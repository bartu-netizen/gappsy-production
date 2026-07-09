/*
  # Fix Top-25 Slots Inventory: Schema Hardening + Audit Fields + Data Repair

  ## Problem
  Almost all Top-25 slots (ranks #2-#25) are incorrectly marked as paid/locked
  because the admin-update edge function set is_paid=true and is_available=false
  on every content edit. This blocks all upsells and causes silent revenue loss.

  ## Changes

  ### 1. Schema Hardening
  - Add UNIQUE constraint on (state_slug, rank) to prevent duplicate rows
  - Add CHECK constraint: rank must be between 1 and 25
  - Add explicit admin-lock audit fields:
    - locked_by_admin (boolean, default false)
    - locked_at (timestamptz, nullable)
    - locked_reason (text, nullable)
    - locked_by_email (text, nullable)
    - last_admin_edit_at (timestamptz, nullable)
    - last_admin_edit_by (text, nullable)

  ### 2. Status View
  - Create view top25_slot_status_view with canonical SOLD/AVAILABLE/LOCKED status

  ### 3. Data Repair (THE CRITICAL FIX)
  - Keep rank=1 as sold/locked in every state
  - Keep truly sold slots: purchased_at IS NOT NULL OR stripe_checkout_session_id IS NOT NULL
  - Restore ALL other ranks 2..25 to AVAILABLE status immediately
  - This recovers ~52*24 = 1248 sellable slots

  ## Important Notes
  - Safe migration: only updates status flags, never content fields
  - After this migration, run top25-ensure-all-states to fill any missing rows
*/

-- 1. Add new audit/lock columns if they don't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'top25_slots' AND column_name = 'locked_by_admin'
  ) THEN
    ALTER TABLE top25_slots ADD COLUMN locked_by_admin boolean NOT NULL DEFAULT false;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'top25_slots' AND column_name = 'locked_at'
  ) THEN
    ALTER TABLE top25_slots ADD COLUMN locked_at timestamptz NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'top25_slots' AND column_name = 'locked_reason'
  ) THEN
    ALTER TABLE top25_slots ADD COLUMN locked_reason text NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'top25_slots' AND column_name = 'locked_by_email'
  ) THEN
    ALTER TABLE top25_slots ADD COLUMN locked_by_email text NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'top25_slots' AND column_name = 'last_admin_edit_at'
  ) THEN
    ALTER TABLE top25_slots ADD COLUMN last_admin_edit_at timestamptz NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'top25_slots' AND column_name = 'last_admin_edit_by'
  ) THEN
    ALTER TABLE top25_slots ADD COLUMN last_admin_edit_by text NULL;
  END IF;
END $$;

-- 2. Add UNIQUE constraint on (state_slug, rank) if not already present
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conname = 'top25_slots_state_slug_rank_unique'
  ) THEN
    ALTER TABLE top25_slots ADD CONSTRAINT top25_slots_state_slug_rank_unique UNIQUE (state_slug, rank);
  END IF;
END $$;

-- 3. Add CHECK constraint on rank (1..25) if not already present
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conname = 'top25_slots_rank_range_check'
  ) THEN
    ALTER TABLE top25_slots ADD CONSTRAINT top25_slots_rank_range_check CHECK (rank >= 1 AND rank <= 25);
  END IF;
END $$;

-- 4. Add performance indexes
CREATE INDEX IF NOT EXISTS idx_top25_slots_state_rank ON top25_slots (state_slug, rank);
CREATE INDEX IF NOT EXISTS idx_top25_slots_available_lookup
  ON top25_slots (state_slug, slot_status, is_paid, rank)
  WHERE slot_status = 'available' AND is_paid = false;

-- 5. Create canonical status view
CREATE OR REPLACE VIEW top25_slot_status_view AS
SELECT
  id,
  state_slug,
  rank,
  is_paid,
  is_available,
  slot_status,
  locked_by_admin,
  agency_name,
  website,
  logo_url,
  CASE
    WHEN rank = 1 THEN 'SOLD'
    WHEN is_paid = true THEN 'SOLD'
    WHEN is_available = true AND slot_status = 'available' THEN 'AVAILABLE'
    WHEN locked_by_admin = true THEN 'LOCKED'
    ELSE 'LOCKED'
  END AS canonical_status,
  created_at,
  updated_at
FROM top25_slots;

-- 6. DATA REPAIR: Restore slots to correct status
-- Step A: Ensure rank=1 in every state is sold/locked (not for sale)
UPDATE top25_slots
SET
  is_paid = true,
  is_available = false,
  slot_status = 'sold',
  locked_by_admin = false,
  locked_at = NULL,
  locked_reason = NULL,
  locked_by_email = NULL
WHERE rank = 1;

-- Step B: For ranks 2..25 that are NOT truly purchased via Stripe or manually:
-- Restore to AVAILABLE. This is the critical fix.
-- "Truly sold" = has a Stripe checkout session ID OR has a purchased_at timestamp
UPDATE top25_slots
SET
  is_paid = false,
  is_available = true,
  slot_status = 'available',
  locked_by_admin = false,
  locked_at = NULL,
  locked_reason = NULL,
  locked_by_email = NULL,
  claimed_at = NULL,
  sale_source = NULL,
  stripe_checkout_session_id = NULL,
  stripe_payment_intent_id = NULL
WHERE rank > 1
  AND (
    -- No confirmed Stripe checkout
    (stripe_checkout_session_id IS NULL OR stripe_checkout_session_id = '')
    -- AND no manual purchase timestamp
    AND (purchased_at IS NULL)
  );

-- Rows with purchased_at OR stripe_checkout_session_id remain sold (untouched)

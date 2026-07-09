/*
  # Fix broken enforce_rank1_vazagency trigger + add slot_status field

  ## Summary
  The `enforce_rank1_vazagency` trigger function referenced `NEW.name` but the
  top25_slots table uses `agency_name`. This caused ALL UPDATE statements on
  top25_slots to fail with "record NEW has no field name".

  This migration:
  1. Fixes the trigger function to reference the correct column (agency_name)
  2. Adds slot_status and related fields to top25_slots
  3. Migrates existing data to correct slot_status values
  4. Corrects is_paid to only be true when there is real payment evidence
  5. Creates slot_status_audit_log table for monitoring
*/

-- ============================================================
-- STEP 1: Fix the broken trigger function
-- ============================================================

CREATE OR REPLACE FUNCTION public.enforce_rank1_vazagency()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
BEGIN
  IF NEW.agency_name ILIKE 'VAZAGENCY' AND NEW.rank IS NOT NULL AND NEW.rank != 1 THEN
    NEW.rank := 1;
  END IF;
  RETURN NEW;
END;
$$;

-- ============================================================
-- STEP 2: Add slot_status and related fields
-- ============================================================

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'top25_slots' AND column_name = 'slot_status') THEN
    ALTER TABLE top25_slots ADD COLUMN slot_status TEXT NOT NULL DEFAULT 'available';
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'top25_slots' AND column_name = 'status_updated_at') THEN
    ALTER TABLE top25_slots ADD COLUMN status_updated_at TIMESTAMPTZ DEFAULT now();
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'top25_slots' AND column_name = 'status_reason') THEN
    ALTER TABLE top25_slots ADD COLUMN status_reason TEXT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'top25_slots' AND column_name = 'status_updated_by') THEN
    ALTER TABLE top25_slots ADD COLUMN status_updated_by TEXT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'top25_slots' AND column_name = 'sale_source') THEN
    ALTER TABLE top25_slots ADD COLUMN sale_source TEXT NULL;
  END IF;
END $$;

-- Add check constraint for valid status values
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.table_constraints
    WHERE table_name = 'top25_slots' AND constraint_name = 'top25_slots_slot_status_check'
  ) THEN
    ALTER TABLE top25_slots ADD CONSTRAINT top25_slots_slot_status_check
      CHECK (slot_status IN ('available', 'locked', 'reserved', 'sold'));
  END IF;
END $$;

-- Add index for fast availability queries
CREATE INDEX IF NOT EXISTS idx_top25_slots_availability
  ON top25_slots (state_slug, slot_status, rank);

-- ============================================================
-- STEP 3: Data migration — backfill slot_status
-- ============================================================

-- Slots with Stripe payment evidence → 'sold'
UPDATE top25_slots
SET
  slot_status = 'sold',
  sale_source = 'stripe',
  status_updated_by = 'migration',
  status_reason = 'Confirmed Stripe payment',
  status_updated_at = now()
WHERE rank != 1
  AND slot_status = 'available'
  AND (
    stripe_checkout_session_id IS NOT NULL
    OR (is_paid = true AND purchased_at IS NOT NULL)
  );

-- Slots marked is_paid=true but no payment evidence → 'locked'
-- (incorrectly set by admin-update edge function)
UPDATE top25_slots
SET
  slot_status = 'locked',
  sale_source = NULL,
  status_updated_by = 'migration',
  status_reason = 'Admin-assigned (no Stripe payment — corrected from incorrect is_paid=true)',
  status_updated_at = now()
WHERE rank != 1
  AND slot_status = 'available'
  AND is_paid = true
  AND stripe_checkout_session_id IS NULL
  AND purchased_at IS NULL;

-- ============================================================
-- STEP 4: Correct is_paid — only true when payment evidence exists
-- ============================================================

-- Reset is_paid=false for locked slots (no payment was made)
UPDATE top25_slots
SET
  is_paid = false,
  claimed_at = NULL
WHERE rank != 1
  AND slot_status = 'locked'
  AND stripe_checkout_session_id IS NULL
  AND purchased_at IS NULL;

-- Ensure sold non-rank-1 slots have is_paid=true
UPDATE top25_slots
SET is_paid = true
WHERE rank != 1
  AND slot_status = 'sold'
  AND is_paid = false;

-- Rank 1 slots get slot_status='sold' directly (bypassing the trigger since we're using a direct SQL update here)
UPDATE top25_slots
SET
  slot_status = 'sold',
  sale_source = 'manual',
  status_updated_by = 'migration',
  status_reason = 'Rank 1 permanently reserved for Vazagency',
  status_updated_at = now()
WHERE rank = 1
  AND slot_status = 'available';

-- ============================================================
-- STEP 5: Create slot_status_audit_log table
-- ============================================================

CREATE TABLE IF NOT EXISTS slot_status_audit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  state_slug TEXT NOT NULL,
  rank INTEGER NOT NULL,
  slot_id UUID,
  old_status TEXT,
  new_status TEXT NOT NULL,
  changed_by TEXT NOT NULL,
  reason TEXT,
  stripe_session_id TEXT,
  stripe_payment_intent_id TEXT,
  ip_address TEXT,
  metadata JSONB DEFAULT '{}'::jsonb
);

ALTER TABLE slot_status_audit_log ENABLE ROW LEVEL SECURITY;

CREATE POLICY "slot_status_audit_service_role_select"
  ON slot_status_audit_log
  FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "slot_status_audit_service_role_insert"
  ON slot_status_audit_log
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_slot_status_audit_state_rank
  ON slot_status_audit_log (state_slug, rank, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_slot_status_audit_created
  ON slot_status_audit_log (created_at DESC);

-- Add agency_id and Stripe tracking to top25_slots
-- 
-- Schema Changes:
-- - Add agency_id (uuid FK -> other_agencies.id)
-- - Add is_available (boolean, default true) - tracks if slot is sellable
-- - Add purchased_at (timestamptz) - when slot was claimed via Stripe
-- - Add stripe_checkout_session_id (text) - Stripe session ID
-- - Add stripe_payment_intent_id (text) - Stripe payment intent ID
-- - Add updated_at (timestamptz) - last update timestamp
-- 
-- Indexes:
-- - Add unique constraint on (state_slug, rank)
-- - Add index on (state_slug, is_available, is_paid) for availability queries
-- - Add index on agency_id for joins
-- 
-- Data Migration:
-- - Backfill agency_id for existing paid slots by matching agency_name
-- - Set is_available=false for all paid slots
-- - Set is_available=true for unpaid slots

-- Add new columns
ALTER TABLE top25_slots
  ADD COLUMN IF NOT EXISTS agency_id uuid REFERENCES other_agencies(id) ON DELETE SET NULL,
  ADD COLUMN IF NOT EXISTS is_available boolean NOT NULL DEFAULT true,
  ADD COLUMN IF NOT EXISTS purchased_at timestamptz,
  ADD COLUMN IF NOT EXISTS stripe_checkout_session_id text,
  ADD COLUMN IF NOT EXISTS stripe_payment_intent_id text,
  ADD COLUMN IF NOT EXISTS updated_at timestamptz DEFAULT now();

-- Backfill agency_id for existing paid slots by matching agency_name to other_agencies
UPDATE top25_slots ts
SET agency_id = oa.id
FROM other_agencies oa
WHERE ts.agency_name IS NOT NULL
  AND ts.agency_name != ''
  AND lower(trim(ts.agency_name)) = lower(trim(oa.name))
  AND ts.state_slug = oa.state_slug
  AND ts.agency_id IS NULL;

-- Set is_available=false for all paid slots (already claimed)
UPDATE top25_slots
SET is_available = false,
    updated_at = now()
WHERE is_paid = true;

-- Set is_available=true for unpaid slots (available for purchase)
UPDATE top25_slots
SET is_available = true,
    updated_at = now()
WHERE is_paid = false;

-- Add unique constraint on (state_slug, rank) to prevent duplicate ranks
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint 
    WHERE conname = 'top25_slots_state_slug_rank_key'
  ) THEN
    ALTER TABLE top25_slots ADD CONSTRAINT top25_slots_state_slug_rank_key UNIQUE (state_slug, rank);
  END IF;
END $$;

-- Add index on (state_slug, is_available, is_paid) for availability queries
CREATE INDEX IF NOT EXISTS idx_top25_slots_availability 
  ON top25_slots(state_slug, is_available, is_paid);

-- Add index on agency_id for joins
CREATE INDEX IF NOT EXISTS idx_top25_slots_agency_id 
  ON top25_slots(agency_id);

-- Add index on updated_at for cache invalidation
CREATE INDEX IF NOT EXISTS idx_top25_slots_updated_at 
  ON top25_slots(updated_at DESC);
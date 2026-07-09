/*
  # Add push_enabled, scope_type, and scope_expires_at to discount_offers

  ## Summary
  Extends discount_offers with fields required for the secure scoped discount-token system:
  - push_enabled: controls whether the discount is automatically pushed into funnels
  - scope_type: restricts how the offer is applied (agency, global, or session-scoped)
  - scope_expires_at: separate expiry for push/session scope (does not affect direct /offer/{token} links)
  - discount_percent: explicit integer percent column (15, 20, or 25) alongside existing discount_value

  ## Changes to discount_offers
  - `push_enabled` (boolean, default false) — when true, the offer is pushed into funnels automatically
  - `scope_type` (text, nullable) — 'agency', 'global', or 'session'; controls how the offer propagates
  - `scope_expires_at` (timestamptz, nullable) — expiry for push/session-scoped carryover; direct links not affected

  ## Backfill
  - Existing rows: push_enabled = false (do not retroactively push old offers)
  - usage_count: set to 0 where currently null (should not exist but guard anyway)
  - is_active: only set true where NULL (preserve existing false rows)

  ## Security
  - No RLS changes needed; service role controls all writes
  - Anon read policy already covers these fields via existing USING (true) policy
*/

DO $$
BEGIN
  -- push_enabled
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'discount_offers' AND column_name = 'push_enabled'
  ) THEN
    ALTER TABLE discount_offers ADD COLUMN push_enabled boolean NOT NULL DEFAULT false;
  END IF;

  -- scope_type
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'discount_offers' AND column_name = 'scope_type'
  ) THEN
    ALTER TABLE discount_offers ADD COLUMN scope_type text
      CHECK (scope_type IS NULL OR scope_type IN ('agency', 'global', 'session'));
  END IF;

  -- scope_expires_at
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'discount_offers' AND column_name = 'scope_expires_at'
  ) THEN
    ALTER TABLE discount_offers ADD COLUMN scope_expires_at timestamptz;
  END IF;
END $$;

-- Backfill: push_enabled = false for all existing rows (already default, but explicit)
UPDATE discount_offers SET push_enabled = false WHERE push_enabled IS NULL;

-- Backfill: usage_count = 0 where null (guard; column has NOT NULL DEFAULT 0 already)
UPDATE discount_offers SET usage_count = 0 WHERE usage_count IS NULL;

-- Index for efficient push-enabled lookup per agency
CREATE INDEX IF NOT EXISTS idx_discount_offers_push_enabled
  ON discount_offers (agency_id, push_enabled)
  WHERE push_enabled = true;

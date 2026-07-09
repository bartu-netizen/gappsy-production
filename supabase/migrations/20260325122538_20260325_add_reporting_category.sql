/*
  # Add Reporting Category to stripe_orders and stripe_subscriptions

  ## Purpose
  Classify revenue records so that unrelated legacy data can be excluded from
  core Gappsy listing metrics without deleting anything from Stripe or the DB.

  ## Changes

  ### stripe_orders
  - Adds `reporting_category` (text, NOT NULL, default 'core_listing_revenue')
  - Backfills existing records: the $5 ThriveCart legacy order (id=8) → 'excluded_legacy_unrelated'
  - All other existing orders default to 'core_listing_revenue'

  ### stripe_subscriptions  
  - Adds `reporting_category` (text, NOT NULL, default 'core_listing_revenue')
  - Backfills: the ThriveCart legacy subscription (subscription_id containing 'thrivecart') → 'excluded_legacy_unrelated'

  ## Allowed Values
  - core_listing_revenue: standard Gappsy listing payment
  - upgrade_revenue: upgrade from activation to top-25
  - renewal_revenue: recurring subscription renewal
  - excluded_legacy_unrelated: unrelated pre-Gappsy record (excluded from all dashboards)

  ## Notes
  - NO records are deleted
  - Stripe sync is not affected
  - Exclusion only applies to dashboard display and metric calculations
  - The legacy $5 ThriveCart record identified by:
      stripe_orders: amount_total=500, no agency_id, subscription_id='sub_IOAeWxt3OKODQ1'
      stripe_subscriptions: price_id contains 'thrivecart', subscription_id='sub_IOAeWxt3OKODQ1'
*/

-- ── stripe_orders ─────────────────────────────────────────────────────────────

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'stripe_orders' AND column_name = 'reporting_category'
  ) THEN
    ALTER TABLE stripe_orders
      ADD COLUMN reporting_category text NOT NULL DEFAULT 'core_listing_revenue';
  END IF;
END $$;

ALTER TABLE stripe_orders
  DROP CONSTRAINT IF EXISTS stripe_orders_reporting_category_check;

ALTER TABLE stripe_orders
  ADD CONSTRAINT stripe_orders_reporting_category_check
  CHECK (reporting_category IN (
    'core_listing_revenue',
    'upgrade_revenue',
    'renewal_revenue',
    'excluded_legacy_unrelated'
  ));

-- Backfill legacy $5 ThriveCart order
UPDATE stripe_orders
SET reporting_category = 'excluded_legacy_unrelated'
WHERE subscription_id = 'sub_IOAeWxt3OKODQ1'
   OR (amount_total = 500 AND agency_id IS NULL AND state_slug IS NULL);

-- Backfill upgrade orders
UPDATE stripe_orders
SET reporting_category = 'upgrade_revenue'
WHERE source_listing_type = 'top25_upgrade'
  AND reporting_category = 'core_listing_revenue';

CREATE INDEX IF NOT EXISTS idx_stripe_orders_reporting_category
  ON stripe_orders (reporting_category);

-- ── stripe_subscriptions ──────────────────────────────────────────────────────

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'stripe_subscriptions' AND column_name = 'reporting_category'
  ) THEN
    ALTER TABLE stripe_subscriptions
      ADD COLUMN reporting_category text NOT NULL DEFAULT 'core_listing_revenue';
  END IF;
END $$;

ALTER TABLE stripe_subscriptions
  DROP CONSTRAINT IF EXISTS stripe_subscriptions_reporting_category_check;

ALTER TABLE stripe_subscriptions
  ADD CONSTRAINT stripe_subscriptions_reporting_category_check
  CHECK (reporting_category IN (
    'core_listing_revenue',
    'upgrade_revenue',
    'renewal_revenue',
    'excluded_legacy_unrelated'
  ));

-- Backfill legacy ThriveCart subscription (non-Stripe price_id)
UPDATE stripe_subscriptions
SET reporting_category = 'excluded_legacy_unrelated'
WHERE subscription_id = 'sub_IOAeWxt3OKODQ1'
   OR price_id LIKE '%thrivecart%'
   OR (price_id NOT LIKE 'price_%');

CREATE INDEX IF NOT EXISTS idx_stripe_subscriptions_reporting_category
  ON stripe_subscriptions (reporting_category);

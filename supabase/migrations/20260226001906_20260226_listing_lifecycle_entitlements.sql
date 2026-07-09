/*
  # Listing Lifecycle & Entitlement System

  ## Summary
  Adds a comprehensive subscription lifecycle layer for all 6-month listing products.
  All changes are ADDITIVE and backward-compatible — no existing columns are removed.

  ## New Tables
  1. `agency_listing_entitlements`
     - Central source of truth for active product entitlements per agency
     - Tracks subscription lifecycle: active → past_due → canceled/expired
     - Links to Stripe subscription, order, slot, and agency records
     - Types: standard_listing, top25_slot, spotlight, featured_badge, visual_upgrade, get_matched

  2. `stripe_webhook_events_processed`
     - Idempotency guard for webhook event processing
     - Prevents double-activation from duplicate Stripe deliveries

  ## Modified Tables
  1. `top25_slots` — added lifecycle/subscription linkage fields
  2. `stripe_orders` — added subscription/entitlement context fields

  ## Security
  - RLS enabled on new tables
  - Service role only for write access (webhook + admin functions)
  - Anon read restricted
*/

-- ─────────────────────────────────────────────────────────────────────────────
-- 1. Webhook idempotency guard
-- ─────────────────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS stripe_webhook_events_processed (
  id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  stripe_event_id     text NOT NULL UNIQUE,
  event_type          text NOT NULL,
  processed_at        timestamptz NOT NULL DEFAULT now(),
  status              text NOT NULL DEFAULT 'processed',
  notes               text,
  created_at          timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE stripe_webhook_events_processed ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access on stripe_webhook_events_processed"
  ON stripe_webhook_events_processed
  FOR SELECT
  TO service_role
  USING (true);

CREATE INDEX IF NOT EXISTS idx_stripe_webhook_events_processed_event_id
  ON stripe_webhook_events_processed (stripe_event_id);

-- ─────────────────────────────────────────────────────────────────────────────
-- 2. Agency listing entitlements
-- ─────────────────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS agency_listing_entitlements (
  id                          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id                   text NOT NULL,
  state_slug                  text,
  entitlement_type            text NOT NULL,
  source_listing_type         text,
  top25_slot_id               uuid,
  top25_rank                  int,
  is_active                   boolean NOT NULL DEFAULT false,
  status                      text NOT NULL DEFAULT 'pending',
  started_at                  timestamptz,
  current_period_start        bigint,
  current_period_end          bigint,
  cancel_at_period_end        boolean NOT NULL DEFAULT false,
  ended_at                    timestamptz,
  stripe_customer_id          text,
  stripe_subscription_id      text,
  stripe_price_id             text,
  stripe_product_id           text,
  stripe_checkout_session_id  text,
  stripe_invoice_id           text,
  order_id                    uuid,
  metadata_json               jsonb,
  created_at                  timestamptz NOT NULL DEFAULT now(),
  updated_at                  timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE agency_listing_entitlements ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access on agency_listing_entitlements"
  ON agency_listing_entitlements
  FOR SELECT
  TO service_role
  USING (true);

CREATE INDEX IF NOT EXISTS idx_ale_agency_id
  ON agency_listing_entitlements (agency_id);

CREATE INDEX IF NOT EXISTS idx_ale_subscription_id
  ON agency_listing_entitlements (stripe_subscription_id)
  WHERE stripe_subscription_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_ale_session_id
  ON agency_listing_entitlements (stripe_checkout_session_id)
  WHERE stripe_checkout_session_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_ale_top25_slot_id
  ON agency_listing_entitlements (top25_slot_id)
  WHERE top25_slot_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_ale_status_active
  ON agency_listing_entitlements (status, is_active);

CREATE INDEX IF NOT EXISTS idx_ale_period_end
  ON agency_listing_entitlements (current_period_end)
  WHERE is_active = true;

-- ─────────────────────────────────────────────────────────────────────────────
-- 3. Extend top25_slots with lifecycle/subscription linkage fields
-- ─────────────────────────────────────────────────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='top25_slots' AND column_name='stripe_subscription_id') THEN
    ALTER TABLE top25_slots ADD COLUMN stripe_subscription_id text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='top25_slots' AND column_name='stripe_customer_id') THEN
    ALTER TABLE top25_slots ADD COLUMN stripe_customer_id text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='top25_slots' AND column_name='lock_started_at') THEN
    ALTER TABLE top25_slots ADD COLUMN lock_started_at timestamptz;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='top25_slots' AND column_name='lock_expires_at') THEN
    ALTER TABLE top25_slots ADD COLUMN lock_expires_at timestamptz;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='top25_slots' AND column_name='billing_status') THEN
    ALTER TABLE top25_slots ADD COLUMN billing_status text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='top25_slots' AND column_name='cancel_at_period_end') THEN
    ALTER TABLE top25_slots ADD COLUMN cancel_at_period_end boolean DEFAULT false;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='top25_slots' AND column_name='last_billing_sync_at') THEN
    ALTER TABLE top25_slots ADD COLUMN last_billing_sync_at timestamptz;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='top25_slots' AND column_name='claimed_by_entitlement_id') THEN
    ALTER TABLE top25_slots ADD COLUMN claimed_by_entitlement_id uuid;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='top25_slots' AND column_name='locked_by_email') THEN
    ALTER TABLE top25_slots ADD COLUMN locked_by_email text;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_top25_slots_subscription_id
  ON top25_slots (stripe_subscription_id)
  WHERE stripe_subscription_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_top25_slots_lock_expires_at
  ON top25_slots (lock_expires_at)
  WHERE is_paid = true;

-- ─────────────────────────────────────────────────────────────────────────────
-- 4. Extend stripe_orders with subscription/entitlement context fields
-- ─────────────────────────────────────────────────────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='subscription_id') THEN
    ALTER TABLE stripe_orders ADD COLUMN subscription_id text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='checkout_mode') THEN
    ALTER TABLE stripe_orders ADD COLUMN checkout_mode text DEFAULT 'payment';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='agency_id') THEN
    ALTER TABLE stripe_orders ADD COLUMN agency_id text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='agency_name') THEN
    ALTER TABLE stripe_orders ADD COLUMN agency_name text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='source_listing_type') THEN
    ALTER TABLE stripe_orders ADD COLUMN source_listing_type text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='entitlement_types') THEN
    ALTER TABLE stripe_orders ADD COLUMN entitlement_types text[];
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='top25_slot_id') THEN
    ALTER TABLE stripe_orders ADD COLUMN top25_slot_id text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='top25_rank') THEN
    ALTER TABLE stripe_orders ADD COLUMN top25_rank int;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='current_period_end') THEN
    ALTER TABLE stripe_orders ADD COLUMN current_period_end bigint;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='paid_at') THEN
    ALTER TABLE stripe_orders ADD COLUMN paid_at timestamptz;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_stripe_orders_subscription_id
  ON stripe_orders (subscription_id)
  WHERE subscription_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_stripe_orders_agency_id
  ON stripe_orders (agency_id)
  WHERE agency_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_stripe_orders_source_listing_type
  ON stripe_orders (source_listing_type)
  WHERE source_listing_type IS NOT NULL;

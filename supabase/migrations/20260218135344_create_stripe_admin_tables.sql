/*
  # Stripe Admin Tables

  ## Purpose
  Extend Stripe data storage to power the /wp-admin Stripe Dashboard.
  All existing tables (stripe_orders, stripe_customers, stripe_subscriptions) are left intact.

  ## New Tables

  ### stripe_order_items
  Line items linked to checkout sessions / payment intents.
  Fields: order reference, product/price ids, description, qty, amounts, metadata.

  ### stripe_invoices
  Stripe invoice records with hosted_invoice_url and invoice_pdf for the admin UI.

  ### stripe_events_raw
  Raw Stripe events for idempotency checking and audit log.

  ## Schema Extensions (safe, additive only)

  ### stripe_orders: add metadata + extra fields if missing
  - metadata jsonb
  - customer_email text
  - customer_name text
  - invoice_id text
  - livemode boolean
  - state_slug text
  - funnel_type text
  - submission_id text
  - receipt_url text
  - stripe_created_at timestamptz

  ## Security
  - RLS enabled on all new tables
  - Service role only access
*/

-- ─── stripe_order_items ──────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS stripe_order_items (
  id                          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at                  timestamptz NOT NULL DEFAULT now(),

  stripe_checkout_session_id  text,
  stripe_payment_intent_id    text,
  stripe_customer_id          text,

  price_id                    text,
  product_id                  text,
  description                 text,
  quantity                    integer DEFAULT 1,

  amount_subtotal             bigint,
  amount_total                bigint,
  currency                    text,

  metadata                    jsonb NOT NULL DEFAULT '{}'::jsonb
);

ALTER TABLE stripe_order_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role only insert stripe_order_items"
  ON stripe_order_items FOR INSERT TO service_role WITH CHECK (true);
CREATE POLICY "Service role only select stripe_order_items"
  ON stripe_order_items FOR SELECT TO service_role USING (true);
CREATE POLICY "Service role only update stripe_order_items"
  ON stripe_order_items FOR UPDATE TO service_role USING (true) WITH CHECK (true);
CREATE POLICY "Service role only delete stripe_order_items"
  ON stripe_order_items FOR DELETE TO service_role USING (true);

CREATE INDEX IF NOT EXISTS idx_order_items_session  ON stripe_order_items (stripe_checkout_session_id);
CREATE INDEX IF NOT EXISTS idx_order_items_pi       ON stripe_order_items (stripe_payment_intent_id);
CREATE INDEX IF NOT EXISTS idx_order_items_customer ON stripe_order_items (stripe_customer_id);


-- ─── stripe_invoices ─────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS stripe_invoices (
  id                          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at                  timestamptz NOT NULL DEFAULT now(),

  stripe_invoice_id           text UNIQUE NOT NULL,
  stripe_customer_id          text,
  stripe_payment_intent_id    text,
  stripe_subscription_id      text,

  hosted_invoice_url          text,
  invoice_pdf                 text,
  status                      text,
  amount_paid                 bigint,
  amount_due                  bigint,
  currency                    text,
  customer_email              text,
  livemode                    boolean DEFAULT false,

  raw                         jsonb NOT NULL DEFAULT '{}'::jsonb
);

ALTER TABLE stripe_invoices ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role only insert stripe_invoices"
  ON stripe_invoices FOR INSERT TO service_role WITH CHECK (true);
CREATE POLICY "Service role only select stripe_invoices"
  ON stripe_invoices FOR SELECT TO service_role USING (true);
CREATE POLICY "Service role only update stripe_invoices"
  ON stripe_invoices FOR UPDATE TO service_role USING (true) WITH CHECK (true);
CREATE POLICY "Service role only delete stripe_invoices"
  ON stripe_invoices FOR DELETE TO service_role USING (true);

CREATE INDEX IF NOT EXISTS idx_invoices_customer ON stripe_invoices (stripe_customer_id);
CREATE INDEX IF NOT EXISTS idx_invoices_pi       ON stripe_invoices (stripe_payment_intent_id);
CREATE INDEX IF NOT EXISTS idx_invoices_status   ON stripe_invoices (status);


-- ─── stripe_events_raw ───────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS stripe_events_raw (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at      timestamptz NOT NULL DEFAULT now(),
  stripe_event_id text UNIQUE NOT NULL,
  type            text NOT NULL,
  livemode        boolean DEFAULT false,
  processed_at    timestamptz DEFAULT now(),
  data            jsonb NOT NULL DEFAULT '{}'::jsonb
);

ALTER TABLE stripe_events_raw ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role only insert stripe_events_raw"
  ON stripe_events_raw FOR INSERT TO service_role WITH CHECK (true);
CREATE POLICY "Service role only select stripe_events_raw"
  ON stripe_events_raw FOR SELECT TO service_role USING (true);

CREATE INDEX IF NOT EXISTS idx_events_raw_type ON stripe_events_raw (type);
CREATE INDEX IF NOT EXISTS idx_events_raw_created ON stripe_events_raw (created_at DESC);


-- ─── Extend stripe_orders (additive columns only) ────────────────────────────
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='customer_email') THEN
    ALTER TABLE stripe_orders ADD COLUMN customer_email text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='customer_name') THEN
    ALTER TABLE stripe_orders ADD COLUMN customer_name text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='invoice_id') THEN
    ALTER TABLE stripe_orders ADD COLUMN invoice_id text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='livemode') THEN
    ALTER TABLE stripe_orders ADD COLUMN livemode boolean DEFAULT false;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='state_slug') THEN
    ALTER TABLE stripe_orders ADD COLUMN state_slug text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='funnel_type') THEN
    ALTER TABLE stripe_orders ADD COLUMN funnel_type text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='submission_id') THEN
    ALTER TABLE stripe_orders ADD COLUMN submission_id text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='receipt_url') THEN
    ALTER TABLE stripe_orders ADD COLUMN receipt_url text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='stripe_created_at') THEN
    ALTER TABLE stripe_orders ADD COLUMN stripe_created_at timestamptz;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='metadata') THEN
    ALTER TABLE stripe_orders ADD COLUMN metadata jsonb DEFAULT '{}'::jsonb;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_orders' AND column_name='product_summary') THEN
    ALTER TABLE stripe_orders ADD COLUMN product_summary text;
  END IF;
END $$;

-- Extend stripe_customers (additive)
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_customers' AND column_name='email') THEN
    ALTER TABLE stripe_customers ADD COLUMN email text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_customers' AND column_name='name') THEN
    ALTER TABLE stripe_customers ADD COLUMN name text;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_customers' AND column_name='livemode') THEN
    ALTER TABLE stripe_customers ADD COLUMN livemode boolean DEFAULT false;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='stripe_customers' AND column_name='metadata') THEN
    ALTER TABLE stripe_customers ADD COLUMN metadata jsonb DEFAULT '{}'::jsonb;
  END IF;
END $$;

-- Indexes on extended stripe_orders columns
CREATE INDEX IF NOT EXISTS idx_stripe_orders_status    ON stripe_orders (status);
CREATE INDEX IF NOT EXISTS idx_stripe_orders_created   ON stripe_orders (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_stripe_orders_customer  ON stripe_orders (customer_id);
CREATE INDEX IF NOT EXISTS idx_stripe_orders_state     ON stripe_orders (state_slug);

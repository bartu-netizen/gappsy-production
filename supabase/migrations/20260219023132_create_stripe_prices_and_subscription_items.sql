/*
  # Add Stripe Prices and Subscription Items tables

  ## Purpose
  Support MRR/YRR calculation by storing price interval data and per-subscription item details.

  ## New Tables

  ### stripe_prices
  - Stores Stripe Price objects with billing interval metadata
  - `stripe_price_id` (text, unique) — Stripe price ID (e.g., price_xxx)
  - `unit_amount` (bigint) — price in cents
  - `currency` (text) — ISO currency code (e.g., "usd")
  - `recurring_interval` (text) — "day" | "week" | "month" | "year" | null (null = one-time)
  - `recurring_interval_count` (integer) — e.g., 1 for monthly, 3 for quarterly
  - `active` (boolean) — whether the price is active in Stripe
  - `product_id` (text) — associated Stripe product ID
  - `nickname` (text) — optional label
  - `raw` (jsonb) — full Stripe price object for reference

  ### stripe_subscription_items
  - Stores line items for each subscription
  - `stripe_subscription_item_id` (text, unique) — Stripe subscription item ID (si_xxx)
  - `subscription_id` (text) — Stripe subscription ID
  - `price_id` (text) — references stripe_prices.stripe_price_id
  - `quantity` (integer, default 1)
  - `active` (boolean, default true)

  ## Security
  - RLS enabled on both tables
  - Only service_role can read/write (admin-only data, no user access needed)

  ## Notes
  - These tables are populated by the `stripe-admin-recurring-metrics` edge function on demand
  - The `stripe_admin_sync` function can also upsert into these tables in the future
*/

CREATE TABLE IF NOT EXISTS stripe_prices (
  id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  stripe_price_id text NOT NULL UNIQUE,
  unit_amount bigint NOT NULL DEFAULT 0,
  currency text NOT NULL DEFAULT 'usd',
  recurring_interval text NULL,
  recurring_interval_count integer NOT NULL DEFAULT 1,
  active boolean NOT NULL DEFAULT true,
  product_id text NULL,
  nickname text NULL,
  raw jsonb NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE stripe_prices ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access to stripe_prices"
  ON stripe_prices
  FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "Service role insert stripe_prices"
  ON stripe_prices
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role update stripe_prices"
  ON stripe_prices
  FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE TABLE IF NOT EXISTS stripe_subscription_items (
  id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  stripe_subscription_item_id text NOT NULL UNIQUE,
  subscription_id text NOT NULL,
  price_id text NOT NULL,
  quantity integer NOT NULL DEFAULT 1,
  active boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE stripe_subscription_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access to stripe_subscription_items"
  ON stripe_subscription_items
  FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "Service role insert stripe_subscription_items"
  ON stripe_subscription_items
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role update stripe_subscription_items"
  ON stripe_subscription_items
  FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_stripe_prices_stripe_price_id ON stripe_prices (stripe_price_id);
CREATE INDEX IF NOT EXISTS idx_stripe_sub_items_subscription_id ON stripe_subscription_items (subscription_id);
CREATE INDEX IF NOT EXISTS idx_stripe_sub_items_price_id ON stripe_subscription_items (price_id);

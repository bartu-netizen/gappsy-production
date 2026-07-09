/*
  # Add discount tracking columns to stripe_orders

  1. Modified Tables
    - `stripe_orders`
      - `offer_token` (text) - The discount offer token used, if any
      - `discount_percentage` (numeric) - The discount percentage applied (e.g. 15, 20, 25)
      - `discount_amount_cents` (bigint) - The discount amount in cents
      - `original_amount_cents` (bigint) - The cart subtotal before discount
      - `discount_source` (text) - Source of the discount (smartlead, replay, admin, direct)

  2. Indexes
    - idx_stripe_orders_offer_token for querying by offer token
    - idx_stripe_orders_discount_percentage for aggregation by discount tier

  3. Notes
    - These columns allow direct querying of discount performance
      without having to parse the JSONB metadata column
    - Existing rows are not backfilled; only new orders will populate these
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'stripe_orders' AND column_name = 'offer_token'
  ) THEN
    ALTER TABLE stripe_orders ADD COLUMN offer_token text DEFAULT NULL;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'stripe_orders' AND column_name = 'discount_percentage'
  ) THEN
    ALTER TABLE stripe_orders ADD COLUMN discount_percentage numeric(5,2) DEFAULT NULL;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'stripe_orders' AND column_name = 'discount_amount_cents'
  ) THEN
    ALTER TABLE stripe_orders ADD COLUMN discount_amount_cents bigint DEFAULT NULL;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'stripe_orders' AND column_name = 'original_amount_cents'
  ) THEN
    ALTER TABLE stripe_orders ADD COLUMN original_amount_cents bigint DEFAULT NULL;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'stripe_orders' AND column_name = 'discount_source'
  ) THEN
    ALTER TABLE stripe_orders ADD COLUMN discount_source text DEFAULT NULL;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_stripe_orders_offer_token
  ON stripe_orders (offer_token) WHERE offer_token IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_stripe_orders_discount_percentage
  ON stripe_orders (discount_percentage) WHERE discount_percentage IS NOT NULL;

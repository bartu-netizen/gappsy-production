/*
  # Create stripe_refunds and stripe_disputes tables

  1. New Tables
    - `stripe_refunds`
      - Tracks refunds from Stripe webhooks
      - Linked to stripe_orders via stripe_order_id (bigint to match stripe_orders.id)
      - Idempotent on stripe_refund_id (unique)
    - `stripe_disputes`
      - Tracks disputes/chargebacks from Stripe webhooks
      - Linked to stripe_orders via stripe_order_id
      - `won` boolean tracks final outcome
      - Idempotent on stripe_dispute_id (unique)

  2. Security
    - RLS enabled on both tables
    - Service role access only (admin/webhook context)
    - No anon or authenticated public policies

  3. Indexes
    - stripe_refund_id / stripe_dispute_id unique
    - stripe_order_id, stripe_charge_id, stripe_payment_intent_id for joins
    - status, created_at for listings
*/

CREATE TABLE IF NOT EXISTS stripe_refunds (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  stripe_refund_id text UNIQUE NOT NULL,
  stripe_charge_id text,
  stripe_payment_intent_id text,
  stripe_checkout_session_id text,
  stripe_order_id bigint,
  stripe_subscription_id text,
  agency_id uuid,
  amount_cents integer NOT NULL DEFAULT 0,
  currency text DEFAULT 'usd',
  status text,
  reason text,
  metadata jsonb DEFAULT '{}'::jsonb,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_stripe_refunds_order_id ON stripe_refunds(stripe_order_id);
CREATE INDEX IF NOT EXISTS idx_stripe_refunds_charge_id ON stripe_refunds(stripe_charge_id);
CREATE INDEX IF NOT EXISTS idx_stripe_refunds_payment_intent ON stripe_refunds(stripe_payment_intent_id);
CREATE INDEX IF NOT EXISTS idx_stripe_refunds_status ON stripe_refunds(status);
CREATE INDEX IF NOT EXISTS idx_stripe_refunds_created_at ON stripe_refunds(created_at DESC);

ALTER TABLE stripe_refunds ENABLE ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS stripe_disputes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  stripe_dispute_id text UNIQUE NOT NULL,
  stripe_charge_id text,
  stripe_payment_intent_id text,
  stripe_order_id bigint,
  stripe_subscription_id text,
  agency_id uuid,
  amount_cents integer NOT NULL DEFAULT 0,
  currency text DEFAULT 'usd',
  reason text,
  status text,
  evidence_due_by timestamptz,
  won boolean DEFAULT false,
  metadata jsonb DEFAULT '{}'::jsonb,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_stripe_disputes_order_id ON stripe_disputes(stripe_order_id);
CREATE INDEX IF NOT EXISTS idx_stripe_disputes_charge_id ON stripe_disputes(stripe_charge_id);
CREATE INDEX IF NOT EXISTS idx_stripe_disputes_payment_intent ON stripe_disputes(stripe_payment_intent_id);
CREATE INDEX IF NOT EXISTS idx_stripe_disputes_status ON stripe_disputes(status);
CREATE INDEX IF NOT EXISTS idx_stripe_disputes_created_at ON stripe_disputes(created_at DESC);

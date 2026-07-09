/*
  # Add unique constraints to stripe_orders for safe upserts

  ## Problem
  stripe_orders has only a primary key. Edge functions call .upsert() with
  onConflict: 'checkout_session_id', 'payment_intent_id', etc., but these
  columns have no unique constraint so Postgres rejects the ON CONFLICT clause.

  ## Changes
  - Add UNIQUE constraint on checkout_session_id (main upsert key)
  - Add UNIQUE constraint on payment_intent_id (secondary upsert key, nullable)

  Both use partial indexes (WHERE column IS NOT NULL) for nullable columns to
  avoid conflicts on multiple NULL values.

  ## Notes
  checkout_session_id is the primary natural key used by all upsert paths.
  payment_intent_id is used as a secondary lookup key for payment-intent events.
*/

CREATE UNIQUE INDEX IF NOT EXISTS stripe_orders_checkout_session_id_key
  ON stripe_orders (checkout_session_id)
  WHERE checkout_session_id IS NOT NULL;

CREATE UNIQUE INDEX IF NOT EXISTS stripe_orders_payment_intent_id_key
  ON stripe_orders (payment_intent_id)
  WHERE payment_intent_id IS NOT NULL;

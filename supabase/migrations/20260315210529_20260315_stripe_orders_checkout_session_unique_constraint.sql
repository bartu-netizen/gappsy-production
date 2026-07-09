/*
  # Add unique constraint on stripe_orders.checkout_session_id

  The partial unique index from the previous migration cannot be used as an
  ON CONFLICT target. This migration adds a proper unique constraint that
  Postgres can use with ON CONFLICT (checkout_session_id).

  The previous partial indexes are dropped first to avoid duplication.
*/

DROP INDEX IF EXISTS stripe_orders_checkout_session_id_key;
DROP INDEX IF EXISTS stripe_orders_payment_intent_id_key;

ALTER TABLE stripe_orders
  ADD CONSTRAINT stripe_orders_checkout_session_id_key
  UNIQUE (checkout_session_id);

/*
  # stripe_orders — relax NOT NULL on payment_intent_id, customer_id

  1. Purpose
    - Allow persisting rows from webhook events that legitimately lack these
      fields (subscription-only sessions, delayed PI capture) and manual
      backfills of missing sales.

  2. Safety
    - No data change. Pre-existing rows already satisfy any loosened constraint.
*/

ALTER TABLE public.stripe_orders
  ALTER COLUMN payment_intent_id DROP NOT NULL,
  ALTER COLUMN customer_id DROP NOT NULL;

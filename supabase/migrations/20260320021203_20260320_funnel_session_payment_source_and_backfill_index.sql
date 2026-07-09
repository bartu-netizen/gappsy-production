/*
  # Funnel Session Payment Source Tracking

  ## Purpose
  Supports reliable webhook-based purchase tracking by:
  1. Adding a `payment_source` column to distinguish client-logged vs webhook-backfilled purchases
  2. Adding an index on checkout_session_id for fast webhook lookups

  ## Changes to funnel_sessions
  - `payment_source` (text) — 'client' | 'webhook' — how the paid event was recorded

  ## Notes
  - This column is nullable; existing rows will be NULL until they are updated
  - Future client-logged events will set 'client'
  - Webhook-backfilled events will set 'webhook'
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'payment_source'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN payment_source text;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_funnel_sessions_checkout_session_id
  ON funnel_sessions(checkout_session_id)
  WHERE checkout_session_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_funnel_sessions_stage_funnel
  ON funnel_sessions(funnel_name, stage)
  WHERE funnel_name = 'your_agency';

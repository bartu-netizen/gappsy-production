/*
  # Add Stripe event ID to email notification logs

  1. Modified Tables
    - `email_notification_logs`
      - `stripe_event_id` (text, nullable) — Stripe event ID for deduplication of sale notifications
      - Index on `stripe_event_id` for fast lookups
      - Index on `notification_type, created_at DESC` for filtered log queries

  2. Notes
    - The stripe_event_id column enables deduplication: if a webhook retries,
      we can check whether a notification was already sent for that event
    - No destructive changes — only adds columns and indexes
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'email_notification_logs' AND column_name = 'stripe_event_id'
  ) THEN
    ALTER TABLE email_notification_logs ADD COLUMN stripe_event_id text;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_email_notification_logs_stripe_event_id
  ON email_notification_logs (stripe_event_id)
  WHERE stripe_event_id IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_email_notification_logs_type_created
  ON email_notification_logs (notification_type, created_at DESC);

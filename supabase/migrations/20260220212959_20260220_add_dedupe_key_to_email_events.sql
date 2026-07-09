/*
  # Add dedupe_key to email_events for open deduplication

  ## Summary
  Adds a `dedupe_key` column to `email_events` and a unique constraint on
  (email_message_id, event_type, dedupe_key) so that the open-tracking
  endpoint can use INSERT ... ON CONFLICT DO NOTHING to prevent double-counting
  pixel fires from the same user agent + IP prefix within a 60-second window.

  ## Changes
  - `email_events.dedupe_key` (text, nullable) — SHA-256 digest of:
      message_id + normalized UA + ip/24 prefix + 60-second time bucket.
      NULL means the event was inserted without deduplication (legacy or clicks).
  - Unique constraint `email_events_dedupe_key_uidx` on
      (email_message_id, event_type, dedupe_key) WHERE dedupe_key IS NOT NULL.
  - Composite index `idx_email_events_msg_type_at` on
      (email_message_id, event_type, occurred_at DESC) for fast stats queries.

  ## Notes
  - Existing rows keep dedupe_key = NULL and are unaffected.
  - The unique constraint uses a partial index (WHERE dedupe_key IS NOT NULL)
    so NULL rows never conflict with each other.
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'email_events' AND column_name = 'dedupe_key'
  ) THEN
    ALTER TABLE email_events ADD COLUMN dedupe_key text;
  END IF;
END $$;

CREATE UNIQUE INDEX IF NOT EXISTS email_events_dedupe_key_uidx
  ON email_events (email_message_id, event_type, dedupe_key)
  WHERE dedupe_key IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_email_events_msg_type_at
  ON email_events (email_message_id, event_type, occurred_at DESC);

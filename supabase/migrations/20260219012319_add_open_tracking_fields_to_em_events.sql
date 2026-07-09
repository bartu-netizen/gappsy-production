/*
  # Enhance em_events for open-rate tracking

  1. Changes to em_events
    - Add ip_hash (text, nullable) for privacy-safe IP storage
    - Add user_agent (text, nullable) to store client info
    - Add url (text, nullable) for click tracking target URL

  2. New indexes
    - idx_em_events_msg_type: fast unique-open lookup per message_id + event_type
    - idx_em_events_created: fast date-range queries for today's stats

  3. Notes
    - message_id in em_events is uuid referencing em_messages.id
    - Unique opens are computed with COUNT(DISTINCT message_id) WHERE event_type='open'
    - No data is lost — only additive column additions
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_events' AND column_name = 'ip_hash'
  ) THEN
    ALTER TABLE em_events ADD COLUMN ip_hash text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_events' AND column_name = 'user_agent'
  ) THEN
    ALTER TABLE em_events ADD COLUMN user_agent text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'em_events' AND column_name = 'url'
  ) THEN
    ALTER TABLE em_events ADD COLUMN url text;
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_em_events_msg_type
  ON em_events(message_id, event_type);

CREATE INDEX IF NOT EXISTS idx_em_events_created
  ON em_events(created_at);

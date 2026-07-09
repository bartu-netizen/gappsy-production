/*
  # Create Quick Send and Email Tracking Tables

  1. New Tables
    - `em_sends` - Individual email sends with full metadata and status tracking
    - `em_open_events` - Records when emails are opened (tracking pixel)
    - `em_click_events` - Records when email links are clicked (redirect tracking)
    - `em_click_urls` - Backup storage of original URLs for click tracking

  2. Columns & Indexes
    - em_sends: Indexed on created_at, status for quick queries
    - em_open_events: FK to send_id, indexed for event lookups
    - em_click_events: FK to send_id, indexed for event lookups
    - em_click_urls: Indexed for reverse lookups

  3. Security (RLS)
    - Only authenticated admins can read/write via edge functions
    - Tracking endpoints (open/click) use edge function validation
    - No direct client access to tables

  4. Important Notes
    - em_sends stores full email metadata (from/reply-to) for audit
    - Open events dedup per IP per day (soft dedupe)
    - Click events record every click without dedupe
    - All timestamps in UTC
*/

CREATE TABLE IF NOT EXISTS em_sends (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now(),
  created_by uuid,
  recipient_email text NOT NULL,
  recipient_name text,
  subject text NOT NULL,
  html_body text NOT NULL,
  text_body text,
  status text NOT NULL DEFAULT 'queued' CHECK (status IN ('queued', 'sent', 'failed')),
  provider_message_id text,
  error text,
  from_name text NOT NULL DEFAULT 'Gappsy',
  from_email text NOT NULL DEFAULT 'noreply@gappsy.com',
  reply_to text,
  meta jsonb DEFAULT '{}'::jsonb,
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS em_open_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  send_id uuid NOT NULL REFERENCES em_sends(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now(),
  ip_hash text,
  ua text,
  ref text
);

CREATE TABLE IF NOT EXISTS em_click_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  send_id uuid NOT NULL REFERENCES em_sends(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now(),
  url text NOT NULL,
  ip_hash text,
  ua text,
  ref text
);

CREATE TABLE IF NOT EXISTS em_click_urls (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  send_id uuid NOT NULL REFERENCES em_sends(id) ON DELETE CASCADE,
  encoded_url text NOT NULL UNIQUE,
  original_url text NOT NULL,
  created_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_em_sends_created_at ON em_sends(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_em_sends_status ON em_sends(status);
CREATE INDEX IF NOT EXISTS idx_em_sends_recipient_email ON em_sends(recipient_email);
CREATE INDEX IF NOT EXISTS idx_em_open_events_send_id ON em_open_events(send_id);
CREATE INDEX IF NOT EXISTS idx_em_open_events_created_at ON em_open_events(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_em_click_events_send_id ON em_click_events(send_id);
CREATE INDEX IF NOT EXISTS idx_em_click_events_created_at ON em_click_events(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_em_click_urls_send_id ON em_click_urls(send_id);

ALTER TABLE em_sends ENABLE ROW LEVEL SECURITY;
ALTER TABLE em_open_events ENABLE ROW LEVEL SECURITY;
ALTER TABLE em_click_events ENABLE ROW LEVEL SECURITY;
ALTER TABLE em_click_urls ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admin only: read em_sends" ON em_sends FOR SELECT
  TO authenticated USING (false);

CREATE POLICY "Admin only: insert em_sends" ON em_sends FOR INSERT
  TO authenticated WITH CHECK (false);

CREATE POLICY "Admin only: read em_open_events" ON em_open_events FOR SELECT
  TO authenticated USING (false);

CREATE POLICY "Admin only: insert em_open_events" ON em_open_events FOR INSERT
  TO authenticated WITH CHECK (false);

CREATE POLICY "Admin only: read em_click_events" ON em_click_events FOR SELECT
  TO authenticated USING (false);

CREATE POLICY "Admin only: insert em_click_events" ON em_click_events FOR INSERT
  TO authenticated WITH CHECK (false);

CREATE POLICY "Admin only: read em_click_urls" ON em_click_urls FOR SELECT
  TO authenticated USING (false);

CREATE POLICY "Admin only: insert em_click_urls" ON em_click_urls FOR INSERT
  TO authenticated WITH CHECK (false);

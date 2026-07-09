/*
  # Manage Funnel Tracking System

  ## Overview
  Creates comprehensive tracking and notification system for the manage/delete funnel.

  ## Tables

  1. **manage_funnel_events** — Event log for all manage funnel interactions
     - Tracks: funnel opened, removal intent, recovery, confirmation
     - Includes engagement metrics for contextualized notifications
     - Supports deduplication of email notifications

  2. **manage_funnel_notification_log** — Deduplication log for email notifications
     - Prevents spam by limiting manage_funnel_opened emails to once per 24h per agency
     - Tracks all notification sends for audit trail

  ## Event Types

  - manage_funnel_opened: User lands on /manage-listing page
  - manage_remove_started: User clicks remove or enters recovery step
  - manage_recovered: User chooses to keep listing or activate
  - manage_remove_confirmed: User confirms removal

  ## Notification Rules

  - manage_funnel_opened: Deduped (max once per 24h per agency)
  - manage_remove_started: Always sent (high intent)
  - manage_recovered: Always sent
  - manage_remove_confirmed: Always sent

  ## Security
  - RLS enabled on both tables
  - Anyone can insert events (anonymous tracking)
  - Only service_role can read events
*/

-- ─────────────────────────────────────────────
-- 1. manage_funnel_events
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS manage_funnel_events (
  id                    uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  event_type            text NOT NULL CHECK (event_type IN (
    'manage_funnel_opened',
    'manage_remove_started',
    'manage_recovered',
    'manage_remove_confirmed'
  )),
  agency_id             text NOT NULL,
  agency_slug           text NULL,
  agency_name           text NOT NULL,
  state_slug            text NULL,
  token                 text NULL,
  lead_key              text NULL,
  source                text DEFAULT 'unknown' CHECK (source IN ('smartlead', 'direct', 'unknown')),
  listing_type          text NULL CHECK (listing_type IN ('top25', 'other', 'free')),

  -- Engagement context for notifications
  engaged_leads_count   int  DEFAULT 0,
  total_interactions    int  DEFAULT 0,
  engagement_hint       text NULL,

  -- Event-specific data
  recovery_type         text NULL CHECK (recovery_type IN ('keep_visible', 'activate')),
  entry_reason          text NULL CHECK (entry_reason IN ('not_interested', 'remove_me', 'unsubscribe', 'unknown')),

  -- Request metadata
  page_path             text NULL,
  referrer              text NULL,
  user_agent            text NULL,
  request_ip            text NULL,

  -- Additional context
  metadata              jsonb DEFAULT '{}'::jsonb,
  created_at            timestamptz DEFAULT now()
);

-- Indexes for analytics and lookups
CREATE INDEX IF NOT EXISTS idx_mfe_agency_id ON manage_funnel_events (agency_id);
CREATE INDEX IF NOT EXISTS idx_mfe_event_type ON manage_funnel_events (event_type);
CREATE INDEX IF NOT EXISTS idx_mfe_created_at ON manage_funnel_events (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_mfe_agency_event ON manage_funnel_events (agency_id, event_type, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_mfe_state_event ON manage_funnel_events (state_slug, event_type, created_at DESC);

ALTER TABLE manage_funnel_events ENABLE ROW LEVEL SECURITY;

-- Anyone can insert (anonymous tracking)
CREATE POLICY "Anyone can insert manage funnel events"
  ON manage_funnel_events FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Only service_role can read (admin analytics)
CREATE POLICY "Service role can read manage funnel events"
  ON manage_funnel_events FOR SELECT
  TO service_role
  USING (true);

-- ─────────────────────────────────────────────
-- 2. manage_funnel_notification_log
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS manage_funnel_notification_log (
  id                    uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  notification_type     text NOT NULL,
  agency_id             text NOT NULL,
  event_id              uuid NULL REFERENCES manage_funnel_events(id),
  to_emails             text NOT NULL,
  subject               text NOT NULL,
  status                text NOT NULL CHECK (status IN ('sent', 'failed', 'skipped')),
  skip_reason           text NULL,
  provider              text NULL,
  provider_message_id   text NULL,
  provider_response     jsonb NULL,
  error_message         text NULL,
  payload               jsonb NULL,
  created_at            timestamptz DEFAULT now()
);

-- Index for deduplication checks
CREATE INDEX IF NOT EXISTS idx_mfnl_agency_type_created
  ON manage_funnel_notification_log (agency_id, notification_type, created_at DESC);

-- Index for audit queries
CREATE INDEX IF NOT EXISTS idx_mfnl_created_at ON manage_funnel_notification_log (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_mfnl_status ON manage_funnel_notification_log (status, created_at DESC);

ALTER TABLE manage_funnel_notification_log ENABLE ROW LEVEL SECURITY;

-- Only service_role can read/write
CREATE POLICY "Service role full access on manage notification log"
  ON manage_funnel_notification_log
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- ─────────────────────────────────────────────
-- 3. Seed email notification settings
-- ─────────────────────────────────────────────

-- Add manage funnel notification types to email_notification_settings
INSERT INTO email_notification_settings (notification_type, is_enabled, recipient_emails, subject_template, body_html)
VALUES
  ('manage_funnel_opened',     true, 'bartu@gappsy.com', 'Manage funnel opened — {{agency_name}}',   '<p>An agency has opened the manage funnel.</p>'),
  ('manage_remove_started',    true, 'bartu@gappsy.com', 'Removal intent — {{agency_name}}',         '<p>An agency has started the removal process.</p>'),
  ('manage_recovered',         true, 'bartu@gappsy.com', 'Recovered from removal — {{agency_name}}', '<p>An agency has recovered from the removal funnel.</p>'),
  ('manage_remove_confirmed',  true, 'bartu@gappsy.com', 'Listing removed — {{agency_name}}',        '<p>An agency has confirmed listing removal.</p>')
ON CONFLICT (notification_type) DO NOTHING;
/*
  # Internal Email Notification System

  ## Summary
  Creates three new tables to support internal admin email notifications for all
  form submissions (Get Matched, Spotlight, Top 25, Availability Check, Confirm Connection).

  ## New Tables

  ### 1. notification_settings
  Per-form-type configuration:
  - enabled: whether to send notifications for this form type
  - recipients: comma-separated email addresses to notify
  - subject_template: custom subject line (supports {{form_type}} tokens)

  ### 2. email_notifications_log
  Audit log of every email notification attempt:
  - form_type, row_id: identifies the form submission
  - status: sent | failed | skipped
  - provider_message_id: SMTP message ID on success
  - error: error message on failure
  - recipients_json: who was notified

  ### 3. agency_connection_confirms
  Stores "Confirm Connection" submissions from the availability owner demo page.

  ## Security
  - RLS enabled on all tables
  - service_role has full access (for edge functions)
  - No direct access for anon/authenticated

  ## Notes
  - Idempotency column `client_submission_id` on email_notifications_log prevents double-sends
  - Default notification_settings rows are seeded for all 5 form types
*/

-- ============================================================
-- NOTIFICATION SETTINGS
-- ============================================================
CREATE TABLE IF NOT EXISTS notification_settings (
  form_type text PRIMARY KEY,
  enabled boolean NOT NULL DEFAULT true,
  recipients text NOT NULL DEFAULT '',
  subject_template text NOT NULL DEFAULT 'New {{form_type}} submission',
  created_at timestamptz DEFAULT now() NOT NULL,
  updated_at timestamptz DEFAULT now() NOT NULL
);

ALTER TABLE notification_settings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access on notification_settings"
  ON notification_settings FOR ALL TO service_role USING (true) WITH CHECK (true);

INSERT INTO notification_settings (form_type, enabled, recipients, subject_template) VALUES
  ('get_matched',         true,  '', 'New Get Matched lead: {{company}}'),
  ('sponsored_spotlight', true,  '', 'New Spotlight application: {{company}}'),
  ('top25_submission',    true,  '', 'New Top 25 submission: {{company}}'),
  ('availability_check',  true,  '', 'New Availability check: {{agency}}'),
  ('confirm_connection',  true,  '', 'Confirm Connection: {{agency}}')
ON CONFLICT (form_type) DO NOTHING;

-- ============================================================
-- EMAIL NOTIFICATIONS LOG
-- ============================================================
CREATE TABLE IF NOT EXISTS email_notifications_log (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  form_type text NOT NULL,
  row_id text NOT NULL,
  client_submission_id text,
  status text NOT NULL DEFAULT 'sent',
  recipients_json jsonb DEFAULT '[]',
  provider_message_id text,
  error text,
  payload_snapshot jsonb DEFAULT '{}',
  created_at timestamptz DEFAULT now() NOT NULL,
  CONSTRAINT email_notifications_log_client_submission_id_key UNIQUE (client_submission_id)
);

CREATE INDEX IF NOT EXISTS idx_email_notifications_log_form_type ON email_notifications_log(form_type);
CREATE INDEX IF NOT EXISTS idx_email_notifications_log_row_id ON email_notifications_log(row_id);
CREATE INDEX IF NOT EXISTS idx_email_notifications_log_status ON email_notifications_log(status);
CREATE INDEX IF NOT EXISTS idx_email_notifications_log_created_at ON email_notifications_log(created_at DESC);

ALTER TABLE email_notifications_log ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access on email_notifications_log"
  ON email_notifications_log FOR ALL TO service_role USING (true) WITH CHECK (true);

-- ============================================================
-- AGENCY CONNECTION CONFIRMS
-- ============================================================
CREATE TABLE IF NOT EXISTS agency_connection_confirms (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  agency_id text,
  agency_name text NOT NULL DEFAULT '',
  contact_name text NOT NULL DEFAULT '',
  contact_email text NOT NULL DEFAULT '',
  contact_phone text,
  message text,
  state_slug text,
  state_name text,
  page_path text,
  utm_source text,
  utm_medium text,
  utm_campaign text,
  meta jsonb DEFAULT '{}',
  created_at timestamptz DEFAULT now() NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_agency_connection_confirms_agency_id ON agency_connection_confirms(agency_id);
CREATE INDEX IF NOT EXISTS idx_agency_connection_confirms_contact_email ON agency_connection_confirms(contact_email);
CREATE INDEX IF NOT EXISTS idx_agency_connection_confirms_created_at ON agency_connection_confirms(created_at DESC);

ALTER TABLE agency_connection_confirms ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access on agency_connection_confirms"
  ON agency_connection_confirms FOR ALL TO service_role USING (true) WITH CHECK (true);

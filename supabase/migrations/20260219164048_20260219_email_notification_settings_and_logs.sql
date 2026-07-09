/*
  # Email Notification Settings & Logs — Full Schema

  ## Summary
  Replaces the minimal `notification_settings` table with a richer
  `email_notification_settings` table that stores per-type subject AND body
  templates, enable/disable state, and recipient list.

  Also creates `email_notification_logs` for per-send auditing (both real
  triggers and admin test sends).

  ## Changes

  ### New Tables
  - `email_notification_settings`
    - `notification_type` (text, unique) — primary key alias
    - `is_enabled` (boolean, default true)
    - `recipient_emails` (text) — comma-separated
    - `subject_template` (text) — supports {{variables}}
    - `body_html` (text) — HTML body template
    - `body_text` (text, nullable) — plain-text fallback
    - `updated_at`, `created_at`

  - `email_notification_logs`
    - `id` (uuid pk)
    - `notification_type` (text)
    - `is_test` (boolean) — true when sent from admin test-send
    - `to_emails` (text)
    - `subject` (text)
    - `status` (text) — 'sent' | 'failed'
    - `provider` (text)
    - `provider_message_id`, `provider_response`, `error_code`, `error_message`
    - `payload` (jsonb) — the variable values used for rendering
    - `request_id` (text)
    - `created_at`

  ### Existing Data Migration
  Seeds `email_notification_settings` from existing `notification_settings`
  rows so no data is lost.

  ### Security
  - RLS enabled on both tables
  - Only service_role can read/write (all access via edge functions)
*/

-- ─── email_notification_settings ────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS email_notification_settings (
  notification_type  text PRIMARY KEY,
  is_enabled         boolean NOT NULL DEFAULT true,
  recipient_emails   text    NOT NULL DEFAULT '',
  subject_template   text    NOT NULL DEFAULT '',
  body_html          text    NOT NULL DEFAULT '',
  body_text          text,
  updated_at         timestamptz NOT NULL DEFAULT now(),
  created_at         timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE email_notification_settings ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'email_notification_settings' AND policyname = 'Service role full access on email_notification_settings'
  ) THEN
    EXECUTE $pol$
      CREATE POLICY "Service role full access on email_notification_settings"
        ON email_notification_settings
        FOR ALL
        TO service_role
        USING (true)
        WITH CHECK (true)
    $pol$;
  END IF;
END $$;

-- ─── Seed from existing notification_settings ───────────────────────────────

INSERT INTO email_notification_settings (notification_type, is_enabled, recipient_emails, subject_template, body_html)
SELECT
  form_type,
  enabled,
  COALESCE(recipients, ''),
  COALESCE(subject_template, ''),
  ''
FROM notification_settings
ON CONFLICT (notification_type) DO UPDATE
  SET
    is_enabled       = EXCLUDED.is_enabled,
    recipient_emails = EXCLUDED.recipient_emails,
    subject_template = EXCLUDED.subject_template,
    updated_at       = now();

-- Ensure all 5 types exist with sensible defaults
INSERT INTO email_notification_settings (notification_type, is_enabled, recipient_emails, subject_template, body_html)
VALUES
  ('get_matched',        true, '', 'New Get Matched lead: {{company}}',         ''),
  ('sponsored_spotlight',true, '', 'New Spotlight application: {{company}}',    ''),
  ('top25_submission',   true, '', 'New Top 25 submission: {{company}}',         ''),
  ('availability_check', true, '', 'New Availability check: {{agency}}',         ''),
  ('confirm_connection', true, '', 'Confirm Connection: {{agency}}',             '')
ON CONFLICT (notification_type) DO NOTHING;

-- ─── email_notification_logs ─────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS email_notification_logs (
  id                   uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at           timestamptz NOT NULL DEFAULT now(),
  notification_type    text        NOT NULL,
  is_test              boolean     NOT NULL DEFAULT false,
  to_emails            text        NOT NULL DEFAULT '',
  subject              text        NOT NULL DEFAULT '',
  status               text        NOT NULL CHECK (status IN ('sent','failed')),
  provider             text        NOT NULL DEFAULT 'smtp',
  provider_message_id  text,
  provider_response    text,
  error_code           text,
  error_message        text,
  payload              jsonb,
  request_id           text
);

CREATE INDEX IF NOT EXISTS idx_enl_type_created
  ON email_notification_logs (notification_type, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_enl_is_test
  ON email_notification_logs (is_test, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_enl_status
  ON email_notification_logs (status, created_at DESC);

ALTER TABLE email_notification_logs ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'email_notification_logs' AND policyname = 'Service role full access on email_notification_logs'
  ) THEN
    EXECUTE $pol$
      CREATE POLICY "Service role full access on email_notification_logs"
        ON email_notification_logs
        FOR ALL
        TO service_role
        USING (true)
        WITH CHECK (true)
    $pol$;
  END IF;
END $$;

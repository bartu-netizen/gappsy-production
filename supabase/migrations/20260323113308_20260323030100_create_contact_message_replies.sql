/*
  # Create contact_message_replies table

  ## Summary
  Stores outbound replies sent from the WP-admin Contact Inbox. Combined with
  the inbound contact_messages rows, this forms a complete conversation thread
  per sender email address.

  ## New Tables

  ### contact_message_replies
  Outbound replies sent by admins through the contact inbox reply composer.

  Columns:
  - `id`                         — UUID primary key
  - `contact_message_id`         — FK to the original inbound message (nullable for future inbound threading)
  - `thread_key`                 — sender email_normalized (groups all messages in same thread)
  - `direction`                  — outbound (reserved: inbound for future reply ingestion)
  - `subject`                    — email subject line
  - `body_text`                  — plain text body (required)
  - `body_html`                  — HTML body (optional)
  - `to_email`                   — recipient email
  - `to_name`                    — recipient name
  - `from_email`                 — sending address
  - `from_name`                  — sending name / display name
  - `sent_at`                    — when the email was sent
  - `sent_by`                    — admin who sent (from admin session)
  - `delivery_status`            — sent | failed | bounced
  - `email_provider_message_id`  — SMTP message ID for delivery tracking
  - `created_at`                 — row insertion timestamp

  ## Security
  - RLS enabled
  - service_role: full CRUD
  - authenticated: SELECT only

  ## Notes
  1. Structured to support future inbound reply ingestion (direction = 'inbound')
  2. thread_key = email_normalized enables full conversation reconstruction
  3. contact_message_id can be null for system-initiated outbound messages
*/

CREATE TABLE IF NOT EXISTS contact_message_replies (
  id                           uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_message_id           uuid        REFERENCES contact_messages(id) ON DELETE SET NULL,
  thread_key                   text        NOT NULL,
  direction                    text        NOT NULL DEFAULT 'outbound',
  subject                      text,
  body_text                    text        NOT NULL,
  body_html                    text,
  to_email                     text        NOT NULL,
  to_name                      text,
  from_email                   text,
  from_name                    text,
  sent_at                      timestamptz NOT NULL DEFAULT now(),
  sent_by                      text,
  delivery_status              text        NOT NULL DEFAULT 'sent',
  email_provider_message_id    text,
  created_at                   timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE contact_message_replies ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access to contact_message_replies"
  ON contact_message_replies FOR ALL
  TO service_role
  USING (true) WITH CHECK (true);

CREATE POLICY "Authenticated users can read contact_message_replies"
  ON contact_message_replies FOR SELECT
  TO authenticated
  USING (true);

CREATE INDEX IF NOT EXISTS idx_cmr_contact_message_id
  ON contact_message_replies (contact_message_id);

CREATE INDEX IF NOT EXISTS idx_cmr_thread_key
  ON contact_message_replies (thread_key);

CREATE INDEX IF NOT EXISTS idx_cmr_sent_at
  ON contact_message_replies (sent_at DESC);

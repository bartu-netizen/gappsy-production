/*
  # Create email_send_logs table

  Tracks every test email send attempt from the SMTP admin panel.

  1. New Tables
    - `email_send_logs`
      - `id` (uuid, primary key)
      - `created_at` (timestamptz)
      - `to_email` (text)
      - `template_id` (text)
      - `subject` (text)
      - `status` (text) - 'sent' | 'failed'
      - `error_code` (text, nullable)
      - `error_message` (text, nullable)
      - `provider_message` (text, nullable)
      - `request_id` (text, nullable)

  2. Security
    - Enable RLS
    - Only authenticated admin sessions can insert/select
    - No public access
*/

CREATE TABLE IF NOT EXISTS email_send_logs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at timestamptz DEFAULT now(),
  to_email text NOT NULL,
  template_id text NOT NULL DEFAULT 'basic',
  subject text NOT NULL DEFAULT '',
  status text NOT NULL DEFAULT 'sent',
  error_code text,
  error_message text,
  provider_message text,
  request_id text
);

ALTER TABLE email_send_logs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role can manage email send logs"
  ON email_send_logs
  FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "Service role can insert email send logs"
  ON email_send_logs
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_email_send_logs_created_at ON email_send_logs (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_email_send_logs_status ON email_send_logs (status);

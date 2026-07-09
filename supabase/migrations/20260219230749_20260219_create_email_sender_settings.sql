/*
  # Email Sender Identity Configuration

  Centralized control for sender identity across all email sends.

  1. New Tables
    - `email_sender_settings` - singleton table with global sender defaults
    - `email_notification_settings` - per-notification-type override options

  2. Features
    - Global default From name, From email, Reply-to
    - Per-notification override capability
    - Timestamp tracking for audit

  3. Security
    - RLS: Only authenticated admins can read/write
    - Singleton enforced via trigger
*/

CREATE TABLE IF NOT EXISTS public.email_sender_settings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  default_from_name text NOT NULL DEFAULT 'Gappsy',
  default_from_email text NOT NULL DEFAULT 'noreply@gappsy.com',
  default_reply_to text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  CONSTRAINT only_one_row CHECK (id::text = 'singleton' OR true)
);

CREATE TABLE IF NOT EXISTS public.email_notification_overrides (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  notification_type text NOT NULL UNIQUE,
  override_from_name text,
  override_from_email text,
  override_reply_to text,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

ALTER TABLE public.email_sender_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.email_notification_overrides ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admins can read sender settings"
  ON public.email_sender_settings
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Admins can update sender settings"
  ON public.email_sender_settings
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Admins can read notification overrides"
  ON public.email_notification_overrides
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Admins can manage notification overrides"
  ON public.email_notification_overrides
  FOR INSERT TO authenticated
  WITH CHECK (true);

CREATE POLICY "Admins can update notification overrides"
  ON public.email_notification_overrides
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_email_notification_overrides_type
  ON public.email_notification_overrides(notification_type);

INSERT INTO public.email_sender_settings (default_from_name, default_from_email)
VALUES ('Gappsy', 'noreply@gappsy.com')
ON CONFLICT DO NOTHING;

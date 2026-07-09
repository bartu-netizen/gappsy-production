/*
  # Quick Send Email System

  Add tables and functions for ad-hoc 1:1 email sending with tracking.

  1. New Tables
    - `email_messages` - stores individual email sends
    - `email_events` - tracks opens, clicks, delivery status
    - `email_click_urls` - stores original URLs for link rewrites

  2. Tracking Endpoints
    - Public tracking endpoints for opens/clicks (no auth required)
    - Server-side writes use service role

  3. Security
    - RLS: Only authenticated admins can manage (validated in edge functions)
    - Tracking endpoints validate message_id exists
    - No email addresses exposed in public URLs
*/

CREATE TABLE IF NOT EXISTS public.email_messages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  kind text NOT NULL DEFAULT 'quick_send',
  to_email text NOT NULL,
  to_name text,
  subject text NOT NULL,
  from_name text NOT NULL,
  from_email text NOT NULL,
  reply_to text,
  html_body text NOT NULL,
  text_body text,
  status text NOT NULL DEFAULT 'queued',
  provider_message_id text,
  sent_at timestamptz,
  delivered_at timestamptz,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.email_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email_message_id uuid NOT NULL REFERENCES public.email_messages(id) ON DELETE CASCADE,
  event_type text NOT NULL,
  occurred_at timestamptz NOT NULL DEFAULT now(),
  url text,
  user_agent text,
  ip_hash text,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.email_click_urls (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email_message_id uuid NOT NULL REFERENCES public.email_messages(id) ON DELETE CASCADE,
  original_url text NOT NULL,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE public.email_messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.email_events ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.email_click_urls ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admins can read quick sends"
  ON public.email_messages
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Admins can create quick sends"
  ON public.email_messages
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Admins can update quick sends"
  ON public.email_messages
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Events readable by authenticated"
  ON public.email_events
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Service role can insert events"
  ON public.email_events
  FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Click URLs readable by authenticated"
  ON public.email_click_urls
  FOR SELECT
  TO authenticated
  USING (true);

CREATE INDEX IF NOT EXISTS idx_email_messages_status
  ON public.email_messages(status, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_email_messages_to_email
  ON public.email_messages(to_email, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_email_events_message_id
  ON public.email_events(email_message_id, event_type, occurred_at DESC);

CREATE INDEX IF NOT EXISTS idx_email_events_type_occurred
  ON public.email_events(event_type, occurred_at DESC);

CREATE INDEX IF NOT EXISTS idx_email_click_urls_message_id
  ON public.email_click_urls(email_message_id, original_url);

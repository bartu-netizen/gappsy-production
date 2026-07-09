/*
  # Funnel Tracking: funnel_sessions + funnel_events

  ## Purpose
  Track the full conversion funnel for all 5 lead types across 52 state pages.
  Enables the Submissions Center to show: funnel stage, last seen, drop-off, payment status, timeline.

  ## New Tables

  ### funnel_sessions
  One row per unique lead/session. Acts as the "summary" row joined into submissions.
  - id, created_at, updated_at
  - funnel_type: 'top25' | 'spotlight' | 'demo' | 'availability' | 'matched'
  - state_slug, lead_email, lead_name, agency_name, agency_id, visitor_id
  - lead_key: deterministic dedup key = lower(email)+'|'+funnel_type+'|'+state_slug
  - submission_type, submission_id: links back to the actual form submission table
  - last_event_name, last_event_at, stage, dropoff_stage, dropoff_path
  - selected_offer, selected_upsell
  - checkout_session_id, payment_intent_id, payment_status, amount_total, currency

  ### funnel_events
  One row per event in the funnel. Append-only timeline.
  - id, created_at, session_id (FK -> funnel_sessions), funnel_type, state_slug
  - visitor_id, lead_email
  - event_name: 'page_view' | 'offer_view' | 'upsell_view' | 'cta_click' | 'form_submit' | 'checkout_start' | 'payment_success' | 'payment_failed'
  - event_stage: 'offer' | 'upsell' | 'checkout' | 'thankyou'
  - page_path, referrer, metadata (jsonb)

  ## Security
  - RLS enabled on both tables
  - Only service role (via edge functions) can write
  - No public read access
  - Admin reads are done via edge functions with service role
*/

-- ─── funnel_sessions ────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS funnel_sessions (
  id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at          timestamptz NOT NULL DEFAULT now(),
  updated_at          timestamptz NOT NULL DEFAULT now(),

  funnel_type         text NOT NULL,
  state_slug          text,
  lead_email          text,
  lead_name           text,
  agency_name         text,
  agency_id           text,
  visitor_id          text,

  lead_key            text UNIQUE,

  submission_type     text,
  submission_id       text,

  last_event_name     text,
  last_event_at       timestamptz,

  stage               text DEFAULT 'opened',
  dropoff_stage       text,
  dropoff_path        text,

  selected_offer      text,
  selected_upsell     text,

  checkout_session_id text,
  payment_intent_id   text,
  payment_status      text,
  amount_total        integer,
  currency            text
);

ALTER TABLE funnel_sessions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role only insert funnel_sessions"
  ON funnel_sessions FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role only update funnel_sessions"
  ON funnel_sessions FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Service role only select funnel_sessions"
  ON funnel_sessions FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "Service role only delete funnel_sessions"
  ON funnel_sessions FOR DELETE
  TO service_role
  USING (true);

CREATE INDEX IF NOT EXISTS idx_funnel_sessions_lead_key     ON funnel_sessions (lead_key);
CREATE INDEX IF NOT EXISTS idx_funnel_sessions_visitor      ON funnel_sessions (visitor_id, funnel_type, state_slug);
CREATE INDEX IF NOT EXISTS idx_funnel_sessions_checkout     ON funnel_sessions (checkout_session_id);
CREATE INDEX IF NOT EXISTS idx_funnel_sessions_last_event   ON funnel_sessions (last_event_at DESC);
CREATE INDEX IF NOT EXISTS idx_funnel_sessions_submission   ON funnel_sessions (submission_type, submission_id);


-- ─── funnel_events ───────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS funnel_events (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at   timestamptz NOT NULL DEFAULT now(),

  session_id   uuid REFERENCES funnel_sessions(id) ON DELETE CASCADE,

  funnel_type  text NOT NULL,
  state_slug   text,
  visitor_id   text,
  lead_email   text,

  event_name   text NOT NULL,
  event_stage  text,
  page_path    text,
  referrer     text,
  metadata     jsonb NOT NULL DEFAULT '{}'::jsonb
);

ALTER TABLE funnel_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role only insert funnel_events"
  ON funnel_events FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role only select funnel_events"
  ON funnel_events FOR SELECT
  TO service_role
  USING (true);

CREATE INDEX IF NOT EXISTS idx_funnel_events_session   ON funnel_events (session_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_funnel_events_email     ON funnel_events (lead_email);
CREATE INDEX IF NOT EXISTS idx_funnel_events_visitor   ON funnel_events (visitor_id);

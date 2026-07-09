/*
  # Request Replay Funnel Tracking — Schema and Email Settings

  ## Summary
  Sets up full end-to-end tracking infrastructure for the /request-replay/:slug
  funnel so it integrates into the existing pipeline without any separate systems.

  ## Changes

  ### 1. Seed email_notification_settings for replay_opened
  Adds three rows to email_notification_settings so admin emails fire when an
  agency opens request replay, clicks the CTA, or completes the full replay.

  - replay_opened      — fires on every new replay session open (MANDATORY)
  - replay_cta_click   — fires when user clicks the activation CTA (disabled by default)
  - replay_completed   — fires when user reaches final CTA and stays (disabled by default)

  ### 2. Index on funnel_events for replay scoring
  Adds a composite index that makes the replay scoring CTE in
  compute_agency_intent_scores fast:

    funnel_events(funnel_name, event_name, created_at)
    WHERE funnel_name = 'request_replay'

  This is a partial index — zero cost for non-replay rows.

  ### 3. Index on funnel_sessions for replay session lookup by fsid
  funnel_sessions.fsid is already indexed (unique) so replay-funnel-track
  can look up sessions by replay_session_id. No change needed here.

  ## Security
  All changes target existing tables with existing RLS — no new tables, no
  RLS changes required.
*/

-- ── 1. Seed email_notification_settings for replay events ──────────────────

INSERT INTO email_notification_settings
  (notification_type, is_enabled, recipient_emails, subject_template, body_html)
VALUES
  (
    'replay_opened',
    true,
    'bartu@gappsy.com',
    'Replay opened — {{agency_name}}',
    '<p>An agency has opened the request replay page.</p>'
  ),
  (
    'replay_cta_click',
    false,
    'bartu@gappsy.com',
    'Replay CTA clicked — {{agency_name}}',
    '<p>An agency clicked the activation CTA during request replay.</p>'
  ),
  (
    'replay_completed',
    false,
    'bartu@gappsy.com',
    'Replay completed — {{agency_name}}',
    '<p>An agency completed the full request replay sequence.</p>'
  )
ON CONFLICT (notification_type) DO UPDATE SET
  is_enabled       = EXCLUDED.is_enabled,
  recipient_emails = CASE
    WHEN EXCLUDED.recipient_emails IS NULL OR EXCLUDED.recipient_emails = ''
    THEN 'bartu@gappsy.com'
    ELSE EXCLUDED.recipient_emails
  END,
  subject_template = EXCLUDED.subject_template,
  body_html        = EXCLUDED.body_html;

-- ── 2. Partial index on funnel_events for fast replay scoring ──────────────

CREATE INDEX IF NOT EXISTS idx_funnel_events_replay_scoring
  ON funnel_events (funnel_name, event_name, created_at DESC)
  WHERE funnel_name = 'request_replay';

-- ── 3. Composite index for replay session queries (visitor + funnel + agency) ─

CREATE INDEX IF NOT EXISTS idx_funnel_sessions_replay_lookup
  ON funnel_sessions (funnel_name, agency_id, visitor_id, created_at DESC)
  WHERE funnel_name = 'request_replay';

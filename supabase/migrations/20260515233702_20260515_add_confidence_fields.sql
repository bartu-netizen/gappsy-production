/*
  # Add Confidence Classification Fields

  ## Summary
  Adds human/scanner confidence scoring fields to funnel tracking tables.
  This is a purely additive migration — all new columns are nullable with no
  NOT NULL constraints, so every existing query and insert continues to work
  without change.

  ## New Columns

  ### funnel_events
  - `intent_level` (text) — classification: 'scanner' | 'possible_human' | 'verified_human'
  - `confidence_score` (int) — numeric score used to derive intent_level
  - `scanner_signals` (jsonb) — structured scanner detection signals
  - `human_signals` (jsonb) — structured human presence signals
  - `timing_signals` (jsonb) — thinking-time and interaction timing signals
  - `confidence_reasoning` (jsonb) — { positive: string[], negative: string[] } for debugging

  ### funnel_sessions
  - `intent_level` (text) — session-level classification
  - `confidence_score` (int) — session-level score
  - `active_time_ms` (int) — accumulated active foreground tab time in ms
  - `interaction_count` (int) — total human input interaction count
  - `is_scanner_flagged` (boolean, default false) — quick filter for scanner sessions
  - `thinking_time_ms` (int) — time between first input and first commercial interaction
  - `confidence_reasoning` (jsonb) — session-level reasoning snapshot

  ### manage_funnel_events
  - `intent_level` (text) — classification
  - `confidence_score` (int) — numeric score
  - `confidence_reasoning` (jsonb) — reasoning snapshot

  ## New Indexes
  - `funnel_events(intent_level)` — for filtering by classification
  - `funnel_sessions(intent_level, confidence_score)` — for sorted queries
  - `funnel_sessions(is_scanner_flagged)` — for fast scanner-exclusion queries

  ## Security
  No RLS changes — these columns inherit existing policies on their tables.
  No data is dropped or modified.
*/

-- ── funnel_events ─────────────────────────────────────────────────────────────

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'intent_level'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN intent_level text;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'confidence_score'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN confidence_score int;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'scanner_signals'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN scanner_signals jsonb;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'human_signals'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN human_signals jsonb;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'timing_signals'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN timing_signals jsonb;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_events' AND column_name = 'confidence_reasoning'
  ) THEN
    ALTER TABLE funnel_events ADD COLUMN confidence_reasoning jsonb;
  END IF;
END $$;

-- ── funnel_sessions ───────────────────────────────────────────────────────────

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'intent_level'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN intent_level text;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'confidence_score'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN confidence_score int;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'active_time_ms'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN active_time_ms int;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'interaction_count'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN interaction_count int;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'is_scanner_flagged'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN is_scanner_flagged boolean DEFAULT false;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'thinking_time_ms'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN thinking_time_ms int;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'funnel_sessions' AND column_name = 'confidence_reasoning'
  ) THEN
    ALTER TABLE funnel_sessions ADD COLUMN confidence_reasoning jsonb;
  END IF;
END $$;

-- ── manage_funnel_events ──────────────────────────────────────────────────────

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'manage_funnel_events' AND column_name = 'intent_level'
  ) THEN
    ALTER TABLE manage_funnel_events ADD COLUMN intent_level text;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'manage_funnel_events' AND column_name = 'confidence_score'
  ) THEN
    ALTER TABLE manage_funnel_events ADD COLUMN confidence_score int;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'manage_funnel_events' AND column_name = 'confidence_reasoning'
  ) THEN
    ALTER TABLE manage_funnel_events ADD COLUMN confidence_reasoning jsonb;
  END IF;
END $$;

-- ── Indexes ───────────────────────────────────────────────────────────────────

CREATE INDEX IF NOT EXISTS idx_funnel_events_intent_level
  ON funnel_events (intent_level);

CREATE INDEX IF NOT EXISTS idx_funnel_sessions_intent_confidence
  ON funnel_sessions (intent_level, confidence_score);

CREATE INDEX IF NOT EXISTS idx_funnel_sessions_scanner_flagged
  ON funnel_sessions (is_scanner_flagged);

-- ── Parallel intent scoring function (human-only, original untouched) ─────────

CREATE OR REPLACE FUNCTION compute_agency_human_intent_scores(
  p_state_slug text DEFAULT NULL
)
RETURNS TABLE (
  agency_id text,
  state_slug text,
  activity_score numeric,
  deepest_step integer,
  last_activity_at timestamptz,
  checkout_opened_count bigint,
  availability_submitted_count bigint,
  upsell_viewed_count bigint,
  profile_views bigint,
  profile_clicks bigint,
  repeat_visits bigint,
  score_breakdown jsonb
)
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    s.agency_id,
    s.state_slug,
    SUM(
      CASE
        WHEN e.event_name ILIKE '%checkout%' THEN 40
        WHEN e.event_name ILIKE '%activation%offer%' THEN 20
        WHEN e.event_name ILIKE '%activate%click%' THEN 15
        WHEN e.event_name ILIKE '%availability%submit%' THEN 10
        WHEN e.event_name ILIKE '%profile%view%' THEN 5
        WHEN e.event_name ILIKE '%replay%cta%' THEN 15
        ELSE 2
      END
    )::numeric AS activity_score,
    MAX(e.step_number) AS deepest_step,
    MAX(e.created_at) AS last_activity_at,
    COUNT(*) FILTER (WHERE e.event_name ILIKE '%checkout%') AS checkout_opened_count,
    COUNT(*) FILTER (WHERE e.event_name ILIKE '%availability%submit%') AS availability_submitted_count,
    COUNT(*) FILTER (WHERE e.event_name ILIKE '%upsell%' OR e.event_name ILIKE '%upgrade%') AS upsell_viewed_count,
    COUNT(*) FILTER (WHERE e.event_name ILIKE '%profile%view%') AS profile_views,
    COUNT(*) FILTER (WHERE e.event_name ILIKE '%profile%click%') AS profile_clicks,
    COUNT(DISTINCT s.fsid) AS repeat_visits,
    NULL::jsonb AS score_breakdown
  FROM funnel_sessions s
  JOIN funnel_events e ON e.session_id = s.id
  WHERE
    s.agency_id IS NOT NULL
    AND (p_state_slug IS NULL OR s.state_slug = p_state_slug)
    AND (s.is_scanner_flagged IS NULL OR s.is_scanner_flagged = false)
    AND e.created_at >= now() - interval '30 days'
  GROUP BY s.agency_id, s.state_slug
  HAVING SUM(
    CASE
      WHEN e.event_name ILIKE '%checkout%' THEN 40
      WHEN e.event_name ILIKE '%activation%offer%' THEN 20
      WHEN e.event_name ILIKE '%activate%click%' THEN 15
      WHEN e.event_name ILIKE '%availability%submit%' THEN 10
      WHEN e.event_name ILIKE '%profile%view%' THEN 5
      WHEN e.event_name ILIKE '%replay%cta%' THEN 15
      ELSE 2
    END
  ) > 0
  ORDER BY activity_score DESC;
$$;

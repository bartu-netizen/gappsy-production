/*
  # Extended Agency Intent Scoring with Manage Funnel

  ## Purpose
  Extends the existing `compute_agency_intent_scores` function to include
  manage/delete funnel signals as part of a multi-dimensional scoring model.

  ## Scoring Model Extension

  ### 1. positive_intent_score
  Unchanged from existing activity_score:
  - Profile views, clicks, engagement
  - Availability requests
  - Checkout opens
  - Smart link visits
  - All existing positive funnel signals

  ### 2. churn_intent_score (NEW)
  Signals that agency wants to remove listing or is at risk:
  - manage_funnel_opened: +2 (mild negative signal)
  - manage_remove_started: +10 (strong churn intent)
  - manage_remove_confirmed: +20 (terminal removal)
  - manage_recovered: -5 (reduces churn score)

  ### 3. recovery_opportunity_score (NEW)
  High engagement + churn signals = recovery priority:
  - manage_remove_started + high positive_intent: +15
  - manage_funnel_opened + multiple engaged leads: +8
  - Strong engagement (score > 50) + any manage activity: +5

  ### 4. final_priority_score (NEW)
  Combined prioritization score:
  - Base: positive_intent_score
  - Penalty: - (churn_intent_score * 0.5)
  - Boost: + recovery_opportunity_score
  - If manage_remove_confirmed: set to 0 (terminal)

  ### 5. recovery_priority (NEW)
  Classification: high / medium / low / none
  - HIGH: manage_remove_started + engagement > 50
  - MEDIUM: manage_funnel_opened + engagement > 30
  - LOW: any manage activity + engagement > 0
  - NONE: removed confirmed OR no manage activity

  ## Safety
  - Non-breaking: Creates NEW function (v2), preserves original
  - Returns all original fields plus new scoring dimensions
  - Backward compatible with existing callers
*/

CREATE OR REPLACE FUNCTION compute_agency_intent_scores_v2(
  p_state_slug text DEFAULT NULL
)
RETURNS TABLE (
  agency_id                    text,
  state_slug                   text,
  -- Original fields (unchanged)
  activity_score               numeric,
  deepest_step                 integer,
  last_activity_at             timestamptz,
  checkout_opened_count        integer,
  availability_submitted_count integer,
  upsell_viewed_count          integer,
  profile_views                integer,
  profile_clicks               integer,
  repeat_visits                integer,
  score_breakdown              jsonb,
  -- NEW: Multi-dimensional scoring fields
  positive_intent_score        numeric,
  churn_intent_score           numeric,
  recovery_opportunity_score   numeric,
  final_priority_score         numeric,
  recovery_priority            text,
  -- NEW: Manage funnel event counts
  manage_opened_count          integer,
  manage_remove_intent_count   integer,
  manage_recovered_count       integer,
  manage_removed_count         integer,
  last_manage_event_at         timestamptz,
  last_manage_event_type       text
)
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  WITH

  /* ──────────────────────────────────────────────────────────────────
     Use existing compute_agency_intent_scores as base
     ────────────────────────────────────────────────────────────────── */
  base_scores AS (
    SELECT *
    FROM compute_agency_intent_scores(p_state_slug)
  ),

  /* ──────────────────────────────────────────────────────────────────
     Aggregate manage_funnel_events per (agency_id, state_slug)
     ────────────────────────────────────────────────────────────────── */
  manage_agg AS (
    SELECT
      agency_id,
      COALESCE(state_slug, '') AS sl,
      COUNT(*) FILTER (
        WHERE event_type = 'manage_funnel_opened'
      )::int AS opened_count,
      COUNT(*) FILTER (
        WHERE event_type = 'manage_remove_started'
      )::int AS remove_intent_count,
      COUNT(*) FILTER (
        WHERE event_type = 'manage_recovered'
      )::int AS recovered_count,
      COUNT(*) FILTER (
        WHERE event_type = 'manage_remove_confirmed'
      )::int AS removed_count,
      MAX(created_at) AS last_manage_at,
      (ARRAY_AGG(event_type ORDER BY created_at DESC))[1] AS last_event_type
    FROM manage_funnel_events
    WHERE agency_id IS NOT NULL
      AND agency_id <> ''
      AND (p_state_slug IS NULL OR state_slug = p_state_slug)
    GROUP BY agency_id, COALESCE(state_slug, '')
  ),

  /* ──────────────────────────────────────────────────────────────────
     Calculate multi-dimensional scores
     ────────────────────────────────────────────────────────────────── */
  scored AS (
    SELECT
      bs.agency_id,
      bs.state_slug,
      -- Original fields
      bs.activity_score,
      bs.deepest_step,
      bs.last_activity_at,
      bs.checkout_opened_count,
      bs.availability_submitted_count,
      bs.upsell_viewed_count,
      bs.profile_views,
      bs.profile_clicks,
      bs.repeat_visits,
      bs.score_breakdown,

      -- Manage funnel counts
      COALESCE(ma.opened_count, 0) AS manage_opened_count,
      COALESCE(ma.remove_intent_count, 0) AS manage_remove_intent_count,
      COALESCE(ma.recovered_count, 0) AS manage_recovered_count,
      COALESCE(ma.removed_count, 0) AS manage_removed_count,
      ma.last_manage_at AS last_manage_event_at,
      ma.last_event_type AS last_manage_event_type,

      -- 1. positive_intent_score = existing activity_score
      bs.activity_score AS positive_intent_score,

      -- 2. churn_intent_score
      (
        COALESCE(ma.opened_count, 0) * 2 +
        COALESCE(ma.remove_intent_count, 0) * 10 +
        COALESCE(ma.removed_count, 0) * 20 -
        COALESCE(ma.recovered_count, 0) * 5
      )::numeric AS churn_intent_score,

      -- 3. recovery_opportunity_score
      CASE
        -- High engagement + remove intent = high recovery priority
        WHEN COALESCE(ma.remove_intent_count, 0) > 0
             AND bs.activity_score > 50 THEN 15
        -- Opened manage + strong engagement = medium recovery opportunity
        WHEN COALESCE(ma.opened_count, 0) > 0
             AND bs.activity_score > 30 THEN 8
        -- Any manage activity + some engagement = low recovery opportunity
        WHEN (COALESCE(ma.opened_count, 0) + COALESCE(ma.remove_intent_count, 0)) > 0
             AND bs.activity_score > 0 THEN 5
        ELSE 0
      END::numeric AS recovery_opportunity_score,

      -- Flag for removed agencies
      COALESCE(ma.removed_count, 0) > 0 AS is_removed

    FROM base_scores bs
    LEFT JOIN manage_agg ma ON ma.agency_id = bs.agency_id AND ma.sl = bs.state_slug

    -- Include agencies that have manage activity but no base score
    UNION ALL

    SELECT
      ma.agency_id,
      ma.sl AS state_slug,
      -- Original fields (zeros/nulls for agencies with only manage activity)
      0::numeric AS activity_score,
      0 AS deepest_step,
      ma.last_manage_at AS last_activity_at,
      0 AS checkout_opened_count,
      0 AS availability_submitted_count,
      0 AS upsell_viewed_count,
      0 AS profile_views,
      0 AS profile_clicks,
      0 AS repeat_visits,
      '{}'::jsonb AS score_breakdown,

      -- Manage funnel counts
      ma.opened_count AS manage_opened_count,
      ma.remove_intent_count AS manage_remove_intent_count,
      ma.recovered_count AS manage_recovered_count,
      ma.removed_count AS manage_removed_count,
      ma.last_manage_at AS last_manage_event_at,
      ma.last_event_type AS last_manage_event_type,

      -- Scoring
      0::numeric AS positive_intent_score,
      (
        ma.opened_count * 2 +
        ma.remove_intent_count * 10 +
        ma.removed_count * 20 -
        ma.recovered_count * 5
      )::numeric AS churn_intent_score,
      0::numeric AS recovery_opportunity_score,
      ma.removed_count > 0 AS is_removed

    FROM manage_agg ma
    WHERE NOT EXISTS (
      SELECT 1 FROM base_scores bs
      WHERE bs.agency_id = ma.agency_id AND bs.state_slug = ma.sl
    )
  )

  /* ──────────────────────────────────────────────────────────────────
     FINAL OUTPUT: Calculate final_priority_score and recovery_priority
     ────────────────────────────────────────────────────────────────── */
  SELECT
    s.agency_id,
    s.state_slug,
    s.activity_score,
    s.deepest_step,
    s.last_activity_at,
    s.checkout_opened_count,
    s.availability_submitted_count,
    s.upsell_viewed_count,
    s.profile_views,
    s.profile_clicks,
    s.repeat_visits,
    s.score_breakdown,
    s.positive_intent_score,
    s.churn_intent_score,
    s.recovery_opportunity_score,

    -- 4. final_priority_score
    CASE
      WHEN s.is_removed THEN 0  -- Removed agencies get zero priority
      ELSE ROUND(
        s.positive_intent_score
        - (s.churn_intent_score * 0.5)
        + s.recovery_opportunity_score,
      2)
    END AS final_priority_score,

    -- 5. recovery_priority classification
    CASE
      WHEN s.is_removed THEN 'none'
      WHEN s.manage_remove_intent_count > 0 AND s.positive_intent_score > 50 THEN 'high'
      WHEN s.manage_opened_count > 0 AND s.positive_intent_score > 30 THEN 'medium'
      WHEN (s.manage_opened_count + s.manage_remove_intent_count) > 0
           AND s.positive_intent_score > 0 THEN 'low'
      ELSE 'none'
    END AS recovery_priority,

    s.manage_opened_count,
    s.manage_remove_intent_count,
    s.manage_recovered_count,
    s.manage_removed_count,
    s.last_manage_event_at,
    s.last_manage_event_type

  FROM scored s
  ORDER BY
    CASE
      WHEN s.is_removed THEN 0
      ELSE ROUND(
        s.positive_intent_score
        - (s.churn_intent_score * 0.5)
        + s.recovery_opportunity_score,
      2)
    END DESC,
    s.deepest_step DESC,
    s.last_activity_at DESC NULLS LAST;
$$;

/* Grant execute to both anon and authenticated roles */
GRANT EXECUTE ON FUNCTION compute_agency_intent_scores_v2(text)
  TO anon, authenticated;

/* Create index on manage_funnel_events for efficient aggregation */
CREATE INDEX IF NOT EXISTS idx_manage_funnel_events_agency_state_scoring
  ON manage_funnel_events (agency_id, state_slug, event_type, created_at DESC)
  WHERE agency_id IS NOT NULL AND agency_id <> '';

COMMENT ON FUNCTION compute_agency_intent_scores_v2(text) IS
  'Extended agency intent scoring with manage/delete funnel signals. Returns multi-dimensional scores: positive_intent, churn_intent, recovery_opportunity, final_priority, and recovery_priority classification.';

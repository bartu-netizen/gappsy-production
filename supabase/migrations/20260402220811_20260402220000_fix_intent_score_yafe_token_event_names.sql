/*
  # Fix compute_agency_intent_scores: yafe_agg token/smart-link event names

  ## Problem
  The yafe_agg CTE was filtering for event names that are never written to
  your_agency_funnel_events:

    'smart_link_visit', 'token_link_visit', 'smart_link_clicked',
    'direct_token_visit', 'token_page_viewed'

  The track-your-agency-event edge function has an ALLOWED_EVENTS whitelist
  that does not include any of these names. As a result, the token_visit_score
  (formerly smart_link_score) was always 0 for every agency.

  ## Fix
  Replace the dead event names with the two events that are actually written
  to your_agency_funnel_events by the /your-agency token flow:

    'your_agency_token_open'        — emitted when a token link is opened
    'your_agency_view_listing_click' — emitted when user clicks through to
                                       their listing from the token page

  Both are confirmed real in track-your-agency-event/index.ts ALLOWED_EVENTS.

  ## Renamed column
  Internal CTE column smart_link_score renamed to token_visit_score for
  accuracy. JSONB score_breakdown key updated to match.
  The return table signature is unchanged — activity_score absorbs this.

  ## No other changes
  All scoring weights, recency multipliers, deepest_step ladder, all_combos
  UNION (including the session_agg / eng_agg fix from 20260402212829),
  SECURITY DEFINER, and GRANT are preserved exactly.
*/

CREATE OR REPLACE FUNCTION compute_agency_intent_scores(
  p_state_slug text DEFAULT NULL
)
RETURNS TABLE (
  agency_id                    text,
  state_slug                   text,
  activity_score               numeric,
  deepest_step                 integer,
  last_activity_at             timestamptz,
  checkout_opened_count        integer,
  availability_submitted_count integer,
  upsell_viewed_count          integer,
  profile_views                integer,
  profile_clicks               integer,
  repeat_visits                integer,
  score_breakdown              jsonb
)
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  WITH

  /* ─── 1. FUNNEL EVENTS (main weighted event signals) ───────────────── */
  fe_agg AS (
    SELECT
      fs.agency_id,
      COALESCE(fe.state_slug, fs.state_slug)     AS sl,
      MAX(fe.step_number)                        AS max_step,
      MAX(fe.created_at)                         AS last_event_at,
      COUNT(*) FILTER (
        WHERE fe.event_name = 'stripe_checkout_opened'
      )                                          AS checkout_opens,
      COUNT(*) FILTER (
        WHERE fe.event_name = 'demo_availability_submitted'
      )                                          AS avail_submits,
      COUNT(*) FILTER (
        WHERE fe.event_name = 'activation_upsell_viewed'
      )                                          AS upsell_views,
      COUNT(*) FILTER (
        WHERE fe.event_name IN (
          'your_agency_overview_viewed',
          'your_agency_landing_viewed'
        )
      )                                          AS pv_views,
      SUM(
        CASE fe.event_name
          WHEN 'your_agency_profile_clicked'             THEN 2
          WHEN 'your_agency_overview_viewed'             THEN 2
          WHEN 'your_agency_landing_viewed'              THEN 1
          WHEN 'your_agency_see_listing_clicked'         THEN 4
          WHEN 'owner_preview_state_page_viewed'         THEN 3
          WHEN 'owner_preview_scroll_to_listing_clicked' THEN 4
          WHEN 'owner_preview_step2_started'             THEN 4
          WHEN 'demo_availability_modal_opened'          THEN 5
          WHEN 'demo_availability_submitted'             THEN 8
          WHEN 'demo_post_availability_result_viewed'    THEN 2
          WHEN 'activation_upsell_viewed'                THEN 10
          WHEN 'upgrade_positions_page_viewed'           THEN 7
          WHEN 'activate_listing_clicked'                THEN 9
          ELSE 0
        END
      )                                          AS base_event_score
    FROM funnel_events fe
    JOIN funnel_sessions fs ON fs.id = fe.session_id
    WHERE fe.funnel_name = 'your_agency'
      AND fs.agency_id IS NOT NULL
      AND fs.agency_id <> ''
      AND fe.event_name <> 'stripe_checkout_completed'
      AND (
        p_state_slug IS NULL
        OR COALESCE(fe.state_slug, fs.state_slug) = p_state_slug
      )
    GROUP BY
      fs.agency_id,
      COALESCE(fe.state_slug, fs.state_slug)
  ),

  /* checkout bonus: first open = 20, up to 4 extra = +6 each */
  checkout_bonus AS (
    SELECT
      agency_id,
      sl,
      (LEAST(checkout_opens, 1) * 20
       + LEAST(GREATEST(checkout_opens - 1, 0), 4) * 6
      )::int AS checkout_score
    FROM fe_agg
  ),

  /* ─── 2. TOKEN / SMART-LINK VISITS (your_agency_funnel_events) ─────
     Real events confirmed in track-your-agency-event ALLOWED_EVENTS:
       your_agency_token_open        — token link opened
       your_agency_view_listing_click — clicked through to listing
     +4 per occurrence, capped at 5 total occurrences.
  ────────────────────────────────────────────────────────────────────── */
  yafe_agg AS (
    SELECT
      agency_id,
      COALESCE(state_slug, '')                                AS sl,
      (LEAST(
        COUNT(*) FILTER (
          WHERE event_name IN (
            'your_agency_token_open',
            'your_agency_view_listing_click'
          )
        ),
      5) * 4)::int                                           AS token_visit_score,
      MAX(created_at)                                        AS last_yafe_at
    FROM your_agency_funnel_events
    WHERE agency_id IS NOT NULL
      AND agency_id <> ''
      AND (p_state_slug IS NULL OR state_slug = p_state_slug)
    GROUP BY agency_id, COALESCE(state_slug, '')
  ),

  /* ─── 3. PROFILE CLICKS (your_agency_profile_clicks) ───────────────
     +1 per click, capped at 10
  ────────────────────────────────────────────────────────────────────── */
  click_agg AS (
    SELECT
      agency_id,
      COALESCE(state_slug, '')            AS sl,
      COUNT(*)::int                       AS click_count,
      (LEAST(COUNT(*), 10))::int          AS click_score,
      MAX(created_at)                     AS last_click_at
    FROM your_agency_profile_clicks
    WHERE agency_id IS NOT NULL
      AND agency_id <> ''
      AND (p_state_slug IS NULL OR state_slug = p_state_slug)
    GROUP BY agency_id, COALESCE(state_slug, '')
  ),

  /* ─── 4. REPEAT SESSIONS (funnel_sessions) ──────────────────────────
     Each session beyond the first = +3, capped at 5 extra sessions
  ────────────────────────────────────────────────────────────────────── */
  session_agg AS (
    SELECT
      agency_id,
      COALESCE(state_slug, '')                               AS sl,
      COUNT(DISTINCT id)::int                                AS total_sessions,
      (LEAST(GREATEST(COUNT(DISTINCT id) - 1, 0), 5) * 3
      )::int                                                 AS repeat_score,
      MAX(last_event_at)                                     AS last_session_at
    FROM funnel_sessions
    WHERE funnel_name = 'your_agency'
      AND agency_id IS NOT NULL
      AND agency_id <> ''
      AND (p_state_slug IS NULL OR state_slug = p_state_slug)
    GROUP BY agency_id, COALESCE(state_slug, '')
  ),

  /* ─── 5. DWELL-TIME ENGAGEMENT (agency_funnel_engagement) ──────────
     Bonuses based on time_on_page_seconds per page type.
  ────────────────────────────────────────────────────────────────────── */
  eng_agg AS (
    SELECT
      e.agency_id,
      COALESCE(fs.state_slug, '')                            AS sl,
      SUM(
        CASE
          WHEN e.time_on_page_seconds >= 20
               AND (  e.page_path ILIKE '%overview%'
                   OR e.page_path ILIKE '%your-agency%'
                   OR e.page_path ILIKE '%/ya/%')            THEN 1
          WHEN e.time_on_page_seconds >= 30
               AND (  e.page_path ILIKE '%activat%'
                   OR e.page_path ILIKE '%upsell%'
                   OR e.page_path ILIKE '%upgrade%')         THEN 3
          WHEN e.time_on_page_seconds >= 20
               AND e.page_path ILIKE '%checkout%'            THEN 5
          ELSE 0
        END
      )::int                                                 AS dwell_score,
      MAX(e.created_at)                                      AS last_eng_at
    FROM agency_funnel_engagement e
    LEFT JOIN funnel_sessions fs ON fs.fsid = e.fsid
    WHERE e.agency_id IS NOT NULL
      AND e.agency_id <> ''
      AND (
        p_state_slug IS NULL
        OR COALESCE(fs.state_slug, '') = p_state_slug
        OR fs.state_slug IS NULL
      )
    GROUP BY e.agency_id, COALESCE(fs.state_slug, '')
  ),

  /* ─── 6. ALL COMBOS — all five signal sources ───────────────────── */
  all_combos AS (
    SELECT agency_id, sl FROM fe_agg
    UNION
    SELECT agency_id, sl FROM click_agg
    UNION
    SELECT agency_id, sl FROM yafe_agg
    UNION
    SELECT agency_id, sl FROM session_agg
    UNION
    SELECT agency_id, sl FROM eng_agg
  ),

  /* ─── 7. COMBINED: join all score tables onto the combo set ─────── */
  combined AS (
    SELECT
      ac.agency_id,
      ac.sl                                                          AS state_slug,

      COALESCE(fa.base_event_score, 0)::int                         AS event_score,
      COALESCE(cb.checkout_score,   0)::int                         AS checkout_score,
      COALESCE(ya.token_visit_score, 0)::int                        AS token_visit_score,
      COALESCE(cl.click_score,      0)::int                         AS click_score,
      COALESCE(sa.repeat_score,     0)::int                         AS repeat_score,
      COALESCE(ea.dwell_score,      0)::int                         AS dwell_score,

      COALESCE(fa.checkout_opens,   0)::int                         AS checkout_opened_count,
      COALESCE(fa.avail_submits,    0)::int                         AS availability_submitted_count,
      COALESCE(fa.upsell_views,     0)::int                         AS upsell_viewed_count,
      COALESCE(fa.pv_views,         0)::int                         AS profile_views,
      COALESCE(cl.click_count,      0)::int                         AS profile_clicks,
      GREATEST(COALESCE(sa.total_sessions, 1) - 1, 0)::int          AS repeat_visits,

      CASE
        WHEN COALESCE(fa.max_step, 0) >= 130 THEN 5
        WHEN COALESCE(fa.max_step, 0) >= 100 THEN 4
        WHEN COALESCE(fa.max_step, 0) >=  70 THEN 3
        WHEN COALESCE(fa.max_step, 0) >=  40 THEN 2
        WHEN COALESCE(fa.max_step, 0) >    0 THEN 1
        ELSE 0
      END::int                                                       AS deepest_step,

      GREATEST(
        fa.last_event_at,
        cl.last_click_at,
        ea.last_eng_at,
        sa.last_session_at,
        ya.last_yafe_at
      )                                                              AS last_activity_at,

      COALESCE(fa.max_step, 0)                                       AS raw_max_step

    FROM all_combos ac
    LEFT JOIN fe_agg       fa ON fa.agency_id = ac.agency_id AND fa.sl = ac.sl
    LEFT JOIN checkout_bonus cb ON cb.agency_id = ac.agency_id AND cb.sl = ac.sl
    LEFT JOIN yafe_agg     ya ON ya.agency_id = ac.agency_id AND ya.sl = ac.sl
    LEFT JOIN click_agg    cl ON cl.agency_id = ac.agency_id AND cl.sl = ac.sl
    LEFT JOIN session_agg  sa ON sa.agency_id = ac.agency_id AND sa.sl = ac.sl
    LEFT JOIN eng_agg      ea ON ea.agency_id = ac.agency_id AND ea.sl = ac.sl
  ),

  /* ─── 8. RECENCY WEIGHTING ──────────────────────────────────────── */
  scored AS (
    SELECT
      c.*,
      (c.event_score + c.checkout_score + c.token_visit_score
       + c.click_score + c.repeat_score + c.dwell_score
      )::numeric AS raw_score,
      CASE
        WHEN c.last_activity_at >= NOW() - INTERVAL '3 days'  THEN 1.35
        WHEN c.last_activity_at >= NOW() - INTERVAL '7 days'  THEN 1.20
        WHEN c.last_activity_at >= NOW() - INTERVAL '14 days' THEN 1.10
        WHEN c.last_activity_at >= NOW() - INTERVAL '30 days' THEN 1.00
        WHEN c.last_activity_at >= NOW() - INTERVAL '60 days' THEN 0.75
        WHEN c.last_activity_at IS NULL                        THEN 1.00
        ELSE                                                        0.50
      END AS recency_mult
    FROM combined c
  )

  SELECT
    s.agency_id,
    s.state_slug,
    ROUND(s.raw_score * s.recency_mult, 2)             AS activity_score,
    s.deepest_step,
    s.last_activity_at,
    s.checkout_opened_count,
    s.availability_submitted_count,
    s.upsell_viewed_count,
    s.profile_views,
    s.profile_clicks,
    s.repeat_visits,
    jsonb_build_object(
      'event_score',         s.event_score,
      'checkout_score',      s.checkout_score,
      'token_visit_score',   s.token_visit_score,
      'click_score',         s.click_score,
      'repeat_score',        s.repeat_score,
      'dwell_score',         s.dwell_score,
      'raw_score',           s.raw_score,
      'recency_mult',        s.recency_mult,
      'final_score',         ROUND(s.raw_score * s.recency_mult, 2),
      'raw_max_step_number', s.raw_max_step
    )                                                   AS score_breakdown
  FROM scored s
  WHERE s.raw_score > 0
  ORDER BY
    ROUND(s.raw_score * s.recency_mult, 2) DESC,
    s.deepest_step DESC,
    s.last_activity_at DESC NULLS LAST;
$$;

GRANT EXECUTE ON FUNCTION compute_agency_intent_scores(text)
  TO anon, authenticated;

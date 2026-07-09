/*
  # Agency Intent Score Function

  ## Purpose
  Computes a weighted buying-intent score per (agency_id, state_slug) pair
  from all existing funnel tracking signals. Used to power showcase ranking,
  follow-up prioritization, and admin analytics.

  ## Score Sources
  1. funnel_events (joined to funnel_sessions) — main event weights
  2. your_agency_profile_clicks — profile click signals
  3. your_agency_funnel_events — smart link / token visit signals
  4. agency_funnel_engagement — dwell-time bonuses
  5. funnel_sessions — repeat session bonus

  ## Scoring Model
  Event signals (from funnel_events):
    your_agency_profile_clicked             +2
    your_agency_overview_viewed             +2
    your_agency_landing_viewed              +1
    your_agency_see_listing_clicked         +4
    owner_preview_state_page_viewed         +3
    owner_preview_scroll_to_listing_clicked +4
    owner_preview_step2_started             +4
    demo_availability_modal_opened          +5
    demo_availability_submitted             +8
    demo_post_availability_result_viewed    +2
    activation_upsell_viewed               +10
    upgrade_positions_page_viewed           +7
    activate_listing_clicked                +9
    stripe_checkout_opened (first)         +20
    stripe_checkout_opened (extra, cap 4)   +6 each
    stripe_checkout_completed               0 (excluded)

  Profile clicks (your_agency_profile_clicks):
    each click                              +1 (capped at 10)

  Smart link visits (your_agency_funnel_events):
    each smart link visit                   +4 (capped at 5)

  Repeat sessions:
    each additional session                 +3 (capped at 5)

  Dwell-time bonuses (agency_funnel_engagement):
    20+ sec on profile/overview page        +1
    30+ sec on activation/upsell page       +3
    20+ sec on checkout page                +5

  ## Recency Multipliers
    last 3 days    × 1.35
    last 7 days    × 1.20
    last 14 days   × 1.10
    last 30 days   × 1.00
    last 60 days   × 0.75
    60+ days ago   × 0.50

  ## Deepest Step (1–5 funnel ladder)
    1 = discovery only (steps 10–39)
    2 = preview / interaction (steps 40–69)
    3 = form / demo interaction (steps 70–99)
    4 = upsell viewed (steps 100–129)
    5 = checkout / payment (steps 130–150)

  ## Safety
    - Returns 0 for agencies with no tracking data
    - Defensive against NULL state_slug values
    - Does NOT touch manual showcase pinning or paid listing logic
    - SECURITY DEFINER — reads tracking tables regardless of RLS context
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

  /* ──────────────────────────────────────────────────────────────────
     1. FUNNEL EVENTS  (main weighted event signals)
     Each event is scored by name; checkout has capped multi-open bonus
     ────────────────────────────────────────────────────────────────── */
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
      /* base score: sum all non-checkout events */
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

  /* ──────────────────────────────────────────────────────────────────
     2. SMART LINK VISITS  (your_agency_funnel_events)
     +4 per visit, capped at 5 occurrences
     ────────────────────────────────────────────────────────────────── */
  yafe_agg AS (
    SELECT
      agency_id,
      COALESCE(state_slug, '')                                AS sl,
      (LEAST(
        COUNT(*) FILTER (
          WHERE event_name IN (
            'smart_link_visit',   'token_link_visit',
            'smart_link_clicked', 'direct_token_visit',
            'token_page_viewed'
          )
        ),
      5) * 4)::int                                          AS smart_link_score,
      MAX(created_at)                                        AS last_yafe_at
    FROM your_agency_funnel_events
    WHERE agency_id IS NOT NULL
      AND agency_id <> ''
      AND (p_state_slug IS NULL OR state_slug = p_state_slug)
    GROUP BY agency_id, COALESCE(state_slug, '')
  ),

  /* ──────────────────────────────────────────────────────────────────
     3. PROFILE CLICKS  (your_agency_profile_clicks)
     +1 per click, capped at 10
     ────────────────────────────────────────────────────────────────── */
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

  /* ──────────────────────────────────────────────────────────────────
     4. REPEAT SESSIONS  (funnel_sessions)
     Each session beyond the first = +3, capped at 5 extra sessions
     ────────────────────────────────────────────────────────────────── */
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

  /* ──────────────────────────────────────────────────────────────────
     5. DWELL-TIME ENGAGEMENT  (agency_funnel_engagement)
     Bonuses based on time_on_page_seconds per page type.
     State is resolved through funnel_sessions via fsid (best-effort).
     ────────────────────────────────────────────────────────────────── */
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

  /* ──────────────────────────────────────────────────────────────────
     6. UNION all (agency_id, state_slug) combos from every source
     ────────────────────────────────────────────────────────────────── */
  all_combos AS (
    SELECT agency_id, sl FROM fe_agg
    UNION
    SELECT agency_id, sl FROM click_agg
    UNION
    SELECT agency_id, sl FROM yafe_agg
  ),

  /* ──────────────────────────────────────────────────────────────────
     7. COMBINED: join all score tables onto the combo set
     ────────────────────────────────────────────────────────────────── */
  combined AS (
    SELECT
      ac.agency_id,
      ac.sl                                                          AS state_slug,

      /* score components */
      COALESCE(fa.base_event_score, 0)::int                         AS event_score,
      COALESCE(cb.checkout_score,   0)::int                         AS checkout_score,
      COALESCE(ya.smart_link_score, 0)::int                         AS smart_link_score,
      COALESCE(cl.click_score,      0)::int                         AS click_score,
      COALESCE(sa.repeat_score,     0)::int                         AS repeat_score,
      COALESCE(ea.dwell_score,      0)::int                         AS dwell_score,

      /* stat counters */
      COALESCE(fa.checkout_opens,   0)::int                         AS checkout_opened_count,
      COALESCE(fa.avail_submits,    0)::int                         AS availability_submitted_count,
      COALESCE(fa.upsell_views,     0)::int                         AS upsell_viewed_count,
      COALESCE(fa.pv_views,         0)::int                         AS profile_views,
      COALESCE(cl.click_count,      0)::int                         AS profile_clicks,
      GREATEST(COALESCE(sa.total_sessions, 1) - 1, 0)::int          AS repeat_visits,

      /* deepest funnel step (1–5 ladder) */
      CASE
        WHEN COALESCE(fa.max_step, 0) >= 130 THEN 5
        WHEN COALESCE(fa.max_step, 0) >= 100 THEN 4
        WHEN COALESCE(fa.max_step, 0) >=  70 THEN 3
        WHEN COALESCE(fa.max_step, 0) >=  40 THEN 2
        WHEN COALESCE(fa.max_step, 0) >    0 THEN 1
        ELSE 0
      END::int                                                       AS deepest_step,

      /* most recent activity timestamp across all signal sources */
      GREATEST(
        fa.last_event_at,
        cl.last_click_at,
        ea.last_eng_at,
        sa.last_session_at,
        ya.last_yafe_at
      )                                                              AS last_activity_at,

      /* raw step number for debug breakdown */
      COALESCE(fa.max_step, 0)                                       AS raw_max_step

    FROM all_combos ac
    LEFT JOIN fe_agg       fa ON fa.agency_id = ac.agency_id AND fa.sl = ac.sl
    LEFT JOIN checkout_bonus cb ON cb.agency_id = ac.agency_id AND cb.sl = ac.sl
    LEFT JOIN yafe_agg     ya ON ya.agency_id = ac.agency_id AND ya.sl = ac.sl
    LEFT JOIN click_agg    cl ON cl.agency_id = ac.agency_id AND cl.sl = ac.sl
    LEFT JOIN session_agg  sa ON sa.agency_id = ac.agency_id AND sa.sl = ac.sl
    LEFT JOIN eng_agg      ea ON ea.agency_id = ac.agency_id AND ea.sl = ac.sl
  ),

  /* ──────────────────────────────────────────────────────────────────
     8. RECENCY WEIGHTING  (multiply raw score by recency multiplier)
     ────────────────────────────────────────────────────────────────── */
  scored AS (
    SELECT
      c.*,
      (c.event_score + c.checkout_score + c.smart_link_score
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

  /* ──────────────────────────────────────────────────────────────────
     FINAL OUTPUT  — sorted: score desc, deepest_step desc, recency
     Only agencies with raw_score > 0 are returned.
     ────────────────────────────────────────────────────────────────── */
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
      'event_score',        s.event_score,
      'checkout_score',     s.checkout_score,
      'smart_link_score',   s.smart_link_score,
      'click_score',        s.click_score,
      'repeat_score',       s.repeat_score,
      'dwell_score',        s.dwell_score,
      'raw_score',          s.raw_score,
      'recency_mult',       s.recency_mult,
      'final_score',        ROUND(s.raw_score * s.recency_mult, 2),
      'raw_max_step_number',s.raw_max_step
    )                                                   AS score_breakdown
  FROM scored s
  WHERE s.raw_score > 0
  ORDER BY
    ROUND(s.raw_score * s.recency_mult, 2) DESC,
    s.deepest_step DESC,
    s.last_activity_at DESC NULLS LAST;
$$;

/* Grant execute to both roles so both the anon edge-function key and
   authenticated admin calls can invoke this RPC. */
GRANT EXECUTE ON FUNCTION compute_agency_intent_scores(text)
  TO anon, authenticated;

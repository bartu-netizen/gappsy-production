/*
  # Add Replay Opens Count to Intent Scoring

  ## Summary
  Extends compute_agency_intent_scores to track how many distinct times each
  agency has opened the request replay funnel (deduped by unique session IDs).
  Agencies that open their replay multiple times show stronger purchase intent,
  so repeat visits are rewarded with bonus points.

  ## Changes to replay_agg CTE
  - Adds `replay_opens_count` (COUNT DISTINCT funnel_sessions.id)
    so we know how many unique replay sessions this agency has had,
    not just raw event count.

  ## New combined CTE fields
  - `replay_opens_count` — exposed so the score_breakdown can surface it
  - `replay_repeat_bonus` — additional score based on repeat visit thresholds:

  | Opens | Bonus |
  |-------|-------|
  | 5+    |  +15  |
  | 3+    |  +10  |
  | 2+    |  +5   |
  | <2    |  +0   |

  ## scored CTE
  - `replay_repeat_bonus` is added to `raw_score`

  ## score_breakdown JSONB
  - Gains `replay_opens_count` and `replay_repeat_bonus` keys

  ## Safety
  - Non-breaking: all existing scores, field names, and weights are preserved
  - COALESCE guards ensure missing data never causes NULLs
  - replay_score cap (60) is unchanged
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

  /* ─── 1. FUNNEL EVENTS (your_agency weighted event signals) ────────── */
  fe_agg AS (
    SELECT
      fs.agency_id,
      COALESCE(fe.state_slug, fs.state_slug)     AS sl,
      MAX(fe.step_number)                        AS max_step,
      MAX(fe.created_at)                         AS last_event_at,
      COUNT(*) FILTER (
        WHERE fe.event_name IN (
          'stripe_checkout_opened',
          'checkout_page_viewed'
        )
      )                                          AS checkout_opens,
      COUNT(*) FILTER (
        WHERE fe.event_name IN (
          'demo_availability_submitted',
          'owner_preview_check_availability_submitted'
        )
      )                                          AS avail_submits,
      COUNT(*) FILTER (
        WHERE fe.event_name IN (
          'activation_upsell_viewed',
          'owner_preview_missed_clients_cta_clicked'
        )
      )                                          AS upsell_views,
      COUNT(*) FILTER (
        WHERE fe.event_name IN (
          'your_agency_overview_viewed',
          'your_agency_landing_viewed',
          'your_agency_profile_page_viewed',
          'your_agency_landing_page_viewed'
        )
      )                                          AS pv_views,
      SUM(
        CASE fe.event_name
          WHEN 'your_agency_profile_clicked'                        THEN 2
          WHEN 'your_agency_overview_viewed'                        THEN 2
          WHEN 'your_agency_profile_page_viewed'                    THEN 2
          WHEN 'your_agency_landing_viewed'                         THEN 1
          WHEN 'your_agency_landing_page_viewed'                    THEN 1
          WHEN 'your_agency_see_listing_clicked'                    THEN 4
          WHEN 'your_agency_start_receiving_cta_clicked'            THEN 4
          WHEN 'owner_preview_state_page_viewed'                    THEN 3
          WHEN 'owner_preview_scroll_to_listing_clicked'            THEN 4
          WHEN 'owner_preview_scroll_to_listing_cta_clicked'        THEN 4
          WHEN 'owner_preview_step2_started'                        THEN 4
          WHEN 'owner_preview_check_availability_opened'            THEN 4
          WHEN 'demo_availability_modal_opened'                     THEN 5
          WHEN 'owner_preview_check_availability_modal_opened'      THEN 5
          WHEN 'demo_availability_submitted'                        THEN 8
          WHEN 'owner_preview_check_availability_submitted'         THEN 8
          WHEN 'demo_post_availability_result_viewed'               THEN 2
          WHEN 'owner_preview_check_availability_result_page_viewed' THEN 2
          WHEN 'activation_upsell_viewed'                           THEN 10
          WHEN 'owner_preview_missed_clients_cta_clicked'           THEN 10
          WHEN 'upgrade_positions_page_viewed'                      THEN 7
          WHEN 'owner_preview_missed_clients_page_viewed'           THEN 7
          WHEN 'activate_listing_clicked'                           THEN 9
          WHEN 'owner_preview_activate_listing_cta_clicked'         THEN 9
          WHEN 'listing_activation_offer_page_viewed'               THEN 5
          ELSE 0
        END
      )                                          AS base_event_score
    FROM funnel_events fe
    JOIN funnel_sessions fs ON fs.id = fe.session_id
    WHERE fe.funnel_name = 'your_agency'
      AND fs.agency_id IS NOT NULL
      AND fs.agency_id <> ''
      AND fe.event_name NOT IN ('stripe_checkout_completed', 'checkout_completed')
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

  /* ─── 2. TOKEN / SMART-LINK VISITS (your_agency_funnel_events) ─────── */
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

  /* ─── 3. PROFILE CLICKS (your_agency_profile_clicks) ───────────────── */
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

  /* ─── 4. REPEAT SESSIONS (funnel_sessions) ──────────────────────────── */
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

  /* ─── 5. DWELL-TIME ENGAGEMENT (agency_funnel_engagement) ───────────── */
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
      )
    GROUP BY e.agency_id, COALESCE(fs.state_slug, '')
  ),

  /* ─── 6. REQUEST REPLAY SIGNALS (funnel_events WHERE funnel_name='request_replay') ─
     Replay events contribute positive intent signals weighted by engagement depth.
     replay_opens_count = COUNT(DISTINCT session IDs) → deduped replay visits.

     Weight table:
       replay_opened                  → +3   (entry signal)
       replay_scene_view (intro)      → +1   (minimal, scene 1)
       replay_scene_view (client_*)   → +2   (moderate engagement)
       replay_scene_view (routed_*)   → +5   (high relevance — saw routing)
       replay_scene_view (missed_*)   → +6   (high relevance — saw missed leads)
       replay_scene_view (final_*)    → +5   (reached the end)
       replay_auto_continue_started   → +4   (user let timer run)
       replay_auto_continue_completed → +8   (stayed for full auto-sequence)
       replay_completed               → +6   (full replay completion)
       replay_cta_click               → +10  (explicit activation intent)

     Capped at 60 total per agency/state to prevent inflation.
     replay_opens_count is NOT capped — it tracks raw distinct session count.
  ────────────────────────────────────────────────────────────────────────── */
  replay_agg AS (
    SELECT
      fs.agency_id,
      COALESCE(fe.state_slug, fs.state_slug)  AS sl,
      MAX(fe.created_at)                      AS last_replay_at,
      COUNT(DISTINCT fs.id)::int              AS replay_opens_count,
      LEAST(
        SUM(
          CASE
            WHEN fe.event_name = 'replay_cta_click'               THEN 10
            WHEN fe.event_name = 'replay_auto_continue_completed'  THEN 8
            WHEN fe.event_name = 'replay_completed'                THEN 6
            WHEN fe.event_name = 'replay_auto_continue_started'    THEN 4
            WHEN fe.event_name = 'replay_opened'                   THEN 3
            WHEN fe.event_name = 'replay_scene_view'
              AND (fe.metadata->>'scene_name') ILIKE 'missed_%'    THEN 6
            WHEN fe.event_name = 'replay_scene_view'
              AND (fe.metadata->>'scene_name') ILIKE 'routed_%'    THEN 5
            WHEN fe.event_name = 'replay_scene_view'
              AND (fe.metadata->>'scene_name') ILIKE 'final_%'     THEN 5
            WHEN fe.event_name = 'replay_scene_view'
              AND (fe.metadata->>'scene_name') ILIKE 'client_%'    THEN 2
            WHEN fe.event_name = 'replay_scene_view'
              AND (fe.metadata->>'scene_name') = 'intro'           THEN 1
            ELSE 0
          END
        )::int,
      60)                                     AS replay_score
    FROM funnel_events fe
    JOIN funnel_sessions fs ON fs.id = fe.session_id
    WHERE fe.funnel_name = 'request_replay'
      AND fs.agency_id IS NOT NULL
      AND fs.agency_id <> ''
      AND (
        p_state_slug IS NULL
        OR COALESCE(fe.state_slug, fs.state_slug) = p_state_slug
      )
    GROUP BY
      fs.agency_id,
      COALESCE(fe.state_slug, fs.state_slug)
  ),

  /* ─── 7. ALL COMBOS — all six signal sources ─────────────────────────── */
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
    UNION
    SELECT agency_id, sl FROM replay_agg
  ),

  /* ─── 8. COMBINED: join all score tables onto the combo set ──────────── */
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
      COALESCE(ra.replay_score,     0)::int                         AS replay_score,
      COALESCE(ra.replay_opens_count, 0)::int                       AS replay_opens_count,

      CASE
        WHEN COALESCE(ra.replay_opens_count, 0) >= 5               THEN 15
        WHEN COALESCE(ra.replay_opens_count, 0) >= 3               THEN 10
        WHEN COALESCE(ra.replay_opens_count, 0) >= 2               THEN  5
        ELSE 0
      END::int                                                       AS replay_repeat_bonus,

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
        ya.last_yafe_at,
        ra.last_replay_at
      )                                                              AS last_activity_at,

      COALESCE(fa.max_step, 0)                                       AS raw_max_step

    FROM all_combos ac
    LEFT JOIN fe_agg       fa ON fa.agency_id = ac.agency_id AND fa.sl = ac.sl
    LEFT JOIN checkout_bonus cb ON cb.agency_id = ac.agency_id AND cb.sl = ac.sl
    LEFT JOIN yafe_agg     ya ON ya.agency_id = ac.agency_id AND ya.sl = ac.sl
    LEFT JOIN click_agg    cl ON cl.agency_id = ac.agency_id AND cl.sl = ac.sl
    LEFT JOIN session_agg  sa ON sa.agency_id = ac.agency_id AND sa.sl = ac.sl
    LEFT JOIN eng_agg      ea ON ea.agency_id = ac.agency_id AND ea.sl = ac.sl
    LEFT JOIN replay_agg   ra ON ra.agency_id = ac.agency_id AND ra.sl = ac.sl
  ),

  /* ─── 9. RECENCY WEIGHTING ───────────────────────────────────────────── */
  scored AS (
    SELECT
      c.*,
      (c.event_score + c.checkout_score + c.token_visit_score
       + c.click_score + c.repeat_score + c.dwell_score + c.replay_score
       + c.replay_repeat_bonus
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
      'replay_score',        s.replay_score,
      'replay_opens_count',  s.replay_opens_count,
      'replay_repeat_bonus', s.replay_repeat_bonus,
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

COMMENT ON FUNCTION compute_agency_intent_scores(text) IS
  'Multi-source agency intent scoring. Sources: your_agency funnel events, '
  'token visits, profile clicks, repeat sessions, dwell time, request_replay '
  'funnel signals, and replay repeat bonus (2+→+5, 3+→+10, 5+→+15). '
  'replay_score capped at 60; replay_repeat_bonus is separate.';

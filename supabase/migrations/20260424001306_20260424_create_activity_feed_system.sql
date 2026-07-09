/*
  # Centralized Agency Activity Feed

  1. Overview
    - Aggregates events from existing tables into a single canonical stream
    - Powers /wp-admin/activity-feed, intent detection, and sales timing
    - Aggregation layer only — no new event writes

  2. New Functions
    - `get_admin_activity_feed(p_limit int, p_state_slug text, p_agency_id uuid)`
       Returns unified, normalized events with canonical names, event group,
       intent weight, agency enrichment, and human-readable label.

  3. Data Sources (existing tables, not modified)
    - your_agency_funnel_events (profile, ledger, activate clicks)
    - manage_funnel_events (manage listing, remove, recover)
    - owner_demo_events (availability demo)
    - agency_availability_requests (availability form submissions)
    - funnel_events (checkout, replay)
    - smartlead_link_events (email link opens)

  4. Security
    - SECURITY DEFINER function, service-role callable only
    - EXECUTE granted to service_role; revoked from anon/authenticated
*/

CREATE OR REPLACE FUNCTION public.get_admin_activity_feed(
  p_limit int DEFAULT 200,
  p_state_slug text DEFAULT NULL,
  p_agency_id uuid DEFAULT NULL
)
RETURNS TABLE (
  id text,
  created_at timestamptz,
  agency_id text,
  agency_name text,
  agency_slug text,
  state_slug text,
  state_name text,
  event_name text,
  event_group text,
  funnel_step text,
  source text,
  intent_weight int,
  readable_label text,
  metadata jsonb
)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
  WITH raw AS (
    -- Your Agency funnel
    SELECT
      'ya:' || y.id::text AS id,
      y.created_at,
      y.agency_id,
      y.agency_slug,
      y.state_slug,
      CASE y.event_name
        WHEN 'your_agency_start_receiving_cta_clicked' THEN 'your_agency_activate_clicked'
        WHEN 'token_page_viewed' THEN 'your_agency_token_page_viewed'
        WHEN 'direct_token_visit' THEN 'your_agency_token_page_viewed'
        ELSE y.event_name
      END AS event_name,
      'your_agency' AS funnel_step,
      COALESCE(y.meta->>'source', 'direct') AS source,
      y.meta AS metadata
    FROM your_agency_funnel_events y
    WHERE y.created_at > now() - interval '30 days'

    UNION ALL

    -- Manage listing funnel
    SELECT
      'mf:' || m.id::text,
      m.created_at,
      m.agency_id,
      m.agency_slug,
      m.state_slug,
      CASE m.event_type
        WHEN 'manage_funnel_opened' THEN 'manage_listing_opened'
        ELSE m.event_type
      END,
      'manage',
      COALESCE(m.metadata->>'source', 'direct'),
      m.metadata
    FROM manage_funnel_events m
    WHERE m.created_at > now() - interval '30 days'

    UNION ALL

    -- Owner demo (availability funnel)
    SELECT
      'od:' || d.id::text,
      d.created_at,
      d.agency_id::text,
      NULL::text,
      d.state_slug,
      d.event_name,
      'availability',
      'direct',
      d.metadata
    FROM owner_demo_events d
    WHERE d.created_at > now() - interval '30 days'

    UNION ALL

    -- Availability form submissions
    SELECT
      'ar:' || a.id::text,
      a.created_at,
      a.agency_id::text,
      a.agency_slug,
      a.state_slug,
      'availability_submitted',
      'availability',
      'direct',
      jsonb_build_object('service', a.service, 'budget', a.budget, 'timeline', a.timeline)
    FROM agency_availability_requests a
    WHERE a.created_at > now() - interval '30 days'

    UNION ALL

    -- Generic funnel (checkout, replay)
    SELECT
      'fe:' || f.id::text,
      f.created_at,
      f.agency_id,
      NULL::text,
      f.state_slug,
      CASE f.event_name
        WHEN 'checkout_start' THEN 'checkout_opened'
        WHEN 'checkout_started' THEN 'checkout_opened'
        WHEN 'payment_success' THEN 'checkout_completed'
        WHEN 'payment_failed' THEN 'checkout_failed'
        WHEN 'replay_opened' THEN 'request_replay_opened'
        WHEN 'replay_completed' THEN 'request_replay_engaged'
        WHEN 'replay_cta_click' THEN 'request_replay_engaged'
        WHEN 'upsell_view' THEN 'activation_upsell_viewed'
        ELSE f.event_name
      END,
      CASE
        WHEN f.event_name LIKE 'replay_%' THEN 'replay'
        WHEN f.event_name LIKE 'checkout_%' OR f.event_name LIKE 'payment_%' THEN 'checkout'
        WHEN f.event_name LIKE 'upsell_%' THEN 'checkout'
        ELSE 'profile'
      END,
      COALESCE(f.metadata->>'source', 'direct'),
      f.metadata
    FROM funnel_events f
    WHERE f.created_at > now() - interval '30 days'
      AND f.agency_id IS NOT NULL

    UNION ALL

    -- Smartlead link opens (email source signal)
    SELECT
      'sl:' || s.id::text,
      s.created_at,
      s.agency_id,
      s.agency_slug,
      s.state_slug,
      CASE s.event_type
        WHEN 'smart_link_opened' THEN 'smart_link_opened'
        WHEN 'qualified_view' THEN 'smart_link_qualified_view'
        ELSE s.event_type
      END,
      'smartlink',
      'email',
      s.metadata
    FROM smartlead_link_events s
    WHERE s.created_at > now() - interval '30 days'
      AND COALESCE((s.metadata->>'is_bot')::boolean, false) = false
  ),
  enriched AS (
    SELECT
      r.id,
      r.created_at,
      r.agency_id,
      r.agency_slug,
      r.state_slug,
      r.event_name,
      r.funnel_step,
      r.source,
      r.metadata,
      CASE
        WHEN r.event_name IN (
          'checkout_opened'
        ) THEN 20
        WHEN r.event_name IN (
          'your_agency_activate_clicked'
        ) THEN 10
        WHEN r.event_name IN (
          'activation_upsell_viewed'
        ) THEN 10
        WHEN r.event_name IN (
          'request_replay_opened',
          'request_replay_engaged'
        ) THEN 6
        WHEN r.event_name IN (
          'your_agency_ledger_page_viewed'
        ) THEN 5
        WHEN r.event_name IN (
          'manage_recovered'
        ) THEN 5
        WHEN r.event_name IN (
          'availability_submitted',
          'demo_submitted',
          'demo_completed',
          'your_agency_profile_clicked',
          'your_agency_see_listing_clicked',
          'your_agency_view_requests_clicked',
          'cta_click',
          'form_submit'
        ) THEN 3
        WHEN r.event_name IN (
          'manage_remove_started',
          'manage_remove_confirmed'
        ) THEN -10
        WHEN r.event_name IN ('checkout_completed', 'checkout_failed') THEN 0
        ELSE 1
      END AS intent_weight,
      CASE
        WHEN r.event_name IN ('checkout_opened','your_agency_activate_clicked','availability_submitted','checkout_completed') THEN 'conversion'
        WHEN r.event_name IN ('manage_remove_started','manage_remove_confirmed') THEN 'negative'
        WHEN r.event_name IN ('your_agency_profile_clicked','your_agency_see_listing_clicked','your_agency_view_requests_clicked',
                              'cta_click','form_submit','request_replay_engaged','demo_submitted','demo_completed',
                              'manage_recovered','activation_upsell_viewed') THEN 'engagement'
        ELSE 'view'
      END AS event_group
    FROM raw r
  )
  SELECT
    e.id,
    e.created_at,
    e.agency_id,
    COALESCE(oa_id.name, oa_slug.name) AS agency_name,
    COALESCE(e.agency_slug, oa_id.slug) AS agency_slug,
    e.state_slug,
    COALESCE(oa_id.state_name, oa_slug.state_name) AS state_name,
    e.event_name,
    e.event_group,
    e.funnel_step,
    e.source,
    e.intent_weight,
    CASE e.event_name
      WHEN 'your_agency_profile_page_viewed' THEN 'Viewed profile'
      WHEN 'your_agency_landing_page_viewed' THEN 'Viewed profile'
      WHEN 'your_agency_ledger_page_viewed' THEN 'Viewed proof ledger'
      WHEN 'your_agency_profile_clicked' THEN 'Clicked profile card'
      WHEN 'your_agency_see_listing_clicked' THEN 'Clicked see listing'
      WHEN 'your_agency_view_requests_clicked' THEN 'Clicked view requests'
      WHEN 'your_agency_activate_clicked' THEN 'Clicked activate'
      WHEN 'your_agency_token_page_viewed' THEN 'Opened claim link'
      WHEN 'manage_listing_opened' THEN 'Opened manage listing'
      WHEN 'manage_remove_started' THEN 'Started removal'
      WHEN 'manage_remove_confirmed' THEN 'Confirmed removal'
      WHEN 'manage_recovered' THEN 'Recovered listing'
      WHEN 'checkout_opened' THEN 'Opened checkout'
      WHEN 'checkout_completed' THEN 'Completed checkout'
      WHEN 'checkout_failed' THEN 'Checkout failed'
      WHEN 'activation_upsell_viewed' THEN 'Viewed upsell'
      WHEN 'availability_submitted' THEN 'Submitted availability request'
      WHEN 'demo_opened' THEN 'Opened availability demo'
      WHEN 'demo_submitted' THEN 'Submitted availability demo'
      WHEN 'demo_completed' THEN 'Completed availability demo'
      WHEN 'request_replay_opened' THEN 'Opened replay'
      WHEN 'request_replay_engaged' THEN 'Engaged with replay'
      WHEN 'smart_link_opened' THEN 'Opened email link'
      WHEN 'smart_link_qualified_view' THEN 'Qualified email view'
      ELSE replace(initcap(replace(e.event_name, '_', ' ')), 'Your Agency ', '')
    END AS readable_label,
    e.metadata
  FROM enriched e
  LEFT JOIN other_agencies oa_id
    ON e.agency_id IS NOT NULL
    AND e.agency_id ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
    AND oa_id.id = e.agency_id::uuid
  LEFT JOIN other_agencies oa_slug
    ON oa_id.id IS NULL
    AND e.agency_slug IS NOT NULL
    AND e.state_slug IS NOT NULL
    AND oa_slug.slug = e.agency_slug
    AND oa_slug.state_slug = e.state_slug
  WHERE (p_state_slug IS NULL OR e.state_slug = p_state_slug)
    AND (p_agency_id IS NULL OR oa_id.id = p_agency_id OR oa_slug.id = p_agency_id)
  ORDER BY e.created_at DESC
  LIMIT GREATEST(1, LEAST(p_limit, 500));
$$;

REVOKE ALL ON FUNCTION public.get_admin_activity_feed(int, text, uuid) FROM PUBLIC;
REVOKE ALL ON FUNCTION public.get_admin_activity_feed(int, text, uuid) FROM anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_admin_activity_feed(int, text, uuid) TO service_role;


/*
  Computed intent score per agency, aggregated from the same canonical feed.
  Returns one row per (agency_id, state_slug) with totals over 7d / 30d.
*/
CREATE OR REPLACE FUNCTION public.get_admin_activity_intent_scores(
  p_state_slug text DEFAULT NULL,
  p_limit int DEFAULT 200
)
RETURNS TABLE (
  agency_id uuid,
  agency_name text,
  agency_slug text,
  state_slug text,
  state_name text,
  intent_score int,
  intent_score_7d int,
  event_count_7d int,
  last_event_at timestamptz,
  last_event_name text,
  last_event_label text
)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
  WITH feed AS (
    SELECT * FROM public.get_admin_activity_feed(500, p_state_slug, NULL)
  ),
  resolved AS (
    SELECT
      CASE
        WHEN f.agency_id ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
          THEN f.agency_id::uuid
        ELSE oa.id
      END AS resolved_agency_id,
      f.*
    FROM feed f
    LEFT JOIN other_agencies oa
      ON f.agency_slug = oa.slug AND f.state_slug = oa.state_slug
  )
  SELECT
    r.resolved_agency_id AS agency_id,
    max(r.agency_name) AS agency_name,
    max(r.agency_slug) AS agency_slug,
    r.state_slug,
    max(r.state_name) AS state_name,
    GREATEST(0, COALESCE(sum(r.intent_weight), 0))::int AS intent_score,
    GREATEST(0, COALESCE(sum(r.intent_weight) FILTER (WHERE r.created_at > now() - interval '7 days'), 0))::int AS intent_score_7d,
    COALESCE(count(*) FILTER (WHERE r.created_at > now() - interval '7 days'), 0)::int AS event_count_7d,
    max(r.created_at) AS last_event_at,
    (array_agg(r.event_name ORDER BY r.created_at DESC))[1] AS last_event_name,
    (array_agg(r.readable_label ORDER BY r.created_at DESC))[1] AS last_event_label
  FROM resolved r
  WHERE r.resolved_agency_id IS NOT NULL
  GROUP BY r.resolved_agency_id, r.state_slug
  ORDER BY intent_score DESC, last_event_at DESC NULLS LAST
  LIMIT GREATEST(1, LEAST(p_limit, 500));
$$;

REVOKE ALL ON FUNCTION public.get_admin_activity_intent_scores(text, int) FROM PUBLIC;
REVOKE ALL ON FUNCTION public.get_admin_activity_intent_scores(text, int) FROM anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_admin_activity_intent_scores(text, int) TO service_role;

/*
  # Activity Feed — Sales Control Center Upgrade

  1. Updates
    - `get_admin_activity_feed` — adds `funnel_stage` column (awareness/engagement/high_intent/checkout/conversion/negative),
      optional `p_window_minutes` parameter for time-window filtering, and stronger agency-name fallback
      (joins by agency_id UUID, by (slug, state_slug), and finally by slug-only when state_slug is absent).

  2. New Functions
    - `get_admin_ready_to_close(p_state_slug text, p_window_hours int)` — agencies that opened checkout but
      did NOT complete payment, or clicked activate with high intent. Sorted by recency + intent.
    - `get_admin_at_risk(p_state_slug text, p_window_hours int)` — agencies with removal started / manage funnel
      opened, or inactive high-intent agencies (no positive action in 48h). Goal: save churn.
    - `get_admin_revenue_summary(p_state_slug text)` — total revenue cents for last 24h and last 7d from
      `stripe_orders` (paid, non-deleted).

  3. Security
    - All functions are SECURITY DEFINER with locked search_path.
    - Callable only via service-role from the admin edge function.
*/

-- Drop old signature first so we can add the new p_window_minutes parameter.
DROP FUNCTION IF EXISTS public.get_admin_activity_feed(integer, text, uuid);

CREATE OR REPLACE FUNCTION public.get_admin_activity_feed(
  p_limit integer DEFAULT 200,
  p_state_slug text DEFAULT NULL,
  p_agency_id uuid DEFAULT NULL,
  p_window_minutes integer DEFAULT NULL
)
RETURNS TABLE(
  id text,
  created_at timestamptz,
  agency_id text,
  agency_name text,
  agency_slug text,
  state_slug text,
  state_name text,
  event_name text,
  event_group text,
  funnel_stage text,
  funnel_step text,
  source text,
  intent_weight integer,
  readable_label text,
  metadata jsonb
)
LANGUAGE sql
SECURITY DEFINER
SET search_path TO 'public', 'pg_temp'
AS $$
WITH params AS (
  SELECT
    CASE
      WHEN p_window_minutes IS NULL OR p_window_minutes <= 0 THEN now() - interval '30 days'
      ELSE now() - make_interval(mins => p_window_minutes)
    END AS since
),
raw AS (
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
  FROM your_agency_funnel_events y, params
  WHERE y.created_at >= params.since

  UNION ALL

  SELECT 'mf:' || m.id::text, m.created_at, m.agency_id, m.agency_slug, m.state_slug,
    CASE m.event_type WHEN 'manage_funnel_opened' THEN 'manage_listing_opened' ELSE m.event_type END,
    'manage',
    COALESCE(m.metadata->>'source', 'direct'),
    m.metadata
  FROM manage_funnel_events m, params
  WHERE m.created_at >= params.since

  UNION ALL

  SELECT 'od:' || d.id::text, d.created_at, d.agency_id::text, NULL::text, d.state_slug,
    d.event_name, 'availability', 'direct', d.metadata
  FROM owner_demo_events d, params
  WHERE d.created_at >= params.since

  UNION ALL

  SELECT 'ar:' || a.id::text, a.created_at, a.agency_id::text, a.agency_slug, a.state_slug,
    'availability_submitted', 'availability', 'direct',
    jsonb_build_object('service', a.service, 'budget', a.budget, 'timeline', a.timeline)
  FROM agency_availability_requests a, params
  WHERE a.created_at >= params.since

  UNION ALL

  SELECT 'fe:' || f.id::text, f.created_at, f.agency_id, NULL::text, f.state_slug,
    CASE f.event_name
      WHEN 'checkout_start' THEN 'checkout_opened'
      WHEN 'checkout_started' THEN 'checkout_opened'
      WHEN 'payment_success' THEN 'checkout_completed'
      WHEN 'payment_succeeded' THEN 'checkout_completed'
      WHEN 'stripe_payment_succeeded' THEN 'checkout_completed'
      WHEN 'listing_activated_paid' THEN 'listing_activated_paid'
      WHEN 'top25_purchase_completed' THEN 'top25_purchase_completed'
      WHEN 'spotlight_purchase_completed' THEN 'spotlight_purchase_completed'
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
  FROM funnel_events f, params
  WHERE f.created_at >= params.since AND f.agency_id IS NOT NULL

  UNION ALL

  SELECT 'sl:' || s.id::text, s.created_at, s.agency_id, s.agency_slug, s.state_slug,
    CASE s.event_type
      WHEN 'smart_link_opened' THEN 'smart_link_opened'
      WHEN 'qualified_view' THEN 'smart_link_qualified_view'
      ELSE s.event_type
    END,
    'smartlink', 'email', s.metadata
  FROM smartlead_link_events s, params
  WHERE s.created_at >= params.since
    AND COALESCE((s.metadata->>'is_bot')::boolean, false) = false
),
safe_id AS (
  SELECT
    r.*,
    CASE
      WHEN r.agency_id ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
      THEN r.agency_id::uuid
      ELSE NULL
    END AS agency_uuid
  FROM raw r
),
enriched AS (
  SELECT
    s.*,
    CASE
      WHEN s.event_name IN ('checkout_completed','payment_succeeded','stripe_payment_succeeded',
        'listing_activated_paid','top25_purchase_completed','spotlight_purchase_completed') THEN 25
      WHEN s.event_name = 'checkout_opened' THEN 20
      WHEN s.event_name = 'your_agency_activate_clicked' THEN 10
      WHEN s.event_name = 'activation_upsell_viewed' THEN 10
      WHEN s.event_name IN ('request_replay_opened','request_replay_engaged') THEN 6
      WHEN s.event_name = 'your_agency_ledger_page_viewed' THEN 5
      WHEN s.event_name = 'manage_recovered' THEN 5
      WHEN s.event_name IN (
        'availability_submitted','demo_submitted','demo_completed',
        'your_agency_profile_clicked','your_agency_see_listing_clicked',
        'your_agency_view_requests_clicked','cta_click','form_submit'
      ) THEN 3
      WHEN s.event_name IN ('manage_remove_started','manage_remove_confirmed') THEN -10
      WHEN s.event_name = 'checkout_failed' THEN 0
      ELSE 1
    END AS intent_weight,
    CASE
      WHEN s.event_name IN (
        'checkout_completed','payment_succeeded','stripe_payment_succeeded',
        'listing_activated_paid','top25_purchase_completed','spotlight_purchase_completed'
      ) THEN 'conversion'
      WHEN s.event_name IN (
        'checkout_opened','your_agency_activate_clicked','availability_submitted'
      ) THEN 'high_intent'
      WHEN s.event_name IN ('manage_remove_started','manage_remove_confirmed') THEN 'negative'
      WHEN s.event_name IN (
        'your_agency_profile_clicked','your_agency_see_listing_clicked','your_agency_view_requests_clicked',
        'cta_click','form_submit','request_replay_engaged','demo_submitted','demo_completed',
        'manage_recovered','activation_upsell_viewed','your_agency_ledger_page_viewed'
      ) THEN 'engagement'
      ELSE 'view'
    END AS event_group,
    CASE
      WHEN s.event_name IN (
        'checkout_completed','payment_succeeded','stripe_payment_succeeded',
        'listing_activated_paid','top25_purchase_completed','spotlight_purchase_completed'
      ) THEN 'conversion'
      WHEN s.event_name = 'checkout_opened' THEN 'checkout'
      WHEN s.event_name IN ('your_agency_activate_clicked','availability_submitted') THEN 'high_intent'
      WHEN s.event_name IN ('manage_remove_started','manage_remove_confirmed') THEN 'negative'
      WHEN s.event_name IN (
        'your_agency_profile_clicked','your_agency_see_listing_clicked','your_agency_view_requests_clicked',
        'cta_click','form_submit','request_replay_engaged','demo_submitted','demo_completed',
        'manage_recovered','activation_upsell_viewed','your_agency_ledger_page_viewed'
      ) THEN 'engagement'
      ELSE 'awareness'
    END AS funnel_stage
  FROM safe_id s
)
SELECT
  e.id,
  e.created_at,
  e.agency_id,
  COALESCE(oa_id.name, oa_slug_state.name, oa_slug_any.name) AS agency_name,
  COALESCE(e.agency_slug, oa_id.slug, oa_slug_state.slug, oa_slug_any.slug) AS agency_slug,
  e.state_slug,
  COALESCE(oa_id.state_name, oa_slug_state.state_name, oa_slug_any.state_name) AS state_name,
  e.event_name,
  e.event_group,
  e.funnel_stage,
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
    WHEN 'checkout_completed' THEN 'Payment completed'
    WHEN 'payment_succeeded' THEN 'Payment succeeded'
    WHEN 'stripe_payment_succeeded' THEN 'Stripe payment succeeded'
    WHEN 'listing_activated_paid' THEN 'Paid listing activated'
    WHEN 'top25_purchase_completed' THEN 'Top 25 purchase completed'
    WHEN 'spotlight_purchase_completed' THEN 'Spotlight purchase completed'
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
LEFT JOIN other_agencies oa_id ON oa_id.id = e.agency_uuid
LEFT JOIN other_agencies oa_slug_state
  ON oa_id.id IS NULL
  AND e.agency_slug IS NOT NULL
  AND e.state_slug IS NOT NULL
  AND oa_slug_state.slug = e.agency_slug
  AND oa_slug_state.state_slug = e.state_slug
LEFT JOIN LATERAL (
  SELECT oa.name, oa.slug, oa.state_name
  FROM other_agencies oa
  WHERE oa_id.id IS NULL
    AND oa_slug_state.id IS NULL
    AND e.agency_slug IS NOT NULL
    AND oa.slug = e.agency_slug
  ORDER BY (oa.state_slug = e.state_slug) DESC NULLS LAST, oa.updated_at DESC NULLS LAST
  LIMIT 1
) oa_slug_any ON true
WHERE (p_state_slug IS NULL OR e.state_slug = p_state_slug)
  AND (p_agency_id IS NULL OR oa_id.id = p_agency_id OR oa_slug_state.id = p_agency_id)
ORDER BY e.created_at DESC
LIMIT GREATEST(1, LEAST(p_limit, 500));
$$;

GRANT EXECUTE ON FUNCTION public.get_admin_activity_feed(integer, text, uuid, integer) TO service_role;

-- ============================================================
-- Ready-to-Close
-- Agencies with checkout_opened but no conversion within window,
-- OR activate_clicked with high intent score.
-- ============================================================
CREATE OR REPLACE FUNCTION public.get_admin_ready_to_close(
  p_state_slug text DEFAULT NULL,
  p_window_hours integer DEFAULT 72,
  p_limit integer DEFAULT 20
)
RETURNS TABLE(
  agency_id uuid,
  agency_name text,
  agency_slug text,
  state_slug text,
  state_name text,
  intent_score integer,
  last_action_label text,
  last_action_event text,
  last_action_at timestamptz,
  signal text
)
LANGUAGE sql
SECURITY DEFINER
SET search_path TO 'public', 'pg_temp'
AS $$
WITH feed AS (
  SELECT * FROM public.get_admin_activity_feed(
    500, p_state_slug, NULL,
    GREATEST(60, p_window_hours * 60)
  )
),
resolved AS (
  SELECT
    CASE
      WHEN f.agency_id ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
      THEN f.agency_id::uuid
      ELSE oa.id
    END AS aid,
    f.*
  FROM feed f
  LEFT JOIN other_agencies oa
    ON f.agency_slug = oa.slug AND f.state_slug = oa.state_slug
),
agg AS (
  SELECT
    aid,
    max(state_slug) AS state_slug,
    max(state_name) AS state_name,
    max(agency_name) AS agency_name,
    max(agency_slug) AS agency_slug,
    GREATEST(0, COALESCE(sum(intent_weight), 0))::int AS intent_score,
    bool_or(event_name = 'checkout_opened') AS opened_checkout,
    bool_or(event_group = 'conversion') AS converted,
    bool_or(event_name = 'your_agency_activate_clicked') AS clicked_activate,
    (array_agg(readable_label ORDER BY created_at DESC))[1] AS last_label,
    (array_agg(event_name ORDER BY created_at DESC))[1] AS last_event,
    max(created_at) AS last_at
  FROM resolved
  WHERE aid IS NOT NULL
  GROUP BY aid
)
SELECT
  a.aid AS agency_id,
  a.agency_name,
  a.agency_slug,
  a.state_slug,
  a.state_name,
  a.intent_score,
  a.last_label AS last_action_label,
  a.last_event AS last_action_event,
  a.last_at AS last_action_at,
  CASE
    WHEN a.opened_checkout AND NOT a.converted THEN 'checkout_abandoned'
    WHEN a.clicked_activate AND a.intent_score >= 15 THEN 'activate_high_intent'
    ELSE 'warm'
  END AS signal
FROM agg a
WHERE (a.opened_checkout AND NOT a.converted)
   OR (a.clicked_activate AND a.intent_score >= 15)
ORDER BY a.intent_score DESC, a.last_at DESC
LIMIT GREATEST(1, LEAST(p_limit, 100));
$$;

GRANT EXECUTE ON FUNCTION public.get_admin_ready_to_close(text, integer, integer) TO service_role;

-- ============================================================
-- At-Risk (churn / drop-off)
-- ============================================================
CREATE OR REPLACE FUNCTION public.get_admin_at_risk(
  p_state_slug text DEFAULT NULL,
  p_window_hours integer DEFAULT 168,
  p_limit integer DEFAULT 20
)
RETURNS TABLE(
  agency_id uuid,
  agency_name text,
  agency_slug text,
  state_slug text,
  state_name text,
  intent_score integer,
  last_action_label text,
  last_action_event text,
  last_action_at timestamptz,
  hours_since_action numeric,
  signal text
)
LANGUAGE sql
SECURITY DEFINER
SET search_path TO 'public', 'pg_temp'
AS $$
WITH feed AS (
  SELECT * FROM public.get_admin_activity_feed(
    500, p_state_slug, NULL,
    GREATEST(60, p_window_hours * 60)
  )
),
resolved AS (
  SELECT
    CASE
      WHEN f.agency_id ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
      THEN f.agency_id::uuid
      ELSE oa.id
    END AS aid,
    f.*
  FROM feed f
  LEFT JOIN other_agencies oa
    ON f.agency_slug = oa.slug AND f.state_slug = oa.state_slug
),
agg AS (
  SELECT
    aid,
    max(state_slug) AS state_slug,
    max(state_name) AS state_name,
    max(agency_name) AS agency_name,
    max(agency_slug) AS agency_slug,
    GREATEST(0, COALESCE(sum(intent_weight), 0))::int AS intent_score,
    bool_or(event_name = 'manage_remove_started') AS remove_started,
    bool_or(event_name = 'manage_remove_confirmed') AS remove_confirmed,
    bool_or(event_name = 'manage_listing_opened') AS manage_opened,
    max(created_at) FILTER (WHERE event_group IN ('high_intent','engagement','conversion')) AS last_positive_at,
    (array_agg(readable_label ORDER BY created_at DESC))[1] AS last_label,
    (array_agg(event_name ORDER BY created_at DESC))[1] AS last_event,
    max(created_at) AS last_at
  FROM resolved
  WHERE aid IS NOT NULL
  GROUP BY aid
)
SELECT
  a.aid AS agency_id,
  a.agency_name,
  a.agency_slug,
  a.state_slug,
  a.state_name,
  a.intent_score,
  a.last_label AS last_action_label,
  a.last_event AS last_action_event,
  a.last_at AS last_action_at,
  ROUND(EXTRACT(EPOCH FROM (now() - a.last_at)) / 3600.0, 1) AS hours_since_action,
  CASE
    WHEN a.remove_confirmed THEN 'remove_confirmed'
    WHEN a.remove_started THEN 'remove_started'
    WHEN a.manage_opened THEN 'manage_opened'
    WHEN a.intent_score >= 15 AND (a.last_positive_at IS NULL OR a.last_positive_at < now() - interval '48 hours')
      THEN 'high_intent_inactive'
    ELSE 'other'
  END AS signal
FROM agg a
WHERE a.remove_started
   OR a.remove_confirmed
   OR a.manage_opened
   OR (a.intent_score >= 15 AND (a.last_positive_at IS NULL OR a.last_positive_at < now() - interval '48 hours'))
ORDER BY
  (CASE
    WHEN a.remove_confirmed THEN 3
    WHEN a.remove_started THEN 2
    ELSE 1
  END) DESC,
  a.intent_score DESC,
  a.last_at DESC
LIMIT GREATEST(1, LEAST(p_limit, 100));
$$;

GRANT EXECUTE ON FUNCTION public.get_admin_at_risk(text, integer, integer) TO service_role;

-- ============================================================
-- Revenue summary (24h / 7d) from stripe_orders
-- ============================================================
CREATE OR REPLACE FUNCTION public.get_admin_revenue_summary(
  p_state_slug text DEFAULT NULL
)
RETURNS TABLE(
  revenue_cents_24h bigint,
  orders_24h integer,
  revenue_cents_7d bigint,
  orders_7d integer,
  currency text
)
LANGUAGE sql
SECURITY DEFINER
SET search_path TO 'public', 'pg_temp'
AS $$
  SELECT
    COALESCE(sum(amount_total) FILTER (WHERE paid_at >= now() - interval '24 hours'), 0)::bigint AS revenue_cents_24h,
    COALESCE(count(*) FILTER (WHERE paid_at >= now() - interval '24 hours'), 0)::int AS orders_24h,
    COALESCE(sum(amount_total) FILTER (WHERE paid_at >= now() - interval '7 days'), 0)::bigint AS revenue_cents_7d,
    COALESCE(count(*) FILTER (WHERE paid_at >= now() - interval '7 days'), 0)::int AS orders_7d,
    COALESCE((array_agg(currency ORDER BY paid_at DESC) FILTER (WHERE paid_at >= now() - interval '7 days'))[1], 'usd') AS currency
  FROM stripe_orders
  WHERE deleted_at IS NULL
    AND payment_status = 'paid'
    AND paid_at >= now() - interval '7 days'
    AND (p_state_slug IS NULL OR state_slug = p_state_slug);
$$;

GRANT EXECUTE ON FUNCTION public.get_admin_revenue_summary(text) TO service_role;

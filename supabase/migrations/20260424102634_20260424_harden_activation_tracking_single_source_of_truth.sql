/*
  # Harden activation tracking — single source of truth for conversion

  1. Canonicalization direction reversed
     - Legacy `your_agency_activate_clicked` → canonical
       `your_agency_start_receiving_cta_clicked`
       (previously the reverse).
     - All legacy/duplicate activation events are mapped to the canonical
       new name at read time. Raw rows are preserved (backward compatible).

  2. ONE conversion event, deduplicated
     - All real-activation events (`checkout_completed`, `payment_succeeded`,
       `stripe_payment_succeeded`, `listing_activated_paid`) are folded into
       a single canonical event name: `listing_activated`.
     - A DISTINCT ON dedupe key keeps only ONE `listing_activated` per
       (agency_id, stripe order/session, day) combination. Downstream
       aggregations therefore cannot double-count.
     - `top25_purchase_completed` and `spotlight_purchase_completed`
       remain distinct (they are separate SKUs, not duplicates).

  3. Safety invariant
     - `event_group = 'high_intent'` can NEVER be counted as conversion:
       the classification CASE tests the canonical event_name in the
       mutually-exclusive `conversion` bucket first, then everything else.
       Downstream consumers must filter by `event_group = 'conversion'`
       (never by string matching on event_name).

  Security:
    - Function remains SECURITY DEFINER with locked search_path.
*/

DROP FUNCTION IF EXISTS public.get_admin_activity_feed(integer, text, uuid, integer);

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
  -- your_agency_funnel_events: canonicalize legacy activate_clicked → start_receiving
  SELECT
    'ya:' || y.id::text AS id,
    y.created_at,
    y.agency_id,
    y.agency_slug,
    y.state_slug,
    CASE y.event_name
      WHEN 'your_agency_activate_clicked' THEN 'your_agency_start_receiving_cta_clicked'
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

  -- funnel_events: fold all duplicate activation/payment names into canonical `listing_activated`
  SELECT 'fe:' || f.id::text, f.created_at, f.agency_id, NULL::text, f.state_slug,
    CASE f.event_name
      WHEN 'checkout_start' THEN 'checkout_opened'
      WHEN 'checkout_started' THEN 'checkout_opened'
      WHEN 'checkout_completed' THEN 'listing_activated'
      WHEN 'payment_success' THEN 'listing_activated'
      WHEN 'payment_succeeded' THEN 'listing_activated'
      WHEN 'stripe_payment_succeeded' THEN 'listing_activated'
      WHEN 'listing_activated_paid' THEN 'listing_activated'
      WHEN 'top25_purchase_completed' THEN 'top25_purchase_completed'
      WHEN 'spotlight_purchase_completed' THEN 'spotlight_purchase_completed'
      WHEN 'payment_failed' THEN 'checkout_failed'
      WHEN 'replay_opened' THEN 'request_replay_opened'
      WHEN 'replay_completed' THEN 'request_replay_engaged'
      WHEN 'replay_cta_click' THEN 'request_replay_engaged'
      WHEN 'upsell_view' THEN 'activation_upsell_viewed'
      WHEN 'activate_listing_clicked' THEN 'owner_preview_activate_listing_cta_clicked'
      ELSE f.event_name
    END,
    CASE
      WHEN f.event_name LIKE 'replay_%' THEN 'replay'
      WHEN f.event_name LIKE 'checkout_%' OR f.event_name LIKE 'payment_%' THEN 'checkout'
      WHEN f.event_name LIKE 'upsell_%' THEN 'checkout'
      WHEN f.event_name IN ('activate_listing_clicked','owner_preview_activate_listing_cta_clicked') THEN 'owner_preview'
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
-- Dedupe conversions: keep ONE `listing_activated` per
-- (agency_id, stripe order/session ref, day). Non-conversion rows untouched.
deduped AS (
  SELECT DISTINCT ON (
    CASE
      WHEN r.event_name = 'listing_activated' THEN
        COALESCE(r.agency_id, '') || '|' ||
        COALESCE(
          r.metadata->>'stripe_order_id',
          r.metadata->>'order_id',
          r.metadata->>'checkout_session_id',
          r.metadata->>'session_id',
          to_char(r.created_at, 'YYYY-MM-DD')
        ) || '|listing_activated'
      ELSE r.id
    END
  )
    r.*
  FROM raw r
  ORDER BY
    CASE
      WHEN r.event_name = 'listing_activated' THEN
        COALESCE(r.agency_id, '') || '|' ||
        COALESCE(
          r.metadata->>'stripe_order_id',
          r.metadata->>'order_id',
          r.metadata->>'checkout_session_id',
          r.metadata->>'session_id',
          to_char(r.created_at, 'YYYY-MM-DD')
        ) || '|listing_activated'
      ELSE r.id
    END,
    r.created_at ASC
),
safe_id AS (
  SELECT
    d.*,
    CASE
      WHEN d.agency_id ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
      THEN d.agency_id::uuid
      ELSE NULL
    END AS agency_uuid
  FROM deduped d
),
enriched AS (
  SELECT
    s.*,
    -- intent_weight mirrors the group buckets; never awards weight to conversion
    -- being double-counted (deduped upstream) nor to string-matched "activate"
    CASE
      WHEN s.event_name IN ('listing_activated','top25_purchase_completed','spotlight_purchase_completed') THEN 25
      WHEN s.event_name = 'checkout_opened' THEN 20
      WHEN s.event_name IN (
        'your_agency_start_receiving_cta_clicked','owner_preview_activate_listing_cta_clicked'
      ) THEN 10
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
    -- Conversion bucket is mutually exclusive and tested first; high_intent cannot
    -- ever also resolve to conversion.
    CASE
      WHEN s.event_name IN (
        'listing_activated','top25_purchase_completed','spotlight_purchase_completed'
      ) THEN 'conversion'
      WHEN s.event_name IN (
        'checkout_opened',
        'your_agency_start_receiving_cta_clicked',
        'owner_preview_activate_listing_cta_clicked',
        'availability_submitted'
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
        'listing_activated','top25_purchase_completed','spotlight_purchase_completed'
      ) THEN 'conversion'
      WHEN s.event_name = 'checkout_opened' THEN 'checkout'
      WHEN s.event_name IN (
        'your_agency_start_receiving_cta_clicked',
        'owner_preview_activate_listing_cta_clicked',
        'availability_submitted'
      ) THEN 'high_intent'
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
    WHEN 'your_agency_start_receiving_cta_clicked' THEN 'Clicked Start receiving clients'
    WHEN 'owner_preview_activate_listing_cta_clicked' THEN 'Clicked activate listing CTA'
    WHEN 'your_agency_token_page_viewed' THEN 'Opened claim link'
    WHEN 'manage_listing_opened' THEN 'Opened manage listing'
    WHEN 'manage_remove_started' THEN 'Started removal'
    WHEN 'manage_remove_confirmed' THEN 'Confirmed removal'
    WHEN 'manage_recovered' THEN 'Recovered listing'
    WHEN 'checkout_opened' THEN 'Opened checkout'
    WHEN 'listing_activated' THEN 'Activated listing'
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

-- Update ready_to_close to use event_group, never string match "activate".
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
    -- Classification uses funnel_stage / event_group, never raw string matches.
    bool_or(funnel_stage = 'checkout') AS opened_checkout,
    bool_or(event_group = 'conversion') AS converted,
    bool_or(event_group = 'high_intent') AS has_high_intent,
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
    WHEN a.has_high_intent AND a.intent_score >= 15 THEN 'activate_high_intent'
    ELSE 'warm'
  END AS signal
FROM agg a
WHERE NOT a.converted
  AND (
    (a.opened_checkout)
    OR (a.has_high_intent AND a.intent_score >= 15)
  )
ORDER BY a.intent_score DESC, a.last_at DESC
LIMIT GREATEST(1, LEAST(p_limit, 100));
$$;

GRANT EXECUTE ON FUNCTION public.get_admin_ready_to_close(text, integer, integer) TO service_role;

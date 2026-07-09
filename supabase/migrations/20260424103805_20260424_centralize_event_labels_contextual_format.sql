/*
  # Centralize event labels — contextual format

  Updates `get_admin_activity_feed` so `readable_label` matches the single
  source of truth in `src/utils/adminEventLabels.ts` (format: "{context} — {action}").

  No logic change to event_group / funnel_stage / intent_weight; only the
  label strings are updated.
*/

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
    -- Your-agency profile
    WHEN 'your_agency_landing_page_viewed' THEN 'Your-agency profile — Viewed landing page'
    WHEN 'your_agency_profile_page_viewed' THEN 'Your-agency profile — Viewed agency profile'
    WHEN 'your_agency_profile_clicked' THEN 'Your-agency profile — Clicked profile card'
    WHEN 'your_agency_see_listing_clicked' THEN 'Your-agency profile — Clicked "See my listing"'
    WHEN 'your_agency_view_requests_clicked' THEN 'Your-agency profile — Clicked "See recent client requests"'
    WHEN 'your_agency_token_page_viewed' THEN 'Your-agency profile — Opened claim link'
    -- Your-agency ledger
    WHEN 'your_agency_ledger_page_viewed' THEN 'Your-agency ledger — Viewed missed client requests'
    WHEN 'your_agency_start_receiving_cta_clicked' THEN 'Your-agency ledger — Clicked "Start receiving these clients"'
    -- Owner preview
    WHEN 'owner_preview_state_page_viewed' THEN 'Owner preview — Viewed state page'
    WHEN 'owner_preview_scroll_to_listing_cta_clicked' THEN 'Owner preview — Clicked "Scroll to my listing"'
    WHEN 'owner_preview_check_availability_opened' THEN 'Owner preview — Opened availability form'
    WHEN 'owner_preview_check_availability_modal_opened' THEN 'Owner preview — Opened availability modal'
    WHEN 'owner_preview_missed_clients_page_viewed' THEN 'Owner preview — Viewed missed clients page'
    WHEN 'owner_preview_missed_clients_cta_clicked' THEN 'Owner preview — Clicked "See missed clients"'
    WHEN 'owner_preview_activate_listing_cta_clicked' THEN 'Owner preview — Clicked "activate your listing now"'
    WHEN 'availability_submitted' THEN 'Owner preview — Submitted availability form'
    WHEN 'demo_opened' THEN 'Owner preview — Opened availability demo'
    WHEN 'demo_submitted' THEN 'Owner preview — Submitted availability demo'
    WHEN 'demo_completed' THEN 'Owner preview — Completed availability demo'
    -- Activation offer
    WHEN 'activation_upsell_viewed' THEN 'Activation offer — Viewed upsell'
    -- Checkout
    WHEN 'checkout_opened' THEN 'Checkout — Opened Stripe checkout'
    WHEN 'checkout_failed' THEN 'Checkout — Checkout failed'
    -- Sale
    WHEN 'listing_activated' THEN 'Sale — Listing activated'
    WHEN 'top25_purchase_completed' THEN 'Sale — Top 25 purchase completed'
    WHEN 'spotlight_purchase_completed' THEN 'Sale — Spotlight purchase completed'
    -- Manage listing
    WHEN 'manage_listing_opened' THEN 'Manage listing — Opened manage listing'
    WHEN 'manage_remove_started' THEN 'Manage listing — Started removal'
    WHEN 'manage_remove_confirmed' THEN 'Manage listing — Confirmed removal'
    WHEN 'manage_recovered' THEN 'Manage listing — Recovered listing'
    -- Replay
    WHEN 'request_replay_opened' THEN 'Request replay — Opened replay page'
    WHEN 'request_replay_engaged' THEN 'Request replay — Engaged with replay'
    -- Email
    WHEN 'smart_link_opened' THEN 'Email — Opened smart link'
    WHEN 'smart_link_qualified_view' THEN 'Email — Qualified smart link view'
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

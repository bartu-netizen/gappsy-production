/*
  # Enrich agency identity resolution + contextual label cleanup

  ## Summary
  Rewrites `get_admin_activity_feed` so every event row benefits from a
  multi-step agency-identity resolution chain:
    1. other_agencies by valid agency_id
    2. other_agencies by agency_slug + state_slug
    3. other_agencies by agency_slug only
    4. metadata JSON ids (agency_id, agencyId, aid)
    5. metadata JSON slugs (agency_slug, agencySlug, slug)
    6. metadata JSON names (agency_name, agencyName, company_name, companyName)
    7. source-table agency_name columns (agency_availability_requests,
       manage_funnel_events, owner_demo_events)
    8. falls back to "Unknown agency" on the client

  Adds two output columns so the admin UI can explain every unresolved row:
    - identity_source text
    - identity_debug jsonb

  ## Security
  - SECURITY DEFINER, search_path locked to public, pg_temp
  - Only admin client calls this function

  ## Intent scoring (unchanged)
  - view:        +1
  - engagement:  +3 to +5
  - high_intent: +10 (CTA clicks only — never conversion)
  - checkout:    +20 (checkout_opened)
  - conversion:  +25 (listing_activated / top25 / spotlight purchases)
  - negative:    -10 (remove started/confirmed)

  ## Notes
  - Payment events are still deduplicated via DISTINCT ON
    (agency_id, stripe_order_id|order_id|checkout_session_id|session_id|date).
  - Unknown events now return NULL for readable_label so the client falls
    back to the centralized getEventMeta() helper and muted raw event_name
    rather than an auto-prettified string.
*/

CREATE OR REPLACE FUNCTION public.get_admin_activity_feed(
  p_limit integer DEFAULT 200,
  p_state_slug text DEFAULT NULL::text,
  p_agency_id uuid DEFAULT NULL::uuid,
  p_window_minutes integer DEFAULT NULL::integer
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
  identity_source text,
  identity_debug jsonb,
  metadata jsonb
)
LANGUAGE sql
SECURITY DEFINER
SET search_path TO 'public', 'pg_temp'
AS $function$
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
    NULL::text AS src_agency_name,
    CASE y.event_name
      WHEN 'your_agency_activate_clicked' THEN 'your_agency_start_receiving_cta_clicked'
      WHEN 'token_page_viewed' THEN 'your_agency_token_page_viewed'
      WHEN 'direct_token_visit' THEN 'your_agency_token_page_viewed'
      WHEN 'your_agency_page_view' THEN 'your_agency_profile_page_viewed'
      ELSE y.event_name
    END AS event_name,
    'your_agency' AS funnel_step,
    COALESCE(y.meta->>'source', 'direct') AS source,
    y.meta AS metadata
  FROM your_agency_funnel_events y, params
  WHERE y.created_at >= params.since

  UNION ALL

  SELECT 'mf:' || m.id::text, m.created_at, m.agency_id, m.agency_slug, m.state_slug,
         m.agency_name,
         CASE m.event_type
           WHEN 'manage_funnel_opened' THEN 'manage_listing_opened'
           ELSE m.event_type
         END,
         'manage',
         COALESCE(m.metadata->>'source', 'direct'),
         m.metadata
  FROM manage_funnel_events m, params
  WHERE m.created_at >= params.since

  UNION ALL

  SELECT 'od:' || d.id::text, d.created_at, d.agency_id::text, NULL::text, d.state_slug,
         d.agency_name,
         d.event_name, 'availability', 'direct', d.metadata
  FROM owner_demo_events d, params
  WHERE d.created_at >= params.since

  UNION ALL

  SELECT 'ar:' || a.id::text, a.created_at, a.agency_id::text, a.agency_slug, a.state_slug,
         a.agency_name,
         'availability_submitted', 'availability', 'direct',
         jsonb_build_object('service', a.service, 'budget', a.budget, 'timeline', a.timeline,
                            'agency_name', a.agency_name)
  FROM agency_availability_requests a, params
  WHERE a.created_at >= params.since

  UNION ALL

  SELECT 'fe:' || f.id::text, f.created_at, f.agency_id, NULL::text, f.state_slug,
         NULL::text,
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
         NULL::text,
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
harvested AS (
  SELECT
    d.*,
    COALESCE(
      d.agency_id,
      d.metadata->>'agency_id',
      d.metadata->>'agencyId',
      d.metadata->>'aid'
    ) AS h_agency_id,
    COALESCE(
      d.agency_slug,
      d.metadata->>'agency_slug',
      d.metadata->>'agencySlug',
      d.metadata->>'slug'
    ) AS h_agency_slug,
    COALESCE(
      d.src_agency_name,
      d.metadata->>'agency_name',
      d.metadata->>'agencyName',
      d.metadata->>'company_name',
      d.metadata->>'companyName'
    ) AS h_agency_name
  FROM deduped d
),
typed AS (
  SELECT
    h.*,
    CASE
      WHEN h.h_agency_id ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
      THEN h.h_agency_id::uuid
      ELSE NULL
    END AS agency_uuid
  FROM harvested h
),
enriched AS (
  SELECT
    t.*,
    CASE
      WHEN t.event_name IN ('listing_activated','top25_purchase_completed','spotlight_purchase_completed') THEN 25
      WHEN t.event_name = 'checkout_opened' THEN 20
      WHEN t.event_name IN (
        'your_agency_start_receiving_cta_clicked',
        'owner_preview_activate_listing_cta_clicked',
        'manage_listing_activate_clicked'
      ) THEN 10
      WHEN t.event_name = 'activation_upsell_viewed' THEN 10
      WHEN t.event_name IN ('request_replay_opened','request_replay_engaged') THEN 6
      WHEN t.event_name = 'your_agency_ledger_page_viewed' THEN 5
      WHEN t.event_name = 'manage_recovered' THEN 5
      WHEN t.event_name IN (
        'availability_submitted','demo_submitted','demo_completed',
        'your_agency_profile_clicked','your_agency_see_listing_clicked',
        'your_agency_view_requests_clicked','cta_click','form_submit'
      ) THEN 3
      WHEN t.event_name IN ('manage_remove_started','manage_remove_confirmed') THEN -10
      WHEN t.event_name = 'checkout_failed' THEN 0
      ELSE 1
    END AS intent_weight,
    CASE
      WHEN t.event_name IN (
        'listing_activated','top25_purchase_completed','spotlight_purchase_completed'
      ) THEN 'conversion'
      WHEN t.event_name IN (
        'checkout_opened',
        'your_agency_start_receiving_cta_clicked',
        'owner_preview_activate_listing_cta_clicked',
        'manage_listing_activate_clicked',
        'availability_submitted'
      ) THEN 'high_intent'
      WHEN t.event_name IN ('manage_remove_started','manage_remove_confirmed') THEN 'negative'
      WHEN t.event_name IN (
        'your_agency_profile_clicked','your_agency_see_listing_clicked','your_agency_view_requests_clicked',
        'cta_click','form_submit','request_replay_engaged','demo_submitted','demo_completed',
        'manage_recovered','activation_upsell_viewed','your_agency_ledger_page_viewed'
      ) THEN 'engagement'
      ELSE 'view'
    END AS event_group,
    CASE
      WHEN t.event_name IN (
        'listing_activated','top25_purchase_completed','spotlight_purchase_completed'
      ) THEN 'conversion'
      WHEN t.event_name = 'checkout_opened' THEN 'checkout'
      WHEN t.event_name IN (
        'your_agency_start_receiving_cta_clicked',
        'owner_preview_activate_listing_cta_clicked',
        'manage_listing_activate_clicked',
        'availability_submitted'
      ) THEN 'high_intent'
      WHEN t.event_name IN ('manage_remove_started','manage_remove_confirmed') THEN 'negative'
      WHEN t.event_name IN (
        'your_agency_profile_clicked','your_agency_see_listing_clicked','your_agency_view_requests_clicked',
        'cta_click','form_submit','request_replay_engaged','demo_submitted','demo_completed',
        'manage_recovered','activation_upsell_viewed','your_agency_ledger_page_viewed'
      ) THEN 'engagement'
      ELSE 'awareness'
    END AS funnel_stage
  FROM typed t
),
joined AS (
  SELECT
    e.*,
    oa_id.id   AS oid_id,   oa_id.name  AS oid_name,   oa_id.slug  AS oid_slug,   oa_id.state_name AS oid_state_name,   oa_id.state_slug AS oid_state_slug,
    oa_ss.id   AS oss_id,   oa_ss.name  AS oss_name,   oa_ss.slug  AS oss_slug,   oa_ss.state_name AS oss_state_name,   oa_ss.state_slug AS oss_state_slug,
    oa_any.id  AS oany_id,  oa_any.name AS oany_name,  oa_any.slug AS oany_slug,  oa_any.state_name AS oany_state_name, oa_any.state_slug AS oany_state_slug
  FROM enriched e
  LEFT JOIN other_agencies oa_id
    ON oa_id.id = e.agency_uuid
  LEFT JOIN other_agencies oa_ss
    ON oa_id.id IS NULL
   AND e.h_agency_slug IS NOT NULL
   AND e.state_slug IS NOT NULL
   AND oa_ss.slug = e.h_agency_slug
   AND oa_ss.state_slug = e.state_slug
  LEFT JOIN LATERAL (
    SELECT oa.id, oa.name, oa.slug, oa.state_name, oa.state_slug
    FROM other_agencies oa
    WHERE oa_id.id IS NULL
      AND oa_ss.id IS NULL
      AND e.h_agency_slug IS NOT NULL
      AND oa.slug = e.h_agency_slug
    ORDER BY (oa.state_slug = e.state_slug) DESC NULLS LAST, oa.updated_at DESC NULLS LAST
    LIMIT 1
  ) oa_any ON true
)
SELECT
  j.id,
  j.created_at,
  COALESCE(j.oid_id::text, j.oss_id::text, j.oany_id::text, j.h_agency_id) AS agency_id,
  COALESCE(j.oid_name, j.oss_name, j.oany_name, j.h_agency_name) AS agency_name,
  COALESCE(j.oid_slug, j.oss_slug, j.oany_slug, j.h_agency_slug) AS agency_slug,
  COALESCE(j.state_slug, j.oid_state_slug, j.oss_state_slug, j.oany_state_slug) AS state_slug,
  COALESCE(j.oid_state_name, j.oss_state_name, j.oany_state_name) AS state_name,
  j.event_name,
  j.event_group,
  j.funnel_stage,
  j.funnel_step,
  j.source,
  j.intent_weight,
  CASE j.event_name
    WHEN 'your_agency_landing_page_viewed' THEN 'Your-agency profile — Viewed landing page'
    WHEN 'your_agency_profile_page_viewed' THEN 'Your-agency profile — Viewed agency profile'
    WHEN 'your_agency_profile_clicked' THEN 'Your-agency profile — Clicked profile card'
    WHEN 'your_agency_see_listing_clicked' THEN 'Your-agency profile — Clicked "See my listing"'
    WHEN 'your_agency_view_requests_clicked' THEN 'Your-agency profile — Clicked "See recent client requests"'
    WHEN 'your_agency_token_page_viewed' THEN 'Your-agency profile — Opened claim link'
    WHEN 'your_agency_ledger_page_viewed' THEN 'Your-agency ledger — Viewed missed client requests'
    WHEN 'your_agency_start_receiving_cta_clicked' THEN 'Your-agency ledger — Clicked "Start receiving these clients"'
    WHEN 'owner_preview_state_page_viewed' THEN 'Owner preview — Viewed state page'
    WHEN 'owner_preview_scroll_to_listing_cta_clicked' THEN 'Owner preview — Clicked "Scroll to my listing"'
    WHEN 'owner_preview_check_availability_opened' THEN 'Owner preview — Opened availability form'
    WHEN 'owner_preview_check_availability_modal_opened' THEN 'Owner preview — Opened availability modal'
    WHEN 'owner_preview_check_availability_submitted' THEN 'Owner preview — Submitted availability form'
    WHEN 'owner_preview_check_availability_result_page_viewed' THEN 'Owner preview — Viewed availability result'
    WHEN 'owner_preview_missed_clients_page_viewed' THEN 'Owner preview — Viewed missed clients page'
    WHEN 'owner_preview_missed_clients_cta_clicked' THEN 'Owner preview — Clicked "See missed clients"'
    WHEN 'owner_preview_activate_listing_cta_clicked' THEN 'Owner preview — Clicked "activate your listing now"'
    WHEN 'availability_submitted' THEN 'Owner preview — Submitted availability form'
    WHEN 'demo_opened' THEN 'Owner preview — Opened availability demo'
    WHEN 'demo_submitted' THEN 'Owner preview — Submitted availability demo'
    WHEN 'demo_completed' THEN 'Owner preview — Completed availability demo'
    WHEN 'activation_upsell_viewed' THEN 'Activation offer — Viewed upsell'
    WHEN 'checkout_opened' THEN 'Checkout — Opened Stripe checkout'
    WHEN 'checkout_failed' THEN 'Checkout — Checkout failed'
    WHEN 'listing_activated' THEN 'Sale — Listing activated'
    WHEN 'top25_purchase_completed' THEN 'Sale — Top 25 purchase completed'
    WHEN 'spotlight_purchase_completed' THEN 'Sale — Spotlight purchase completed'
    WHEN 'manage_listing_opened' THEN 'Manage listing — Opened manage listing'
    WHEN 'manage_listing_activate_clicked' THEN 'Manage listing — Clicked "Start receiving these clients"'
    WHEN 'manage_remove_started' THEN 'Manage listing — Started removal'
    WHEN 'manage_remove_confirmed' THEN 'Manage listing — Confirmed removal'
    WHEN 'manage_recovered' THEN 'Manage listing — Recovered listing'
    WHEN 'request_replay_opened' THEN 'Request replay — Opened replay page'
    WHEN 'request_replay_engaged' THEN 'Request replay — Engaged with replay'
    WHEN 'smart_link_opened' THEN 'Email — Opened smart link'
    WHEN 'smart_link_qualified_view' THEN 'Email — Qualified smart link view'
    ELSE NULL
  END AS readable_label,
  CASE
    WHEN j.oid_id IS NOT NULL THEN 'other_agencies_id'
    WHEN j.oss_id IS NOT NULL THEN 'other_agencies_slug_state'
    WHEN j.oany_id IS NOT NULL THEN 'other_agencies_slug_only'
    WHEN j.h_agency_id IS NOT NULL THEN 'metadata_id'
    WHEN j.h_agency_slug IS NOT NULL THEN 'metadata_slug'
    WHEN j.h_agency_name IS NOT NULL THEN 'source_table_name'
    ELSE 'unresolved'
  END AS identity_source,
  jsonb_build_object(
    'raw_agency_id',        j.agency_id,
    'raw_agency_slug',      j.agency_slug,
    'state_slug',           j.state_slug,
    'meta_has_agency_id',   (j.metadata ? 'agency_id'  OR j.metadata ? 'agencyId' OR j.metadata ? 'aid'),
    'meta_has_agency_slug', (j.metadata ? 'agency_slug' OR j.metadata ? 'agencySlug' OR j.metadata ? 'slug'),
    'meta_has_agency_name', (j.metadata ? 'agency_name' OR j.metadata ? 'agencyName' OR j.metadata ? 'company_name' OR j.metadata ? 'companyName'),
    'src_table_name',       j.src_agency_name,
    'harvested_id',         j.h_agency_id,
    'harvested_slug',       j.h_agency_slug,
    'harvested_name',       j.h_agency_name
  ) AS identity_debug,
  j.metadata
FROM joined j
WHERE (p_state_slug IS NULL OR j.state_slug = p_state_slug)
  AND (p_agency_id IS NULL OR j.oid_id = p_agency_id OR j.oss_id = p_agency_id OR j.oany_id = p_agency_id)
ORDER BY j.created_at DESC
LIMIT GREATEST(1, LEAST(p_limit, 500));
$function$;

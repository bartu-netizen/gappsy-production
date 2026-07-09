/*
  # Harden identity resolution + add intent_stage + reweight scoring (v3b)
  - Normalize names (lower/trim/strip punctuation + corp suffixes)
  - Fallback chain: id -> slug+state -> slug -> name+state -> name -> fuzzy -> metadata
  - identity_method + identity_confidence (high/medium/low/none)
  - intent_stage column (discovery/interest/evaluation/high_intent/purchase_ready/converted/churn_risk)
  - Reweighted intent: ledger_viewed=6, view_requests_clicked=8, availability_submitted=12,
    CTA=15, checkout_opened=25, conversion=25
*/

CREATE OR REPLACE FUNCTION public.get_admin_activity_feed(
  p_limit integer DEFAULT 200,
  p_state_slug text DEFAULT NULL::text,
  p_agency_id uuid DEFAULT NULL::uuid,
  p_window_minutes integer DEFAULT NULL::integer
)
RETURNS TABLE(
  id text,
  created_at timestamp with time zone,
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
  intent_stage text,
  readable_label text,
  identity_source text,
  identity_method text,
  identity_confidence text,
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
    CASE m.event_type WHEN 'manage_funnel_opened' THEN 'manage_listing_opened' ELSE m.event_type END,
    'manage',
    COALESCE(m.metadata->>'source', 'direct'),
    m.metadata
  FROM manage_funnel_events m, params
  WHERE m.created_at >= params.since

  UNION ALL
  SELECT 'od:' || d.id::text, d.created_at, d.agency_id::text, NULL::text, d.state_slug,
    d.agency_name, d.event_name, 'availability', 'direct', d.metadata
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
  WHERE f.created_at >= params.since
    AND (
      f.agency_id IS NOT NULL
      OR f.metadata ? 'agency_id'   OR f.metadata ? 'agencyId'    OR f.metadata ? 'aid'
      OR f.metadata ? 'agency_slug' OR f.metadata ? 'agencySlug'  OR f.metadata ? 'slug'
      OR f.metadata ? 'agency_name' OR f.metadata ? 'agencyName'
      OR f.metadata ? 'company_name' OR f.metadata ? 'companyName'
    )

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
    COALESCE(d.agency_id, d.metadata->>'agency_id', d.metadata->>'agencyId', d.metadata->>'aid') AS h_agency_id,
    COALESCE(d.agency_slug, d.metadata->>'agency_slug', d.metadata->>'agencySlug', d.metadata->>'slug') AS h_agency_slug,
    COALESCE(d.src_agency_name, d.metadata->>'agency_name', d.metadata->>'agencyName', d.metadata->>'company_name', d.metadata->>'companyName') AS h_agency_name
  FROM deduped d
),
typed AS (
  SELECT
    h.*,
    CASE
      WHEN h.h_agency_id ~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
      THEN h.h_agency_id::uuid ELSE NULL
    END AS agency_uuid,
    NULLIF(
      regexp_replace(
        regexp_replace(
          lower(trim(COALESCE(h.h_agency_name, ''))),
          '\s+(llc|l\.l\.c\.|inc|inc\.|ltd|ltd\.|corp|corp\.|co|co\.|pllc|pc|p\.c\.|gmbh|ag|sa|nv|bv)\b', '', 'g'
        ),
        '[^a-z0-9 ]+', '', 'g'
      ),
      ''
    ) AS n_agency_name
  FROM harvested h
),
enriched AS (
  SELECT
    t.*,
    CASE
      WHEN t.event_name IN ('listing_activated','top25_purchase_completed','spotlight_purchase_completed') THEN 25
      WHEN t.event_name = 'checkout_opened' THEN 25
      WHEN t.event_name IN (
        'your_agency_start_receiving_cta_clicked',
        'owner_preview_activate_listing_cta_clicked',
        'manage_listing_activate_clicked'
      ) THEN 15
      WHEN t.event_name IN ('availability_submitted','owner_preview_check_availability_submitted') THEN 12
      WHEN t.event_name = 'your_agency_view_requests_clicked' THEN 8
      WHEN t.event_name = 'your_agency_ledger_page_viewed' THEN 6
      WHEN t.event_name IN ('activation_upsell_viewed','listing_activation_offer_page_viewed') THEN 10
      WHEN t.event_name IN ('request_replay_opened','request_replay_engaged') THEN 6
      WHEN t.event_name = 'manage_recovered' THEN 5
      WHEN t.event_name IN (
        'demo_submitted','demo_completed',
        'your_agency_profile_clicked','your_agency_see_listing_clicked',
        'cta_click','form_submit'
      ) THEN 3
      WHEN t.event_name IN ('manage_remove_started','manage_remove_confirmed') THEN -10
      WHEN t.event_name = 'checkout_failed' THEN 0
      ELSE 1
    END AS intent_weight,
    CASE
      WHEN t.event_name IN ('listing_activated','top25_purchase_completed','spotlight_purchase_completed') THEN 'conversion'
      WHEN t.event_name = 'checkout_opened' THEN 'high_intent'
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
      ELSE 'view'
    END AS event_group,
    CASE
      WHEN t.event_name IN ('listing_activated','top25_purchase_completed','spotlight_purchase_completed') THEN 'conversion'
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
    END AS funnel_stage,
    CASE
      WHEN t.event_name IN ('listing_activated','top25_purchase_completed','spotlight_purchase_completed') THEN 'converted'
      WHEN t.event_name IN ('manage_remove_started','manage_remove_confirmed') THEN 'churn_risk'
      WHEN t.event_name = 'checkout_opened' THEN 'purchase_ready'
      WHEN t.event_name IN (
        'your_agency_start_receiving_cta_clicked',
        'owner_preview_activate_listing_cta_clicked',
        'manage_listing_activate_clicked',
        'activation_upsell_viewed','listing_activation_offer_page_viewed'
      ) THEN 'high_intent'
      WHEN t.event_name IN (
        'availability_submitted','owner_preview_check_availability_submitted',
        'owner_preview_check_availability_opened','owner_preview_check_availability_modal_opened',
        'owner_preview_check_availability_result_page_viewed',
        'demo_submitted','demo_completed','demo_opened'
      ) THEN 'evaluation'
      WHEN t.event_name IN (
        'your_agency_view_requests_clicked','your_agency_ledger_page_viewed',
        'owner_preview_missed_clients_cta_clicked','owner_preview_missed_clients_page_viewed',
        'request_replay_opened','request_replay_engaged','smart_link_qualified_view'
      ) THEN 'interest'
      ELSE 'discovery'
    END AS intent_stage
  FROM typed t
),
j_id AS (
  SELECT e.id AS raw_id, oa.id, oa.name, oa.slug, oa.state_name, oa.state_slug
  FROM enriched e LEFT JOIN other_agencies oa ON oa.id = e.agency_uuid
),
j_slug_state AS (
  SELECT e.id AS raw_id, oa.id, oa.name, oa.slug, oa.state_name, oa.state_slug
  FROM enriched e LEFT JOIN other_agencies oa
    ON e.h_agency_slug IS NOT NULL AND e.state_slug IS NOT NULL
   AND oa.slug = e.h_agency_slug AND oa.state_slug = e.state_slug
),
j_slug AS (
  SELECT DISTINCT ON (e.id) e.id AS raw_id, oa.id, oa.name, oa.slug, oa.state_name, oa.state_slug
  FROM enriched e LEFT JOIN other_agencies oa ON oa.slug = e.h_agency_slug
  ORDER BY e.id, (oa.state_slug = e.state_slug) DESC NULLS LAST, oa.updated_at DESC NULLS LAST
),
j_name_state AS (
  SELECT DISTINCT ON (e.id) e.id AS raw_id, oa.id, oa.name, oa.slug, oa.state_name, oa.state_slug
  FROM enriched e LEFT JOIN other_agencies oa
    ON e.n_agency_name IS NOT NULL AND e.state_slug IS NOT NULL
   AND oa.state_slug = e.state_slug
   AND NULLIF(
         regexp_replace(
           regexp_replace(
             lower(trim(COALESCE(oa.name,''))),
             '\s+(llc|l\.l\.c\.|inc|inc\.|ltd|ltd\.|corp|corp\.|co|co\.|pllc|pc|p\.c\.|gmbh|ag|sa|nv|bv)\b', '', 'g'
           ),
           '[^a-z0-9 ]+', '', 'g'
         ),
         ''
       ) = e.n_agency_name
  ORDER BY e.id, oa.updated_at DESC NULLS LAST
),
j_name AS (
  SELECT DISTINCT ON (e.id) e.id AS raw_id, oa.id, oa.name, oa.slug, oa.state_name, oa.state_slug
  FROM enriched e LEFT JOIN other_agencies oa
    ON e.n_agency_name IS NOT NULL
   AND NULLIF(
         regexp_replace(
           regexp_replace(
             lower(trim(COALESCE(oa.name,''))),
             '\s+(llc|l\.l\.c\.|inc|inc\.|ltd|ltd\.|corp|corp\.|co|co\.|pllc|pc|p\.c\.|gmbh|ag|sa|nv|bv)\b', '', 'g'
           ),
           '[^a-z0-9 ]+', '', 'g'
         ),
         ''
       ) = e.n_agency_name
  ORDER BY e.id, oa.updated_at DESC NULLS LAST
),
j_fuzzy AS (
  SELECT DISTINCT ON (e.id) e.id AS raw_id, oa.id, oa.name, oa.slug, oa.state_name, oa.state_slug
  FROM enriched e LEFT JOIN other_agencies oa
    ON e.n_agency_name IS NOT NULL
   AND length(e.n_agency_name) >= 4
   AND lower(oa.name) ILIKE '%' || e.n_agency_name || '%'
  ORDER BY e.id, (oa.state_slug = e.state_slug) DESC NULLS LAST, oa.updated_at DESC NULLS LAST
),
resolved AS (
  SELECT
    e.*,
    COALESCE(ji.id, jss.id, jsl.id, jns.id, jn.id, jf.id) AS r_id,
    COALESCE(ji.name, jss.name, jsl.name, jns.name, jn.name, jf.name) AS r_name,
    COALESCE(ji.slug, jss.slug, jsl.slug, jns.slug, jn.slug, jf.slug) AS r_slug,
    COALESCE(ji.state_name, jss.state_name, jsl.state_name, jns.state_name, jn.state_name, jf.state_name) AS r_state_name,
    COALESCE(ji.state_slug, jss.state_slug, jsl.state_slug, jns.state_slug, jn.state_slug, jf.state_slug) AS r_state_slug,
    CASE
      WHEN ji.id  IS NOT NULL THEN 'id'
      WHEN jss.id IS NOT NULL THEN 'slug_state'
      WHEN jsl.id IS NOT NULL THEN 'slug'
      WHEN jns.id IS NOT NULL THEN 'name_state'
      WHEN jn.id  IS NOT NULL THEN 'name'
      WHEN jf.id  IS NOT NULL THEN 'fuzzy'
      WHEN e.h_agency_id   IS NOT NULL THEN 'metadata_id'
      WHEN e.h_agency_slug IS NOT NULL THEN 'metadata_slug'
      WHEN e.h_agency_name IS NOT NULL THEN 'metadata_name'
      ELSE 'unresolved'
    END AS identity_method,
    CASE
      WHEN ji.id  IS NOT NULL THEN 'high'
      WHEN jss.id IS NOT NULL THEN 'high'
      WHEN jsl.id IS NOT NULL THEN 'medium'
      WHEN jns.id IS NOT NULL THEN 'medium'
      WHEN jn.id  IS NOT NULL THEN 'medium'
      WHEN jf.id  IS NOT NULL THEN 'low'
      WHEN e.h_agency_id   IS NOT NULL THEN 'low'
      WHEN e.h_agency_slug IS NOT NULL THEN 'low'
      WHEN e.h_agency_name IS NOT NULL THEN 'low'
      ELSE 'none'
    END AS identity_confidence
  FROM enriched e
  LEFT JOIN j_id         ji  ON ji.raw_id  = e.id
  LEFT JOIN j_slug_state jss ON jss.raw_id = e.id AND ji.id IS NULL
  LEFT JOIN j_slug       jsl ON jsl.raw_id = e.id AND ji.id IS NULL AND jss.id IS NULL
  LEFT JOIN j_name_state jns ON jns.raw_id = e.id AND ji.id IS NULL AND jss.id IS NULL AND jsl.id IS NULL
  LEFT JOIN j_name       jn  ON jn.raw_id  = e.id AND ji.id IS NULL AND jss.id IS NULL AND jsl.id IS NULL AND jns.id IS NULL
  LEFT JOIN j_fuzzy      jf  ON jf.raw_id  = e.id AND ji.id IS NULL AND jss.id IS NULL AND jsl.id IS NULL AND jns.id IS NULL AND jn.id IS NULL
)
SELECT
  r.id,
  r.created_at,
  COALESCE(r.r_id::text, r.h_agency_id) AS agency_id,
  COALESCE(r.r_name, r.h_agency_name) AS agency_name,
  COALESCE(r.r_slug, r.h_agency_slug) AS agency_slug,
  COALESCE(r.state_slug, r.r_state_slug) AS state_slug,
  r.r_state_name AS state_name,
  r.event_name,
  r.event_group,
  r.funnel_stage,
  r.funnel_step,
  r.source,
  r.intent_weight,
  r.intent_stage,
  CASE r.event_name
    WHEN 'your_agency_landing_page_viewed' THEN 'Your-agency profile — Viewed landing page'
    WHEN 'your_agency_profile_page_viewed' THEN 'Your-agency profile — Viewed missed client opportunities'
    WHEN 'your_agency_profile_clicked' THEN 'Your-agency profile — Clicked profile card'
    WHEN 'your_agency_see_listing_clicked' THEN 'Your-agency profile — Clicked "See my listing"'
    WHEN 'your_agency_view_requests_clicked' THEN 'Your-agency profile — Clicked to view missed client requests'
    WHEN 'your_agency_token_page_viewed' THEN 'Your-agency profile — Opened claim link'
    WHEN 'your_agency_ledger_page_viewed' THEN 'Your-agency ledger — Reviewed missed client opportunities'
    WHEN 'your_agency_start_receiving_cta_clicked' THEN 'Your-agency ledger — Signaled intent to activate (CTA)'
    WHEN 'owner_preview_state_page_viewed' THEN 'Owner preview — Landed on state page'
    WHEN 'owner_preview_scroll_to_listing_cta_clicked' THEN 'Owner preview — Looked for their listing'
    WHEN 'owner_preview_check_availability_opened' THEN 'Owner preview — Started client request flow'
    WHEN 'owner_preview_check_availability_modal_opened' THEN 'Owner preview — Opened availability modal'
    WHEN 'owner_preview_check_availability_submitted' THEN 'Owner preview — Submitted client request flow'
    WHEN 'owner_preview_check_availability_result_page_viewed' THEN 'Owner preview — Viewed match result (client routed elsewhere)'
    WHEN 'owner_preview_missed_clients_page_viewed' THEN 'Owner preview — Reviewed missed clients page'
    WHEN 'owner_preview_missed_clients_cta_clicked' THEN 'Owner preview — Clicked to see missed clients'
    WHEN 'owner_preview_activate_listing_cta_clicked' THEN 'Owner preview — Signaled intent to activate (CTA)'
    WHEN 'availability_submitted' THEN 'Client request — Real client submitted request'
    WHEN 'demo_opened' THEN 'Owner preview — Opened availability demo'
    WHEN 'demo_submitted' THEN 'Owner preview — Submitted availability demo'
    WHEN 'demo_completed' THEN 'Owner preview — Completed availability demo'
    WHEN 'activation_upsell_viewed' THEN 'Activation offer — Considered upsell'
    WHEN 'listing_activation_offer_page_viewed' THEN 'Activation offer — Reviewed offer page'
    WHEN 'checkout_opened' THEN 'Checkout — Reached Stripe checkout (purchase-ready)'
    WHEN 'checkout_failed' THEN 'Checkout — Payment failed'
    WHEN 'listing_activated' THEN 'Sale — Listing activated (converted)'
    WHEN 'top25_purchase_completed' THEN 'Sale — Top 25 purchase completed'
    WHEN 'spotlight_purchase_completed' THEN 'Sale — Spotlight purchase completed'
    WHEN 'manage_listing_opened' THEN 'Manage listing — Opened manage listing'
    WHEN 'manage_listing_activate_clicked' THEN 'Manage listing — Signaled intent to activate (CTA)'
    WHEN 'manage_remove_started' THEN 'Manage listing — Started removal (churn risk)'
    WHEN 'manage_remove_confirmed' THEN 'Manage listing — Confirmed removal (churn)'
    WHEN 'manage_recovered' THEN 'Manage listing — Recovered listing'
    WHEN 'request_replay_opened' THEN 'Request replay — Opened replay page'
    WHEN 'request_replay_engaged' THEN 'Request replay — Engaged with replay'
    WHEN 'smart_link_opened' THEN 'Email — Opened smart link'
    WHEN 'smart_link_qualified_view' THEN 'Email — Qualified smart link view'
    ELSE NULL
  END AS readable_label,
  CASE
    WHEN r.identity_method = 'id' THEN 'other_agencies_id'
    WHEN r.identity_method = 'slug_state' THEN 'other_agencies_slug_state'
    WHEN r.identity_method = 'slug' THEN 'other_agencies_slug_only'
    WHEN r.identity_method = 'name_state' THEN 'other_agencies_name_state'
    WHEN r.identity_method = 'name' THEN 'other_agencies_name'
    WHEN r.identity_method = 'fuzzy' THEN 'other_agencies_fuzzy'
    WHEN r.identity_method = 'metadata_id' THEN 'metadata_id'
    WHEN r.identity_method = 'metadata_slug' THEN 'metadata_slug'
    WHEN r.identity_method = 'metadata_name' THEN 'source_table_name'
    ELSE 'unresolved'
  END AS identity_source,
  r.identity_method,
  r.identity_confidence,
  jsonb_build_object(
    'raw_agency_id',    r.agency_id,
    'raw_agency_slug',  r.agency_slug,
    'state_slug',       r.state_slug,
    'harvested_id',     r.h_agency_id,
    'harvested_slug',   r.h_agency_slug,
    'harvested_name',   r.h_agency_name,
    'normalized_name',  r.n_agency_name,
    'method',           r.identity_method,
    'confidence',       r.identity_confidence
  ) AS identity_debug,
  r.metadata
FROM resolved r
WHERE (p_state_slug IS NULL OR r.state_slug = p_state_slug)
  AND (p_agency_id IS NULL OR r.r_id = p_agency_id)
ORDER BY r.created_at DESC
LIMIT GREATEST(1, LEAST(p_limit, 500));
$function$;

GRANT EXECUTE ON FUNCTION public.get_admin_activity_feed(integer, text, uuid, integer) TO authenticated, service_role, anon;

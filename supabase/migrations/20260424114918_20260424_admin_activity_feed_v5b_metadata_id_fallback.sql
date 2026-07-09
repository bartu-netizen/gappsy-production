/*
  # Activity feed v5b: metadata-id fallback + replay_session enrichment filter

  Adds to the identity fallback chain:
  - metadata->>'agencyId' / 'agency_id' as id fallback when raw agency_id is NULL
  - Harvests more meta keys for slug/name
*/

DROP FUNCTION IF EXISTS public.get_admin_activity_feed(integer, text, uuid, integer);

CREATE OR REPLACE FUNCTION public.get_admin_activity_feed(
  p_limit integer DEFAULT 100,
  p_filter_type text DEFAULT NULL,
  p_agency_id uuid DEFAULT NULL,
  p_minutes integer DEFAULT NULL
)
RETURNS TABLE (
  id text, created_at timestamptz, event_name text, funnel_step text, source text,
  agency_id text, agency_name text, agency_slug text, state_slug text, metadata jsonb,
  intent_weight integer, intent_stage text, identity_method text, identity_confidence text,
  identity_source text, identity_debug jsonb
)
LANGUAGE sql STABLE SECURITY DEFINER
SET search_path TO 'public', 'extensions', 'pg_temp'
AS $$
  WITH raw AS (
    SELECT
      f.id::text AS id, f.created_at AS created_at, f.agency_id AS agency_id,
      NULL::text AS agency_slug, f.state_slug AS state_slug, NULL::text AS src_agency_name,
      f.event_name AS event_name, COALESCE(f.event_stage, f.funnel_name) AS funnel_step,
      'funnel_events'::text AS source, f.metadata AS metadata
    FROM public.funnel_events f
    WHERE (p_minutes IS NULL OR f.created_at >= now() - (p_minutes::text || ' minutes')::interval)
      AND (p_filter_type IS NULL OR p_filter_type = 'funnel_events')
    UNION ALL
    SELECT y.id::text, y.created_at, y.agency_id, y.agency_slug, y.state_slug, NULL::text,
           y.event_name, y.section, 'your_agency'::text, y.meta
    FROM public.your_agency_funnel_events y
    WHERE (p_minutes IS NULL OR y.created_at >= now() - (p_minutes::text || ' minutes')::interval)
      AND (p_filter_type IS NULL OR p_filter_type = 'your_agency')
    UNION ALL
    SELECT m.id::text, m.created_at, m.agency_id, m.agency_slug, m.state_slug, m.agency_name,
           m.event_type, 'manage_funnel'::text, 'manage_funnel'::text, m.metadata
    FROM public.manage_funnel_events m
    WHERE (p_minutes IS NULL OR m.created_at >= now() - (p_minutes::text || ' minutes')::interval)
      AND (p_filter_type IS NULL OR p_filter_type = 'manage_funnel')
    UNION ALL
    SELECT a.id::text, a.created_at, a.agency_id::text, a.agency_slug, a.state_slug, a.agency_name,
           'availability_submitted'::text, 'availability'::text, 'availability'::text,
           jsonb_build_object('service', a.service, 'budget', a.budget, 'timeline', a.timeline,
                              'client_email', a.client_email, 'is_demo', a.is_demo)
    FROM public.agency_availability_requests a
    WHERE a.deleted_at IS NULL AND COALESCE(a.is_demo, false) = false
      AND (p_minutes IS NULL OR a.created_at >= now() - (p_minutes::text || ' minutes')::interval)
      AND (p_filter_type IS NULL OR p_filter_type = 'availability')
    UNION ALL
    SELECT s.id::text, s.created_at, s.agency_id, NULL::text, s.state_slug, s.agency_name,
           COALESCE(s.status::text, 'stripe_order'), 'payment'::text, 'stripe'::text, s.metadata
    FROM public.stripe_orders s
    WHERE s.deleted_at IS NULL
      AND (p_minutes IS NULL OR s.created_at >= now() - (p_minutes::text || ' minutes')::interval)
      AND (p_filter_type IS NULL OR p_filter_type = 'stripe')
  ),
  windowed AS (
    SELECT r.* FROM raw r ORDER BY r.created_at DESC LIMIT LEAST(GREATEST(p_limit, 1) * 4, 2000)
  ),
  prepared AS (
    SELECT w.*,
      NULLIF(COALESCE(w.agency_id, w.metadata->>'agencyId', w.metadata->>'agency_id',
                      w.metadata->>'agencyID', w.metadata->>'targetAgencyId'), '') AS eff_agency_id,
      NULLIF(COALESCE(w.src_agency_name, w.metadata->>'agency_name', w.metadata->>'agencyName',
                      w.metadata->>'name', w.metadata->>'agency'), '') AS meta_name,
      NULLIF(COALESCE(w.agency_slug, w.metadata->>'agency_slug', w.metadata->>'agencySlug',
                      w.metadata->>'slug'), '') AS eff_slug,
      public.normalize_agency_name_strict(
        COALESCE(w.src_agency_name, w.metadata->>'agency_name',
                 w.metadata->>'agencyName', w.metadata->>'name', w.metadata->>'agency')
      ) AS norm_name
    FROM windowed w
  ),
  resolved AS (
    SELECT p.*, m.matched_id, m.matched_name, m.matched_slug, m.method, m.confidence
    FROM prepared p
    LEFT JOIN LATERAL (
      SELECT oa.id::text AS matched_id, oa.name AS matched_name, oa.slug AS matched_slug,
             'id'::text AS method, 'high'::text AS confidence
      FROM public.other_agencies oa
      WHERE p.eff_agency_id IS NOT NULL AND oa.id::text = p.eff_agency_id
      LIMIT 1
    ) m ON TRUE
    LEFT JOIN LATERAL (
      SELECT oa.id::text, oa.name, oa.slug, 'slug_state'::text, 'high'::text
      FROM public.other_agencies oa
      WHERE m.matched_id IS NULL AND p.eff_slug IS NOT NULL AND p.state_slug IS NOT NULL
        AND oa.slug = p.eff_slug AND oa.state_slug = p.state_slug
      LIMIT 1
    ) m2(matched_id, matched_name, matched_slug, method, confidence) ON m.matched_id IS NULL
    LEFT JOIN LATERAL (
      SELECT oa.id::text, oa.name, oa.slug, 'slug'::text, 'medium'::text
      FROM public.other_agencies oa
      WHERE m.matched_id IS NULL AND m2.matched_id IS NULL
        AND p.eff_slug IS NOT NULL AND oa.slug = p.eff_slug
      LIMIT 1
    ) m3(matched_id, matched_name, matched_slug, method, confidence)
      ON (m.matched_id IS NULL AND m2.matched_id IS NULL)
    LEFT JOIN LATERAL (
      SELECT oa.id::text, oa.name, oa.slug, 'name_state'::text, 'medium'::text
      FROM public.other_agencies oa
      WHERE m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL
        AND p.norm_name IS NOT NULL AND p.state_slug IS NOT NULL
        AND oa.name_norm = p.norm_name AND oa.state_slug = p.state_slug
      LIMIT 1
    ) m4(matched_id, matched_name, matched_slug, method, confidence)
      ON (m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL)
    LEFT JOIN LATERAL (
      SELECT oa.id::text, oa.name, oa.slug, 'name'::text, 'medium'::text
      FROM public.other_agencies oa
      WHERE m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL AND m4.matched_id IS NULL
        AND p.norm_name IS NOT NULL AND oa.name_norm = p.norm_name
      LIMIT 1
    ) m5(matched_id, matched_name, matched_slug, method, confidence)
      ON (m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL AND m4.matched_id IS NULL)
    LEFT JOIN LATERAL (
      SELECT oa.id::text, oa.name, oa.slug, 'fuzzy'::text, 'low'::text
      FROM public.other_agencies oa
      WHERE m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL
            AND m4.matched_id IS NULL AND m5.matched_id IS NULL
        AND p.norm_name IS NOT NULL AND length(p.norm_name) >= 4
        AND oa.name_norm % p.norm_name
        AND extensions.similarity(oa.name_norm, p.norm_name) >= 0.6
      ORDER BY extensions.similarity(oa.name_norm, p.norm_name) DESC
      LIMIT 1
    ) m6(matched_id, matched_name, matched_slug, method, confidence)
      ON (m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL
          AND m4.matched_id IS NULL AND m5.matched_id IS NULL)
  ),
  enriched AS (
    SELECT
      r.id, r.created_at, r.event_name, r.funnel_step, r.source,
      COALESCE(r.matched_id, r.eff_agency_id) AS agency_id,
      COALESCE(r.matched_name, r.meta_name) AS agency_name,
      COALESCE(r.matched_slug, r.eff_slug) AS agency_slug,
      r.state_slug, r.metadata,
      CASE
        WHEN r.event_name IN ('availability_submitted','availability_request_submitted') THEN 12
        WHEN r.event_name IN ('stripe_checkout_opened','checkout_opened','stripe_checkout_started') THEN 25
        WHEN r.event_name ILIKE '%cta%click%' OR r.event_name ILIKE '%click_cta%' OR r.event_name = 'cta_clicked' THEN 15
        WHEN r.event_name IN ('view_requests_clicked','view_matches_clicked') THEN 8
        WHEN r.event_name ILIKE '%ledger%' OR r.event_name ILIKE '%missed%opportun%' THEN 6
        WHEN r.source = 'stripe' THEN 30
        WHEN r.event_name ILIKE '%activation%' OR r.event_name ILIKE '%listing_activated%' THEN 30
        ELSE 1
      END AS intent_weight,
      CASE
        WHEN r.source = 'stripe' AND r.event_name IN ('completed','paid') THEN 'converted'
        WHEN r.event_name ILIKE '%activation%' OR r.event_name ILIKE '%listing_activated%' THEN 'converted'
        WHEN r.event_name IN ('stripe_checkout_opened','checkout_opened','stripe_checkout_started') THEN 'purchase_ready'
        WHEN r.event_name ILIKE '%cta%click%' OR r.event_name ILIKE '%click_cta%' OR r.event_name = 'cta_clicked' THEN 'high_intent'
        WHEN r.event_name IN ('view_requests_clicked','view_matches_clicked') THEN 'high_intent'
        WHEN r.event_name IN ('availability_submitted','availability_request_submitted') THEN 'evaluation'
        WHEN r.source = 'manage_funnel' AND r.event_name ILIKE '%remove%' THEN 'churn_risk'
        WHEN r.event_name ILIKE '%ledger%' OR r.event_name ILIKE '%missed%opportun%' THEN 'interest'
        WHEN r.event_name ILIKE '%profile%view%' OR r.event_name ILIKE '%landing%' OR r.event_name ILIKE '%page_view%' THEN 'discovery'
        ELSE 'discovery'
      END AS intent_stage,
      COALESCE(r.method, 'none') AS identity_method,
      COALESCE(r.confidence,
               CASE WHEN r.meta_name IS NOT NULL OR r.eff_slug IS NOT NULL THEN 'low' ELSE 'none' END) AS identity_confidence,
      CASE
        WHEN r.method IS NOT NULL THEN 'other_agencies:' || r.method
        WHEN r.meta_name IS NOT NULL THEN 'metadata:name'
        WHEN r.eff_slug IS NOT NULL THEN 'metadata:slug'
        ELSE 'unresolved'
      END AS identity_source,
      jsonb_build_object('raw_agency_id', r.agency_id, 'eff_agency_id', r.eff_agency_id,
                         'meta_name', r.meta_name, 'norm_name', r.norm_name,
                         'eff_slug', r.eff_slug, 'matched_via', r.method) AS identity_debug
    FROM resolved r
  )
  SELECT e.id, e.created_at, e.event_name, e.funnel_step, e.source,
         e.agency_id, e.agency_name, e.agency_slug, e.state_slug, e.metadata,
         e.intent_weight, e.intent_stage, e.identity_method, e.identity_confidence,
         e.identity_source, e.identity_debug
  FROM enriched e
  WHERE (p_agency_id IS NULL OR e.agency_id = p_agency_id::text)
  ORDER BY e.created_at DESC
  LIMIT GREATEST(p_limit, 1);
$$;

GRANT EXECUTE ON FUNCTION public.get_admin_activity_feed(integer, text, uuid, integer) TO authenticated, service_role, anon;

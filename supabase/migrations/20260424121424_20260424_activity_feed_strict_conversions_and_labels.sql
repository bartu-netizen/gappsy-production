/*
  # Activity Feed — Strict Conversion Whitelist + Non-Null readable_label

  1. Fixes
    - `readable_label` is now always a real human string (never NULL) via CASE
      with humanized fallback `initcap(replace(event_name,'_',' '))`.
    - Conversion detection restricted to a strict whitelist. Page views like
      `activation_upgrade_viewed`, `activation_upsell_viewed`,
      `listing_activation_offer_page_viewed` are NO LONGER marked conversion;
      they are classified as engagement/interest.
    - stripe source conversion only when status in ('completed','paid','succeeded','active').

  2. Security
    - SECURITY DEFINER preserved, search_path locked, signature unchanged.
*/

CREATE OR REPLACE FUNCTION public.get_admin_activity_feed(
  p_limit integer DEFAULT 100,
  p_state_slug text DEFAULT NULL,
  p_agency_id uuid DEFAULT NULL,
  p_window_minutes integer DEFAULT NULL
)
RETURNS TABLE(
  id text, created_at timestamptz, agency_id text, agency_name text, agency_slug text,
  state_slug text, state_name text, event_name text, event_group text, funnel_stage text,
  funnel_step text, source text, intent_weight integer, readable_label text, metadata jsonb,
  intent_stage text, identity_method text, identity_confidence text, identity_source text,
  identity_debug jsonb
)
LANGUAGE sql STABLE SECURITY DEFINER
SET search_path TO 'public','extensions','pg_temp'
AS $function$
WITH raw AS (
  SELECT f.id::text AS id, f.created_at, f.agency_id, NULL::text AS agency_slug,
         f.state_slug, NULL::text AS src_agency_name, f.event_name,
         COALESCE(f.event_stage, f.funnel_name) AS funnel_step,
         'funnel_events'::text AS source, f.metadata
  FROM public.funnel_events f
  WHERE (p_window_minutes IS NULL OR f.created_at >= now() - (p_window_minutes::text || ' minutes')::interval)
    AND (p_state_slug IS NULL OR f.state_slug = p_state_slug)
  UNION ALL
  SELECT y.id::text, y.created_at, y.agency_id, y.agency_slug, y.state_slug, NULL::text,
         y.event_name, y.section, 'your_agency'::text, y.meta
  FROM public.your_agency_funnel_events y
  WHERE (p_window_minutes IS NULL OR y.created_at >= now() - (p_window_minutes::text || ' minutes')::interval)
    AND (p_state_slug IS NULL OR y.state_slug = p_state_slug)
  UNION ALL
  SELECT m.id::text, m.created_at, m.agency_id, m.agency_slug, m.state_slug, m.agency_name,
         m.event_type, 'manage_funnel'::text, 'manage_funnel'::text, m.metadata
  FROM public.manage_funnel_events m
  WHERE (p_window_minutes IS NULL OR m.created_at >= now() - (p_window_minutes::text || ' minutes')::interval)
    AND (p_state_slug IS NULL OR m.state_slug = p_state_slug)
  UNION ALL
  SELECT a.id::text, a.created_at, a.agency_id::text, a.agency_slug, a.state_slug, a.agency_name,
         'availability_submitted'::text, 'availability'::text, 'availability'::text,
         jsonb_build_object('service', a.service, 'budget', a.budget, 'timeline', a.timeline,
                            'client_email', a.client_email, 'is_demo', a.is_demo)
  FROM public.agency_availability_requests a
  WHERE a.deleted_at IS NULL AND COALESCE(a.is_demo,false)=false
    AND (p_window_minutes IS NULL OR a.created_at >= now() - (p_window_minutes::text || ' minutes')::interval)
    AND (p_state_slug IS NULL OR a.state_slug = p_state_slug)
  UNION ALL
  SELECT s.id::text, s.created_at, s.agency_id, NULL::text, s.state_slug, s.agency_name,
         COALESCE(s.status::text,'stripe_order'), 'payment'::text, 'stripe'::text, s.metadata
  FROM public.stripe_orders s
  WHERE s.deleted_at IS NULL
    AND (p_window_minutes IS NULL OR s.created_at >= now() - (p_window_minutes::text || ' minutes')::interval)
    AND (p_state_slug IS NULL OR s.state_slug = p_state_slug)
),
windowed AS (
  SELECT r.* FROM raw r ORDER BY r.created_at DESC LIMIT LEAST(GREATEST(p_limit,1)*4, 2000)
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
  SELECT p.*, m.matched_id, m.matched_name, m.matched_slug, m.matched_state, m.method, m.confidence
  FROM prepared p
  LEFT JOIN LATERAL (
    SELECT oa.id::text AS matched_id, oa.name AS matched_name, oa.slug AS matched_slug,
           oa.state_slug AS matched_state, 'id'::text AS method, 'high'::text AS confidence
    FROM public.other_agencies oa
    WHERE p.eff_agency_id IS NOT NULL AND oa.id::text = p.eff_agency_id LIMIT 1
  ) m ON TRUE
  LEFT JOIN LATERAL (
    SELECT oa.id::text, oa.name, oa.slug, oa.state_slug, 'slug_state'::text, 'high'::text
    FROM public.other_agencies oa
    WHERE m.matched_id IS NULL AND p.eff_slug IS NOT NULL AND p.state_slug IS NOT NULL
      AND oa.slug = p.eff_slug AND oa.state_slug = p.state_slug LIMIT 1
  ) m2(matched_id, matched_name, matched_slug, matched_state, method, confidence) ON m.matched_id IS NULL
  LEFT JOIN LATERAL (
    SELECT oa.id::text, oa.name, oa.slug, oa.state_slug, 'slug'::text, 'medium'::text
    FROM public.other_agencies oa
    WHERE m.matched_id IS NULL AND m2.matched_id IS NULL
      AND p.eff_slug IS NOT NULL AND oa.slug = p.eff_slug LIMIT 1
  ) m3(matched_id, matched_name, matched_slug, matched_state, method, confidence)
    ON (m.matched_id IS NULL AND m2.matched_id IS NULL)
  LEFT JOIN LATERAL (
    SELECT oa.id::text, oa.name, oa.slug, oa.state_slug, 'name_state'::text, 'medium'::text
    FROM public.other_agencies oa
    WHERE m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL
      AND p.norm_name IS NOT NULL AND p.state_slug IS NOT NULL
      AND oa.name_norm = p.norm_name AND oa.state_slug = p.state_slug LIMIT 1
  ) m4(matched_id, matched_name, matched_slug, matched_state, method, confidence)
    ON (m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL)
  LEFT JOIN LATERAL (
    SELECT oa.id::text, oa.name, oa.slug, oa.state_slug, 'name'::text, 'medium'::text
    FROM public.other_agencies oa
    WHERE m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL AND m4.matched_id IS NULL
      AND p.norm_name IS NOT NULL AND oa.name_norm = p.norm_name LIMIT 1
  ) m5(matched_id, matched_name, matched_slug, matched_state, method, confidence)
    ON (m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL AND m4.matched_id IS NULL)
  LEFT JOIN LATERAL (
    SELECT oa.id::text, oa.name, oa.slug, oa.state_slug, 'fuzzy'::text, 'low'::text
    FROM public.other_agencies oa
    WHERE m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL
      AND m4.matched_id IS NULL AND m5.matched_id IS NULL
      AND p.norm_name IS NOT NULL AND length(p.norm_name) >= 4
      AND oa.name_norm % p.norm_name
      AND extensions.similarity(oa.name_norm, p.norm_name) >= 0.6
    ORDER BY extensions.similarity(oa.name_norm, p.norm_name) DESC LIMIT 1
  ) m6(matched_id, matched_name, matched_slug, matched_state, method, confidence)
    ON (m.matched_id IS NULL AND m2.matched_id IS NULL AND m3.matched_id IS NULL
        AND m4.matched_id IS NULL AND m5.matched_id IS NULL)
),
classified AS (
  SELECT r.*,
    -- STRICT conversion whitelist (no ILIKE guessing on 'activation')
    CASE
      WHEN r.source = 'stripe' AND lower(r.event_name) IN ('completed','paid','succeeded','active') THEN TRUE
      WHEN r.event_name IN (
        'checkout_completed','stripe_checkout_completed',
        'payment_succeeded','stripe_payment_succeeded',
        'listing_activated','listing_activated_paid',
        'top25_purchase_completed','spotlight_purchase_completed'
      ) THEN TRUE
      ELSE FALSE
    END AS is_conversion,
    CASE
      WHEN r.event_name IN ('stripe_checkout_opened','checkout_opened','stripe_checkout_started',
                            'checkout_started','checkout_page_viewed') THEN TRUE
      ELSE FALSE
    END AS is_checkout,
    CASE
      WHEN r.event_name ILIKE '%cta%click%' OR r.event_name ILIKE '%click_cta%'
           OR r.event_name = 'cta_clicked'
           OR r.event_name IN (
             'your_agency_start_receiving_cta_clicked','your_agency_activate_clicked',
             'owner_preview_missed_clients_cta_clicked','owner_preview_activate_listing_cta_clicked',
             'activate_listing_clicked'
           ) THEN TRUE
      ELSE FALSE
    END AS is_cta,
    CASE
      WHEN r.event_name IN ('view_requests_clicked','view_matches_clicked',
                            'your_agency_view_requests_clicked') THEN TRUE
      ELSE FALSE
    END AS is_view_requests,
    CASE
      WHEN r.event_name IN ('availability_submitted','availability_request_submitted',
                            'demo_availability_submitted',
                            'owner_preview_check_availability_submitted') THEN TRUE
      ELSE FALSE
    END AS is_availability_submit,
    CASE
      WHEN r.source = 'manage_funnel' AND r.event_name ILIKE '%remove%' THEN TRUE
      ELSE FALSE
    END AS is_churn,
    CASE
      WHEN r.event_name ILIKE '%ledger%' OR r.event_name ILIKE '%missed%opportun%' THEN TRUE
      ELSE FALSE
    END AS is_ledger
  FROM resolved r
)
SELECT
  c.id, c.created_at,
  COALESCE(c.matched_id, c.eff_agency_id) AS agency_id,
  COALESCE(c.matched_name, c.meta_name)   AS agency_name,
  COALESCE(c.matched_slug, c.eff_slug)    AS agency_slug,
  COALESCE(c.state_slug, c.matched_state) AS state_slug,
  NULL::text                              AS state_name,
  c.event_name,
  CASE
    WHEN c.is_conversion THEN 'conversion'
    WHEN c.is_checkout THEN 'checkout'
    WHEN c.is_cta THEN 'high_intent'
    WHEN c.is_view_requests THEN 'high_intent'
    WHEN c.is_availability_submit THEN 'high_intent'
    WHEN c.is_churn THEN 'negative'
    WHEN c.is_ledger THEN 'engagement'
    WHEN c.event_name ILIKE '%activation%viewed' OR c.event_name ILIKE '%upsell%viewed'
         OR c.event_name ILIKE '%offer_page_viewed' THEN 'engagement'
    WHEN c.event_name ILIKE '%profile%view%' OR c.event_name ILIKE '%landing%'
         OR c.event_name ILIKE '%page_view%' THEN 'view'
    ELSE 'engagement'
  END AS event_group,
  CASE
    WHEN c.is_conversion THEN 'converted'
    WHEN c.is_checkout THEN 'purchase_ready'
    WHEN c.is_cta THEN 'high_intent'
    WHEN c.is_view_requests THEN 'high_intent'
    WHEN c.is_availability_submit THEN 'evaluation'
    WHEN c.is_churn THEN 'churn_risk'
    WHEN c.is_ledger THEN 'interest'
    WHEN c.event_name ILIKE '%activation%viewed' OR c.event_name ILIKE '%upsell%viewed'
         OR c.event_name ILIKE '%offer_page_viewed' THEN 'interest'
    WHEN c.event_name ILIKE '%profile%view%' OR c.event_name ILIKE '%landing%'
         OR c.event_name ILIKE '%page_view%' THEN 'discovery'
    ELSE 'discovery'
  END AS funnel_stage,
  c.funnel_step,
  c.source,
  (CASE
    WHEN c.is_conversion THEN 30
    WHEN c.is_checkout THEN 25
    WHEN c.is_cta THEN 15
    WHEN c.is_availability_submit THEN 12
    WHEN c.is_view_requests THEN 8
    WHEN c.is_ledger THEN 6
    WHEN c.is_churn THEN -10
    ELSE 1
  END)::integer AS intent_weight,
  -- Non-null readable_label
  CASE
    WHEN c.is_conversion THEN 'Converted — Listing activated (paid)'
    WHEN c.is_checkout THEN 'Purchase-ready — Reached Stripe checkout'
    WHEN c.event_name IN ('your_agency_start_receiving_cta_clicked','your_agency_activate_clicked',
                           'owner_preview_activate_listing_cta_clicked','activate_listing_clicked')
      THEN 'High intent — Signaled intent to activate (CTA clicked)'
    WHEN c.event_name IN ('owner_preview_missed_clients_cta_clicked',
                           'your_agency_view_requests_clicked',
                           'view_requests_clicked','view_matches_clicked')
      THEN 'High intent — Clicked to see missed client opportunities'
    WHEN c.is_availability_submit THEN 'Evaluation — Completed client request flow'
    WHEN c.event_name IN ('owner_preview_check_availability_opened',
                           'owner_preview_check_availability_modal_opened',
                           'step2_started')
      THEN 'Evaluation — Started client request flow'
    WHEN c.event_name IN ('owner_preview_check_availability_result_page_viewed',
                           'demo_post_availability_result_viewed')
      THEN 'Evaluation — Viewed match result (client was routed elsewhere)'
    WHEN c.is_ledger THEN 'Interest — Viewed missed client opportunities'
    WHEN c.event_name ILIKE '%activation%viewed' THEN 'Interest — Viewed activation offer'
    WHEN c.event_name ILIKE '%upsell%viewed' THEN 'Interest — Viewed upsell offer'
    WHEN c.event_name ILIKE '%offer_page_viewed' THEN 'Interest — Viewed offer page'
    WHEN c.event_name IN ('your_agency_profile_page_viewed','your_agency_page_view',
                           'your_agency_overview_viewed')
      THEN 'Discovery — Owner viewed their own agency profile'
    WHEN c.is_churn AND c.event_name ILIKE '%confirm%' THEN 'Churn risk — Owner confirmed listing removal'
    WHEN c.is_churn THEN 'Churn risk — Owner started removing their listing'
    ELSE initcap(replace(c.event_name,'_',' '))
  END AS readable_label,
  c.metadata,
  CASE
    WHEN c.is_conversion THEN 'converted'
    WHEN c.is_checkout THEN 'purchase_ready'
    WHEN c.is_cta THEN 'high_intent'
    WHEN c.is_view_requests THEN 'high_intent'
    WHEN c.is_availability_submit THEN 'evaluation'
    WHEN c.is_churn THEN 'churn_risk'
    WHEN c.is_ledger THEN 'interest'
    WHEN c.event_name ILIKE '%activation%viewed' OR c.event_name ILIKE '%upsell%viewed'
         OR c.event_name ILIKE '%offer_page_viewed' THEN 'interest'
    WHEN c.event_name ILIKE '%profile%view%' OR c.event_name ILIKE '%landing%'
         OR c.event_name ILIKE '%page_view%' THEN 'discovery'
    ELSE 'discovery'
  END AS intent_stage,
  COALESCE(c.method,'none') AS identity_method,
  COALESCE(c.confidence,
           CASE WHEN c.meta_name IS NOT NULL OR c.eff_slug IS NOT NULL THEN 'low' ELSE 'none' END) AS identity_confidence,
  CASE
    WHEN c.method IS NOT NULL THEN 'other_agencies:' || c.method
    WHEN c.meta_name IS NOT NULL THEN 'metadata:name'
    WHEN c.eff_slug IS NOT NULL THEN 'metadata:slug'
    ELSE 'unresolved'
  END AS identity_source,
  jsonb_build_object('raw_agency_id', c.agency_id, 'eff_agency_id', c.eff_agency_id,
                     'meta_name', c.meta_name, 'norm_name', c.norm_name,
                     'eff_slug', c.eff_slug, 'matched_via', c.method) AS identity_debug
FROM classified c
WHERE (p_agency_id IS NULL OR COALESCE(c.matched_id, c.eff_agency_id) = p_agency_id::text)
ORDER BY c.created_at DESC
LIMIT GREATEST(p_limit,1);
$function$;

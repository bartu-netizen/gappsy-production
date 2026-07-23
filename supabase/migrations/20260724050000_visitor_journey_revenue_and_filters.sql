/*
  # True site-wide visitor + revenue unification

  list_visitor_summaries() (20260723070000) only unioned the software-
  directory tracking tables (site_page_views, tool_page_views,
  tool_outbound_clicks, smart_search_logs, tool_chat_messages,
  vendor_onboarding_sessions) — it never covered the OTHER major product
  line on this site, the agency/state-page funnel (top25, spotlight, demo,
  availability, matched), even though that funnel already uses the exact
  same visitor_id (funnel_events.visitor_id / funnel_sessions.visitor_id are
  the same getVisitorId() persisted in localStorage as gappsy_visitor_id —
  see src/utils/funnelTracking.ts). This migration adds both funnel_events
  (page-level activity) and funnel_sessions (funnel-level rollup, which
  already carries a REAL amount_total/payment_status per session — no
  estimate needed, unlike the software side's vendor_feature_subscriptions)
  into the same visitor rollup and the same revenue figure, so "all Gappsy
  revenue, all Gappsy visitors" genuinely means all of it, not just the
  software directory.

  Also adds real filtering: country and traffic-source (the latter
  replicates classifyTrafficSource.ts's rules in SQL so it can be filtered
  on, not just displayed).

  Additive: CREATE OR REPLACE on an existing function (safe, same pattern as
  every other function migration in this repo), no column/table changes.
*/

CREATE OR REPLACE FUNCTION list_visitor_summaries(
  p_search text DEFAULT NULL,
  p_from timestamptz DEFAULT NULL,
  p_to timestamptz DEFAULT NULL,
  p_only_paid boolean DEFAULT false,
  p_country text DEFAULT NULL,
  p_traffic_source text DEFAULT NULL,
  p_limit int DEFAULT 50,
  p_offset int DEFAULT 0
)
RETURNS TABLE (
  visitor_id text,
  first_seen_at timestamptz,
  last_seen_at timestamptz,
  total_events bigint,
  reached_checkout boolean,
  paid boolean,
  utm_source text,
  utm_medium text,
  referrer text,
  country_name text,
  city text,
  revenue_cents bigint
)
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  WITH events AS (
    SELECT visitor_id, created_at,
           utm_source, utm_medium, referrer,
           country_name, city
    FROM site_page_views
    WHERE visitor_id IS NOT NULL

    UNION ALL

    SELECT visitor_id, created_at,
           utm_source, utm_medium, referrer,
           country_name, NULL::text AS city
    FROM tool_page_views
    WHERE visitor_id IS NOT NULL

    UNION ALL

    SELECT visitor_id, created_at,
           NULL::text AS utm_source, NULL::text AS utm_medium, referrer,
           country_name, NULL::text AS city
    FROM tool_outbound_clicks
    WHERE visitor_id IS NOT NULL

    UNION ALL

    SELECT visitor_id, created_at,
           NULL::text AS utm_source, NULL::text AS utm_medium, NULL::text AS referrer,
           country_name, city
    FROM smart_search_logs
    WHERE visitor_id IS NOT NULL

    UNION ALL

    SELECT visitor_id, created_at,
           NULL::text AS utm_source, NULL::text AS utm_medium, NULL::text AS referrer,
           NULL::text AS country_name, NULL::text AS city
    FROM tool_chat_messages
    WHERE visitor_id IS NOT NULL

    UNION ALL

    SELECT visitor_id, created_at,
           utm_source, utm_medium, referrer,
           NULL::text AS country_name, NULL::text AS city
    FROM vendor_onboarding_sessions
    WHERE visitor_id IS NOT NULL

    UNION ALL

    -- Agency/state-page funnel (top25, spotlight, demo, availability,
    -- matched) — no utm/geo columns of its own, just visitor_id/referrer.
    SELECT visitor_id, created_at,
           NULL::text AS utm_source, NULL::text AS utm_medium, referrer,
           NULL::text AS country_name, NULL::text AS city
    FROM funnel_events
    WHERE visitor_id IS NOT NULL
  ),
  agg AS (
    SELECT
      visitor_id,
      MIN(created_at) AS first_seen_at,
      MAX(created_at) AS last_seen_at,
      COUNT(*) AS total_events
    FROM events
    GROUP BY visitor_id
  ),
  latest_meta AS (
    SELECT DISTINCT ON (visitor_id)
      visitor_id, utm_source, utm_medium, referrer
    FROM events
    WHERE utm_source IS NOT NULL OR utm_medium IS NOT NULL OR referrer IS NOT NULL
    ORDER BY visitor_id, created_at DESC
  ),
  latest_geo AS (
    SELECT DISTINCT ON (visitor_id)
      visitor_id, country_name, city
    FROM events
    WHERE country_name IS NOT NULL OR city IS NOT NULL
    ORDER BY visitor_id, created_at DESC
  ),
  checkout_reached AS (
    SELECT DISTINCT visitor_id
    FROM vendor_onboarding_sessions
    WHERE visitor_id IS NOT NULL
      AND status IN ('checkout_pending', 'checkout_completed', 'verified')

    UNION

    SELECT DISTINCT visitor_id
    FROM funnel_sessions
    WHERE visitor_id IS NOT NULL AND checkout_session_id IS NOT NULL
  ),
  paid_visitors AS (
    SELECT DISTINCT vos.visitor_id
    FROM vendor_feature_subscriptions vfs
    JOIN vendor_onboarding_sessions vos ON vos.id = vfs.onboarding_session_id
    WHERE vfs.status = 'active' AND vos.visitor_id IS NOT NULL

    UNION

    SELECT DISTINCT visitor_id
    FROM funnel_sessions
    WHERE visitor_id IS NOT NULL AND payment_status = 'paid'
  ),
  -- Software side: display-only estimate (same consts used everywhere else —
  -- vendor-onboarding, admin-vendor-monetization). Agency side: funnel_sessions
  -- already carries the REAL Stripe amount_total, no estimate needed.
  revenue AS (
    SELECT
      vos.visitor_id,
      SUM(
        CASE
          WHEN vfs.product = 'claim' THEN 2900
          WHEN vfs.product = 'growth' AND vfs.billing_interval = 'year' THEN 69900
          WHEN vfs.product = 'growth' THEN 8900
          ELSE 0
        END
      ) AS revenue_cents
    FROM vendor_feature_subscriptions vfs
    JOIN vendor_onboarding_sessions vos ON vos.id = vfs.onboarding_session_id
    WHERE vfs.status = 'active' AND vos.visitor_id IS NOT NULL
    GROUP BY vos.visitor_id

    UNION ALL

    SELECT
      visitor_id,
      COALESCE(SUM(amount_total), 0) AS revenue_cents
    FROM funnel_sessions
    WHERE visitor_id IS NOT NULL AND payment_status = 'paid'
    GROUP BY visitor_id
  ),
  revenue_by_visitor AS (
    SELECT visitor_id, SUM(revenue_cents) AS revenue_cents
    FROM revenue
    GROUP BY visitor_id
  ),
  matched_by_email AS (
    -- p_search may match a contact_email/lead_email captured on that
    -- visitor's session(s), not just their visitor_id itself.
    SELECT DISTINCT visitor_id
    FROM vendor_onboarding_sessions
    WHERE visitor_id IS NOT NULL
      AND p_search IS NOT NULL AND p_search <> ''
      AND contact_email ILIKE '%' || p_search || '%'

    UNION

    SELECT DISTINCT visitor_id
    FROM funnel_sessions
    WHERE visitor_id IS NOT NULL
      AND p_search IS NOT NULL AND p_search <> ''
      AND lead_email ILIKE '%' || p_search || '%'
  )
  SELECT
    a.visitor_id,
    a.first_seen_at,
    a.last_seen_at,
    a.total_events,
    (cr.visitor_id IS NOT NULL) AS reached_checkout,
    (pv.visitor_id IS NOT NULL) AS paid,
    lm.utm_source,
    lm.utm_medium,
    lm.referrer,
    lg.country_name,
    lg.city,
    COALESCE(rbv.revenue_cents, 0) AS revenue_cents
  FROM agg a
  LEFT JOIN latest_meta lm ON lm.visitor_id = a.visitor_id
  LEFT JOIN latest_geo lg ON lg.visitor_id = a.visitor_id
  LEFT JOIN checkout_reached cr ON cr.visitor_id = a.visitor_id
  LEFT JOIN paid_visitors pv ON pv.visitor_id = a.visitor_id
  LEFT JOIN revenue_by_visitor rbv ON rbv.visitor_id = a.visitor_id
  WHERE
    (
      p_search IS NULL OR p_search = ''
      OR a.visitor_id ILIKE '%' || p_search || '%'
      OR a.visitor_id IN (SELECT visitor_id FROM matched_by_email)
    )
    AND (p_from IS NULL OR a.last_seen_at >= p_from)
    AND (p_to IS NULL OR a.last_seen_at <= p_to)
    AND (p_only_paid IS NOT TRUE OR pv.visitor_id IS NOT NULL)
    AND (p_country IS NULL OR p_country = '' OR lg.country_name = p_country)
    AND (
      p_traffic_source IS NULL OR p_traffic_source = ''
      OR (
        CASE
          WHEN lm.utm_source ILIKE 'google' THEN 'Google'
          WHEN lm.utm_source ILIKE 'youtube' THEN 'YouTube'
          WHEN lm.utm_source ILIKE 'tiktok' THEN 'TikTok'
          WHEN lm.utm_source ILIKE ANY (ARRAY['instagram', 'ig']) THEN 'Instagram'
          WHEN lm.utm_source ILIKE ANY (ARRAY['facebook', 'fb']) THEN 'Facebook'
          WHEN lm.utm_source ILIKE ANY (ARRAY['email', 'newsletter']) THEN 'Email'
          WHEN lm.utm_source IS NOT NULL THEN INITCAP(lm.utm_source)
          WHEN lm.referrer ILIKE '%google.%' THEN 'Google'
          WHEN lm.referrer ILIKE '%youtube.com%' THEN 'YouTube'
          WHEN lm.referrer ILIKE '%tiktok.com%' THEN 'TikTok'
          WHEN lm.referrer ILIKE '%instagram.com%' THEN 'Instagram'
          WHEN lm.referrer ILIKE '%facebook.com%' THEN 'Facebook'
          WHEN lm.referrer ILIKE ANY (ARRAY['%t.co%', '%twitter.com%', '%x.com%']) THEN 'Twitter / X'
          ELSE 'Direct / Unknown'
        END
      ) = p_traffic_source
    )
  ORDER BY a.last_seen_at DESC
  LIMIT p_limit OFFSET p_offset;
$$;

GRANT EXECUTE ON FUNCTION list_visitor_summaries(text, timestamptz, timestamptz, boolean, text, text, int, int) TO service_role;

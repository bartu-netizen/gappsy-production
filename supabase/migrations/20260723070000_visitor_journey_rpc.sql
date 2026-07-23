/*
  Aggregation RPC for the /wp-admin visitor-journey dashboard (admin-visitor-
  journey edge function). Same rationale as get_tool_analytics_summary()
  (20260716030000): PostgREST can't express a cross-table GROUP BY through
  the JS query builder, so the per-visitor rollup (first/last seen, total
  event count, paid/checkout status, most recent traffic-source + geo) is
  done here in one query instead of pulling every raw row into the edge
  function to reduce in JS.

  Sources unioned (all six tables that got a shared `visitor_id text` column
  in 20260723060000_unified_visitor_tracking.sql): site_page_views,
  tool_page_views, tool_outbound_clicks, smart_search_logs,
  tool_chat_messages, vendor_onboarding_sessions.

  "Paid" is deliberately NOT the same as "reached checkout" — a visitor can
  open Stripe Checkout (vendor_onboarding_sessions.status in
  checkout_pending/checkout_completed/verified) and never actually pay.
  Real payment is only ever vendor_feature_subscriptions.status = 'active',
  joined back to a visitor via its onboarding_session_id.

  Same SECURITY DEFINER + service_role-only grant pattern as the other admin
  aggregation RPCs (get_tool_analytics_summary, search_tools_admin_rpc,
  editorial_metrics_rpcs).
*/

CREATE OR REPLACE FUNCTION list_visitor_summaries(
  p_search text DEFAULT NULL,
  p_from timestamptz DEFAULT NULL,
  p_to timestamptz DEFAULT NULL,
  p_only_paid boolean DEFAULT false,
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
  city text
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
    -- Most recent non-null utm_source/utm_medium/referrer per visitor,
    -- across all six sources.
    SELECT DISTINCT ON (visitor_id)
      visitor_id, utm_source, utm_medium, referrer
    FROM events
    WHERE utm_source IS NOT NULL OR utm_medium IS NOT NULL OR referrer IS NOT NULL
    ORDER BY visitor_id, created_at DESC
  ),
  latest_geo AS (
    -- Most recent non-null country_name/city per visitor.
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
  ),
  paid_visitors AS (
    SELECT DISTINCT vos.visitor_id
    FROM vendor_feature_subscriptions vfs
    JOIN vendor_onboarding_sessions vos ON vos.id = vfs.onboarding_session_id
    WHERE vfs.status = 'active' AND vos.visitor_id IS NOT NULL
  ),
  matched_by_email AS (
    -- p_search may match a contact_email captured on that visitor's
    -- funnel session(s), not just their visitor_id itself.
    SELECT DISTINCT visitor_id
    FROM vendor_onboarding_sessions
    WHERE visitor_id IS NOT NULL
      AND p_search IS NOT NULL AND p_search <> ''
      AND contact_email ILIKE '%' || p_search || '%'
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
    lg.city
  FROM agg a
  LEFT JOIN latest_meta lm ON lm.visitor_id = a.visitor_id
  LEFT JOIN latest_geo lg ON lg.visitor_id = a.visitor_id
  LEFT JOIN checkout_reached cr ON cr.visitor_id = a.visitor_id
  LEFT JOIN paid_visitors pv ON pv.visitor_id = a.visitor_id
  WHERE
    (
      p_search IS NULL OR p_search = ''
      OR a.visitor_id ILIKE '%' || p_search || '%'
      OR a.visitor_id IN (SELECT visitor_id FROM matched_by_email)
    )
    AND (p_from IS NULL OR a.last_seen_at >= p_from)
    AND (p_to IS NULL OR a.last_seen_at <= p_to)
    AND (p_only_paid IS NOT TRUE OR pv.visitor_id IS NOT NULL)
  ORDER BY a.last_seen_at DESC
  LIMIT p_limit OFFSET p_offset;
$$;

GRANT EXECUTE ON FUNCTION list_visitor_summaries(text, timestamptz, timestamptz, boolean, int, int) TO service_role;

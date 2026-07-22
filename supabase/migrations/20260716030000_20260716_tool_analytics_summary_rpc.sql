/*
  Aggregation RPC for the /wp-admin tool-analytics dashboard — PostgREST
  can't express GROUP BY through the JS query builder, so this does the
  per-tool view/click totals (all-time, last 7d, last 30d) in one query
  instead of pulling every raw event row into the edge function to sum in
  JS. Same SECURITY DEFINER + service_role-only grant pattern as the other
  admin aggregation RPCs in this repo (search_tools_admin_rpc,
  editorial_metrics_rpcs). Only returns tools with at least one recorded
  event — a wall of zero-activity tools isn't useful in a summary table.
*/

CREATE OR REPLACE FUNCTION get_tool_analytics_summary()
RETURNS TABLE (
  tool_id uuid,
  views_total bigint,
  views_7d bigint,
  views_30d bigint,
  clicks_total bigint,
  clicks_7d bigint,
  clicks_30d bigint
)
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    t.id AS tool_id,
    COALESCE(v.total, 0) AS views_total,
    COALESCE(v.d7, 0) AS views_7d,
    COALESCE(v.d30, 0) AS views_30d,
    COALESCE(c.total, 0) AS clicks_total,
    COALESCE(c.d7, 0) AS clicks_7d,
    COALESCE(c.d30, 0) AS clicks_30d
  FROM tools t
  LEFT JOIN (
    SELECT
      tool_id,
      count(*) AS total,
      count(*) FILTER (WHERE created_at > now() - interval '7 days') AS d7,
      count(*) FILTER (WHERE created_at > now() - interval '30 days') AS d30
    FROM tool_page_views
    GROUP BY tool_id
  ) v ON v.tool_id = t.id
  LEFT JOIN (
    SELECT
      tool_id,
      count(*) AS total,
      count(*) FILTER (WHERE created_at > now() - interval '7 days') AS d7,
      count(*) FILTER (WHERE created_at > now() - interval '30 days') AS d30
    FROM tool_outbound_clicks
    GROUP BY tool_id
  ) c ON c.tool_id = t.id
  WHERE v.total IS NOT NULL OR c.total IS NOT NULL
  ORDER BY COALESCE(v.total, 0) + COALESCE(c.total, 0) DESC;
$$;

GRANT EXECUTE ON FUNCTION get_tool_analytics_summary() TO service_role;

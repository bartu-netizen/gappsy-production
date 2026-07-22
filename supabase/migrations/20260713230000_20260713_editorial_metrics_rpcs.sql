/*
  # Editor Metrics — day-bucketed aggregation RPCs

  PostgREST's query builder can't GROUP BY a date_trunc'd column or bucket
  a numeric range directly, so these two small RPCs back the Editor
  Metrics dashboard: reviews/day (from the existing admin_audit_log — no
  new events table) and a completeness-score histogram (from the cached
  tools.completeness_percent column populated by the completeness_rescan
  scheduler job).
*/

CREATE OR REPLACE FUNCTION editorial_reviews_per_day(days_back integer DEFAULT 14)
RETURNS TABLE(day date, review_count bigint, avg_duration_ms numeric)
LANGUAGE sql
STABLE
AS $$
  SELECT
    date_trunc('day', created_at)::date AS day,
    count(*) AS review_count,
    avg(duration_ms) FILTER (WHERE duration_ms IS NOT NULL) AS avg_duration_ms
  FROM admin_audit_log
  WHERE target_table IN ('tools', 'crawl_jobs', 'discovered_tools', 'enrichment_field_suggestions', 'enrichment_jobs')
    AND created_at >= now() - (days_back || ' days')::interval
  GROUP BY 1
  ORDER BY 1 ASC;
$$;

CREATE OR REPLACE FUNCTION editorial_completeness_distribution()
RETURNS TABLE(bucket text, tool_count bigint)
LANGUAGE sql
STABLE
AS $$
  SELECT
    CASE
      WHEN completeness_percent IS NULL THEN 'unscored'
      WHEN completeness_percent < 26 THEN '0-25'
      WHEN completeness_percent < 51 THEN '26-50'
      WHEN completeness_percent < 76 THEN '51-75'
      ELSE '76-100'
    END AS bucket,
    count(*) AS tool_count
  FROM tools
  GROUP BY 1;
$$;

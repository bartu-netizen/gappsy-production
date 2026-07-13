/*
  # Change detection — "what's due" selector RPCs

  Additive. Two read-only SQL functions that pick the next bounded batch of
  (tool, page_type) checks for the scheduler jobs in
  _shared/schedulerRegistry.ts (change_detection_scan, stale_source_retry)
  to process. Written as SQL functions rather than assembled in JS because
  the "existing stale rows due for recheck" UNION "brand-new tool/page_type
  pairs with no fingerprint row yet" logic needs a real anti-join
  (tool_page_fingerprints IS NULL), which the Supabase JS client can't
  express — matches the existing codebase pattern of RPCs for bounded work
  selection (claim_crawl_jobs, claim_scheduled_jobs), except these are
  plain SELECTs (no FOR UPDATE SKIP LOCKED / row claiming) since a stale
  candidate simply won't be "due" again until its last_checked_at is
  bumped by the caller after processing it.

  select_due_change_checks: the normal cadence — existing rows whose
  last_checked_at has passed p_check_interval_hours (ordered oldest-first
  so a slow period never starves anything), topped up with brand-new
  tool/page_type pairs that don't have a fingerprint row yet (first
  snapshot). Excludes page types disabled in change_detection_rules and
  rows already backed off (consecutive_failures at/above threshold —
  those are select_stale_change_checks' job instead, on a slower cadence).

  select_stale_change_checks: the backed-off set — rows that hit
  max_consecutive_failures_before_backoff, retried only every
  p_backoff_hours (default 7 days) instead of the normal cadence, so a
  dead source doesn't keep consuming every scan's batch budget forever.

  Both resolve a best-effort pricing page URL from the tool's most recent
  crawl_jobs.normalized_extraction (see crawlExtractionAdapter.ts) via a
  correlated subquery; changeDetectionRunner.ts falls back to a
  conventional `${website}/pricing` guess when this is null.
*/

CREATE OR REPLACE FUNCTION select_due_change_checks(
  p_batch_size integer,
  p_check_interval_hours integer DEFAULT 24
)
RETURNS TABLE (
  tool_id uuid,
  website text,
  page_type text,
  pricing_page_url text,
  is_first_snapshot boolean,
  previous_content_fingerprint text,
  previous_extracted_fingerprint jsonb
)
LANGUAGE sql
STABLE
AS $$
  WITH enabled_types AS (
    SELECT page_type, max_consecutive_failures_before_backoff
    FROM change_detection_rules
    WHERE enabled = true
  ),
  stale AS (
    SELECT
      f.tool_id,
      t.website,
      f.page_type,
      (SELECT cj.normalized_extraction -> 'pricing' -> 'pricing_page_url' ->> 'value'
         FROM crawl_jobs cj WHERE cj.created_draft_tool_id = t.id
         ORDER BY cj.completed_at DESC NULLS LAST LIMIT 1) AS pricing_page_url,
      false AS is_first_snapshot,
      f.content_fingerprint AS previous_content_fingerprint,
      f.extracted_fingerprint AS previous_extracted_fingerprint,
      f.last_checked_at AS due_order
    FROM tool_page_fingerprints f
    JOIN enabled_types e ON e.page_type = f.page_type
    JOIN tools t ON t.id = f.tool_id
    WHERE t.status = 'published' AND t.website IS NOT NULL
      AND f.last_checked_at < now() - (p_check_interval_hours || ' hours')::interval
      AND f.consecutive_failures < e.max_consecutive_failures_before_backoff
  ),
  fresh AS (
    SELECT
      t.id AS tool_id,
      t.website,
      e.page_type,
      (SELECT cj.normalized_extraction -> 'pricing' -> 'pricing_page_url' ->> 'value'
         FROM crawl_jobs cj WHERE cj.created_draft_tool_id = t.id
         ORDER BY cj.completed_at DESC NULLS LAST LIMIT 1) AS pricing_page_url,
      true AS is_first_snapshot,
      NULL::text AS previous_content_fingerprint,
      NULL::jsonb AS previous_extracted_fingerprint,
      t.created_at AS due_order
    FROM tools t
    CROSS JOIN enabled_types e
    LEFT JOIN tool_page_fingerprints f ON f.tool_id = t.id AND f.page_type = e.page_type
    WHERE t.status = 'published' AND t.website IS NOT NULL AND f.id IS NULL
  )
  SELECT tool_id, website, page_type, pricing_page_url, is_first_snapshot, previous_content_fingerprint, previous_extracted_fingerprint
  FROM (SELECT * FROM stale UNION ALL SELECT * FROM fresh) combined
  ORDER BY due_order ASC
  LIMIT p_batch_size;
$$;

CREATE OR REPLACE FUNCTION select_stale_change_checks(
  p_batch_size integer,
  p_backoff_hours integer DEFAULT 168
)
RETURNS TABLE (
  tool_id uuid,
  website text,
  page_type text,
  pricing_page_url text,
  previous_content_fingerprint text,
  previous_extracted_fingerprint jsonb,
  consecutive_failures integer
)
LANGUAGE sql
STABLE
AS $$
  SELECT
    f.tool_id,
    t.website,
    f.page_type,
    (SELECT cj.normalized_extraction -> 'pricing' -> 'pricing_page_url' ->> 'value'
       FROM crawl_jobs cj WHERE cj.created_draft_tool_id = t.id
       ORDER BY cj.completed_at DESC NULLS LAST LIMIT 1) AS pricing_page_url,
    f.content_fingerprint AS previous_content_fingerprint,
    f.extracted_fingerprint AS previous_extracted_fingerprint,
    f.consecutive_failures
  FROM tool_page_fingerprints f
  JOIN change_detection_rules e ON e.page_type = f.page_type AND e.enabled = true
  JOIN tools t ON t.id = f.tool_id AND t.status = 'published' AND t.website IS NOT NULL
  WHERE f.consecutive_failures >= e.max_consecutive_failures_before_backoff
    AND f.last_checked_at < now() - (p_backoff_hours || ' hours')::interval
  ORDER BY f.last_checked_at ASC
  LIMIT p_batch_size;
$$;

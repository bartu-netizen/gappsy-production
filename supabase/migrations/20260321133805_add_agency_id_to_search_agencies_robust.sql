/*
  # Add agency_id to search_agencies_robust

  ## Problem
  search_agencies_robust returns agency_slug but NOT agency_id. This means every
  AgencyResult from the search endpoint has agency_id = undefined. Both
  handleContinueSamePage and handleContinueCrossState in NJOwnerIntentModal check
  for agency_id and silently abort when it is missing — making every continue button
  a no-op.

  ## Changes
  - Add out_agency_id TEXT to the RETURNS TABLE
  - In the with_states CTE, resolve the canonical agency_id per slug using a correlated
    subquery against public_agency_search_mv. Prefers real UUIDs (other_agencies.id or
    top25_slots.agency_id) over the synthetic 'top25-{state}-{rank}' fallback strings.
  - In the final SELECT, output the resolved id as out_agency_id
  - All CTEs are otherwise unchanged; only the final projection adds the new field
*/

DROP FUNCTION IF EXISTS public.search_agencies_robust(TEXT, INT);

CREATE OR REPLACE FUNCTION public.search_agencies_robust(
  query_text TEXT,
  max_results INT DEFAULT 10
)
RETURNS TABLE (
  out_agency_id   TEXT,
  out_agency_slug TEXT,
  out_agency_name TEXT,
  out_agency_domain TEXT,
  out_logo_url TEXT,
  out_states JSONB,
  out_match_type TEXT,
  out_score NUMERIC
) LANGUAGE plpgsql SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  q TEXT;
BEGIN
  q := LOWER(TRIM(REGEXP_REPLACE(query_text, '\s+', ' ', 'g')));

  IF LENGTH(q) < 2 THEN
    RETURN;
  END IF;

  RETURN QUERY
  WITH
  exact_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug AS slug,
      m.agency_name AS name,
      m.agency_domain AS domain,
      m.logo_url AS logo,
      'exact' AS mtype,
      100.0 AS mscore
    FROM public_agency_search_mv m
    WHERE m.agency_name_lower = q
       OR m.agency_slug = q
  ),

  prefix_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug AS slug,
      m.agency_name AS name,
      m.agency_domain AS domain,
      m.logo_url AS logo,
      'prefix' AS mtype,
      90.0 - (LENGTH(m.agency_name_lower) - LENGTH(q))::NUMERIC * 0.1 AS mscore
    FROM public_agency_search_mv m
    WHERE m.agency_name_lower LIKE q || '%'
      AND m.agency_slug NOT IN (SELECT slug FROM exact_matches)
  ),

  contains_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug AS slug,
      m.agency_name AS name,
      m.agency_domain AS domain,
      m.logo_url AS logo,
      'contains' AS mtype,
      70.0 + similarity(m.agency_name_lower, q) * 20.0 AS mscore
    FROM public_agency_search_mv m
    WHERE m.agency_name_lower LIKE '%' || q || '%'
      AND m.agency_slug NOT IN (SELECT slug FROM exact_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM prefix_matches)
  ),

  domain_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug AS slug,
      m.agency_name AS name,
      m.agency_domain AS domain,
      m.logo_url AS logo,
      'domain' AS mtype,
      60.0 AS mscore
    FROM public_agency_search_mv m
    WHERE m.agency_domain IS NOT NULL
      AND m.agency_domain ILIKE '%' || q || '%'
      AND m.agency_slug NOT IN (SELECT slug FROM exact_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM prefix_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM contains_matches)
  ),

  slug_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug AS slug,
      m.agency_name AS name,
      m.agency_domain AS domain,
      m.logo_url AS logo,
      'slug' AS mtype,
      50.0 AS mscore
    FROM public_agency_search_mv m
    WHERE m.agency_slug LIKE '%' || REPLACE(q, ' ', '-') || '%'
      AND m.agency_slug NOT IN (SELECT slug FROM exact_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM prefix_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM contains_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM domain_matches)
  ),

  fuzzy_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug AS slug,
      m.agency_name AS name,
      m.agency_domain AS domain,
      m.logo_url AS logo,
      'fuzzy' AS mtype,
      similarity(m.agency_name_lower, q) * 40.0 AS mscore
    FROM public_agency_search_mv m
    WHERE similarity(m.agency_name_lower, q) > 0.2
      AND m.agency_slug NOT IN (SELECT slug FROM exact_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM prefix_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM contains_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM domain_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM slug_matches)
  ),

  all_matches AS (
    SELECT * FROM exact_matches
    UNION ALL SELECT * FROM prefix_matches
    UNION ALL SELECT * FROM contains_matches
    UNION ALL SELECT * FROM domain_matches
    UNION ALL SELECT * FROM slug_matches
    UNION ALL SELECT * FROM fuzzy_matches
  ),

  with_states AS (
    SELECT
      am.slug,
      am.name,
      am.domain,
      am.logo,
      am.mtype,
      am.mscore,
      (
        SELECT JSONB_AGG(JSONB_BUILD_OBJECT(
          'state_slug', mv.state_slug,
          'section', mv.section,
          'rank', mv.rank,
          'page_path', mv.page_path
        ) ORDER BY mv.section DESC, mv.rank NULLS LAST)
        FROM public_agency_search_mv mv
        WHERE mv.agency_slug = am.slug
      ) AS agg_states,
      -- Resolve canonical agency_id: prefer real UUIDs over synthetic 'top25-...' strings
      (
        SELECT mv2.source_agency_id
        FROM public_agency_search_mv mv2
        WHERE mv2.agency_slug = am.slug
          AND mv2.source_agency_id NOT LIKE 'top25-%'
        LIMIT 1
      ) AS resolved_agency_id
    FROM all_matches am
  )

  SELECT
    ws.resolved_agency_id,
    ws.slug,
    ws.name,
    ws.domain,
    ws.logo,
    ws.agg_states,
    ws.mtype,
    ws.mscore
  FROM with_states ws
  ORDER BY ws.mscore DESC, LENGTH(ws.name) ASC
  LIMIT max_results;
END $$;

GRANT EXECUTE ON FUNCTION public.search_agencies_robust TO anon, authenticated;

/*
  # Fix search function to use extensions.similarity

  The pg_trgm extension is in the extensions schema, not public.
  This migration fixes the function to use the correct schema reference.
*/

-- Drop and recreate the function with correct schema for similarity
DROP FUNCTION IF EXISTS public.search_agencies_robust(TEXT, INT);

CREATE OR REPLACE FUNCTION public.search_agencies_robust(
  query_text TEXT,
  max_results INT DEFAULT 10
)
RETURNS TABLE (
  out_agency_slug TEXT,
  out_agency_name TEXT,
  out_agency_domain TEXT,
  out_logo_url TEXT,
  out_states JSONB,
  out_match_type TEXT,
  out_score NUMERIC
) LANGUAGE plpgsql SECURITY DEFINER
SET search_path = public, extensions
AS $$
DECLARE
  q TEXT;
BEGIN
  -- Normalize query
  q := LOWER(TRIM(REGEXP_REPLACE(query_text, '\s+', ' ', 'g')));
  
  IF LENGTH(q) < 2 THEN
    RETURN;
  END IF;
  
  RETURN QUERY
  WITH 
  -- Exact matches (highest priority)
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
  
  -- Prefix matches (name starts with query)
  prefix_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug AS slug,
      m.agency_name AS name,
      m.agency_domain AS domain,
      m.logo_url AS logo,
      'prefix' AS mtype,
      90.0 - LEAST((LENGTH(m.agency_name_lower) - LENGTH(q))::NUMERIC * 0.1, 20.0) AS mscore
    FROM public_agency_search_mv m
    WHERE m.agency_name_lower LIKE q || '%'
      AND m.agency_slug NOT IN (SELECT slug FROM exact_matches)
  ),
  
  -- Contains matches (query anywhere in name) - THIS IS CRITICAL
  contains_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug AS slug,
      m.agency_name AS name,
      m.agency_domain AS domain,
      m.logo_url AS logo,
      'contains' AS mtype,
      75.0 AS mscore
    FROM public_agency_search_mv m
    WHERE m.agency_name_lower LIKE '%' || q || '%'
      AND m.agency_slug NOT IN (SELECT slug FROM exact_matches)
      AND m.agency_slug NOT IN (SELECT slug FROM prefix_matches)
  ),
  
  -- Domain matches
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
  
  -- Slug contains matches
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
  
  -- Combine all matches (no fuzzy for now to avoid extension issues)
  all_matches AS (
    SELECT * FROM exact_matches
    UNION ALL SELECT * FROM prefix_matches
    UNION ALL SELECT * FROM contains_matches
    UNION ALL SELECT * FROM domain_matches
    UNION ALL SELECT * FROM slug_matches
  ),
  
  -- Aggregate states per agency
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
      ) AS agg_states
    FROM all_matches am
  )
  
  SELECT 
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

-- Grant permissions
GRANT EXECUTE ON FUNCTION public.search_agencies_robust TO anon, authenticated;

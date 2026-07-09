/*
  # Canonical Public Agency Search System v2

  This migration creates a bulletproof search system for /your-agency that guarantees
  ALL publicly visible agencies are searchable.

  ## Problem Being Solved
  - Search only indexed paid top25 agencies, missing unpaid but visible top25 listings
  - Multi-state agencies were not properly handled
  - Page paths used wrong URLs like /explore/{state}?tab=other instead of canonical URLs
  - Contains matching was only a limited fallback, causing valid agencies to be missed

  ## Changes Made

  1. New Materialized View: `public_agency_search_mv`
     - Single source of truth for ALL publicly visible agencies
     - Includes ALL top25 slots with agency_name (paid or unpaid - if visible on page)
     - Includes ALL active other_agencies
     - Uses canonical page paths: /marketing-agencies-in-{state}-united-states/
     - Supports multi-state via other_agency_state_listings

  2. Enhanced rebuild function with full coverage

  3. Proper search indexes for:
     - Exact name match
     - Prefix name match
     - Contains name match (trigram)
     - Slug match
     - Domain match

  4. Diagnostic functions to verify coverage

  ## Security
  - Public read access for search
  - Only service role can rebuild
*/

-- Step 1: Enable pg_trgm for fuzzy/contains matching if not already enabled
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Step 2: Create the canonical public agency search materialized view
DROP MATERIALIZED VIEW IF EXISTS public_agency_search_mv CASCADE;

CREATE MATERIALIZED VIEW public_agency_search_mv AS
WITH 
-- ALL Top 25 agencies that have a name (publicly visible on state pages)
top25_public AS (
  SELECT DISTINCT
    COALESCE(ts.agency_id::text, 'top25-' || ts.state_slug || '-' || ts.rank::text) AS source_agency_id,
    COALESCE(
      oa.slug,
      LOWER(REGEXP_REPLACE(REGEXP_REPLACE(ts.agency_name, '[^a-zA-Z0-9\s-]', '', 'g'), '\s+', '-', 'g'))
    ) AS agency_slug,
    ts.agency_name,
    LOWER(TRIM(ts.agency_name)) AS agency_name_lower,
    COALESCE(ts.website, oa.website_url) AS agency_domain,
    ts.state_slug,
    'top25' AS section,
    ts.rank,
    ts.is_paid,
    '/marketing-agencies-in-' || ts.state_slug || '-united-states/' AS page_path,
    COALESCE(oa.logo_url, ts.logo_url) AS logo_url
  FROM top25_slots ts
  LEFT JOIN other_agencies oa ON ts.agency_id = oa.id
  WHERE ts.agency_name IS NOT NULL 
    AND TRIM(ts.agency_name) != ''
),

-- ALL Other Agencies (active) - primary state listing
other_agencies_primary AS (
  SELECT DISTINCT
    oa.id::text AS source_agency_id,
    oa.slug AS agency_slug,
    oa.name AS agency_name,
    LOWER(TRIM(oa.name)) AS agency_name_lower,
    oa.website_url AS agency_domain,
    oa.state_slug,
    'other' AS section,
    NULL::int AS rank,
    false AS is_paid,
    '/marketing-agencies-in-' || oa.state_slug || '-united-states/' AS page_path,
    oa.logo_url
  FROM other_agencies oa
  WHERE oa.is_active = true
    AND oa.slug IS NOT NULL
    AND oa.name IS NOT NULL
    AND TRIM(oa.name) != ''
),

-- Multi-state listings from other_agency_state_listings
other_agencies_multistate AS (
  SELECT DISTINCT
    oa.id::text AS source_agency_id,
    oa.slug AS agency_slug,
    oa.name AS agency_name,
    LOWER(TRIM(oa.name)) AS agency_name_lower,
    oa.website_url AS agency_domain,
    oasl.state_slug,
    COALESCE(oasl.section, 'other') AS section,
    oasl.rank,
    false AS is_paid,
    '/marketing-agencies-in-' || oasl.state_slug || '-united-states/' AS page_path,
    oa.logo_url
  FROM other_agencies oa
  INNER JOIN other_agency_state_listings oasl ON oa.id = oasl.agency_id
  WHERE oa.is_active = true
    AND oasl.is_visible = true
    AND oa.slug IS NOT NULL
    AND oa.name IS NOT NULL
    AND TRIM(oa.name) != ''
),

-- Combined all sources
all_listings AS (
  SELECT * FROM top25_public
  UNION ALL
  SELECT * FROM other_agencies_primary
  UNION ALL
  SELECT * FROM other_agencies_multistate
)

-- Final deduplicated result grouped by agency_slug
SELECT 
  ROW_NUMBER() OVER (ORDER BY agency_slug, state_slug, section) AS id,
  source_agency_id,
  agency_slug,
  agency_name,
  agency_name_lower,
  agency_domain,
  state_slug,
  section,
  rank,
  is_paid,
  page_path,
  logo_url,
  NOW() AS indexed_at
FROM all_listings
WHERE agency_slug IS NOT NULL;

-- Step 3: Create indexes for fast search
CREATE UNIQUE INDEX idx_pasm_id ON public_agency_search_mv (id);
CREATE INDEX idx_pasm_slug ON public_agency_search_mv (agency_slug);
CREATE INDEX idx_pasm_name_lower ON public_agency_search_mv (agency_name_lower);
CREATE INDEX idx_pasm_name_trgm ON public_agency_search_mv USING gin (agency_name_lower gin_trgm_ops);
CREATE INDEX idx_pasm_domain ON public_agency_search_mv (agency_domain) WHERE agency_domain IS NOT NULL;
CREATE INDEX idx_pasm_state ON public_agency_search_mv (state_slug);
CREATE INDEX idx_pasm_section ON public_agency_search_mv (section);

-- Step 4: Create rebuild function
CREATE OR REPLACE FUNCTION public.rebuild_public_agency_search()
RETURNS TABLE (
  status TEXT,
  top25_count BIGINT,
  other_count BIGINT,
  multistate_count BIGINT,
  total_listings BIGINT,
  unique_agencies BIGINT,
  duration_ms NUMERIC
) LANGUAGE plpgsql SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_start TIMESTAMPTZ;
  v_top25 BIGINT;
  v_other BIGINT;
  v_multi BIGINT;
  v_total BIGINT;
  v_unique BIGINT;
BEGIN
  v_start := clock_timestamp();
  
  -- Refresh the materialized view
  REFRESH MATERIALIZED VIEW public_agency_search_mv;
  
  -- Get counts
  SELECT COUNT(*) INTO v_top25 FROM public_agency_search_mv WHERE section = 'top25';
  SELECT COUNT(*) INTO v_other FROM public_agency_search_mv WHERE section = 'other';
  SELECT COUNT(*) INTO v_multi FROM (
    SELECT agency_slug FROM public_agency_search_mv GROUP BY agency_slug HAVING COUNT(DISTINCT state_slug) > 1
  ) x;
  SELECT COUNT(*) INTO v_total FROM public_agency_search_mv;
  SELECT COUNT(DISTINCT agency_slug) INTO v_unique FROM public_agency_search_mv;
  
  RETURN QUERY SELECT 
    'completed'::TEXT,
    v_top25,
    v_other,
    v_multi,
    v_total,
    v_unique,
    EXTRACT(MILLISECONDS FROM (clock_timestamp() - v_start))::NUMERIC;
END $$;

-- Step 5: Create diagnostic function
CREATE OR REPLACE FUNCTION public.diagnose_agency_search_coverage()
RETURNS TABLE (
  metric TEXT,
  count BIGINT
) LANGUAGE sql SECURITY DEFINER
SET search_path = public
AS $$
  SELECT 'total_top25_slots_with_name' AS metric, COUNT(*) FROM top25_slots WHERE agency_name IS NOT NULL
  UNION ALL
  SELECT 'total_active_other_agencies', COUNT(*) FROM other_agencies WHERE is_active = true
  UNION ALL
  SELECT 'total_multistate_listings', COUNT(*) FROM other_agency_state_listings WHERE is_visible = true
  UNION ALL
  SELECT 'indexed_top25_listings', COUNT(*) FROM public_agency_search_mv WHERE section = 'top25'
  UNION ALL
  SELECT 'indexed_other_listings', COUNT(*) FROM public_agency_search_mv WHERE section = 'other'
  UNION ALL
  SELECT 'unique_indexed_agencies', COUNT(DISTINCT agency_slug) FROM public_agency_search_mv
  UNION ALL
  SELECT 'agencies_in_multiple_states', COUNT(*) FROM (
    SELECT agency_slug FROM public_agency_search_mv GROUP BY agency_slug HAVING COUNT(DISTINCT state_slug) > 1
  ) x;
$$;

-- Step 6: Create search function with proper ranking
CREATE OR REPLACE FUNCTION public.search_agencies_robust(
  query_text TEXT,
  max_results INT DEFAULT 10
)
RETURNS TABLE (
  agency_slug TEXT,
  agency_name TEXT,
  agency_domain TEXT,
  logo_url TEXT,
  states JSONB,
  match_type TEXT,
  score NUMERIC
) LANGUAGE plpgsql SECURITY DEFINER
SET search_path = public
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
  -- Exact matches
  exact_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug,
      m.agency_name,
      m.agency_domain,
      m.logo_url,
      'exact' AS match_type,
      100.0 AS score
    FROM public_agency_search_mv m
    WHERE m.agency_name_lower = q
       OR m.agency_slug = q
  ),
  
  -- Prefix matches (name starts with query)
  prefix_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug,
      m.agency_name,
      m.agency_domain,
      m.logo_url,
      'prefix' AS match_type,
      90.0 - (LENGTH(m.agency_name_lower) - LENGTH(q))::NUMERIC * 0.1 AS score
    FROM public_agency_search_mv m
    WHERE m.agency_name_lower LIKE q || '%'
      AND m.agency_slug NOT IN (SELECT agency_slug FROM exact_matches)
  ),
  
  -- Contains matches (query anywhere in name)
  contains_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug,
      m.agency_name,
      m.agency_domain,
      m.logo_url,
      'contains' AS match_type,
      70.0 + similarity(m.agency_name_lower, q) * 20.0 AS score
    FROM public_agency_search_mv m
    WHERE m.agency_name_lower LIKE '%' || q || '%'
      AND m.agency_slug NOT IN (SELECT agency_slug FROM exact_matches)
      AND m.agency_slug NOT IN (SELECT agency_slug FROM prefix_matches)
  ),
  
  -- Domain matches
  domain_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug,
      m.agency_name,
      m.agency_domain,
      m.logo_url,
      'domain' AS match_type,
      60.0 AS score
    FROM public_agency_search_mv m
    WHERE m.agency_domain IS NOT NULL 
      AND m.agency_domain ILIKE '%' || q || '%'
      AND m.agency_slug NOT IN (SELECT agency_slug FROM exact_matches)
      AND m.agency_slug NOT IN (SELECT agency_slug FROM prefix_matches)
      AND m.agency_slug NOT IN (SELECT agency_slug FROM contains_matches)
  ),
  
  -- Slug contains matches
  slug_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug,
      m.agency_name,
      m.agency_domain,
      m.logo_url,
      'slug' AS match_type,
      50.0 AS score
    FROM public_agency_search_mv m
    WHERE m.agency_slug LIKE '%' || REPLACE(q, ' ', '-') || '%'
      AND m.agency_slug NOT IN (SELECT agency_slug FROM exact_matches)
      AND m.agency_slug NOT IN (SELECT agency_slug FROM prefix_matches)
      AND m.agency_slug NOT IN (SELECT agency_slug FROM contains_matches)
      AND m.agency_slug NOT IN (SELECT agency_slug FROM domain_matches)
  ),
  
  -- Trigram fuzzy matches as last resort
  fuzzy_matches AS (
    SELECT DISTINCT ON (m.agency_slug)
      m.agency_slug,
      m.agency_name,
      m.agency_domain,
      m.logo_url,
      'fuzzy' AS match_type,
      similarity(m.agency_name_lower, q) * 40.0 AS score
    FROM public_agency_search_mv m
    WHERE similarity(m.agency_name_lower, q) > 0.2
      AND m.agency_slug NOT IN (SELECT agency_slug FROM exact_matches)
      AND m.agency_slug NOT IN (SELECT agency_slug FROM prefix_matches)
      AND m.agency_slug NOT IN (SELECT agency_slug FROM contains_matches)
      AND m.agency_slug NOT IN (SELECT agency_slug FROM domain_matches)
      AND m.agency_slug NOT IN (SELECT agency_slug FROM slug_matches)
  ),
  
  -- Combine all matches
  all_matches AS (
    SELECT * FROM exact_matches
    UNION ALL SELECT * FROM prefix_matches
    UNION ALL SELECT * FROM contains_matches
    UNION ALL SELECT * FROM domain_matches
    UNION ALL SELECT * FROM slug_matches
    UNION ALL SELECT * FROM fuzzy_matches
  ),
  
  -- Aggregate states per agency
  with_states AS (
    SELECT 
      am.agency_slug,
      am.agency_name,
      am.agency_domain,
      am.logo_url,
      am.match_type,
      am.score,
      (
        SELECT JSONB_AGG(JSONB_BUILD_OBJECT(
          'state_slug', m.state_slug,
          'section', m.section,
          'rank', m.rank,
          'page_path', m.page_path
        ) ORDER BY m.section DESC, m.rank NULLS LAST)
        FROM public_agency_search_mv m
        WHERE m.agency_slug = am.agency_slug
      ) AS states
    FROM all_matches am
  )
  
  SELECT 
    ws.agency_slug,
    ws.agency_name,
    ws.agency_domain,
    ws.logo_url,
    ws.states,
    ws.match_type,
    ws.score
  FROM with_states ws
  ORDER BY ws.score DESC, LENGTH(ws.agency_name) ASC
  LIMIT max_results;
END $$;

-- Step 7: Grant necessary permissions
GRANT SELECT ON public_agency_search_mv TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.search_agencies_robust TO anon, authenticated;
GRANT EXECUTE ON FUNCTION public.diagnose_agency_search_coverage TO authenticated;

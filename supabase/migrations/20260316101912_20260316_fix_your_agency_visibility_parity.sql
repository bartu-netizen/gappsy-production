/*
  # Fix /your-agency Visibility Parity

  ## Problem
  Search (public_agency_search_mv via search_agencies_robust) includes ALL Top 25 slots
  where agency_name IS NOT NULL — regardless of is_paid status.

  But profile resolution (agency_listings_index rebuild + agency_listings_search_sources)
  filtered Top 25 with WHERE ts.is_paid = true, creating a mismatch where:
  - search finds the agency
  - /your-agency/:slug returns "Agency not found"

  ## Changes

  1. rebuild_agency_listings_index() — remove is_paid = true gate for Top 25.
     Now includes all Top 25 slots with a non-empty agency_name (same rule as search MV).
     Slug fallback aligned: normalized agency_name slug (same formula as search MV).

  2. agency_listings_search_sources view — remove is_paid = true gate.
     Same slug generation as search MV.

  3. Re-run rebuild and refresh search MV to bring data into sync.

  ## Result
  Anything searchable via /your-agency search is now also resolvable via /your-agency/:slug.
*/

-- =========================================================
-- PART 1: Fix rebuild_agency_listings_index
-- Remove is_paid = true gate, align slug with search MV
-- =========================================================

CREATE OR REPLACE FUNCTION public.rebuild_agency_listings_index()
RETURNS TABLE (
  status TEXT,
  processed_count INT,
  updated_count INT,
  duration_ms INT
) LANGUAGE plpgsql AS $$
DECLARE
  v_start_time TIMESTAMPTZ;
  v_count INT := 0;
  v_total INT := 0;
BEGIN
  v_start_time := CLOCK_TIMESTAMP();

  UPDATE agency_listings_index SET is_visible = false;

  -- Rebuild Top 25: ALL slots with a non-empty agency_name (same rule as search MV)
  -- Slug: use oa.slug if linked, else normalize agency_name (same as public_agency_search_mv)
  INSERT INTO agency_listings_index (
    agency_id, agency_slug, agency_name, agency_domain,
    state_slug, section, rank, other_position, page_path,
    is_visible, updated_at
  )
  SELECT
    COALESCE(ts.agency_id::text, 'top25-' || ts.state_slug || '-' || ts.rank::text),
    COALESCE(
      oa.slug,
      LOWER(REGEXP_REPLACE(REGEXP_REPLACE(ts.agency_name, '[^a-zA-Z0-9\s-]', '', 'g'), '\s+', '-', 'g'))
    ),
    ts.agency_name,
    COALESCE(ts.website, oa.website_url),
    ts.state_slug,
    'top25',
    ts.rank,
    NULL::int,
    '/marketing-agencies-in-' || ts.state_slug || '-united-states/',
    true,
    CLOCK_TIMESTAMP()
  FROM top25_slots ts
  LEFT JOIN other_agencies oa ON ts.agency_id = oa.id
  WHERE ts.agency_name IS NOT NULL AND TRIM(ts.agency_name) != ''
  ON CONFLICT (agency_id, state_slug, section)
  DO UPDATE SET
    agency_slug = EXCLUDED.agency_slug,
    agency_name = EXCLUDED.agency_name,
    agency_domain = EXCLUDED.agency_domain,
    rank = EXCLUDED.rank,
    page_path = EXCLUDED.page_path,
    is_visible = true,
    updated_at = CLOCK_TIMESTAMP();

  GET DIAGNOSTICS v_count = ROW_COUNT;
  v_total := v_count;

  -- Rebuild Other Agencies (active only, unchanged)
  INSERT INTO agency_listings_index (
    agency_id, agency_slug, agency_name, agency_domain,
    state_slug, section, rank, other_position, page_path,
    is_visible, updated_at
  )
  SELECT
    oa.id::text,
    oa.slug,
    oa.name,
    oa.website_url,
    oa.state_slug,
    'other',
    NULL::int,
    ROW_NUMBER() OVER (PARTITION BY oa.state_slug ORDER BY oa.name ASC),
    '/marketing-agencies-in-' || oa.state_slug || '-united-states/',
    true,
    CLOCK_TIMESTAMP()
  FROM other_agencies oa
  WHERE oa.is_active = true
  ON CONFLICT (agency_id, state_slug, section)
  DO UPDATE SET
    agency_slug = EXCLUDED.agency_slug,
    agency_name = EXCLUDED.agency_name,
    agency_domain = EXCLUDED.agency_domain,
    other_position = EXCLUDED.other_position,
    page_path = EXCLUDED.page_path,
    is_visible = true,
    updated_at = CLOCK_TIMESTAMP();

  GET DIAGNOSTICS v_count = ROW_COUNT;
  v_total := v_total + v_count;

  -- Clean up stale entries
  DELETE FROM agency_listings_index WHERE is_visible = false;

  RETURN QUERY SELECT
    'completed'::TEXT,
    v_total,
    v_total,
    EXTRACT(MILLISECOND FROM (CLOCK_TIMESTAMP() - v_start_time))::INT;
END $$;


-- =========================================================
-- PART 2: Fix agency_listings_search_sources view
-- Remove is_paid = true gate, align slug with search MV
-- =========================================================

CREATE OR REPLACE VIEW public.agency_listings_search_sources AS
SELECT DISTINCT
  COALESCE(ts.agency_id::text, 'top25-' || ts.state_slug || '-' || ts.rank::text) AS agency_id,
  COALESCE(
    oa.slug,
    LOWER(REGEXP_REPLACE(REGEXP_REPLACE(ts.agency_name, '[^a-zA-Z0-9\s-]', '', 'g'), '\s+', '-', 'g'))
  ) AS agency_slug,
  ts.agency_name,
  COALESCE(ts.website, oa.website_url) AS agency_domain,
  ts.state_slug,
  'top25' AS section,
  ts.rank,
  NULL::int AS other_position,
  '/marketing-agencies-in-' || ts.state_slug || '-united-states/' AS page_path
FROM top25_slots ts
LEFT JOIN other_agencies oa ON ts.agency_id = oa.id
WHERE ts.agency_name IS NOT NULL AND TRIM(ts.agency_name) != ''

UNION ALL

SELECT DISTINCT
  oa.id::text,
  oa.slug,
  oa.name,
  oa.website_url,
  oa.state_slug,
  'other',
  NULL::int,
  ROW_NUMBER() OVER (PARTITION BY oa.state_slug ORDER BY oa.name ASC),
  '/marketing-agencies-in-' || oa.state_slug || '-united-states/'
FROM other_agencies oa
WHERE oa.is_active = true;


-- =========================================================
-- PART 3: Rebuild index + refresh search MV
-- Brings all data into sync with new rules
-- =========================================================

SELECT public.rebuild_agency_listings_index();
SELECT public.rebuild_public_agency_search();

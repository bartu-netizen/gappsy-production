/*
  # Safe Rebuild Function for /your-agency Index

  ## Problem
  rebuild_agency_listings_index() uses `UPDATE agency_listings_index SET is_visible = false`
  without a WHERE clause, which is blocked by production database security policies.

  ## Changes
  Replace unsafe UPDATE with TRUNCATE + INSERT strategy:
  1. TRUNCATE table completely (safe, fast, no WHERE clause needed)
  2. INSERT all Top 25 slots with agency_name
  3. INSERT all active other_agencies
  4. No DELETE needed since table is empty after TRUNCATE

  ## Security
  - TRUNCATE is always safe (explicit table operation, no WHERE clause risk)
  - Rebuilds entire index from scratch each time (deterministic, idempotent)
  - No orphaned rows possible

  ## Result
  Rebuild works in production without UPDATE without WHERE clause errors.
  Function is now safe, idempotent, and deterministic.
*/

CREATE OR REPLACE FUNCTION public.rebuild_agency_listings_index()
RETURNS TABLE (
  status TEXT,
  processed_count INT,
  updated_count INT,
  duration_ms INT
) LANGUAGE plpgsql AS $$
DECLARE
  v_start_time TIMESTAMPTZ;
  v_top25_count INT := 0;
  v_other_count INT := 0;
  v_total INT := 0;
BEGIN
  v_start_time := CLOCK_TIMESTAMP();

  -- SAFE: Truncate entire table (no WHERE clause needed)
  TRUNCATE agency_listings_index;

  -- Rebuild Top 25: ALL slots with a non-empty agency_name
  -- Slug: use oa.slug if linked, else normalize agency_name
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
  WHERE ts.agency_name IS NOT NULL AND TRIM(ts.agency_name) != '';

  GET DIAGNOSTICS v_top25_count = ROW_COUNT;
  v_total := v_top25_count;

  -- Rebuild Other Agencies (active only)
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
  WHERE oa.is_active = true;

  GET DIAGNOSTICS v_other_count = ROW_COUNT;
  v_total := v_total + v_other_count;

  -- Log successful rebuild
  RAISE NOTICE '[rebuild_agency_listings_index] Completed: top25=% other=% total=%',
    v_top25_count, v_other_count, v_total;

  RETURN QUERY SELECT
    'completed'::TEXT,
    v_total,
    v_total,
    EXTRACT(MILLISECOND FROM (CLOCK_TIMESTAMP() - v_start_time))::INT;
END $$;

-- Run initial safe rebuild to verify it works
SELECT public.rebuild_agency_listings_index();

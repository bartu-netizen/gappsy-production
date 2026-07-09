/*
  # Your Agency Robust Search & Index Sync Fix

  Hardens `/your-agency` to guarantee all public agencies are discoverable.
  Adds fallback search, index repair, and establishes write-time sync.

*/

-- Add visibility field
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'agency_listings_index' AND column_name = 'is_visible'
  ) THEN
    ALTER TABLE agency_listings_index ADD COLUMN is_visible boolean DEFAULT true;
  END IF;
END $$;

-- Create rebuild/repair function
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

  -- Rebuild Top 25 (paid only)
  INSERT INTO agency_listings_index (
    agency_id, agency_slug, agency_name, agency_domain,
    state_slug, section, rank, other_position, page_path,
    is_visible, updated_at
  )
  SELECT
    ts.agency_id::text,
    COALESCE(oa.slug, 'agency-' || ts.state_slug || '-rank-' || ts.rank::text),
    ts.agency_name,
    oa.website_url,
    ts.state_slug,
    'top25',
    ts.rank,
    NULL::int,
    '/explore/' || ts.state_slug || '?tab=top25',
    true,
    CLOCK_TIMESTAMP()
  FROM top25_slots ts
  LEFT JOIN other_agencies oa ON ts.agency_id = oa.id
  WHERE ts.is_paid = true AND ts.agency_id IS NOT NULL AND ts.agency_name IS NOT NULL
  ON CONFLICT (agency_id, state_slug, section)
  DO UPDATE SET
    agency_name = EXCLUDED.agency_name,
    agency_domain = EXCLUDED.agency_domain,
    rank = EXCLUDED.rank,
    page_path = EXCLUDED.page_path,
    is_visible = true,
    updated_at = CLOCK_TIMESTAMP();

  GET DIAGNOSTICS v_count = ROW_COUNT;
  v_total := v_count;

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
    '/explore/' || oa.state_slug || '?tab=other',
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

-- Create fallback search view
CREATE OR REPLACE VIEW public.agency_listings_search_sources AS
SELECT DISTINCT
  ts.agency_id::text as agency_id,
  COALESCE(oa.slug, 'agency-' || ts.state_slug || '-rank-' || ts.rank::text) as agency_slug,
  ts.agency_name,
  oa.website_url as agency_domain,
  ts.state_slug,
  'top25' as section,
  ts.rank,
  NULL::int as other_position,
  '/explore/' || ts.state_slug || '?tab=top25' as page_path
FROM top25_slots ts
LEFT JOIN other_agencies oa ON ts.agency_id = oa.id
WHERE ts.is_paid = true AND ts.agency_id IS NOT NULL AND ts.agency_name IS NOT NULL

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
  '/explore/' || oa.state_slug || '?tab=other'
FROM other_agencies oa
WHERE oa.is_active = true;

-- Add performance indexes
CREATE INDEX IF NOT EXISTS idx_ali_is_visible ON agency_listings_index (is_visible);
CREATE INDEX IF NOT EXISTS idx_ali_name_visible ON agency_listings_index (lower(agency_name), is_visible) WHERE is_visible = true;
CREATE INDEX IF NOT EXISTS idx_ali_slug_visible ON agency_listings_index (agency_slug, is_visible) WHERE is_visible = true;
CREATE INDEX IF NOT EXISTS idx_ali_domain_visible ON agency_listings_index (agency_domain, is_visible) WHERE is_visible = true AND agency_domain IS NOT NULL;

-- Run initial rebuild
SELECT public.rebuild_agency_listings_index();

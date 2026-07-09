/*
  # Fix type casts in get_other_agencies_stats

  Schema reality:
  - other_agencies.id              → uuid
  - other_agency_emails.agency_id  → uuid  (no cast needed)
  - agency_listings.agency_id      → text  (cast ::uuid to compare with oa.id)
*/

CREATE OR REPLACE FUNCTION get_other_agencies_stats(
  p_state_slug TEXT,
  p_search     TEXT DEFAULT '',
  p_filter     TEXT DEFAULT 'all'
)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_result JSON;
  v_search TEXT := lower(trim(COALESCE(p_search, '')));
  v_filter TEXT := COALESCE(p_filter, 'all');
BEGIN
  WITH
  matched_ids AS (
    SELECT DISTINCT oa.id
    FROM other_agencies oa
    WHERE oa.state_slug = p_state_slug
      AND (
        v_search = ''
        OR oa.name        ILIKE '%' || p_search || '%'
        OR oa.website_url ILIKE '%' || p_search || '%'
        OR oa.email       ILIKE '%' || p_search || '%'
        OR EXISTS (
          SELECT 1
          FROM other_agency_emails oae
          WHERE oae.agency_id                  = oa.id
            AND oae.email_normalized           = v_search
            AND oae.exclude_from_agency_lookup = false
        )
      )
  ),
  paid_status AS (
    SELECT
      oa.id,
      CASE
        WHEN oa.paid_override_active = true AND oa.paid_override_value = true  THEN true
        WHEN oa.paid_override_active = true AND oa.paid_override_value = false THEN false
        ELSE EXISTS (
          SELECT 1
          FROM agency_listings al
          WHERE al.agency_id::uuid = oa.id
            AND al.state_slug      = p_state_slug
            AND al.paid_active     = true
            AND al.listing_tier    = 'standard'
        )
      END AS is_effectively_paid
    FROM other_agencies oa
    WHERE oa.state_slug = p_state_slug
  ),
  base AS (
    SELECT
      oa.id,
      oa.is_active,
      oa.website_url,
      oa.services,
      oa.paid_override_active,
      oa.showcase_pinned,
      ps.is_effectively_paid
    FROM other_agencies oa
    JOIN matched_ids mi ON oa.id = mi.id
    JOIN paid_status ps  ON oa.id = ps.id
    WHERE (
      (v_filter = 'all')
      OR (v_filter = 'active'              AND (oa.is_active = true  OR oa.is_active IS NULL))
      OR (v_filter = 'inactive'            AND  oa.is_active = false)
      OR (v_filter = 'paid'                AND  ps.is_effectively_paid = true)
      OR (v_filter = 'unpaid'              AND  ps.is_effectively_paid = false)
      OR (v_filter = 'missing_website'     AND (oa.website_url IS NULL OR trim(oa.website_url) = ''))
      OR (v_filter = 'has_badges'          AND  cardinality(oa.services) > 0)
      OR (v_filter = 'no_badges'           AND (oa.services IS NULL OR cardinality(oa.services) = 0))
      OR (v_filter = 'overridden'          AND  oa.paid_override_active = true)
      OR (v_filter = 'showcase_pinned'     AND  oa.showcase_pinned = true)
      OR (v_filter = 'showcase_not_pinned' AND  oa.showcase_pinned = false)
    )
  )
  SELECT json_build_object(
    'state_slug',       p_state_slug,
    'total',            COUNT(*),
    'active',           COUNT(*) FILTER (WHERE is_active = true  OR is_active IS NULL),
    'inactive',         COUNT(*) FILTER (WHERE is_active = false),
    'paid',             COUNT(*) FILTER (WHERE is_effectively_paid = true),
    'unpaid',           COUNT(*) FILTER (WHERE is_effectively_paid = false),
    'missing_website',  COUNT(*) FILTER (WHERE website_url IS NULL OR trim(website_url) = ''),
    'with_badges',      COUNT(*) FILTER (WHERE cardinality(services) > 0),
    'no_badges',        COUNT(*) FILTER (WHERE services IS NULL OR cardinality(services) = 0)
  )
  INTO v_result
  FROM base;

  RETURN v_result;
END;
$$;

GRANT EXECUTE ON FUNCTION get_other_agencies_stats(TEXT, TEXT, TEXT) TO authenticated;
GRANT EXECUTE ON FUNCTION get_other_agencies_stats(TEXT, TEXT, TEXT) TO service_role;

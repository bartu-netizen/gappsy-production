/*
  # Add get_other_agencies_stats RPC

  ## Purpose
  Replaces the broken row-fetch approach in the manager-api summary action.
  The old approach fetched all rows for a state and counted in JS, hitting
  Supabase's 1000-row default cap. For states like New Jersey (8,640+ agencies)
  this produced wrong totals (e.g. Total = 1000, Free = 1000).

  ## What this does
  - Computes all summary stats in a single SQL query using COUNT(*) FILTER
  - Applies the same search and filter context as the paginated table query
  - Never loads individual rows; uses PostgreSQL aggregation entirely
  - Returns exact uncapped counts regardless of row volume

  ## Parameters
  - p_state_slug: the state to summarise
  - p_search: optional search string (name / website / email)
  - p_filter: optional filter key matching the admin FilterType values

  ## Stats returned (as JSON)
  - total, active, inactive, paid, unpaid, missing_website, with_badges, no_badges

  ## Security
  - SECURITY DEFINER so it can read agency_listings (cross-schema join)
  - Only called by the admin edge function via service role key
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
  -- ── 1. Resolve search ───────────────────────────────────────────────────
  -- Returns the set of agency IDs that match the search string (if any).
  -- Supports name / website / direct-email ilike, plus linked-email exact match.
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

  -- ── 2. Effective paid status ────────────────────────────────────────────
  -- Mirrors the JS effectivePaid() helper:
  --   paid_override wins if active; otherwise standard listing from agency_listings.
  paid_status AS (
    SELECT
      oa.id,
      CASE
        WHEN oa.paid_override_active = true AND oa.paid_override_value = true  THEN true
        WHEN oa.paid_override_active = true AND oa.paid_override_value = false THEN false
        ELSE EXISTS (
          SELECT 1
          FROM agency_listings al
          WHERE al.agency_id    = oa.id
            AND al.state_slug   = p_state_slug
            AND al.paid_active  = true
            AND al.listing_tier = 'standard'
        )
      END AS is_effectively_paid
    FROM other_agencies oa
    WHERE oa.state_slug = p_state_slug
  ),

  -- ── 3. Base filtered set ────────────────────────────────────────────────
  -- Agencies that match search AND the active filter chip.
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

  -- ── 4. Aggregate in a single pass ───────────────────────────────────────
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

-- Grant execute to authenticated role so the admin edge function
-- (which authenticates via service role) can call it.
GRANT EXECUTE ON FUNCTION get_other_agencies_stats(TEXT, TEXT, TEXT) TO authenticated;
GRANT EXECUTE ON FUNCTION get_other_agencies_stats(TEXT, TEXT, TEXT) TO service_role;

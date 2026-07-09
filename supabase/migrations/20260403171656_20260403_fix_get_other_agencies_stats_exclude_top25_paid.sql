/*
  # Fix get_other_agencies_stats: exclude paid_listing_type='top25' from Standard Paid count

  ## Problem
  The Standard Paid ($97) card and filter were returning 3 agencies in New Jersey
  (NXS Creative Group, Olympian Multimedia, TURCHETTE B2B Marketing) because the
  existing logic counted ANY agency with is_paid_listing=true + a confirmed Stripe
  order, regardless of what product that order was for.

  NXS and TURCHETTE have paid_listing_type='top25' in other_agencies, meaning their
  Stripe orders are for Top 25 slots — not Other Agencies standard activations.
  Olympian Multimedia has paid_listing_type=null, meaning it IS an Other Agencies
  standard activation ($97 product).

  ## Fix
  In the paid_status CTE, the Stripe-confirmed path now requires:
    AND (oa.paid_listing_type IS NULL OR oa.paid_listing_type <> 'top25')

  This ensures Standard Paid ($97) means ONLY Other Agencies standard activations.
  Top 25 agencies remain correctly reflected in Top 25 admin views and revenue
  reports — they just do not appear in the Other Agencies Standard Paid filter.

  ## New Jersey expected result after fix
  - Standard Paid ($97) count: 1 (Olympian Multimedia only)
  - NXS Creative Group: excluded (paid_listing_type='top25')
  - TURCHETTE B2B: excluded (paid_listing_type='top25')
  - Studio Forged: excluded (is_paid_listing=true but no Stripe order)
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
        ELSE (
          -- Stripe-confirmed path: only count as Other Agencies paid when the
          -- agency is NOT a Top 25 listing type.  Top 25 agencies have their
          -- own paid product and must not bleed into the $97 Other Agencies filter.
          (
            oa.is_paid_listing = true
            AND (oa.paid_listing_type IS NULL OR oa.paid_listing_type <> 'top25')
            AND EXISTS (
              SELECT 1 FROM stripe_orders so
              WHERE so.agency_id::uuid = oa.id
                AND so.payment_status  = 'paid'
            )
          )
          OR EXISTS (
            SELECT 1
            FROM agency_listings al
            WHERE al.agency_id::uuid = oa.id
              AND al.paid_active     = true
              AND al.listing_tier    = 'standard'
          )
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

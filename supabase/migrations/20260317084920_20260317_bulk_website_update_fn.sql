/*
  # Create bulk_update_agency_websites RPC function

  Accepts a JSON array of {id, website_url, website_domain_normalized}
  and performs a single bulk UPDATE in one SQL statement.
  Called by the backfill edge function in batches of 500.
*/

CREATE OR REPLACE FUNCTION public.bulk_update_agency_websites(
  updates jsonb
)
RETURNS integer
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  updated_count integer;
BEGIN
  WITH vals AS (
    SELECT
      (item->>'id')::uuid                      AS id,
      (item->>'website_url')::text             AS website_url,
      (item->>'website_domain_normalized')::text AS domain
    FROM jsonb_array_elements(updates) AS item
    WHERE item->>'id' IS NOT NULL
      AND item->>'website_url' IS NOT NULL
  )
  UPDATE other_agencies oa
  SET
    website_url = vals.website_url,
    website_domain_normalized = vals.domain,
    updated_at = now()
  FROM vals
  WHERE oa.id = vals.id
    AND oa.is_active = true;

  GET DIAGNOSTICS updated_count = ROW_COUNT;
  RETURN updated_count;
END;
$$;

REVOKE ALL ON FUNCTION public.bulk_update_agency_websites(jsonb) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.bulk_update_agency_websites(jsonb) TO service_role;

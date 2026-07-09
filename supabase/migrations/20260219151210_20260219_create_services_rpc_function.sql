/*
  # Create RPC Function for Services

  1. Create RPC function get_services_for_state
     - Takes state_slug and limit
     - Returns array of {service, count} objects
     - Orders by count descending

  2. Purpose: Generate dynamic service filter chips on state pages
*/

CREATE OR REPLACE FUNCTION get_services_for_state(
  p_state_slug TEXT,
  p_limit INT DEFAULT 8
)
RETURNS TABLE(service TEXT, count INT) AS $$
BEGIN
  RETURN QUERY
  SELECT
    unnest(services) as service,
    COUNT(*) as count
  FROM other_agencies
  WHERE state_slug = p_state_slug AND is_active = true AND services IS NOT NULL AND array_length(services, 1) > 0
  GROUP BY unnest(services)
  ORDER BY count DESC
  LIMIT p_limit;
END;
$$ LANGUAGE plpgsql STABLE;

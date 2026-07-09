/*
  # Add Export Diagnostics RPC

  Creates a function that returns per-state email counts broken down by:
  - Active vs inactive agencies
  - Validation status
  - What would actually be exported given current filter rules

  Used by the admin email cleaning page to show honest pre-export numbers.
*/

CREATE OR REPLACE FUNCTION get_state_email_diagnostics(p_state_slug text)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_result jsonb;
BEGIN
  SELECT jsonb_build_object(
    'state_slug', p_state_slug,

    'total_emails', (
      SELECT COUNT(*)
      FROM other_agency_emails e
      JOIN other_agencies oa ON e.agency_id = oa.id
      WHERE oa.state_slug = p_state_slug
    ),

    'on_active_agencies', (
      SELECT COUNT(*)
      FROM other_agency_emails e
      JOIN other_agencies oa ON e.agency_id = oa.id
      WHERE oa.state_slug = p_state_slug AND oa.is_active = true
    ),

    'on_inactive_agencies', (
      SELECT COUNT(*)
      FROM other_agency_emails e
      JOIN other_agencies oa ON e.agency_id = oa.id
      WHERE oa.state_slug = p_state_slug AND oa.is_active = false
    ),

    'by_status_active', (
      SELECT jsonb_object_agg(validation_status, cnt)
      FROM (
        SELECT e.validation_status, COUNT(*) as cnt
        FROM other_agency_emails e
        JOIN other_agencies oa ON e.agency_id = oa.id
        WHERE oa.state_slug = p_state_slug AND oa.is_active = true
        GROUP BY e.validation_status
      ) s
    ),

    'by_status_inactive', (
      SELECT jsonb_object_agg(validation_status, cnt)
      FROM (
        SELECT e.validation_status, COUNT(*) as cnt
        FROM other_agency_emails e
        JOIN other_agencies oa ON e.agency_id = oa.id
        WHERE oa.state_slug = p_state_slug AND oa.is_active = false
        GROUP BY e.validation_status
      ) s
    ),

    'active_agencies_count', (
      SELECT COUNT(*)
      FROM other_agencies
      WHERE state_slug = p_state_slug AND is_active = true
    ),

    'inactive_agencies_count', (
      SELECT COUNT(*)
      FROM other_agencies
      WHERE state_slug = p_state_slug AND is_active = false
    )
  ) INTO v_result;

  RETURN v_result;
END;
$$;

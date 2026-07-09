/*
  # Fix claim_showcase_slot: resolve "column reference state_slug is ambiguous"

  ## Root Cause
  The original function declared `RETURNS TABLE (..., state_slug text, ...)`.
  In PL/pgSQL every RETURNS TABLE column becomes an OUT parameter variable with
  that exact name. Inside the function body, bare `state_slug` resolves to BOTH:
    - the OUT parameter variable `state_slug`
    - the column `other_agencies.state_slug` referenced in UPDATE WHERE clauses
  PostgreSQL correctly reports: "column reference 'state_slug' is ambiguous".

  ## Fix (must DROP first because return type changes)
  1. DROP the old function signature.
  2. Recreate with `r_state_slug` (renamed output column) so no OUT parameter
     name collides with a table column name.
  3. Use explicit table alias `AS oa` in every UPDATE + qualify all column
     references — belt-and-suspenders against any future name collision.
  4. Re-apply service_role grants.

  The edge function only inspects the `error` field from .rpc(), so renaming
  the output column is backwards-compatible.
*/

-- Drop the existing function (return type must match for CREATE OR REPLACE,
-- so we drop first when changing the output column names).
DROP FUNCTION IF EXISTS public.claim_showcase_slot(uuid, text, integer, text);

-- Recreate with unambiguous parameter names and table-aliased DML
CREATE FUNCTION public.claim_showcase_slot(
  p_agency_id   uuid,
  p_state_slug  text,
  p_slot        integer,
  p_updated_by  text DEFAULT 'admin'
)
RETURNS TABLE (
  role                text,
  id                  uuid,
  name                text,
  r_state_slug        text,
  showcase_pinned     boolean,
  showcase_position   integer,
  showcase_updated_at timestamptz,
  showcase_updated_by text
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $fn$
BEGIN
  IF p_slot IS NOT NULL AND (p_slot < 1 OR p_slot > 12) THEN
    RAISE EXCEPTION 'showcase_position must be between 1 and 12, got %', p_slot;
  END IF;

  -- Displace current owner of this slot (different agency, same state).
  -- Table alias `oa` makes every column reference unambiguous.
  UPDATE other_agencies AS oa
  SET    showcase_position   = NULL,
         showcase_pinned     = false,
         showcase_updated_at = now(),
         showcase_updated_by = p_updated_by || '_displaced'
  WHERE  oa.state_slug        = p_state_slug
    AND  oa.showcase_position = p_slot
    AND  oa.showcase_pinned   = true
    AND  oa.id               <> p_agency_id;

  -- Assign the slot to the target agency.
  UPDATE other_agencies AS oa
  SET    showcase_pinned     = true,
         showcase_position   = p_slot,
         showcase_updated_at = now(),
         showcase_updated_by = p_updated_by
  WHERE  oa.id = p_agency_id;

  -- Return new owner + any row displaced within the last 5 seconds.
  RETURN QUERY
    SELECT
      CASE WHEN a.id = p_agency_id THEN 'owner'::text ELSE 'displaced'::text END,
      a.id,
      a.name,
      a.state_slug          AS r_state_slug,
      a.showcase_pinned,
      a.showcase_position,
      a.showcase_updated_at,
      a.showcase_updated_by
    FROM other_agencies AS a
    WHERE a.id = p_agency_id
      OR (
           a.state_slug          = p_state_slug
       AND a.showcase_pinned     = false
       AND a.showcase_updated_by = p_updated_by || '_displaced'
       AND a.showcase_updated_at >= now() - interval '5 seconds'
      );
END;
$fn$;

REVOKE EXECUTE ON FUNCTION public.claim_showcase_slot(uuid, text, integer, text) FROM PUBLIC;
GRANT  EXECUTE ON FUNCTION public.claim_showcase_slot(uuid, text, integer, text) TO service_role;

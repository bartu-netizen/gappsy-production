/*
  # Fix unpin_showcase_slot: resolve "column reference id is ambiguous"

  ## Problem
  unpin_showcase_slot is declared as:
    RETURNS TABLE(id uuid, showcase_pinned boolean, ...)

  Inside the function body the UPDATE statement uses:
    WHERE id = p_agency_id

  PostgreSQL treats this as ambiguous because "id" could refer to either:
    1. The output column "id" declared in RETURNS TABLE
    2. The table column other_agencies.id

  This causes the runtime error: "column reference id is ambiguous"

  ## Fix
  Add table alias "oa" to the UPDATE statement so every reference to the
  table column is fully qualified as "oa.id", removing all ambiguity.

  The SELECT portion already uses alias "a" (correct). No behavioral change —
  this is a pure disambiguation fix.

  ## Affected operations
  - Manual unpin from the Other Agencies Manager admin UI
  - Showcase toggle OFF (which calls unpin_showcase_slot internally)
*/

CREATE OR REPLACE FUNCTION public.unpin_showcase_slot(
  p_agency_id  uuid,
  p_updated_by text DEFAULT 'admin'::text
)
RETURNS TABLE(
  id                  uuid,
  showcase_pinned     boolean,
  showcase_position   integer,
  showcase_updated_at timestamp with time zone
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
BEGIN
  -- Table alias "oa" makes "oa.id" unambiguous vs the RETURNS TABLE output column "id".
  UPDATE other_agencies AS oa
  SET    showcase_pinned     = false,
         showcase_position   = NULL,
         showcase_updated_at = now(),
         showcase_updated_by = p_updated_by
  WHERE  oa.id = p_agency_id;

  RETURN QUERY
  SELECT a.id,
         a.showcase_pinned,
         a.showcase_position,
         a.showcase_updated_at
  FROM   other_agencies a
  WHERE  a.id = p_agency_id;
END;
$$;

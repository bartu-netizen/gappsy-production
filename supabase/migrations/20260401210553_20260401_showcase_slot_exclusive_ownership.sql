/*
  # Showcase Slot Exclusive Ownership

  Redesigns the showcase pinning system so each (state_slug, showcase_position)
  pair can have AT MOST ONE owner at a time.

  ## Problem
  The previous schema allowed multiple agencies in the same state to have the
  same showcase_position. The resolver did silent "first-wins" conflict
  resolution, making it impossible to predict which agency would appear in a
  given slot.

  ## Changes

  ### 1. Deduplicate existing data
  For every (state_slug, showcase_position) group that has more than one pinned
  agency, keep the most recently updated row as the true slot owner and clear
  showcase_position (+ showcase_pinned) on all others.

  ### 2. Add partial unique index
  UNIQUE (state_slug, showcase_position)
  WHERE showcase_pinned = true AND showcase_position IS NOT NULL

  This is the DB-level safety guard. The backend enforces the same rule, but
  the index makes it impossible to accidentally violate it at the DB level.

  ### 3. Add helper RPC
  claim_showcase_slot(p_agency_id, p_state_slug, p_slot, p_updated_by)
  — atomically displaces any current slot owner and assigns the slot to the
    given agency
  — returns both the updated agency row and any displaced agency row
  — called from the edge function PATCH handler
*/

-- ── STEP 1: Remove duplicate pinned slots ────────────────────────────────────
-- For each (state_slug, showcase_position) with multiple pinned agencies,
-- keep the one with the latest showcase_updated_at (ties broken by id).
DO $$
DECLARE
  dup RECORD;
BEGIN
  FOR dup IN
    SELECT state_slug, showcase_position
    FROM other_agencies
    WHERE showcase_pinned = true
      AND showcase_position IS NOT NULL
    GROUP BY state_slug, showcase_position
    HAVING COUNT(*) > 1
  LOOP
    -- Clear all but the most recently updated in this group
    UPDATE other_agencies
    SET showcase_position = NULL,
        showcase_pinned    = false,
        showcase_updated_at = now(),
        showcase_updated_by = 'migration_dedup'
    WHERE state_slug        = dup.state_slug
      AND showcase_position = dup.showcase_position
      AND showcase_pinned   = true
      AND id NOT IN (
        SELECT id
        FROM other_agencies
        WHERE state_slug        = dup.state_slug
          AND showcase_position = dup.showcase_position
          AND showcase_pinned   = true
        ORDER BY COALESCE(showcase_updated_at, '1970-01-01'::timestamptz) DESC, id DESC
        LIMIT 1
      );
  END LOOP;
END $$;

-- ── STEP 2: Add partial unique index ─────────────────────────────────────────
-- Prevents more than one pinned agency per slot per state at the DB level.
CREATE UNIQUE INDEX IF NOT EXISTS idx_other_agencies_showcase_slot_unique
  ON other_agencies (state_slug, showcase_position)
  WHERE showcase_pinned = true AND showcase_position IS NOT NULL;

-- ── STEP 3: claim_showcase_slot RPC ──────────────────────────────────────────
-- Atomically transfers slot ownership. Called by the edge function PATCH path.
CREATE OR REPLACE FUNCTION public.claim_showcase_slot(
  p_agency_id   uuid,
  p_state_slug  text,
  p_slot        integer,
  p_updated_by  text DEFAULT 'admin'
)
RETURNS TABLE (
  role           text,
  id             uuid,
  name           text,
  state_slug     text,
  showcase_pinned   boolean,
  showcase_position integer,
  showcase_updated_at timestamptz,
  showcase_updated_by text
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $fn$
BEGIN
  -- Validate slot
  IF p_slot IS NOT NULL AND (p_slot < 1 OR p_slot > 12) THEN
    RAISE EXCEPTION 'showcase_position must be between 1 and 12, got %', p_slot;
  END IF;

  -- Displace any current owner of this slot (different agency, same state)
  UPDATE other_agencies
  SET showcase_position   = NULL,
      showcase_pinned     = false,
      showcase_updated_at = now(),
      showcase_updated_by = p_updated_by || '_displaced'
  WHERE state_slug        = p_state_slug
    AND showcase_position = p_slot
    AND showcase_pinned   = true
    AND id               <> p_agency_id;

  -- Assign slot to the requested agency
  UPDATE other_agencies
  SET showcase_pinned     = true,
      showcase_position   = p_slot,
      showcase_updated_at = now(),
      showcase_updated_by = p_updated_by
  WHERE id = p_agency_id;

  -- Return affected rows: new owner first, then displaced agency (if any)
  RETURN QUERY
    SELECT
      CASE WHEN a.id = p_agency_id THEN 'owner' ELSE 'displaced' END AS role,
      a.id,
      a.name,
      a.state_slug,
      a.showcase_pinned,
      a.showcase_position,
      a.showcase_updated_at,
      a.showcase_updated_by
    FROM other_agencies a
    WHERE a.id = p_agency_id
      OR (
        a.state_slug        = p_state_slug
        AND a.showcase_pinned = false
        AND a.showcase_updated_by = p_updated_by || '_displaced'
        AND a.showcase_updated_at >= now() - interval '5 seconds'
      );
END;
$fn$;

-- Revoke public execute, grant to service_role only
REVOKE EXECUTE ON FUNCTION public.claim_showcase_slot(uuid, text, integer, text) FROM PUBLIC;
GRANT  EXECUTE ON FUNCTION public.claim_showcase_slot(uuid, text, integer, text) TO service_role;

-- ── STEP 4: unpin_showcase_slot RPC ──────────────────────────────────────────
-- Cleanly removes a pinned slot from a specific agency.
CREATE OR REPLACE FUNCTION public.unpin_showcase_slot(
  p_agency_id  uuid,
  p_updated_by text DEFAULT 'admin'
)
RETURNS TABLE (
  id                  uuid,
  showcase_pinned     boolean,
  showcase_position   integer,
  showcase_updated_at timestamptz
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $fn$
BEGIN
  UPDATE other_agencies
  SET showcase_pinned     = false,
      showcase_position   = NULL,
      showcase_updated_at = now(),
      showcase_updated_by = p_updated_by
  WHERE id = p_agency_id;

  RETURN QUERY
    SELECT a.id, a.showcase_pinned, a.showcase_position, a.showcase_updated_at
    FROM other_agencies a
    WHERE a.id = p_agency_id;
END;
$fn$;

REVOKE EXECUTE ON FUNCTION public.unpin_showcase_slot(uuid, text) FROM PUBLIC;
GRANT  EXECUTE ON FUNCTION public.unpin_showcase_slot(uuid, text) TO service_role;

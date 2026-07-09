/*
  # Guard inactive agencies from receiving new email rows + cleanup existing violations

  ## Summary
  Two problems proven and fixed here:

  1. **No DB-level guard existed** preventing email rows from being written to
     `is_active = false` agencies. The import pipelines (v1, v2, processor) all
     check `is_active` during the agency *lookup* phase but never re-check it
     immediately before the `INSERT`/`upsert` into `other_agency_emails`. A race
     between deactivation and an in-flight import chunk can write email rows to
     an already-inactive agency.

  2. **Three non-merge deactivation paths** left email rows behind on inactive
     agencies:
     - `deactivate_junk_agency_names` migration (set is_active=false, never called
       merge_duplicate_agencies, so emails were never cleaned up). Affected agencies:
       "RevGen" (2093 emails) and "Integral Marketing Strategies LLC" (1161 emails).
     - Identity-hardened agencies deactivated without a merge call
       ("Create By Influence" x2: 532 + 2 emails).
     - One same-transaction race where email.created_at is 172ms after agency.updated_at
       ("Digital Marketing" / jacobsmithjr.com: 1 email).

  ## What this migration does

  ### Part 1 — Trigger guard
  Adds a BEFORE INSERT trigger on `other_agency_emails` that raises an exception
  if the target `agency_id` resolves to a row with `is_active = false`. This makes
  the guard unconditional regardless of which import path is calling.

  ### Part 2 — Delete orphaned email rows on inactive agencies
  Hard-deletes the 3,789 email rows currently sitting on 5 inactive agencies.
  These rows:
  - Can never be used for SmartLead export (export filters is_active=true)
  - Can never appear on state pages (RLS filters is_active=true)
  - Cause 3,788 cross-agency ambiguous-email collisions in the import pipeline
  - Have zero operational value

  ## Before/after counts
  - Email rows deleted: 3,789 (across 5 inactive agencies)
  - Ambiguous cross-agency email collisions resolved: 3,788
  - Remaining globally duplicated emails after cleanup: ~7 (all junk/shared contacts)

  ## Security
  - No RLS changes
  - Trigger runs as SECURITY INVOKER
*/

-- =============================================================================
-- PART 1: Trigger to block inserts on inactive agencies
-- =============================================================================

CREATE OR REPLACE FUNCTION prevent_email_on_inactive_agency()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_is_active BOOLEAN;
BEGIN
  SELECT is_active INTO v_is_active
  FROM other_agencies
  WHERE id = NEW.agency_id;

  IF v_is_active IS DISTINCT FROM TRUE THEN
    RAISE EXCEPTION
      'Cannot insert email into inactive agency (agency_id=%, is_active=%)',
      NEW.agency_id, v_is_active
      USING ERRCODE = 'integrity_constraint_violation';
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_block_email_on_inactive_agency ON other_agency_emails;

CREATE TRIGGER trg_block_email_on_inactive_agency
  BEFORE INSERT ON other_agency_emails
  FOR EACH ROW
  EXECUTE FUNCTION prevent_email_on_inactive_agency();

-- =============================================================================
-- PART 2: Delete email rows on inactive agencies
-- =============================================================================

DELETE FROM other_agency_emails
WHERE agency_id IN (
  SELECT id FROM other_agencies WHERE is_active = false
);

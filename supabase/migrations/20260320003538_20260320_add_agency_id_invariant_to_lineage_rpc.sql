/*
  # Add agency_id invariant guard to bulk lineage cleaned results RPC

  ## Purpose
  Strengthens the `bulk_apply_lineage_cleaned_results` RPC with an explicit
  invariant: an email row's agency_id must match the lineage record's agency_id
  before any validation update is applied. This prevents a cleaned import from
  silently updating email rows that have been re-linked to a different agency
  between the time of export and the time of import.

  ## Changes

  ### bulk_apply_lineage_cleaned_results (updated)
  - Accepts optional `lineage_agency_id` field in each p_updates element
  - If `lineage_agency_id` is present, adds `AND oae.agency_id = lineage_agency_id`
    to the WHERE clause — the update is skipped for that row if the agency_id
    no longer matches (row was re-linked after export)
  - Returns additional `agency_id_violations` count in the result object
  - Fully backward-compatible: rows without `lineage_agency_id` are updated
    unconditionally (same as before)

  ## Security
  - SECURITY DEFINER, search_path = public (unchanged)
  - The invariant guard is additive — it can only make the function MORE
    restrictive, never less

  ## Invariant being enforced
  - Import must never rewrite an email row to a different agency_id
  - /your-agency URL must always be derived from the linked agency record
  - Validation fields (status/provider/reason/score) are the ONLY things updated
*/

CREATE OR REPLACE FUNCTION bulk_apply_lineage_cleaned_results(
  p_updates JSONB
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_email_rows_updated   INTEGER := 0;
  v_lineage_rows_updated INTEGER := 0;
  v_agency_violations    INTEGER := 0;
  v_now TIMESTAMPTZ := now();
BEGIN
  IF p_updates IS NULL OR jsonb_array_length(p_updates) = 0 THEN
    RETURN jsonb_build_object(
      'email_rows_updated',   0,
      'lineage_rows_updated', 0,
      'agency_id_violations', 0
    );
  END IF;

  -- ── Count rows that WOULD be skipped by agency_id mismatch ────────────────
  SELECT COUNT(*)
  INTO v_agency_violations
  FROM jsonb_array_elements(p_updates) AS u
  JOIN other_agency_emails oae ON oae.id = (u->>'other_agency_email_id')::uuid
  WHERE u->>'lineage_agency_id' IS NOT NULL
    AND oae.agency_id != (u->>'lineage_agency_id')::uuid;

  IF v_agency_violations > 0 THEN
    RAISE WARNING '[bulk_apply_lineage] % email row(s) skipped: agency_id changed since export (invariant guard)', v_agency_violations;
  END IF;

  -- ── Update other_agency_emails (validation fields ONLY) ──────────────────
  -- When lineage_agency_id is supplied, enforce the invariant: only update rows
  -- where the current agency_id still matches the lineage agency_id.
  WITH updates AS (
    SELECT
      (u->>'other_agency_email_id')::uuid          AS email_id,
      CASE WHEN u->>'lineage_agency_id' IS NOT NULL
           THEN (u->>'lineage_agency_id')::uuid
           ELSE NULL
      END                                          AS lineage_agency_id,
      u->>'validation_status'                      AS validation_status,
      u->>'validation_provider'                    AS validation_provider,
      u->>'validation_reason'                      AS validation_reason,
      CASE WHEN u->>'validation_score' IS NOT NULL
           THEN (u->>'validation_score')::numeric
           ELSE NULL
      END                                          AS validation_score
    FROM jsonb_array_elements(p_updates) AS u
  )
  UPDATE other_agency_emails oae
  SET
    validation_status     = upd.validation_status,
    validation_provider   = upd.validation_provider,
    validation_reason     = upd.validation_reason,
    validation_score      = upd.validation_score,
    validation_checked_at = v_now
  FROM updates upd
  WHERE oae.id = upd.email_id
    AND (
      upd.lineage_agency_id IS NULL
      OR oae.agency_id = upd.lineage_agency_id
    );

  GET DIAGNOSTICS v_email_rows_updated = ROW_COUNT;

  -- ── Update lineage rows (match confidence + cleaned status) ───────────────
  WITH updates AS (
    SELECT
      (u->>'lineage_row_id')::uuid AS lineage_row_id,
      u->>'validation_status'      AS cleaned_status,
      CASE WHEN (u->>'is_dedup_anchor')::boolean
           THEN 'exact'
           ELSE 'lineage'
      END                          AS match_confidence
    FROM jsonb_array_elements(p_updates) AS u
  )
  UPDATE other_agency_cleaning_export_rows lcr
  SET
    cleaned_status   = upd.cleaned_status,
    cleaned_at       = v_now,
    matched          = true,
    match_confidence = upd.match_confidence
  FROM updates upd
  WHERE lcr.id = upd.lineage_row_id;

  GET DIAGNOSTICS v_lineage_rows_updated = ROW_COUNT;

  RETURN jsonb_build_object(
    'email_rows_updated',   v_email_rows_updated,
    'lineage_rows_updated', v_lineage_rows_updated,
    'agency_id_violations', v_agency_violations
  );
END;
$$;

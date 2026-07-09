/*
  # Fix bulk_apply_lineage_cleaned_results: invalid match_confidence values

  ## Problem
  The SQL RPC function `bulk_apply_lineage_cleaned_results` was writing
  `match_confidence` values of `'exact_lineage'` and `'dedup_fan_out'` into
  `other_agency_cleaning_export_rows.match_confidence`.

  The column has a CHECK constraint `cleaning_export_rows_confidence_check`
  that only allows: `'exact'`, `'lineage'`, `'ambiguous'`, `'not_found'`.

  Every call to this RPC was failing with:
    "violates check constraint cleaning_export_rows_confidence_check"

  ## Fix
  Replace the two invalid literals in the CASE expression:
    - `'exact_lineage'` → `'exact'`   (anchor/primary deduplicated email)
    - `'dedup_fan_out'` → `'lineage'`  (duplicate rows sharing the same email)

  ## No schema changes
  The constraint is correct. Only the RPC body is corrected.
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
  v_email_rows_updated INTEGER := 0;
  v_lineage_rows_updated INTEGER := 0;
  v_now TIMESTAMPTZ := now();
BEGIN
  IF p_updates IS NULL OR jsonb_array_length(p_updates) = 0 THEN
    RETURN jsonb_build_object(
      'email_rows_updated', 0,
      'lineage_rows_updated', 0
    );
  END IF;

  -- Update other_agency_emails for all entries in one statement
  WITH updates AS (
    SELECT
      (u->>'other_agency_email_id')::uuid AS email_id,
      (u->>'validation_status')           AS validation_status,
      (u->>'validation_provider')         AS validation_provider,
      (u->>'validation_reason')           AS validation_reason,
      CASE WHEN u->>'validation_score' IS NOT NULL
           THEN (u->>'validation_score')::numeric ELSE NULL END AS validation_score
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
  WHERE oae.id = upd.email_id;

  GET DIAGNOSTICS v_email_rows_updated = ROW_COUNT;

  -- Update lineage rows for all entries in one statement
  -- Allowed match_confidence values: 'exact' | 'lineage' | 'ambiguous' | 'not_found'
  -- anchor rows (is_dedup_anchor = true)  → 'exact'
  -- fan-out rows (is_dedup_anchor = false) → 'lineage'
  WITH updates AS (
    SELECT
      (u->>'lineage_row_id')::uuid AS lineage_row_id,
      (u->>'validation_status')    AS cleaned_status,
      CASE WHEN (u->>'is_dedup_anchor')::boolean
           THEN 'exact'
           ELSE 'lineage'
      END AS match_confidence
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
    'lineage_rows_updated', v_lineage_rows_updated
  );
END;
$$;

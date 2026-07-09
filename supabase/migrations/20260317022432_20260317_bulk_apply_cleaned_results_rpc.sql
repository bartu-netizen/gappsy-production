/*
  # Bulk apply cleaned email results via single DB roundtrip

  ## Problem
  The `other-agencies-import-cleaned-results` edge function was processing
  cleaned email results row-by-row: for every row in the CSV it issued 2
  individual UPDATE statements (one to `other_agency_emails`, one to
  `other_agency_cleaning_export_rows`). For a 1793-row file that means
  up to 3,587 sequential DB roundtrips in a single HTTP request, taking
  60-120 seconds and being cut off by the gateway with a 504/502.

  ## Solution
  Two RPC functions that accept the entire result set as a JSONB array and
  apply all updates in one or two SQL statements using unnest / lateral joins.

  ### bulk_apply_lineage_cleaned_results(p_updates JSONB)
  Accepts an array of:
    { lineage_row_id, other_agency_email_id, validation_status,
      validation_provider, validation_reason, validation_score,
      is_dedup_anchor }

  In one CTE it updates ALL matching other_agency_emails rows and ALL
  matching other_agency_cleaning_export_rows rows. Returns counts of
  updated email rows and lineage rows.

  ### bulk_apply_direct_cleaned_results(p_updates JSONB)
  Fallback for when there is no lineage (no export_job_id).
  Accepts an array of:
    { email_id?, agency_id?, email_normalized?, validation_status,
      validation_provider, validation_reason, validation_score }

  Updates other_agency_emails rows matched by:
    - email_id (exact)
    - or (agency_id + email_normalized)
  Returns count of updated rows.

  ## Security
  - SECURITY DEFINER so the edge function (running as anon) can write
    without needing elevated grants
  - search_path set to public
  - Both functions validate input array is not null/empty before executing

  ## Performance
  - 1793-row import: was ~3,587 roundtrips → now 2 roundtrips (one per RPC)
  - Estimated time reduction: from 60-120s to <2s
*/

-- =============================================================================
-- RPC 1: Bulk apply lineage-matched cleaned results
-- =============================================================================

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

-- =============================================================================
-- RPC 2: Bulk apply direct (no-lineage) cleaned results
-- =============================================================================

CREATE OR REPLACE FUNCTION bulk_apply_direct_cleaned_results(
  p_updates JSONB
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_rows_updated INTEGER := 0;
  v_now TIMESTAMPTZ := now();
BEGIN
  IF p_updates IS NULL OR jsonb_array_length(p_updates) = 0 THEN
    RETURN jsonb_build_object('rows_updated', 0);
  END IF;

  -- Update by email_id where present
  WITH updates AS (
    SELECT
      (u->>'email_id')::uuid   AS email_id,
      u->>'validation_status'  AS validation_status,
      u->>'validation_provider' AS validation_provider,
      u->>'validation_reason'   AS validation_reason,
      CASE WHEN u->>'validation_score' IS NOT NULL
           THEN (u->>'validation_score')::numeric ELSE NULL END AS validation_score
    FROM jsonb_array_elements(p_updates) AS u
    WHERE u->>'email_id' IS NOT NULL
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

  GET DIAGNOSTICS v_rows_updated = ROW_COUNT;

  -- Update by (agency_id + email_normalized) for rows without email_id
  WITH updates AS (
    SELECT
      (u->>'agency_id')::uuid          AS agency_id,
      u->>'email_normalized'           AS email_normalized,
      u->>'validation_status'          AS validation_status,
      u->>'validation_provider'        AS validation_provider,
      u->>'validation_reason'          AS validation_reason,
      CASE WHEN u->>'validation_score' IS NOT NULL
           THEN (u->>'validation_score')::numeric ELSE NULL END AS validation_score
    FROM jsonb_array_elements(p_updates) AS u
    WHERE u->>'email_id' IS NULL
      AND u->>'agency_id' IS NOT NULL
      AND u->>'email_normalized' IS NOT NULL
  )
  UPDATE other_agency_emails oae
  SET
    validation_status     = upd.validation_status,
    validation_provider   = upd.validation_provider,
    validation_reason     = upd.validation_reason,
    validation_score      = upd.validation_score,
    validation_checked_at = v_now
  FROM updates upd
  WHERE oae.agency_id = upd.agency_id
    AND oae.email_normalized = upd.email_normalized;

  v_rows_updated := v_rows_updated + (SELECT COUNT(*) FROM (
    SELECT DISTINCT oae.id
    FROM other_agency_emails oae
    JOIN (
      SELECT
        (u->>'agency_id')::uuid AS agency_id,
        u->>'email_normalized'  AS email_normalized
      FROM jsonb_array_elements(p_updates) AS u
      WHERE u->>'email_id' IS NULL
        AND u->>'agency_id' IS NOT NULL
        AND u->>'email_normalized' IS NOT NULL
    ) upd ON oae.agency_id = upd.agency_id
          AND oae.email_normalized = upd.email_normalized
  ) sq);

  RETURN jsonb_build_object('rows_updated', v_rows_updated);
END;
$$;

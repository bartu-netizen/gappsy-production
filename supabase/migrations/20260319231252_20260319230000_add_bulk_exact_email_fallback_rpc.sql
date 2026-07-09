/*
  # Add bulk_apply_exact_email_fallback RPC

  ## Problem Fixed

  The ListClean import function's "unique email" fallback tier (Tier 3) was
  completely broken for large files. When 700+ unmatched emails were sent as
  a `.in("email_normalized", [...])` query via PostgREST, the resulting URL
  exceeded the HTTP URL length limit (~8KB). The request silently failed,
  `candidateError` was set but ignored, and `via_unique_email` stayed at 0.

  This caused 62% of cleaned emails to be lost on import for the North Carolina
  file (1,198 rows → only 455 matched via lineage, 743 unmatched).

  ## Solution

  A single server-side RPC that accepts a JSONB array of {email_normalized,
  validation_status, validation_provider, validation_reason, validation_score}
  rows and does everything inside Postgres in one round-trip:

  1. Normalize all input emails (lowercase + trim)
  2. Join against other_agency_emails to find candidate rows
  3. Use window function COUNT() OVER PARTITION to detect ambiguity
  4. Update ONLY rows where exactly 1 DB record exists for that email
  5. Skip (and count) emails that match multiple DB records (ambiguous)
  6. Return detailed stats: unique_updated, ambiguous_skipped, not_found

  ## Safety Guarantees

  - NEVER updates an email that matches multiple agencies (ambiguous_skipped)
  - Uses lower(trim()) on both sides for case-insensitive exact matching
  - NO fuzzy matching, NO domain matching, NO "first match wins"
  - SECURITY DEFINER with fixed search_path = public

  ## Performance

  - 1 DB roundtrip regardless of array size (was: 1 failing HTTP call)
  - Uses window function for ambiguity detection in single pass
  - Avoids URL length limit entirely (JSONB POST body)

  ## Returns

  - unique_updated: number of email rows successfully updated
  - ambiguous_skipped: number of emails that matched multiple DB records (skipped)
  - not_found: number of emails with zero DB matches
*/

CREATE OR REPLACE FUNCTION bulk_apply_exact_email_fallback(
  p_updates JSONB
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_unique_updated    INTEGER := 0;
  v_ambiguous_skipped INTEGER := 0;
  v_not_found         INTEGER := 0;
  v_total_input       INTEGER := 0;
  v_now               TIMESTAMPTZ := now();
BEGIN
  IF p_updates IS NULL OR jsonb_array_length(p_updates) = 0 THEN
    RETURN jsonb_build_object(
      'unique_updated',    0,
      'ambiguous_skipped', 0,
      'not_found',         0
    );
  END IF;

  v_total_input := jsonb_array_length(p_updates);

  -- Single CTE chain:
  -- 1. Parse and normalize input
  -- 2. Join DB rows, compute per-email match count via window function
  -- 3. Update ONLY rows with match_count = 1
  -- 4. Count ambiguous emails separately
  WITH
  input_emails AS (
    SELECT
      lower(trim(u->>'email_normalized'))  AS email_norm,
      u->>'validation_status'             AS validation_status,
      u->>'validation_provider'           AS validation_provider,
      u->>'validation_reason'             AS validation_reason,
      CASE
        WHEN u->>'validation_score' IS NOT NULL AND u->>'validation_score' <> ''
        THEN (u->>'validation_score')::numeric
        ELSE NULL
      END AS validation_score
    FROM jsonb_array_elements(p_updates) AS u
    WHERE u->>'email_normalized' IS NOT NULL
      AND trim(u->>'email_normalized') <> ''
  ),
  -- Find all DB rows that match any of the input emails
  -- Use window COUNT to detect ambiguity within a single scan
  candidate_rows AS (
    SELECT
      oae.id,
      lower(trim(oae.email_normalized))                                         AS email_norm,
      COUNT(*) OVER (PARTITION BY lower(trim(oae.email_normalized)))            AS match_count
    FROM other_agency_emails oae
    INNER JOIN input_emails ie
            ON lower(trim(oae.email_normalized)) = ie.email_norm
  ),
  -- Only keep rows where exactly 1 DB record exists for that email
  unique_candidates AS (
    SELECT id, email_norm
    FROM candidate_rows
    WHERE match_count = 1
  ),
  -- Data-modifying CTE: apply updates for unique matches only
  updated AS (
    UPDATE other_agency_emails oae
    SET
      validation_status     = ie.validation_status,
      validation_provider   = ie.validation_provider,
      validation_reason     = ie.validation_reason,
      validation_score      = ie.validation_score,
      validation_checked_at = v_now
    FROM unique_candidates uc
    INNER JOIN input_emails ie ON ie.email_norm = uc.email_norm
    WHERE oae.id = uc.id
    RETURNING oae.id
  )
  SELECT COUNT(*) INTO v_unique_updated FROM updated;

  -- Count distinct ambiguous emails (matched multiple DB rows → skipped)
  SELECT COUNT(DISTINCT email_norm) INTO v_ambiguous_skipped
  FROM candidate_rows
  WHERE match_count > 1;

  -- Compute not_found: input emails with zero DB matches at all
  v_not_found := v_total_input - v_unique_updated - v_ambiguous_skipped;
  IF v_not_found < 0 THEN
    v_not_found := 0;
  END IF;

  RETURN jsonb_build_object(
    'unique_updated',    v_unique_updated,
    'ambiguous_skipped', v_ambiguous_skipped,
    'not_found',         v_not_found
  );
END;
$$;

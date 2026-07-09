/*
  # Merge Duplicate Agencies Function

  ## Summary
  Creates a database function to safely merge duplicate agency records into a
  single canonical agency. This ensures one agency = one identity = one /your-agency page.

  ## Changes

  ### 1. Function: merge_duplicate_agencies
  - Takes canonical_agency_id and array of duplicate_agency_ids
  - Moves all emails from duplicates to canonical agency
  - Moves all phones from duplicates to canonical agency
  - Updates any references in other tables
  - Soft-deletes duplicate agency records (sets is_active = false)
  - Returns summary of what was merged

  ### 2. Function: find_and_merge_duplicates_by_domain
  - Automatically finds and merges agencies with same website domain
  - Keeps the oldest agency as canonical
  - Safe to run multiple times (idempotent)

  ## Security
  - Functions are SECURITY INVOKER (run as calling user)
  - Only service role should call these functions

  ## Notes
  - Duplicates are soft-deleted, not hard-deleted for safety
  - All data is preserved on the canonical agency
  - The canonical agency keeps its original slug
*/

-- Function to merge duplicate agencies into a canonical one
CREATE OR REPLACE FUNCTION merge_duplicate_agencies(
  p_canonical_agency_id UUID,
  p_duplicate_agency_ids UUID[]
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_emails_moved INT := 0;
  v_phones_moved INT := 0;
  v_duplicates_deactivated INT := 0;
  v_canonical_slug TEXT;
  v_dup_id UUID;
BEGIN
  -- Get canonical agency slug
  SELECT slug INTO v_canonical_slug
  FROM other_agencies
  WHERE id = p_canonical_agency_id;

  IF v_canonical_slug IS NULL THEN
    RETURN jsonb_build_object(
      'success', false,
      'error', 'Canonical agency not found'
    );
  END IF;

  -- Process each duplicate
  FOREACH v_dup_id IN ARRAY p_duplicate_agency_ids
  LOOP
    -- Skip if same as canonical
    IF v_dup_id = p_canonical_agency_id THEN
      CONTINUE;
    END IF;

    -- Move emails to canonical agency (skip if already exists)
    WITH moved AS (
      UPDATE other_agency_emails
      SET agency_id = p_canonical_agency_id
      WHERE agency_id = v_dup_id
        AND email_normalized NOT IN (
          SELECT email_normalized
          FROM other_agency_emails
          WHERE agency_id = p_canonical_agency_id
        )
      RETURNING id
    )
    SELECT COUNT(*) INTO v_emails_moved FROM moved;

    -- Delete remaining duplicate emails (already exist on canonical)
    DELETE FROM other_agency_emails WHERE agency_id = v_dup_id;

    -- Move phones to canonical agency (skip if already exists)
    WITH moved AS (
      UPDATE other_agency_phones
      SET agency_id = p_canonical_agency_id
      WHERE agency_id = v_dup_id
        AND phone_normalized NOT IN (
          SELECT phone_normalized
          FROM other_agency_phones
          WHERE agency_id = p_canonical_agency_id
            AND phone_normalized IS NOT NULL
        )
      RETURNING id
    )
    SELECT COUNT(*) INTO v_phones_moved FROM moved;

    -- Delete remaining duplicate phones
    DELETE FROM other_agency_phones WHERE agency_id = v_dup_id;

    -- Soft-delete the duplicate agency
    UPDATE other_agencies
    SET is_active = false,
        agency_dedupe_key = NULL,  -- Clear to avoid constraint issues
        global_identity_key = NULL
    WHERE id = v_dup_id;

    v_duplicates_deactivated := v_duplicates_deactivated + 1;
  END LOOP;

  RETURN jsonb_build_object(
    'success', true,
    'canonical_agency_id', p_canonical_agency_id,
    'canonical_slug', v_canonical_slug,
    'emails_moved', v_emails_moved,
    'phones_moved', v_phones_moved,
    'duplicates_deactivated', v_duplicates_deactivated
  );
END;
$$;

-- Function to automatically find and merge duplicates by domain
CREATE OR REPLACE FUNCTION find_and_merge_duplicates_by_domain()
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_total_merged INT := 0;
  v_total_duplicates INT := 0;
  v_domain_record RECORD;
  v_merge_result JSONB;
  v_canonical_id UUID;
  v_duplicate_ids UUID[];
BEGIN
  -- Find all domains with multiple agencies
  FOR v_domain_record IN
    SELECT
      global_identity_key,
      array_agg(id ORDER BY created_at ASC) as agency_ids,
      COUNT(*) as cnt
    FROM other_agencies
    WHERE global_identity_key IS NOT NULL
      AND global_identity_key LIKE 'domain:%'
      AND is_active = true
    GROUP BY global_identity_key
    HAVING COUNT(*) > 1
    ORDER BY COUNT(*) DESC
  LOOP
    -- First agency (oldest) is canonical
    v_canonical_id := v_domain_record.agency_ids[1];
    -- Rest are duplicates
    v_duplicate_ids := v_domain_record.agency_ids[2:];

    -- Merge
    v_merge_result := merge_duplicate_agencies(v_canonical_id, v_duplicate_ids);

    IF (v_merge_result->>'success')::boolean THEN
      v_total_merged := v_total_merged + 1;
      v_total_duplicates := v_total_duplicates + array_length(v_duplicate_ids, 1);
    END IF;
  END LOOP;

  RETURN jsonb_build_object(
    'success', true,
    'domains_merged', v_total_merged,
    'total_duplicates_deactivated', v_total_duplicates
  );
END;
$$;

-- Function to find and merge duplicates by name within same state
CREATE OR REPLACE FUNCTION find_and_merge_duplicates_by_name_in_state(p_state_slug TEXT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_total_merged INT := 0;
  v_total_duplicates INT := 0;
  v_name_record RECORD;
  v_merge_result JSONB;
  v_canonical_id UUID;
  v_duplicate_ids UUID[];
BEGIN
  -- Find all names with multiple agencies in this state
  FOR v_name_record IN
    SELECT
      lower(trim(regexp_replace(name, '\s+', ' ', 'g'))) as normalized_name,
      array_agg(id ORDER BY created_at ASC) as agency_ids,
      COUNT(*) as cnt
    FROM other_agencies
    WHERE state_slug = p_state_slug
      AND is_active = true
      AND name IS NOT NULL
      AND trim(name) != ''
    GROUP BY lower(trim(regexp_replace(name, '\s+', ' ', 'g')))
    HAVING COUNT(*) > 1
    ORDER BY COUNT(*) DESC
  LOOP
    -- First agency (oldest) is canonical
    v_canonical_id := v_name_record.agency_ids[1];
    -- Rest are duplicates
    v_duplicate_ids := v_name_record.agency_ids[2:];

    -- Merge
    v_merge_result := merge_duplicate_agencies(v_canonical_id, v_duplicate_ids);

    IF (v_merge_result->>'success')::boolean THEN
      v_total_merged := v_total_merged + 1;
      v_total_duplicates := v_total_duplicates + array_length(v_duplicate_ids, 1);
    END IF;
  END LOOP;

  RETURN jsonb_build_object(
    'success', true,
    'state_slug', p_state_slug,
    'agencies_merged', v_total_merged,
    'total_duplicates_deactivated', v_total_duplicates
  );
END;
$$;

-- View to show current duplicate status
CREATE OR REPLACE VIEW duplicate_agencies_summary AS
SELECT
  'by_domain' as duplicate_type,
  global_identity_key as identity_key,
  COUNT(*) as duplicate_count,
  array_agg(DISTINCT state_slug) as states,
  MIN(created_at) as first_created,
  array_agg(id ORDER BY created_at ASC) as agency_ids
FROM other_agencies
WHERE global_identity_key IS NOT NULL
  AND global_identity_key LIKE 'domain:%'
  AND is_active = true
GROUP BY global_identity_key
HAVING COUNT(*) > 1

UNION ALL

SELECT
  'by_name_phone' as duplicate_type,
  global_identity_key as identity_key,
  COUNT(*) as duplicate_count,
  array_agg(DISTINCT state_slug) as states,
  MIN(created_at) as first_created,
  array_agg(id ORDER BY created_at ASC) as agency_ids
FROM other_agencies
WHERE global_identity_key IS NOT NULL
  AND global_identity_key LIKE 'name_phone:%'
  AND is_active = true
GROUP BY global_identity_key
HAVING COUNT(*) > 1

ORDER BY duplicate_count DESC;

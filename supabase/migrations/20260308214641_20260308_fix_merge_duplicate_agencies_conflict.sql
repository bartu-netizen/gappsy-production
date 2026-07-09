/*
  # Fix merge_duplicate_agencies conflict handling

  1. Changes
    - Update merge_duplicate_agencies function to handle agency_listings_index conflicts
    - Delete duplicate index entries rather than updating to avoid unique constraint violations
    
  2. Security
    - Function retains search_path setting for security
*/

CREATE OR REPLACE FUNCTION public.merge_duplicate_agencies(p_canonical_agency_id uuid, p_duplicate_agency_ids uuid[])
RETURNS jsonb
LANGUAGE plpgsql
SET search_path TO 'public'
AS $function$
DECLARE
  v_emails_moved INT := 0;
  v_phones_moved INT := 0;
  v_states_moved INT := 0;
  v_duplicates_deactivated INT := 0;
  v_canonical_slug TEXT;
  v_dup_id UUID;
  v_moved_count INT;
BEGIN
  SELECT slug INTO v_canonical_slug
  FROM other_agencies
  WHERE id = p_canonical_agency_id;

  IF v_canonical_slug IS NULL THEN
    RETURN jsonb_build_object(
      'success', false,
      'error', 'Canonical agency not found'
    );
  END IF;

  FOREACH v_dup_id IN ARRAY p_duplicate_agency_ids
  LOOP
    IF v_dup_id = p_canonical_agency_id THEN
      CONTINUE;
    END IF;

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
    SELECT COUNT(*) INTO v_moved_count FROM moved;
    v_emails_moved := v_emails_moved + v_moved_count;

    DELETE FROM other_agency_emails WHERE agency_id = v_dup_id;

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
    SELECT COUNT(*) INTO v_moved_count FROM moved;
    v_phones_moved := v_phones_moved + v_moved_count;

    DELETE FROM other_agency_phones WHERE agency_id = v_dup_id;

    WITH moved AS (
      UPDATE other_agency_state_listings
      SET agency_id = p_canonical_agency_id
      WHERE agency_id = v_dup_id
      AND state_slug NOT IN (
        SELECT state_slug
        FROM other_agency_state_listings
        WHERE agency_id = p_canonical_agency_id
      )
      RETURNING id
    )
    SELECT COUNT(*) INTO v_moved_count FROM moved;
    v_states_moved := v_states_moved + v_moved_count;

    DELETE FROM other_agency_state_listings WHERE agency_id = v_dup_id;

    DELETE FROM agency_listings_index
    WHERE agency_id = v_dup_id::text
    AND (state_slug, section) IN (
      SELECT state_slug, section
      FROM agency_listings_index
      WHERE agency_id = p_canonical_agency_id::text
    );

    UPDATE agency_listings_index
    SET agency_id = p_canonical_agency_id::text,
        agency_slug = v_canonical_slug
    WHERE agency_id = v_dup_id::text;

    UPDATE other_agencies
    SET is_active = false,
        agency_dedupe_key = NULL,
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
    'states_moved', v_states_moved,
    'duplicates_deactivated', v_duplicates_deactivated
  );
END;
$function$;

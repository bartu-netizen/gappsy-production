/*
  # Safe Agency Dedup System

  ## Purpose
  Introduces data-safe duplicate agency detection, preview, and merge tools that
  enforce strict email-ownership rules before any reassignment. This is NOT a
  bulk auto-merge — every email is individually classified before being moved.

  ## Business rules enforced
  - One real agency = one canonical agency record = one /your-agency URL
  - Multiple emails per agency are ALLOWED and preserved
  - An email is only moved to canonical if ownership can be proven
  - Emails flagged as unsafe are LEFT on the (soon-to-be-deactivated) duplicate
    and must be reviewed manually — they are NEVER silently lost

  ## New functions
  1. `preview_safe_agency_merge(canonical_id, duplicate_ids[], detection_priority)`
     → Returns a full preview: canonical info, duplicate info, emails_will_move,
       emails_wont_move, emails_already_on_canonical
  2. `safe_merge_duplicate_agencies(canonical_id, duplicate_ids[], detection_priority, dry_run)`
     → Executes the merge with the ownership rules; dry_run returns plan only

  ## New trigger
  3. `trg_other_agencies_compute_domain`
     → Automatically populates website_domain_normalized from website_url on
       INSERT / UPDATE when website_domain_normalized is NULL, so future imports
       can never create agency records without a domain key set.

  ## One-time backfill
  4. Backfills website_domain_normalized for existing active agencies that have
     website_url but NULL website_domain_normalized.

  ## Security
  - Both functions are SECURITY INVOKER (caller must have table access)
  - search_path pinned to public
*/

-- ─────────────────────────────────────────────────────────────────────────────
-- 1. preview_safe_agency_merge
-- ─────────────────────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION preview_safe_agency_merge(
  p_canonical_agency_id UUID,
  p_duplicate_agency_ids UUID[],
  p_detection_priority INT DEFAULT 5
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_canonical     RECORD;
  v_dup_id        UUID;
  v_dup           RECORD;
  v_email         RECORD;
  v_is_safe       BOOLEAN;
  v_reason        TEXT;
  v_on_canonical  BOOLEAN;
  v_emails_safe   JSONB[] := '{}';
  v_emails_unsafe JSONB[] := '{}';
  v_emails_skip   JSONB[] := '{}';
  v_dup_info      JSONB[] := '{}';
  v_generic_domains TEXT[] := ARRAY[
    'gmail.com','yahoo.com','hotmail.com','outlook.com','aol.com',
    'icloud.com','protonmail.com','mail.com','live.com','msn.com',
    'yahoo.co.uk','googlemail.com','ymail.com','me.com','mac.com'
  ];
BEGIN
  SELECT id, name, slug, state_slug, website_url, website_domain_normalized
  INTO v_canonical
  FROM other_agencies WHERE id = p_canonical_agency_id;

  IF NOT FOUND THEN
    RETURN jsonb_build_object('ok', false, 'error',
      'Canonical agency not found: ' || p_canonical_agency_id);
  END IF;

  FOREACH v_dup_id IN ARRAY p_duplicate_agency_ids LOOP

    SELECT id, name, slug, state_slug, website_url, website_domain_normalized,
           global_identity_key, is_active
    INTO v_dup
    FROM other_agencies WHERE id = v_dup_id;

    IF NOT FOUND THEN CONTINUE; END IF;

    v_dup_info := array_append(v_dup_info, jsonb_build_object(
      'id',                       v_dup.id,
      'name',                     v_dup.name,
      'slug',                     v_dup.slug,
      'state_slug',               v_dup.state_slug,
      'website_url',              v_dup.website_url,
      'website_domain_normalized',v_dup.website_domain_normalized,
      'is_active',                v_dup.is_active
    ));

    FOR v_email IN
      SELECT id, email_raw, email_normalized, email_domain,
             validation_status, domain_match_status,
             is_identity_contaminated, is_primary, source
      FROM other_agency_emails
      WHERE agency_id = v_dup_id
    LOOP
      -- Check if this email is already attached to canonical
      SELECT EXISTS(
        SELECT 1 FROM other_agency_emails
        WHERE agency_id = p_canonical_agency_id
          AND email_normalized = v_email.email_normalized
      ) INTO v_on_canonical;

      IF v_on_canonical THEN
        v_emails_skip := array_append(v_emails_skip, jsonb_build_object(
          'email_id',          v_email.id,
          'email_normalized',  v_email.email_normalized,
          'email_domain',      v_email.email_domain,
          'source_agency_id',  v_dup_id,
          'source_agency_name',v_dup.name,
          'reason',            'already_on_canonical',
          'validation_status', v_email.validation_status,
          'is_primary',        v_email.is_primary
        ));
        CONTINUE;
      END IF;

      v_is_safe := FALSE;
      v_reason  := 'ownership_unproven';

      -- RULE 1: Marked contaminated → never move
      IF v_email.is_identity_contaminated = TRUE THEN
        v_is_safe := FALSE;
        v_reason  := 'identity_contaminated';

      -- RULE 2: Generic provider domain → never move
      ELSIF v_email.email_domain = ANY(v_generic_domains) THEN
        v_is_safe := FALSE;
        v_reason  := 'generic_email_domain';

      -- RULE 3: Email's own domain matches canonical website domain → safe
      ELSIF v_canonical.website_domain_normalized IS NOT NULL
        AND v_email.email_domain IS NOT NULL
        AND lower(v_email.email_domain) = lower(v_canonical.website_domain_normalized) THEN
        v_is_safe := TRUE;
        v_reason  := 'email_domain_matches_canonical';

      -- RULE 4: Both agencies share the same domain, email domain matches → safe
      ELSIF v_canonical.website_domain_normalized IS NOT NULL
        AND v_dup.website_domain_normalized IS NOT NULL
        AND lower(v_canonical.website_domain_normalized) = lower(v_dup.website_domain_normalized)
        AND v_email.email_domain IS NOT NULL
        AND lower(v_email.email_domain) = lower(v_dup.website_domain_normalized) THEN
        v_is_safe := TRUE;
        v_reason  := 'both_agencies_share_domain';

      -- RULE 5: Priority-1 cluster (domain identity) and email not contaminated → safe
      ELSIF p_detection_priority = 1
        AND COALESCE(v_email.domain_match_status, '') != 'different_business_domain' THEN
        v_is_safe := TRUE;
        v_reason  := 'priority_1_domain_cluster';

      -- RULE 6: Strong cluster (≤3) and domain_match_status confirmed same domain
      ELSIF p_detection_priority <= 3
        AND v_email.domain_match_status = 'same_domain' THEN
        v_is_safe := TRUE;
        v_reason  := 'domain_match_status_confirmed';

      -- RULE 7: Insufficient evidence
      ELSE
        v_is_safe := FALSE;
        v_reason  := CASE
          WHEN v_email.email_domain IS NULL                        THEN 'no_email_domain'
          WHEN v_canonical.website_domain_normalized IS NULL       THEN 'canonical_has_no_domain'
          WHEN p_detection_priority >= 4                           THEN 'weak_detection_signal_p' || p_detection_priority
          ELSE 'ownership_unproven'
        END;
      END IF;

      IF v_is_safe THEN
        v_emails_safe := array_append(v_emails_safe, jsonb_build_object(
          'email_id',          v_email.id,
          'email_normalized',  v_email.email_normalized,
          'email_domain',      v_email.email_domain,
          'source_agency_id',  v_dup_id,
          'source_agency_name',v_dup.name,
          'reason',            v_reason,
          'validation_status', v_email.validation_status,
          'is_primary',        v_email.is_primary
        ));
      ELSE
        v_emails_unsafe := array_append(v_emails_unsafe, jsonb_build_object(
          'email_id',          v_email.id,
          'email_normalized',  v_email.email_normalized,
          'email_domain',      v_email.email_domain,
          'source_agency_id',  v_dup_id,
          'source_agency_name',v_dup.name,
          'reason',            v_reason,
          'validation_status', v_email.validation_status,
          'is_primary',        v_email.is_primary
        ));
      END IF;
    END LOOP;
  END LOOP;

  RETURN jsonb_build_object(
    'ok',                        true,
    'canonical', jsonb_build_object(
      'id',                        v_canonical.id,
      'name',                      v_canonical.name,
      'slug',                      v_canonical.slug,
      'state_slug',                v_canonical.state_slug,
      'website_url',               v_canonical.website_url,
      'website_domain_normalized', v_canonical.website_domain_normalized,
      'your_agency_url',           '/your-agency/' || v_canonical.slug
    ),
    'duplicates',                  to_jsonb(v_dup_info),
    'emails_will_move',            to_jsonb(v_emails_safe),
    'emails_wont_move',            to_jsonb(v_emails_unsafe),
    'emails_already_on_canonical', to_jsonb(v_emails_skip),
    'detection_priority',          p_detection_priority,
    'summary', jsonb_build_object(
      'emails_to_move',            COALESCE(array_length(v_emails_safe,   1), 0),
      'emails_flagged',            COALESCE(array_length(v_emails_unsafe,  1), 0),
      'emails_skipped',            COALESCE(array_length(v_emails_skip,    1), 0),
      'duplicates_to_deactivate',  COALESCE(array_length(p_duplicate_agency_ids, 1), 0)
    )
  );
END;
$$;

-- ─────────────────────────────────────────────────────────────────────────────
-- 2. safe_merge_duplicate_agencies
-- ─────────────────────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION safe_merge_duplicate_agencies(
  p_canonical_agency_id UUID,
  p_duplicate_agency_ids UUID[],
  p_detection_priority INT DEFAULT 5,
  p_dry_run BOOLEAN DEFAULT TRUE
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_preview          JSONB;
  v_email_rec        JSONB;
  v_dup_id           UUID;
  v_emails_moved     INT := 0;
  v_emails_removed   INT := 0;
  v_dups_deactivated INT := 0;
BEGIN
  -- Always compute preview first
  v_preview := preview_safe_agency_merge(
    p_canonical_agency_id,
    p_duplicate_agency_ids,
    p_detection_priority
  );

  IF NOT (v_preview->>'ok')::BOOLEAN THEN
    RETURN v_preview;
  END IF;

  -- Dry-run: return the plan without touching any rows
  IF p_dry_run THEN
    RETURN jsonb_build_object(
      'ok',                         true,
      'dry_run',                    true,
      'canonical_agency_id',        p_canonical_agency_id,
      'canonical_slug',             v_preview->'canonical'->>'slug',
      'your_agency_url',            '/your-agency/' || (v_preview->'canonical'->>'slug'),
      'emails_will_move',           COALESCE(jsonb_array_length(v_preview->'emails_will_move'), 0),
      'emails_flagged_review',      COALESCE(jsonb_array_length(v_preview->'emails_wont_move'), 0),
      'emails_already_on_canonical',COALESCE(jsonb_array_length(v_preview->'emails_already_on_canonical'), 0),
      'duplicates_to_deactivate',   COALESCE(array_length(p_duplicate_agency_ids, 1), 0),
      'preview',                    v_preview
    );
  END IF;

  -- ── LIVE MERGE ────────────────────────────────────────────────────────────

  -- Step 1: Move safe emails to canonical
  FOR v_email_rec IN SELECT value FROM jsonb_array_elements(v_preview->'emails_will_move')
  LOOP
    BEGIN
      UPDATE other_agency_emails
      SET    agency_id  = p_canonical_agency_id,
             updated_at = now()
      WHERE  id         = (v_email_rec->>'email_id')::UUID
        AND  agency_id != p_canonical_agency_id;

      IF FOUND THEN
        v_emails_moved := v_emails_moved + 1;
      END IF;
    EXCEPTION WHEN unique_violation THEN
      -- Race: email was already moved; delete the orphaned duplicate row
      DELETE FROM other_agency_emails
      WHERE id = (v_email_rec->>'email_id')::UUID
        AND agency_id != p_canonical_agency_id;
      v_emails_removed := v_emails_removed + 1;
    END;
  END LOOP;

  -- Step 2: Delete emails already present on canonical (from duplicate agencies)
  FOR v_email_rec IN SELECT value FROM jsonb_array_elements(v_preview->'emails_already_on_canonical')
  LOOP
    DELETE FROM other_agency_emails
    WHERE id       = (v_email_rec->>'email_id')::UUID
      AND agency_id != p_canonical_agency_id;

    IF FOUND THEN
      v_emails_removed := v_emails_removed + 1;
    END IF;
  END LOOP;

  -- Step 3: Deactivate duplicate agency shells
  -- NOTE: unsafe emails remain attached to the now-inactive duplicate so they
  --       are never silently lost — admins can find and review them.
  FOREACH v_dup_id IN ARRAY p_duplicate_agency_ids LOOP
    IF v_dup_id = p_canonical_agency_id THEN
      CONTINUE;  -- never self-deactivate
    END IF;

    UPDATE other_agencies
    SET    is_active         = FALSE,
           agency_dedupe_key = NULL,
           global_identity_key = NULL,
           updated_at        = now()
    WHERE  id = v_dup_id;

    IF FOUND THEN
      v_dups_deactivated := v_dups_deactivated + 1;
    END IF;
  END LOOP;

  RETURN jsonb_build_object(
    'ok',                      true,
    'dry_run',                 false,
    'canonical_agency_id',     p_canonical_agency_id,
    'canonical_slug',          v_preview->'canonical'->>'slug',
    'your_agency_url',         '/your-agency/' || (v_preview->'canonical'->>'slug'),
    'emails_moved',            v_emails_moved,
    'emails_removed_duplicate',v_emails_removed,
    'emails_flagged_untouched',COALESCE(jsonb_array_length(v_preview->'emails_wont_move'), 0),
    'duplicates_deactivated',  v_dups_deactivated
  );
END;
$$;

-- ─────────────────────────────────────────────────────────────────────────────
-- 3. Trigger: auto-compute website_domain_normalized from website_url
-- ─────────────────────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION fn_compute_agency_domain_normalized()
RETURNS TRIGGER
LANGUAGE plpgsql
SET search_path = public
AS $$
DECLARE
  v_domain TEXT;
BEGIN
  IF NEW.website_domain_normalized IS NULL AND NEW.website_url IS NOT NULL THEN
    -- Strip protocol, www prefix, path, query, fragment; lowercase
    v_domain := lower(
      regexp_replace(
        regexp_replace(
          regexp_replace(
            trim(NEW.website_url),
            '^https?://(www\.)?', '', 'i'
          ),
          '[/?#].*$', ''
        ),
        '\s+', ''
      )
    );
    -- Accept only strings that look like a real domain (has a dot, reasonable length)
    IF length(v_domain) >= 4 AND v_domain LIKE '%.%' THEN
      NEW.website_domain_normalized := v_domain;
    END IF;
  END IF;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_other_agencies_compute_domain ON other_agencies;
CREATE TRIGGER trg_other_agencies_compute_domain
  BEFORE INSERT OR UPDATE OF website_url
  ON other_agencies
  FOR EACH ROW
  EXECUTE FUNCTION fn_compute_agency_domain_normalized();

-- ─────────────────────────────────────────────────────────────────────────────
-- 4. One-time backfill of website_domain_normalized for existing agencies
-- ─────────────────────────────────────────────────────────────────────────────
UPDATE other_agencies
SET    website_domain_normalized = lower(
         regexp_replace(
           regexp_replace(
             regexp_replace(trim(website_url), '^https?://(www\.)?', '', 'i'),
             '[/?#].*$', ''
           ),
           '\s+', ''
         )
       )
WHERE  website_domain_normalized IS NULL
  AND  website_url IS NOT NULL
  AND  is_active = true
  AND  length(
         lower(
           regexp_replace(
             regexp_replace(
               regexp_replace(trim(website_url), '^https?://(www\.)?', '', 'i'),
               '[/?#].*$', ''
             ),
             '\s+', ''
           )
         )
       ) >= 4;

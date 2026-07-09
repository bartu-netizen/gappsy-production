/*
  # Placeholder and Shared Email Flags

  ## Summary
  Adds four boolean flag columns to `other_agency_emails` to identify and suppress
  junk/placeholder emails and emails that are shared across multiple agency records.

  ## New Columns on `other_agency_emails`
  - `is_placeholder_email`       — email matches known placeholder/fake patterns
  - `is_shared_conflict`         — same normalized email is attached to 2+ active agencies
  - `exclude_from_outreach`      — should NOT be exported to ListClean / Smartlead
  - `exclude_from_agency_lookup` — should NOT be used to resolve a canonical agency

  ## New Functions
  - `is_placeholder_email_check(TEXT)` — immutable helper; returns TRUE for known fakes
  - `fn_compute_email_placeholder_flags()` — trigger function; auto-sets flags on INSERT/UPDATE
  - `refresh_shared_email_conflicts()` — batch function; recomputes `is_shared_conflict`
    and cascades to the two exclude columns.  Call after bulk imports.

  ## New Trigger
  - `trg_other_agency_emails_compute_flags` — BEFORE INSERT OR UPDATE OF email_normalized,
    is_shared_conflict, is_identity_contaminated — keeps flags in sync on every write.

  ## Backfill
  - Backfills `is_placeholder_email` and initial exclude flags for all existing rows.
  - Runs `refresh_shared_email_conflicts()` to mark every row whose email appears on
    2+ active agencies.

  ## Security
  - No RLS changes — functions run as SECURITY INVOKER; service-role key required for DML.

  ## Important Notes
  1. `is_shared_conflict` is a cross-row property and CANNOT be maintained by a single-row
     trigger alone.  Always call `refresh_shared_email_conflicts()` after bulk operations.
  2. Placeholder detection is intentionally conservative — only clear-cut junk patterns.
     Real `info@company.com` emails are NOT flagged; only `info@yoursite.com` (fake domain).
  3. The exclude flags are derived; they are recomputed by the trigger whenever any source
     flag changes.  Do not set them manually.
*/

-- ── Step 1: Add columns ───────────────────────────────────────────────────────
ALTER TABLE other_agency_emails
  ADD COLUMN IF NOT EXISTS is_placeholder_email       BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS is_shared_conflict         BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS exclude_from_outreach      BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS exclude_from_agency_lookup BOOLEAN NOT NULL DEFAULT FALSE;

-- ── Step 2: Indexes for fast filtering ───────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_oae_exclude_outreach
  ON other_agency_emails (exclude_from_outreach)
  WHERE exclude_from_outreach = TRUE;

CREATE INDEX IF NOT EXISTS idx_oae_exclude_lookup
  ON other_agency_emails (exclude_from_agency_lookup)
  WHERE exclude_from_agency_lookup = TRUE;

CREATE INDEX IF NOT EXISTS idx_oae_placeholder
  ON other_agency_emails (is_placeholder_email)
  WHERE is_placeholder_email = TRUE;

CREATE INDEX IF NOT EXISTS idx_oae_shared_conflict
  ON other_agency_emails (is_shared_conflict)
  WHERE is_shared_conflict = TRUE;

-- ── Step 3: Immutable helper — placeholder pattern check ─────────────────────
CREATE OR REPLACE FUNCTION is_placeholder_email_check(p_email TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
IMMUTABLE
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_local  TEXT;
  v_domain TEXT;
  v_parts  TEXT[];
BEGIN
  IF p_email IS NULL OR p_email NOT LIKE '%@%' THEN
    RETURN FALSE;
  END IF;

  v_parts := string_to_array(lower(trim(p_email)), '@');
  IF array_length(v_parts, 1) != 2 THEN RETURN FALSE; END IF;

  v_local  := v_parts[1];
  v_domain := v_parts[2];

  -- ── Placeholder/fake domains ─────────────────────────────────────────────
  IF v_domain IN (
    'example.com', 'example.org', 'example.net',
    'test.com',    'test.org',    'test.net',
    'placeholder.com', 'yoursite.com', 'yourdomain.com',
    'youremail.com',   'domain.com',   'website.com',
    'sample.com',      'fakeemail.com','doe.com',
    'nodomain.com',    'nomail.com',   'tempmail.com',
    'mailtest.com',    'fakemail.com', 'fake.com'
  ) THEN
    RETURN TRUE;
  END IF;

  -- ── Placeholder local parts (exact match) ────────────────────────────────
  IF v_local IN (
    'test', 'example', 'sample', 'placeholder', 'demo',
    'noreply', 'no-reply', 'no_reply', 'donotreply', 'do-not-reply',
    'yourname', 'yourmail', 'youremail', 'youremailhere',
    'email', 'user', 'name', 'someone', 'nobody',
    'enter_email', 'enteremail', 'emailaddress'
  ) THEN
    RETURN TRUE;
  END IF;

  -- ── Placeholder local prefixes (short test* patterns) ────────────────────
  IF v_local LIKE 'test%' AND length(v_local) <= 8 THEN
    RETURN TRUE;
  END IF;

  -- ── Known fake exact emails ───────────────────────────────────────────────
  IF lower(trim(p_email)) IN (
    'john@doe.com',
    'jane@doe.com',
    'info@yoursite.com',
    'email@yourdomain.com',
    'test@test.com',
    'user@user.com',
    'example@example.com',
    'name@name.com',
    'your@email.com',
    'your@youremail.com'
  ) THEN
    RETURN TRUE;
  END IF;

  RETURN FALSE;
END;
$$;

-- ── Step 4: Trigger function — compute all derived flags per row ──────────────
CREATE OR REPLACE FUNCTION fn_compute_email_placeholder_flags()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
BEGIN
  -- Placeholder pattern check (immutable, per-row)
  NEW.is_placeholder_email := is_placeholder_email_check(NEW.email_normalized);

  -- Derived exclude flags — OR of all disqualifying signals
  NEW.exclude_from_agency_lookup :=
    NEW.is_placeholder_email OR
    COALESCE(NEW.is_shared_conflict, FALSE);

  NEW.exclude_from_outreach :=
    NEW.is_placeholder_email OR
    COALESCE(NEW.is_shared_conflict, FALSE) OR
    COALESCE(NEW.is_identity_contaminated, FALSE);

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_other_agency_emails_compute_flags ON other_agency_emails;

CREATE TRIGGER trg_other_agency_emails_compute_flags
  BEFORE INSERT OR UPDATE OF email_normalized, is_shared_conflict, is_identity_contaminated
  ON other_agency_emails
  FOR EACH ROW
  EXECUTE FUNCTION fn_compute_email_placeholder_flags();

-- ── Step 5: Batch shared-conflict refresh (called after bulk imports) ─────────
CREATE OR REPLACE FUNCTION refresh_shared_email_conflicts()
RETURNS JSONB
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_cleared_count  INT := 0;
  v_flagged_count  INT := 0;
  v_shared_emails  INT := 0;
BEGIN
  -- Clear stale shared flags (emails that no longer conflict)
  UPDATE other_agency_emails
  SET is_shared_conflict = FALSE
  WHERE is_shared_conflict = TRUE
    AND email_normalized NOT IN (
      SELECT oae2.email_normalized
      FROM other_agency_emails oae2
      INNER JOIN other_agencies oa ON oa.id = oae2.agency_id AND oa.is_active = TRUE
      GROUP BY oae2.email_normalized
      HAVING COUNT(DISTINCT oae2.agency_id) > 1
    );

  GET DIAGNOSTICS v_cleared_count = ROW_COUNT;

  -- Set shared flags for emails that appear on 2+ active agencies
  WITH shared AS (
    SELECT oae.email_normalized
    FROM other_agency_emails oae
    INNER JOIN other_agencies oa ON oa.id = oae.agency_id AND oa.is_active = TRUE
    GROUP BY oae.email_normalized
    HAVING COUNT(DISTINCT oae.agency_id) > 1
  )
  UPDATE other_agency_emails oae
  SET is_shared_conflict = TRUE
  FROM shared s
  WHERE oae.email_normalized = s.email_normalized
    AND oae.is_shared_conflict = FALSE;

  GET DIAGNOSTICS v_flagged_count = ROW_COUNT;

  -- The trigger will cascade and recompute exclude flags automatically when
  -- is_shared_conflict changes (via UPDATE OF ... trigger definition).
  -- But we need to force a recompute for rows that didn't change is_shared_conflict
  -- but might have stale exclude flags. Touch them explicitly.
  UPDATE other_agency_emails
  SET exclude_from_agency_lookup =
        is_placeholder_email OR COALESCE(is_shared_conflict, FALSE),
      exclude_from_outreach =
        is_placeholder_email OR COALESCE(is_shared_conflict, FALSE) OR COALESCE(is_identity_contaminated, FALSE)
  WHERE exclude_from_agency_lookup != (is_placeholder_email OR COALESCE(is_shared_conflict, FALSE))
     OR exclude_from_outreach != (is_placeholder_email OR COALESCE(is_shared_conflict, FALSE) OR COALESCE(is_identity_contaminated, FALSE));

  SELECT COUNT(DISTINCT email_normalized)
  INTO v_shared_emails
  FROM other_agency_emails
  WHERE is_shared_conflict = TRUE;

  RETURN jsonb_build_object(
    'ok',                  TRUE,
    'shared_email_patterns', v_shared_emails,
    'rows_newly_flagged',  v_flagged_count,
    'rows_cleared',        v_cleared_count,
    'ran_at',              now()
  );
END;
$$;

-- ── Step 6: Backfill — placeholder flags on all existing rows ─────────────────
UPDATE other_agency_emails
SET
  is_placeholder_email       = is_placeholder_email_check(email_normalized),
  exclude_from_outreach      = is_placeholder_email_check(email_normalized) OR COALESCE(is_identity_contaminated, FALSE),
  exclude_from_agency_lookup = is_placeholder_email_check(email_normalized)
WHERE TRUE;

-- ── Step 7: Backfill — shared conflict detection ──────────────────────────────
DO $$
DECLARE
  v_result JSONB;
BEGIN
  SELECT refresh_shared_email_conflicts() INTO v_result;
  RAISE NOTICE 'refresh_shared_email_conflicts result: %', v_result;
END;
$$;

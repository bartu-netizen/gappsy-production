/*
  # V2 Import — Row Audit Table, Dry-Run Flag, Match-Method Counters

  ## Summary
  Adds an additive audit layer on top of the V2 import pipeline. No existing tables
  are modified destructively. All new columns have safe DEFAULT values so existing
  jobs continue to work without schema changes.

  ## New Table

  ### `other_agencies_import_row_audit_v2`
  One row per processed import row. Records:
  - Which agency was matched (or created)
  - How it was matched (match_method)
  - Whether the match is cross-state
  - Which fields actually changed vs. the existing DB row
  - Whether the row was a no-op (only updated_at would change)
  - Whether the match looks suspicious, with a reason

  ## Modified Tables

  ### `other_agencies_import_jobs_v2` — new columns
  - `is_dry_run` — if true, the worker parses and audits but does NOT mutate agency/email/phone data
  - `agencies_real_updated` — matched-existing rows where at least one field changed
  - `agencies_noop_updated` — matched-existing rows where ONLY updated_at would change (no real data diff)
  - `match_domain_cross_state` — rows matched by domain across state lines
  - `match_domain_same_state` — rows matched by domain within the same state
  - `match_phone_same_state` — rows matched by phone (same-state only)
  - `match_name_same_state` — rows matched by name (same-state only)
  - `suspicious_matches_count` — rows flagged as suspicious

  ### `other_agencies_import_job_chunks_v2` — same new counter columns scoped per chunk

  ## Updated RPC

  `increment_import_v2_counters` — extended with new counter parameters (all DEFAULT 0 so
  existing callers without the new params continue to work).

  ## Security
  - RLS enabled on audit table
  - Service role only — no public or authenticated access
*/

-- ── New columns on jobs table ─────────────────────────────────────────────────

ALTER TABLE other_agencies_import_jobs_v2
  ADD COLUMN IF NOT EXISTS is_dry_run boolean NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS agencies_real_updated integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS agencies_noop_updated integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS match_domain_cross_state integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS match_domain_same_state integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS match_phone_same_state integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS match_name_same_state integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS suspicious_matches_count integer NOT NULL DEFAULT 0;

-- ── New columns on chunks table ───────────────────────────────────────────────

ALTER TABLE other_agencies_import_job_chunks_v2
  ADD COLUMN IF NOT EXISTS agencies_real_updated integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS agencies_noop_updated integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS match_domain_cross_state integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS match_domain_same_state integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS match_phone_same_state integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS match_name_same_state integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS suspicious_count integer NOT NULL DEFAULT 0;

-- ── Row audit table ───────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS other_agencies_import_row_audit_v2 (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid NOT NULL REFERENCES other_agencies_import_jobs_v2(id) ON DELETE CASCADE,

  chunk_index integer NOT NULL,
  source_row_number integer NOT NULL,

  source_agency_name text,
  source_state_slug text NOT NULL,
  source_website_url text,
  normalized_domain text,
  source_phone text,

  matched_agency_id uuid,
  matched_agency_slug text,
  matched_agency_state_slug text,

  matched_existing boolean NOT NULL DEFAULT false,

  match_method text NOT NULL DEFAULT 'unknown_existing_match'
    CHECK (match_method IN (
      'created_new',
      'domain_exact_cross_state',
      'domain_exact_same_state',
      'phone_same_state',
      'name_same_state',
      'junk_skipped',
      'error',
      'unknown_existing_match'
    )),

  cross_state boolean NOT NULL DEFAULT false,

  changed_fields jsonb,
  changed_fields_count integer NOT NULL DEFAULT 0,
  only_updated_at boolean NOT NULL DEFAULT false,

  suspicious_match boolean NOT NULL DEFAULT false,
  suspicious_reason text,

  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE other_agencies_import_row_audit_v2 ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role select — row audit v2"
  ON other_agencies_import_row_audit_v2
  FOR SELECT TO service_role USING (true);

CREATE POLICY "Service role insert — row audit v2"
  ON other_agencies_import_row_audit_v2
  FOR INSERT TO service_role WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_import_row_audit_v2_job_id
  ON other_agencies_import_row_audit_v2 (job_id);

CREATE INDEX IF NOT EXISTS idx_import_row_audit_v2_job_method
  ON other_agencies_import_row_audit_v2 (job_id, match_method);

CREATE INDEX IF NOT EXISTS idx_import_row_audit_v2_suspicious
  ON other_agencies_import_row_audit_v2 (job_id, suspicious_match)
  WHERE suspicious_match = true;

CREATE INDEX IF NOT EXISTS idx_import_row_audit_v2_cross_state
  ON other_agencies_import_row_audit_v2 (job_id, cross_state)
  WHERE cross_state = true;

-- ── Extended increment_import_v2_counters RPC ─────────────────────────────────

CREATE OR REPLACE FUNCTION increment_import_v2_counters(
  p_job_id uuid,
  p_agencies_created integer DEFAULT 0,
  p_agencies_updated integer DEFAULT 0,
  p_emails_added integer DEFAULT 0,
  p_errors_count integer DEFAULT 0,
  p_agencies_real_updated integer DEFAULT 0,
  p_agencies_noop_updated integer DEFAULT 0,
  p_match_domain_cross_state integer DEFAULT 0,
  p_match_domain_same_state integer DEFAULT 0,
  p_match_phone_same_state integer DEFAULT 0,
  p_match_name_same_state integer DEFAULT 0,
  p_suspicious_matches_count integer DEFAULT 0
)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  UPDATE other_agencies_import_jobs_v2
  SET
    agencies_created        = agencies_created        + p_agencies_created,
    agencies_updated        = agencies_updated        + p_agencies_updated,
    emails_added            = emails_added            + p_emails_added,
    errors_count            = errors_count            + p_errors_count,
    chunks_processed        = chunks_processed        + 1,
    agencies_real_updated   = agencies_real_updated   + p_agencies_real_updated,
    agencies_noop_updated   = agencies_noop_updated   + p_agencies_noop_updated,
    match_domain_cross_state = match_domain_cross_state + p_match_domain_cross_state,
    match_domain_same_state  = match_domain_same_state  + p_match_domain_same_state,
    match_phone_same_state   = match_phone_same_state   + p_match_phone_same_state,
    match_name_same_state    = match_name_same_state    + p_match_name_same_state,
    suspicious_matches_count = suspicious_matches_count + p_suspicious_matches_count,
    updated_at               = now()
  WHERE id = p_job_id;
END;
$$;

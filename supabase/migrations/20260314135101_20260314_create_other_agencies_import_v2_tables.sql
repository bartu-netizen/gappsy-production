/*
  # Other Agencies Import V2 — Job Tables

  ## Summary
  Creates a clean, isolated set of tables for the V2 import pipeline.
  V1 tables are NOT touched — this is entirely additive.

  ## New Tables

  ### `other_agencies_import_jobs_v2`
  Tracks one job per file upload. Has all status transitions and progress metrics.
  - status: queued → staged → parsing → chunking → processing → completed | partial_success | failed | cancelled
  - Stores file metadata, state slug, row/chunk counts, error messages
  - `last_checkpoint` stores free-form progress string for diagnostics

  ### `other_agencies_import_job_chunks_v2`
  Each chunk is a batch of rows from the parsed file.
  - status: queued → processing → completed | failed
  - Stores row range, agency/email counts, error info

  ### `other_agencies_import_events_v2`
  Append-only event log per job for full audit trail.

  ## Security
  - RLS enabled on all tables
  - No public access — service role only (functions use service role key)
  - Anonymous and authenticated users have zero access

  ## Storage
  - Uses existing `import-staging` bucket (or creates a policy for the v2 prefix)
*/

-- ─── Jobs table ──────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS other_agencies_import_jobs_v2 (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Identity
  state_slug text NOT NULL,
  file_name text NOT NULL,
  file_size_bytes bigint NOT NULL DEFAULT 0,
  file_format text NOT NULL DEFAULT 'unknown',
  storage_path text,

  -- Status machine
  status text NOT NULL DEFAULT 'queued'
    CHECK (status IN ('queued','staged','parsing','chunking','processing','completed','partial_success','failed','cancelled')),

  -- Progress counters
  rows_read integer NOT NULL DEFAULT 0,
  rows_valid integer NOT NULL DEFAULT 0,
  chunks_total integer NOT NULL DEFAULT 0,
  chunks_processed integer NOT NULL DEFAULT 0,
  agencies_created integer NOT NULL DEFAULT 0,
  agencies_updated integer NOT NULL DEFAULT 0,
  emails_added integer NOT NULL DEFAULT 0,
  errors_count integer NOT NULL DEFAULT 0,

  -- Diagnostics
  error_message text,
  last_checkpoint text,
  parse_started_at timestamptz,
  parse_completed_at timestamptz,
  work_started_at timestamptz,
  work_completed_at timestamptz,

  -- Metadata
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE other_agencies_import_jobs_v2 ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role only — jobs v2"
  ON other_agencies_import_jobs_v2
  FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "Service role insert — jobs v2"
  ON other_agencies_import_jobs_v2
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role update — jobs v2"
  ON other_agencies_import_jobs_v2
  FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_import_jobs_v2_status ON other_agencies_import_jobs_v2 (status);
CREATE INDEX IF NOT EXISTS idx_import_jobs_v2_state_slug ON other_agencies_import_jobs_v2 (state_slug);
CREATE INDEX IF NOT EXISTS idx_import_jobs_v2_created_at ON other_agencies_import_jobs_v2 (created_at DESC);

-- ─── Chunks table ─────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS other_agencies_import_job_chunks_v2 (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid NOT NULL REFERENCES other_agencies_import_jobs_v2(id) ON DELETE CASCADE,

  chunk_index integer NOT NULL,
  row_start integer NOT NULL,
  row_end integer NOT NULL,
  row_count integer NOT NULL DEFAULT 0,

  status text NOT NULL DEFAULT 'queued'
    CHECK (status IN ('queued','processing','completed','failed','skipped')),

  agencies_created integer NOT NULL DEFAULT 0,
  agencies_updated integer NOT NULL DEFAULT 0,
  emails_added integer NOT NULL DEFAULT 0,
  errors_count integer NOT NULL DEFAULT 0,
  error_message text,

  started_at timestamptz,
  completed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE other_agencies_import_job_chunks_v2 ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role only — chunks v2"
  ON other_agencies_import_job_chunks_v2
  FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "Service role insert — chunks v2"
  ON other_agencies_import_job_chunks_v2
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role update — chunks v2"
  ON other_agencies_import_job_chunks_v2
  FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_import_chunks_v2_job_id ON other_agencies_import_job_chunks_v2 (job_id);
CREATE INDEX IF NOT EXISTS idx_import_chunks_v2_status ON other_agencies_import_job_chunks_v2 (status);
CREATE INDEX IF NOT EXISTS idx_import_chunks_v2_job_chunk ON other_agencies_import_job_chunks_v2 (job_id, chunk_index);

-- ─── Events table (append-only audit log) ────────────────────────────────────

CREATE TABLE IF NOT EXISTS other_agencies_import_events_v2 (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid NOT NULL REFERENCES other_agencies_import_jobs_v2(id) ON DELETE CASCADE,

  event_type text NOT NULL,
  message text,
  payload jsonb,
  created_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE other_agencies_import_events_v2 ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role only — events v2"
  ON other_agencies_import_events_v2
  FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "Service role insert — events v2"
  ON other_agencies_import_events_v2
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_import_events_v2_job_id ON other_agencies_import_events_v2 (job_id);
CREATE INDEX IF NOT EXISTS idx_import_events_v2_created_at ON other_agencies_import_events_v2 (created_at DESC);

-- ─── Auto-update trigger for jobs updated_at ─────────────────────────────────

CREATE OR REPLACE FUNCTION update_import_jobs_v2_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_import_jobs_v2_updated_at ON other_agencies_import_jobs_v2;
CREATE TRIGGER trg_import_jobs_v2_updated_at
  BEFORE UPDATE ON other_agencies_import_jobs_v2
  FOR EACH ROW EXECUTE FUNCTION update_import_jobs_v2_updated_at();

/*
  # Add parse cursor table for incremental file parsing

  ## Purpose
  Enables the import parse stage to be split into many small lightweight invocations
  instead of one giant compute-heavy invocation that hits WORKER_LIMIT on 30MB+ files.

  ## New Tables

  ### `other_agencies_import_parse_cursors`
  - Tracks per-job parse progress as a byte cursor through the staged file
  - `job_id` - references the import job
  - `byte_offset` - current position in the file (bytes read so far)
  - `file_size_bytes` - total file size so far known
  - `delimiter` - detected CSV delimiter
  - `header_line` - the raw CSV header line text
  - `header_row_index` - which line index the header was found at
  - `chunk_index` - how many chunks have been created so far
  - `rows_parsed` - total normalized rows parsed so far
  - `status` - pending / running / completed / failed
  - `error_message` - failure reason if any
  - `slice_size_bytes` - how many bytes to process per slice (default 512KB)
  - `created_at` / `updated_at`

  ## Security
  - RLS enabled, accessible only via service role (internal functions)
*/

CREATE TABLE IF NOT EXISTS other_agencies_import_parse_cursors (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid NOT NULL REFERENCES other_agencies_import_jobs(id) ON DELETE CASCADE,
  byte_offset bigint NOT NULL DEFAULT 0,
  file_size_bytes bigint NOT NULL DEFAULT 0,
  delimiter text NOT NULL DEFAULT ',',
  header_line text NOT NULL DEFAULT '',
  header_row_index integer NOT NULL DEFAULT 0,
  chunk_index integer NOT NULL DEFAULT 0,
  rows_parsed integer NOT NULL DEFAULT 0,
  status text NOT NULL DEFAULT 'pending',
  error_message text,
  slice_size_bytes integer NOT NULL DEFAULT 524288,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_parse_cursors_job_id ON other_agencies_import_parse_cursors(job_id);

ALTER TABLE other_agencies_import_parse_cursors ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access to parse cursors"
  ON other_agencies_import_parse_cursors
  FOR SELECT
  TO service_role
  USING (true);

CREATE POLICY "Service role insert parse cursors"
  ON other_agencies_import_parse_cursors
  FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role update parse cursors"
  ON other_agencies_import_parse_cursors
  FOR UPDATE
  TO service_role
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Service role delete parse cursors"
  ON other_agencies_import_parse_cursors
  FOR DELETE
  TO service_role
  USING (true);

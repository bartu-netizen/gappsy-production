/*
  # Import V2 Enhanced Metrics

  ## Summary
  Adds comprehensive import tracking metrics to `other_agencies_import_jobs_v2` table
  for better visibility into import outcomes and duplicate handling.

  ## New Columns

  ### Success Metrics
  - `profiles_created` - Count of your_agency_profiles created during import
  - `profiles_already_existing` - Count of profiles that already existed (skipped)

  ### Duplicate Detection Metrics
  - `duplicate_rows_skipped` - Count of duplicate rows in source file
  - `duplicate_agencies_skipped` - Count of duplicate agencies detected during import
  - `duplicate_emails_skipped` - Count of duplicate emails detected during import

  ### Diagnostics
  - `failure_reason` - Human-readable explanation when status = failed
  - `last_activity_at` - Timestamp of last import activity (chunk completion, event, etc.)

  ## Security
  - No RLS changes needed (uses existing service_role policies)

  ## Notes
  - All new columns are nullable/defaulted for backward compatibility with existing jobs
  - These metrics are populated by the import worker functions during processing
*/

-- ─── Add enhanced tracking columns ───────────────────────────────────────────

ALTER TABLE other_agencies_import_jobs_v2
  ADD COLUMN IF NOT EXISTS profiles_created integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS profiles_already_existing integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS duplicate_rows_skipped integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS duplicate_agencies_skipped integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS duplicate_emails_skipped integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS failure_reason text,
  ADD COLUMN IF NOT EXISTS last_activity_at timestamptz;

-- ─── Add indexes for common queries ──────────────────────────────────────────

CREATE INDEX IF NOT EXISTS idx_import_jobs_v2_last_activity 
  ON other_agencies_import_jobs_v2 (last_activity_at DESC NULLS LAST) 
  WHERE last_activity_at IS NOT NULL;

-- Index for finding stuck jobs
CREATE INDEX IF NOT EXISTS idx_import_jobs_v2_stuck_detection 
  ON other_agencies_import_jobs_v2 (status, last_activity_at) 
  WHERE status IN ('processing', 'parsing', 'chunking');
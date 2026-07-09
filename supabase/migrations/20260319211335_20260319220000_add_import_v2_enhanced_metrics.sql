/*
  # Import V2 Enhanced Metrics & Bulk Delete Support

  ## Summary
  Adds better tracking metrics to import jobs for visibility into real outcomes,
  plus support for bulk cleanup operations.

  ## New Fields Added

  ### to `other_agencies_import_jobs_v2`
  - `profiles_created` - count of /your-agency profiles created
  - `profiles_already_existing` - agencies that already had profiles
  - `duplicate_rows_skipped` - identical rows skipped during parse
  - `duplicate_agencies_skipped` - duplicate agency names skipped
  - `duplicate_emails_skipped` - duplicate emails skipped
  - `failure_reason` - short machine-safe reason code (parsing_error, worker_timeout, etc.)
  - `last_activity_at` - timestamp of last progress for stuck diagnosis

  ## Notes
  - All new columns have sensible defaults (0 for counters, null for timestamps/reasons)
  - Existing imports won't break - defaults fill in missing data
  - `last_activity_at` should be updated whenever chunks complete or job progresses
*/

-- Add new metrics columns
ALTER TABLE other_agencies_import_jobs_v2
  ADD COLUMN IF NOT EXISTS profiles_created integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS profiles_already_existing integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS duplicate_rows_skipped integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS duplicate_agencies_skipped integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS duplicate_emails_skipped integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS failure_reason text,
  ADD COLUMN IF NOT EXISTS last_activity_at timestamptz;

-- Add index on last_activity_at for stuck job queries
CREATE INDEX IF NOT EXISTS idx_import_jobs_v2_last_activity ON other_agencies_import_jobs_v2 (last_activity_at DESC NULLS LAST);

-- Add index on failure_reason for filtering failed imports
CREATE INDEX IF NOT EXISTS idx_import_jobs_v2_failure_reason ON other_agencies_import_jobs_v2 (failure_reason) WHERE failure_reason IS NOT NULL;

-- Add comment explaining the purpose
COMMENT ON COLUMN other_agencies_import_jobs_v2.profiles_created IS 'Number of /your-agency profiles created during this import';
COMMENT ON COLUMN other_agencies_import_jobs_v2.profiles_already_existing IS 'Number of agencies that already had /your-agency profiles';
COMMENT ON COLUMN other_agencies_import_jobs_v2.failure_reason IS 'Short machine-safe reason code like parsing_error, worker_timeout, validation_failed';
COMMENT ON COLUMN other_agencies_import_jobs_v2.last_activity_at IS 'Timestamp of last progress update - for detecting truly stuck jobs';

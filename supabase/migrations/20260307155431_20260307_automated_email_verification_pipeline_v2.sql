/*
  # Automated Email Verification Pipeline Schema Updates

  1. Overview
    This migration enhances the email verification system to support fully automated
    verification with intelligent retry logic for unknown results.

  2. Status Model Changes
    - `validation_status` now supports additional values:
      - `pending` - Initial state, awaiting first verification
      - `valid` - Verified as deliverable
      - `invalid` - Verified as undeliverable
      - `unknown` - ListClean returned unknown (legacy, retained for backward compat)
      - `unknown_retry` - Unknown result, scheduled for automatic retry (< 6 attempts)
      - `unknown_final` - Unknown result after max attempts, no more retries
      - `catch_all` - Catch-all server (treated as valid for outreach)
      - `risky` - High risk email address

  3. New Columns
    - `auto_enqueue_on_import` column added to import job tracking

  4. Configuration Constants (documented here, enforced in edge functions)
    - LISTCLEAN_BATCH_SIZE = 500
    - LISTCLEAN_MAX_CONCURRENCY = 20
    - LISTCLEAN_QUEUE_INTERVAL_MINUTES = 5
    - LISTCLEAN_RETRY_DELAY_HOURS = 48
    - LISTCLEAN_MAX_ATTEMPTS = 6

  5. Indexes
    - New index for auto-retry queue selection

  6. Security
    - No RLS changes (admin-only tables)
*/

-- Drop existing constraint and add updated one with new status values
ALTER TABLE other_agency_emails
DROP CONSTRAINT IF EXISTS valid_statuses_including_pending;

ALTER TABLE other_agency_emails
ADD CONSTRAINT valid_statuses_including_pending
CHECK (validation_status IS NULL OR validation_status IN (
  'pending',
  'valid',
  'invalid',
  'unknown',
  'unknown_retry',
  'unknown_final',
  'catch_all',
  'risky',
  'blocked',
  'opted_out',
  'error'
));

-- Add auto_enqueue_on_import to import jobs if not exists
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_import_jobs'
    AND column_name = 'auto_enqueue_on_import'
  ) THEN
    ALTER TABLE other_agency_import_jobs
    ADD COLUMN auto_enqueue_on_import boolean NOT NULL DEFAULT true;
  END IF;
END $$;

-- Create index for auto-retry queue processing
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE schemaname = 'public'
    AND tablename = 'other_agency_emails'
    AND indexname = 'idx_other_agency_emails_auto_retry_queue'
  ) THEN
    CREATE INDEX idx_other_agency_emails_auto_retry_queue
    ON other_agency_emails(validation_status, verification_next_retry_at, verification_attempt_count)
    WHERE validation_status IN ('pending', 'unknown', 'unknown_retry')
      AND verification_attempt_count < 6;
  END IF;
END $$;

-- Migrate existing 'unknown' status rows to 'unknown_retry' or 'unknown_final'
-- based on their attempt count (only rows that haven't been finalized)
UPDATE other_agency_emails
SET validation_status = CASE
  WHEN verification_attempt_count >= 6 THEN 'unknown_final'
  ELSE 'unknown_retry'
END
WHERE validation_status = 'unknown'
AND verification_finalized_at IS NULL;

-- Set verification_next_retry_at for unknown_retry rows that don't have it set
UPDATE other_agency_emails
SET verification_next_retry_at = NOW() + INTERVAL '48 hours'
WHERE validation_status = 'unknown_retry'
AND verification_next_retry_at IS NULL
AND verification_attempt_count < 6;

-- Finalize unknown_final rows
UPDATE other_agency_emails
SET verification_finalized_at = COALESCE(verification_last_attempt_at, NOW())
WHERE validation_status = 'unknown_final'
AND verification_finalized_at IS NULL;

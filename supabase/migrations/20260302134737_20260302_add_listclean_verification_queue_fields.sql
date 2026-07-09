/*
  # Add ListClean Verification Queue Fields

  1. New Columns
    - `verification_attempt_count` - Number of verification attempts made
    - `verification_next_retry_at` - When to retry next (48h intervals)
    - `verification_last_attempt_at` - Last time we tried verification
    - `verification_finalized_at` - When we stopped retrying (valid/invalid/max attempts)
    - `verification_external_status` - Raw ListClean status (clean/dirty/unknown/error)
    - `verification_external_reason` - Remarks from ListClean
    - `verification_locked_at` - Optional: lock to prevent concurrent processing
    - `is_primary` - Mark primary email for agency (if not already present)

  2. Indexes
    - Index on (validation_status, verification_next_retry_at) for queue selection
    - Index on (verification_next_retry_at) for due row lookup
    - Index on (verification_attempt_count) for monitoring

  3. Constraints
    - All new fields nullable or with safe defaults
    - No breaking changes to existing data
    - Backward compatible with manual import flow

  4. Security
    - RLS policies remain unchanged
    - Admin-only verification fields
*/

DO $$
BEGIN
  -- Add verification_attempt_count
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'verification_attempt_count'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD COLUMN verification_attempt_count integer NOT NULL DEFAULT 0;
  END IF;

  -- Add verification_next_retry_at
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'verification_next_retry_at'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD COLUMN verification_next_retry_at timestamptz NULL;
  END IF;

  -- Add verification_last_attempt_at
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'verification_last_attempt_at'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD COLUMN verification_last_attempt_at timestamptz NULL;
  END IF;

  -- Add verification_finalized_at
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'verification_finalized_at'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD COLUMN verification_finalized_at timestamptz NULL;
  END IF;

  -- Add verification_external_status
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'verification_external_status'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD COLUMN verification_external_status text NULL;
  END IF;

  -- Add verification_external_reason
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'verification_external_reason'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD COLUMN verification_external_reason text NULL;
  END IF;

  -- Add verification_locked_at
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'verification_locked_at'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD COLUMN verification_locked_at timestamptz NULL;
  END IF;

  -- Add is_primary if not exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'is_primary'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD COLUMN is_primary boolean NOT NULL DEFAULT false;
  END IF;
END $$;

-- Create indexes for queue processing
DO $$
BEGIN
  -- Index on (validation_status, verification_next_retry_at)
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE schemaname = 'public' AND tablename = 'other_agency_emails'
    AND indexname = 'idx_other_agency_emails_status_retry'
  ) THEN
    CREATE INDEX idx_other_agency_emails_status_retry
    ON other_agency_emails(validation_status, verification_next_retry_at);
  END IF;

  -- Index on verification_next_retry_at
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE schemaname = 'public' AND tablename = 'other_agency_emails'
    AND indexname = 'idx_other_agency_emails_next_retry'
  ) THEN
    CREATE INDEX idx_other_agency_emails_next_retry
    ON other_agency_emails(verification_next_retry_at);
  END IF;

  -- Index on verification_attempt_count
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE schemaname = 'public' AND tablename = 'other_agency_emails'
    AND indexname = 'idx_other_agency_emails_attempt_count'
  ) THEN
    CREATE INDEX idx_other_agency_emails_attempt_count
    ON other_agency_emails(verification_attempt_count);
  END IF;
END $$;

/*
  # Separate Pending vs Unknown Verification Status

  1. Problem Solved
    - Previously, "unknown" status was ambiguous: could mean either
      (a) not yet checked by ListClean (pending)
      (b) ListClean checked and returned unknown result
    - This caused confusion in retry logic and send eligibility

  2. Solution
    - Introduce validation_status='pending' for new/unverified imports
    - validation_status='unknown' now ONLY means ListClean returned unknown
    - Clear distinction enables safe retry logic and correct send eligibility

  3. Columns Added
    - verification_state: text (queued, processing, completed, retry_scheduled, failed_permanent)
      Tracks the current state in the verification workflow
    - This supplements existing verification_* fields for better clarity

  4. Migration Strategy
    - New imports use validation_status='pending' (not 'unknown')
    - Existing rows with validation_status='unknown' remain as-is (they have ListClean results)
    - Existing rows with no verification data (attempt_count=0, no timestamp) are NOT changed
      (they may have been created manually or via old import)

  5. Data Integrity
    - No existing data is deleted or corrupted
    - Backward compatible: old rows with 'unknown' still work in queue processor
    - New rows use 'pending' to signal "not yet verified"

  6. Business Rules (ENFORCED)
    - Only validation_status='valid' is send-ready for Smartlead
    - pending/unknown/invalid/risky/catch_all excluded from send eligibility
    - Role-based emails allowed if validation_status='valid' and otherwise eligible
*/

DO $$
BEGIN
  -- Add verification_state column if not exists
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'verification_state'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD COLUMN verification_state text DEFAULT 'queued' CHECK (verification_state IN ('queued', 'processing', 'completed', 'retry_scheduled', 'failed_permanent'));
  END IF;

  -- Add check constraint to ensure 'pending' is a valid validation_status
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.check_constraints
    WHERE constraint_name = 'valid_statuses_including_pending'
  ) THEN
    ALTER TABLE other_agency_emails
    ADD CONSTRAINT valid_statuses_including_pending CHECK (
      validation_status IN ('pending', 'valid', 'invalid', 'unknown', 'risky', 'catch_all', 'blocked', 'opted_out')
    );
  END IF;
END $$;

-- Create index on verification_state for quick lookup
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE schemaname = 'public' AND tablename = 'other_agency_emails'
    AND indexname = 'idx_other_agency_emails_verification_state'
  ) THEN
    CREATE INDEX idx_other_agency_emails_verification_state
    ON other_agency_emails(verification_state);
  END IF;
END $$;

-- Create compound index for pending/queued lookups
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE schemaname = 'public' AND tablename = 'other_agency_emails'
    AND indexname = 'idx_other_agency_emails_pending_queued'
  ) THEN
    CREATE INDEX idx_other_agency_emails_pending_queued
    ON other_agency_emails(validation_status, verification_state)
    WHERE validation_status = 'pending';
  END IF;
END $$;

/*
  # Add is_primary column to other_agency_emails

  1. New Column
    - `is_primary` (boolean) to track primary email for outreach
  
  2. Index
    - Composite index on (agency_id, is_primary) for efficient primary email lookup
  
  3. Notes
    - Default value is false for backward compatibility
    - Application logic ensures exactly one primary per agency
    - No database constraint needed (application enforces rule)
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'is_primary'
  ) THEN
    ALTER TABLE other_agency_emails ADD COLUMN is_primary BOOLEAN NOT NULL DEFAULT false;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_indexes
    WHERE schemaname = 'public'
    AND tablename = 'other_agency_emails'
    AND indexname = 'idx_other_agency_emails_agency_primary'
  ) THEN
    CREATE INDEX idx_other_agency_emails_agency_primary
    ON other_agency_emails(agency_id, is_primary)
    WHERE is_primary = true;
  END IF;
END $$;

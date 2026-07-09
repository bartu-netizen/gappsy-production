/*
  # Add Bucket Source Tracking for ListClean Result Mapping Fix

  This migration adds a debug field to track which bucket (clean/dirty/unknown)
  a ListClean result came from, enabling visibility into result.status fallback logic.

  PROBLEM FIXED:
  - Emails in the "clean" bucket may have missing result.status
  - Previously these were incorrectly classified as "unknown"
  - Now we annotate bucket source and use bucket as fallback

  FIELD ADDED:
  - verification_bucket_source: text (clean | dirty | unknown | null)
    Stores the source bucket from ListClean download for audit/debugging
*/

DO $$
BEGIN
  -- Add verification_bucket_source column if it doesn't exist
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agency_emails' AND column_name = 'verification_bucket_source'
  ) THEN
    ALTER TABLE other_agency_emails ADD COLUMN verification_bucket_source text;
  END IF;
END $$;

-- Create index for bucket source queries (optional but useful for debugging)
CREATE INDEX IF NOT EXISTS idx_other_agency_emails_bucket_source 
  ON other_agency_emails(verification_bucket_source)
  WHERE verification_bucket_source IS NOT NULL;

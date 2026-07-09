/*
  # Add error_samples to other_agencies_import_job_chunks_v2

  Adds a jsonb column to store the first ~10 row-level error messages per chunk.
  This enables actionable diagnostics showing exactly why rows failed (e.g. schema mismatch).

  1. Changes
    - `other_agencies_import_job_chunks_v2`: add `error_samples` (jsonb, nullable)
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_job_chunks_v2'
    AND column_name = 'error_samples'
  ) THEN
    ALTER TABLE other_agencies_import_job_chunks_v2
    ADD COLUMN error_samples jsonb DEFAULT NULL;
  END IF;
END $$;

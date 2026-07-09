/*
  # Add storage_path column to import jobs
  
  1. Changes
    - Add `storage_path` column to store the path of uploaded file in staging bucket
    - Add `error_message` column to store parsing/processing errors
  
  2. Purpose
    - Support the new async staging architecture where files are uploaded to storage first
    - Then parsed server-side from the staged file
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'storage_path'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN storage_path text;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_jobs' AND column_name = 'error_message'
  ) THEN
    ALTER TABLE other_agencies_import_jobs ADD COLUMN error_message text;
  END IF;
END $$;

/*
  # Fix Import Jobs Status Constraint
  
  1. Problem
    - The current status check constraint does not include all statuses used by the import pipeline
    - Code was using "uploading" and "staged" which may not be allowed
  
  2. Solution
    - Drop existing constraint
    - Recreate with canonical status set:
      - queued (initial state when job is created)
      - staged (file uploaded to storage)
      - parsing (parse function is processing)
      - processing (worker is processing chunks)
      - completed (all chunks processed successfully)
      - partial_success (some chunks failed)
      - failed (job failed)
      - cancelled (admin cancelled)
  
  3. Notes
    - This ensures all pipeline stages can write their status without constraint violations
*/

ALTER TABLE other_agencies_import_jobs 
DROP CONSTRAINT IF EXISTS other_agencies_import_jobs_status_check;

ALTER TABLE other_agencies_import_jobs 
ADD CONSTRAINT other_agencies_import_jobs_status_check 
CHECK (status IN ('queued', 'staged', 'parsing', 'processing', 'completed', 'partial_success', 'failed', 'cancelled'));

UPDATE other_agencies_import_jobs 
SET status = 'failed' 
WHERE status NOT IN ('queued', 'staged', 'parsing', 'processing', 'completed', 'partial_success', 'failed', 'cancelled');

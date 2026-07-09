/*
  # Add increment_chunks_processed RPC function

  ## Purpose
  Provides an atomic increment for the chunks_processed counter on import jobs.
  Called by the worker after each chunk completes to update job progress safely.

  ## New Functions
  - `increment_chunks_processed(p_job_id uuid)` - atomically increments chunks_processed by 1
*/

CREATE OR REPLACE FUNCTION increment_chunks_processed(p_job_id uuid)
RETURNS void
LANGUAGE sql
SECURITY DEFINER
AS $$
  UPDATE other_agencies_import_jobs
  SET chunks_processed = COALESCE(chunks_processed, 0) + 1,
      updated_at = now()
  WHERE id = p_job_id;
$$;

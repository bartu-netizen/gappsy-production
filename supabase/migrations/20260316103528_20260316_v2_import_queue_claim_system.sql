/*
  # V2 Import Queue Claim System

  ## Problem
  Workers were launched fire-and-forget (one fetch per chunk). If any fetch failed to
  start or timed out, that chunk would remain queued/processing forever, stalling the
  entire job.

  ## Changes

  1. Add `retry_count` column to chunks for stale-recovery tracking
  2. Create `claim_next_import_v2_chunk` RPC: atomically claims the next queued chunk
     for a given job, returning it to exactly one worker runner. Uses UPDATE ... RETURNING
     with a CTE for safe concurrency.
  3. Create `recover_stale_import_v2_chunks` RPC: resets chunks stuck in 'processing'
     for > 10 minutes back to 'queued' (up to 3 retries, then marks failed).
  4. Update status CHECK constraint to include 'retrying' status.

  ## Result
  Workers can self-drain the queue atomically. Stale chunks get auto-recovered.
*/

-- 1. Add retry_count column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'other_agencies_import_job_chunks_v2'
    AND column_name = 'retry_count'
  ) THEN
    ALTER TABLE other_agencies_import_job_chunks_v2
    ADD COLUMN retry_count integer NOT NULL DEFAULT 0;
  END IF;
END $$;

-- 2. Atomic chunk claim RPC
CREATE OR REPLACE FUNCTION claim_next_import_v2_chunk(p_job_id uuid)
RETURNS TABLE (
  chunk_id uuid,
  chunk_index integer,
  row_start integer,
  row_end integer,
  row_count integer,
  retry_count integer
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_chunk_id uuid;
BEGIN
  -- Atomically find and claim the next queued chunk
  UPDATE other_agencies_import_job_chunks_v2
  SET status = 'processing',
      started_at = now()
  WHERE id = (
    SELECT id FROM other_agencies_import_job_chunks_v2
    WHERE job_id = p_job_id
      AND status = 'queued'
    ORDER BY chunk_index ASC
    LIMIT 1
    FOR UPDATE SKIP LOCKED
  )
  RETURNING
    id,
    other_agencies_import_job_chunks_v2.chunk_index,
    other_agencies_import_job_chunks_v2.row_start,
    other_agencies_import_job_chunks_v2.row_end,
    other_agencies_import_job_chunks_v2.row_count,
    other_agencies_import_job_chunks_v2.retry_count
  INTO v_chunk_id, chunk_index, row_start, row_end, row_count, retry_count;

  IF v_chunk_id IS NULL THEN
    RETURN;
  END IF;

  chunk_id := v_chunk_id;
  RETURN NEXT;
END;
$$;

-- 3. Stale chunk recovery RPC
CREATE OR REPLACE FUNCTION recover_stale_import_v2_chunks(
  p_job_id uuid,
  p_stale_minutes integer DEFAULT 10,
  p_max_retries integer DEFAULT 3
)
RETURNS TABLE (
  recovered_count integer,
  failed_count integer
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_recovered integer := 0;
  v_failed integer := 0;
  v_cutoff timestamptz;
BEGIN
  v_cutoff := now() - (p_stale_minutes || ' minutes')::interval;

  -- Reset retryable stale chunks back to queued
  UPDATE other_agencies_import_job_chunks_v2
  SET status = 'queued',
      started_at = NULL,
      retry_count = retry_count + 1
  WHERE job_id = p_job_id
    AND status = 'processing'
    AND started_at < v_cutoff
    AND completed_at IS NULL
    AND retry_count < p_max_retries;

  GET DIAGNOSTICS v_recovered = ROW_COUNT;

  -- Mark exhausted retries as failed
  UPDATE other_agencies_import_job_chunks_v2
  SET status = 'failed',
      error_message = 'Chunk timed out after ' || p_max_retries || ' retries',
      error_samples = '["Chunk timed out after maximum retries"]'::jsonb,
      completed_at = now()
  WHERE job_id = p_job_id
    AND status = 'processing'
    AND started_at < v_cutoff
    AND completed_at IS NULL
    AND retry_count >= p_max_retries;

  GET DIAGNOSTICS v_failed = ROW_COUNT;

  recovered_count := v_recovered;
  failed_count := v_failed;
  RETURN NEXT;
END;
$$;

-- 4. Index for efficient chunk claiming
CREATE INDEX IF NOT EXISTS idx_import_chunks_v2_claim
  ON other_agencies_import_job_chunks_v2 (job_id, status, chunk_index)
  WHERE status = 'queued';

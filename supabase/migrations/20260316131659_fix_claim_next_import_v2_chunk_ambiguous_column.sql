/*
  # Fix claim_next_import_v2_chunk — Ambiguous Column Reference

  ## Problem
  The existing `claim_next_import_v2_chunk` function fails with:
    ERROR: 42702: column reference "chunk_index" is ambiguous
  
  This happens because the RETURNS TABLE output column names (chunk_id, chunk_index,
  row_start, row_end, row_count, retry_count) collide with the same-named table columns
  in the PL/pgSQL RETURNING ... INTO clause. PostgreSQL cannot tell whether "chunk_index"
  refers to the PL/pgSQL output variable or the table column.

  ## Fix
  Rewrite the function using a CTE approach. The CTE performs the atomic
  UPDATE ... RETURNING, and the outer SELECT aliases the result columns directly
  into the RETURNS TABLE output — no INTO clause, no PL/pgSQL variable names, 
  no ambiguity.

  ## Tables Modified
  - None (function-only change)
  
  ## Security
  - Keeps SECURITY DEFINER with search_path = public
*/

CREATE OR REPLACE FUNCTION claim_next_import_v2_chunk(p_job_id uuid)
RETURNS TABLE (
  chunk_id uuid,
  chunk_index integer,
  row_start integer,
  row_end integer,
  row_count integer,
  retry_count integer
)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  WITH target AS (
    SELECT id
    FROM other_agencies_import_job_chunks_v2
    WHERE job_id = p_job_id
      AND status = 'queued'
    ORDER BY other_agencies_import_job_chunks_v2.chunk_index ASC
    LIMIT 1
    FOR UPDATE SKIP LOCKED
  ),
  claimed AS (
    UPDATE other_agencies_import_job_chunks_v2 c
    SET status = 'processing',
        started_at = now()
    FROM target t
    WHERE c.id = t.id
    RETURNING
      c.id,
      c.chunk_index,
      c.row_start,
      c.row_end,
      c.row_count,
      c.retry_count
  )
  SELECT
    claimed.id         AS chunk_id,
    claimed.chunk_index,
    claimed.row_start,
    claimed.row_end,
    claimed.row_count,
    claimed.retry_count
  FROM claimed;
$$;

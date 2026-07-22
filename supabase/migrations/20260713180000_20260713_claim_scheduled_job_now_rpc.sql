/*
  # claim_scheduled_job_now(p_job_id, p_worker_id) — "Run Now" claim RPC

  admin-scheduler's run_now action originally used a supabase-js
  `.update().eq().or()` chain to atomically claim one specific job
  (ignoring next_run_at/enabled, but still respecting an existing active
  lease). That combination did not match rows reliably — found during live
  testing: a row with worker_id/lease_expires_at both NULL was not matched
  by `.or('worker_id.is.null,lease_expires_at.lte.<iso>')`, likely a
  PostgREST filter-string edge case with the ISO timestamp value. A real
  SQL RPC (same pattern as claim_crawl_jobs / claim_scheduled_jobs) avoids
  the ambiguity entirely.
*/

CREATE OR REPLACE FUNCTION claim_scheduled_job_now(p_job_id uuid, p_worker_id text)
RETURNS SETOF scheduled_jobs
LANGUAGE sql
AS $$
  UPDATE scheduled_jobs
  SET worker_id = p_worker_id,
      lease_expires_at = now() + interval '10 minutes',
      heartbeat_at = now(),
      updated_at = now()
  WHERE id = p_job_id
    AND (worker_id IS NULL OR lease_expires_at IS NULL OR lease_expires_at <= now())
  RETURNING *;
$$;

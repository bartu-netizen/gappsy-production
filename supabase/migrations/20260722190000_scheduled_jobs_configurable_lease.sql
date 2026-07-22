-- Configurable per-job lease duration for scheduled_jobs.
--
-- Root cause of the recurring "scraper looks stopped" incidents
-- (2026-07-22): a scheduled job's edge function invocation can be killed
-- outright by the platform's own resource governor (WORKER_RESOURCE_LIMIT)
-- mid-run, before it ever reaches the code that clears worker_id/lease_
-- expires_at/heartbeat_at. claim_scheduled_jobs() already re-claims a row
-- once its lease expires, so the system IS self-healing — but every job
-- shared one hardcoded 10-minute lease, sized for genuinely long-running
-- jobs (e.g. listclean_queue_drain, which processes up to 3000 emails
-- synchronously). For a job like email_discovery_scan — internally
-- deadline-bound to ~45s and normally completing in 30-45s — a crash meant
-- up to ~10-11 minutes of looking "stopped" before it silently recovered
-- on its own, which is indistinguishable from "broken" to anyone watching.
--
-- lease_seconds lets each job declare its own lease window: short for fast,
-- internally-bounded jobs (so a platform-level kill self-heals within
-- minutes, not ~10), left at the previous 600s default for everything else
-- so slower jobs are never at risk of a legitimate in-flight run getting
-- reclaimed out from under it.
ALTER TABLE scheduled_jobs
  ADD COLUMN IF NOT EXISTS lease_seconds integer NOT NULL DEFAULT 600
    CHECK (lease_seconds >= 60);

CREATE OR REPLACE FUNCTION claim_scheduled_jobs(p_worker_id text)
RETURNS SETOF scheduled_jobs
LANGUAGE sql
AS $$
  UPDATE scheduled_jobs
  SET worker_id = p_worker_id,
      lease_expires_at = now() + make_interval(secs => lease_seconds),
      heartbeat_at = now(),
      updated_at = now()
  WHERE id IN (
    SELECT id FROM scheduled_jobs
    WHERE enabled = true
      AND next_run_at IS NOT NULL
      AND next_run_at <= now()
      AND (worker_id IS NULL OR lease_expires_at IS NULL OR lease_expires_at <= now())
    ORDER BY priority DESC, next_run_at ASC
    FOR UPDATE SKIP LOCKED
  )
  RETURNING *;
$$;

CREATE OR REPLACE FUNCTION heartbeat_scheduled_job(p_job_id uuid, p_worker_id text)
RETURNS TABLE(id uuid, lease_expires_at timestamptz)
LANGUAGE sql
AS $$
  UPDATE scheduled_jobs
  SET heartbeat_at = now(),
      lease_expires_at = now() + make_interval(secs => lease_seconds)
  WHERE scheduled_jobs.id = p_job_id
    AND scheduled_jobs.worker_id = p_worker_id
  RETURNING scheduled_jobs.id, scheduled_jobs.lease_expires_at;
$$;

-- Fast, internally-deadline-bound jobs (crawler-gateway-backed or otherwise
-- normally sub-minute) get a 3-minute lease instead of the 10-minute
-- default, so a platform-level kill self-heals in ~3 minutes, not ~10.
UPDATE scheduled_jobs
SET lease_seconds = 180
WHERE job_key IN ('email_discovery_scan', 'tool_email_listclean_scan', 'change_detection_scan', 'stale_source_retry');

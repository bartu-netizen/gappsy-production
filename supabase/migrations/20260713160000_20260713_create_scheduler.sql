/*
  # Scheduler / Orchestrator — bottleneck #2

  Every pipeline stage today only advances when an admin clicks a button
  (approve a candidate, click "Process Queue", click "Run" on a discovery
  provider). This introduces a database-backed scheduler so those stages
  can run on their own cron/interval schedule, with the same lease-claim
  safety model already proven for crawl_jobs (bottleneck #1) — atomic
  claiming, crash recovery, bounded retry with backoff.

  Design: ONE pg_cron entry (added in the next migration) fires a single
  `scheduler-tick` edge function every minute. That function is the only
  thing that needs to run on a real wall-clock cadence; it reads
  scheduled_jobs, decides what's due (via cron_expression or
  interval_seconds, evaluated in TypeScript — see _shared/cronNextRun.ts),
  and claims/executes/records the ones that are. This avoids dynamically
  managing N separate pg_cron entries (one per configurable schedule),
  which would need its own admin-triggered `cron.schedule()`/
  `cron.unschedule()` RPC plumbing and a way to keep pg_cron's internal
  job table in sync with ours — one fixed, permanent pg_cron entry is
  simpler and has nothing to keep in sync.

  1. scheduled_jobs — the job DEFINITION, doubling as its own claim/lease
     row (mirrors crawl_jobs' worker_id/lease_expires_at/heartbeat_at
     fields exactly, for the same reason: proven-safe atomic claiming).
  2. scheduled_job_runs — append-only execution history (one row per
     attempt), independent of how many rows scheduled_jobs itself has.
  3. claim_scheduled_jobs(worker_id) — claims every job that is enabled
     and due (or whose previous claim's lease expired — crash recovery),
     atomically, via FOR UPDATE SKIP LOCKED. Unlike claim_crawl_jobs,
     there's no shared concurrency budget to protect here (each job_type
     manages its own internal concurrency, e.g. crawl_queue_drain already
     self-limits via crawl_settings) — so this claims ALL due rows in one
     call, not one-at-a-time.
  4. heartbeat_scheduled_job(job_id, worker_id) — extends a lease only for
     its legitimate current owner, same pattern as heartbeat_crawl_job.
  5. Seed rows for the job types that have a real handler implemented in
     _shared/schedulerRegistry.ts today (discovery_refresh,
     crawl_queue_drain, crawl_lease_cleanup, enrichment_stuck_sweep).
     Screenshot/logo/future-AI job types are NOT seeded — job_type is a
     free-text dispatch key, so adding one later is just: write a handler,
     insert a row. No schema change needed to add a new job type.
*/

-- 1. scheduled_jobs --------------------------------------------------------

CREATE TABLE IF NOT EXISTS scheduled_jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_key text UNIQUE NOT NULL,
  name text NOT NULL,
  description text,

  -- job_type is the dispatch key into _shared/schedulerRegistry.ts's
  -- handler map. Deliberately free-text (not a CHECK-constrained enum) so
  -- registering a new job type is additive — one handler + one row, no
  -- migration required.
  job_type text NOT NULL,

  schedule_type text NOT NULL DEFAULT 'interval'
    CHECK (schedule_type IN ('cron', 'interval', 'manual')),
  cron_expression text,
  interval_seconds integer CHECK (interval_seconds IS NULL OR interval_seconds >= 60),
  CONSTRAINT scheduled_jobs_schedule_shape_chk CHECK (
    (schedule_type = 'cron' AND cron_expression IS NOT NULL AND interval_seconds IS NULL) OR
    (schedule_type = 'interval' AND interval_seconds IS NOT NULL AND cron_expression IS NULL) OR
    (schedule_type = 'manual' AND cron_expression IS NULL AND interval_seconds IS NULL)
  ),

  enabled boolean NOT NULL DEFAULT true,
  config jsonb NOT NULL DEFAULT '{}'::jsonb,
  priority integer NOT NULL DEFAULT 0,
  max_retries integer NOT NULL DEFAULT 3 CHECK (max_retries BETWEEN 0 AND 10),

  next_run_at timestamptz,
  last_run_at timestamptz,
  last_status text CHECK (last_status IS NULL OR last_status IN ('success', 'failed', 'timed_out', 'cancelled')),
  last_duration_ms integer,
  last_error text,
  consecutive_failures integer NOT NULL DEFAULT 0,

  -- Claim/lease state — identical shape to crawl_jobs' equivalent fields.
  worker_id text,
  lease_expires_at timestamptz,
  heartbeat_at timestamptz,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  updated_by text
);

CREATE INDEX IF NOT EXISTS scheduled_jobs_due_idx
  ON scheduled_jobs (enabled, next_run_at)
  WHERE enabled = true;

CREATE INDEX IF NOT EXISTS scheduled_jobs_lease_expiry_idx
  ON scheduled_jobs (lease_expires_at)
  WHERE worker_id IS NOT NULL;

-- 2. scheduled_job_runs -------------------------------------------------

CREATE TABLE IF NOT EXISTS scheduled_job_runs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scheduled_job_id uuid NOT NULL REFERENCES scheduled_jobs(id) ON DELETE CASCADE,
  status text NOT NULL DEFAULT 'running'
    CHECK (status IN ('running', 'success', 'failed', 'cancelled', 'timed_out')),
  triggered_by text NOT NULL DEFAULT 'cron' CHECK (triggered_by IN ('cron', 'manual', 'retry')),
  attempt integer NOT NULL DEFAULT 1,
  worker_id text,
  started_at timestamptz NOT NULL DEFAULT now(),
  completed_at timestamptz,
  duration_ms integer,
  error_message text,
  result jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS scheduled_job_runs_job_idx
  ON scheduled_job_runs (scheduled_job_id, started_at DESC);

CREATE INDEX IF NOT EXISTS scheduled_job_runs_status_idx
  ON scheduled_job_runs (status)
  WHERE status = 'running';

-- 3. claim_scheduled_jobs(p_worker_id) ---------------------------------------

CREATE OR REPLACE FUNCTION claim_scheduled_jobs(p_worker_id text)
RETURNS SETOF scheduled_jobs
LANGUAGE sql
AS $$
  UPDATE scheduled_jobs
  SET worker_id = p_worker_id,
      lease_expires_at = now() + interval '10 minutes',
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

-- 4. heartbeat_scheduled_job(p_job_id, p_worker_id) --------------------------

CREATE OR REPLACE FUNCTION heartbeat_scheduled_job(p_job_id uuid, p_worker_id text)
RETURNS TABLE(id uuid, lease_expires_at timestamptz)
LANGUAGE sql
AS $$
  UPDATE scheduled_jobs
  SET heartbeat_at = now(),
      lease_expires_at = now() + interval '10 minutes'
  WHERE scheduled_jobs.id = p_job_id
    AND scheduled_jobs.worker_id = p_worker_id
  RETURNING scheduled_jobs.id, scheduled_jobs.lease_expires_at;
$$;

-- 5. RLS: service-role only, same posture as every other pipeline table ---

ALTER TABLE scheduled_jobs ENABLE ROW LEVEL SECURITY;
ALTER TABLE scheduled_job_runs ENABLE ROW LEVEL SECURITY;

-- 6. Seed real, implemented job types -----------------------------------

INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, priority, max_retries)
VALUES
  (
    'discovery_refresh', 'Discovery Refresh',
    'Runs every enabled + implemented discovery provider that is due per its own schedule_frequency (hourly/daily/weekly). Checked every 15 minutes; providers not yet due are skipped.',
    'discovery_refresh', 'interval', 900, true, now(), 0, 3
  ),
  (
    'crawl_queue_drain', 'Crawl Queue Processing',
    'Drains crawl_jobs up to crawl_settings.max_concurrent_crawls — claims fresh and due-retry jobs and runs them concurrently. Replaces manual "Process Queue" clicking as the primary driver of crawl throughput.',
    'crawl_queue_drain', 'interval', 120, true, now(), 10, 3
  ),
  (
    'crawl_lease_cleanup', 'Crawl Lease Cleanup',
    'Safety net: terminally fails crawl_jobs whose lease has been expired for a long time AND have exhausted crawl_settings.max_auto_retries, so a job that keeps crashing its worker cannot loop being reclaimed forever without ever reaching maybeScheduleAutoRetry''s own ceiling.',
    'crawl_lease_cleanup', 'interval', 1800, true, now(), 0, 3
  ),
  (
    'enrichment_stuck_sweep', 'Enrichment Stuck Job Report',
    'Read-only: reports (does not modify) enrichment_jobs stuck in queued/exported status for over 48h, so a human can see the AI enrichment backlog without visiting every batch. Never calls an AI provider or mutates enrichment state.',
    'enrichment_stuck_sweep', 'interval', 21600, true, now(), 0, 1
  )
ON CONFLICT (job_key) DO NOTHING;

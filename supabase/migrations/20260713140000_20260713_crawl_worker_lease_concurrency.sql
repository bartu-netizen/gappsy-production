/*
  # Crawl worker leases — bounded concurrent crawl execution

  Replaces the hardcoded CRAWL_LIMITS.MAX_ACTIVE_JOBS = 1 global serial
  guard with a database-backed, lease-based worker-claim model so multiple
  crawl jobs can run concurrently (configurable, safe default 2, hard
  ceiling 4 to match the crawler-gateway's current 1-CPU/512MB resource
  cap and the shared 6GB/3-CPU fleet slice it lives in on the Hivelocity
  server — see crawler-gateway/README.md).

  Additive only: new columns on crawl_jobs, a new singleton settings
  table, and two RPCs. No existing column, index, or row is touched. The
  existing crawl_jobs_status_idx / crawl_jobs_created_at_idx / the
  status+created_at composite index added in 20260713120000 are untouched
  and still used by the admin queue list view.

  1. crawl_jobs: worker_id / lease_expires_at / heartbeat_at / retry_at /
     priority / attempt — the minimum fields needed for atomic claiming,
     crash recovery via lease expiry, and bounded auto-retry with backoff.
     retry_count (existing) keeps meaning "how many times a human clicked
     Retry" (each click inserts a fresh row); attempt (new) tracks
     in-place automatic-pipeline retry attempts on the SAME row, so an
     automatic retry never creates a duplicate crawl_jobs row or a
     duplicate tool draft.

  2. crawl_settings: singleton config row (same id=true pattern as
     enrichment_settings) — max_concurrent_crawls (default 2, CHECK
     between 1 and 4), lease_seconds, max_auto_retries. Editable via a new
     admin-crawl-settings function; hard bounds enforced by CHECK
     constraints so the API cannot set an unsafe value even if it tries.

  3. claim_crawl_jobs(p_worker_id): the atomic claim RPC. Serializes
     concurrent claim attempts via `SELECT ... FOR UPDATE` on the
     crawl_settings singleton row (a cheap, always-uncontended-in-practice
     mutex since crawls are slow relative to this claim statement), then
     claims up to (max_concurrent_crawls - currently-active-with-valid-
     lease) rows using `FOR UPDATE SKIP LOCKED` so two concurrent callers
     can never claim the same row. Eligible rows are either genuinely
     'queued' (and due, i.e. retry_at is null or already past) or an
     in-flight row whose lease has expired (a crashed/killed worker) —
     the latter has its `attempt` bumped, enabling crash recovery without
     ever double-counting a job that is still legitimately running.

  4. heartbeat_crawl_job(p_job_id, p_worker_id): extends a lease only if
     the caller still legitimately owns it (worker_id match + still
     in-flight) — a worker whose lease already expired and was reclaimed
     by someone else cannot resurrect it.
*/

-- 1. crawl_jobs: lease + retry columns -----------------------------------

ALTER TABLE crawl_jobs
  ADD COLUMN IF NOT EXISTS worker_id text,
  ADD COLUMN IF NOT EXISTS lease_expires_at timestamptz,
  ADD COLUMN IF NOT EXISTS heartbeat_at timestamptz,
  ADD COLUMN IF NOT EXISTS retry_at timestamptz,
  ADD COLUMN IF NOT EXISTS priority integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS attempt integer NOT NULL DEFAULT 1;

-- Claim-query support: find eligible queued/expired-lease rows fast even
-- at millions of historical (completed/failed) rows.
CREATE INDEX IF NOT EXISTS crawl_jobs_claim_eligibility_idx
  ON crawl_jobs (status, retry_at, priority DESC, created_at);

CREATE INDEX IF NOT EXISTS crawl_jobs_lease_expiry_idx
  ON crawl_jobs (lease_expires_at)
  WHERE status IN ('starting', 'crawling', 'extracting');

-- 2. crawl_settings ---------------------------------------------------------

CREATE TABLE IF NOT EXISTS crawl_settings (
  id boolean PRIMARY KEY DEFAULT true CHECK (id),
  max_concurrent_crawls integer NOT NULL DEFAULT 2 CHECK (max_concurrent_crawls BETWEEN 1 AND 4),
  lease_seconds integer NOT NULL DEFAULT 240 CHECK (lease_seconds BETWEEN 30 AND 1200),
  max_auto_retries integer NOT NULL DEFAULT 3 CHECK (max_auto_retries BETWEEN 0 AND 10),
  updated_at timestamptz NOT NULL DEFAULT now(),
  updated_by text
);

INSERT INTO crawl_settings (id) VALUES (true) ON CONFLICT (id) DO NOTHING;

ALTER TABLE crawl_settings ENABLE ROW LEVEL SECURITY;

-- 3. claim_crawl_jobs(p_worker_id) -------------------------------------------

CREATE OR REPLACE FUNCTION claim_crawl_jobs(p_worker_id text)
RETURNS SETOF crawl_jobs
LANGUAGE plpgsql
AS $$
DECLARE
  v_max_concurrency integer;
  v_lease_seconds integer;
  v_active_count integer;
  v_available integer;
BEGIN
  -- Row lock on the singleton settings row serializes concurrent claim
  -- attempts, closing the classic "two callers both read active=0 before
  -- either commits" race without needing an external lock service.
  SELECT max_concurrent_crawls, lease_seconds
    INTO v_max_concurrency, v_lease_seconds
    FROM crawl_settings WHERE id = true FOR UPDATE;

  IF v_max_concurrency IS NULL THEN
    v_max_concurrency := 2;
    v_lease_seconds := 240;
  END IF;

  SELECT count(*) INTO v_active_count
    FROM crawl_jobs
    WHERE status IN ('starting', 'crawling', 'extracting')
      AND lease_expires_at IS NOT NULL
      AND lease_expires_at > now();

  v_available := GREATEST(0, v_max_concurrency - v_active_count);
  IF v_available = 0 THEN
    RETURN;
  END IF;

  RETURN QUERY
  UPDATE crawl_jobs
  SET status = 'starting',
      worker_id = p_worker_id,
      lease_expires_at = now() + (v_lease_seconds || ' seconds')::interval,
      heartbeat_at = now(),
      started_at = COALESCE(started_at, now()),
      -- Only bump attempt when reclaiming a crashed in-flight job (old
      -- status was starting/crawling/extracting); a fresh 'queued' claim
      -- is still its first attempt.
      attempt = CASE WHEN status IN ('starting', 'crawling', 'extracting') THEN attempt + 1 ELSE attempt END,
      updated_at = now()
  WHERE id IN (
    SELECT id FROM crawl_jobs
    WHERE (status = 'queued' AND (retry_at IS NULL OR retry_at <= now()))
       OR (status IN ('starting', 'crawling', 'extracting') AND lease_expires_at IS NOT NULL AND lease_expires_at <= now())
    ORDER BY priority DESC, created_at ASC
    LIMIT v_available
    FOR UPDATE SKIP LOCKED
  )
  RETURNING *;
END;
$$;

-- 4. heartbeat_crawl_job(p_job_id, p_worker_id) ------------------------------

CREATE OR REPLACE FUNCTION heartbeat_crawl_job(p_job_id uuid, p_worker_id text)
RETURNS TABLE(id uuid, lease_expires_at timestamptz)
LANGUAGE sql
AS $$
  UPDATE crawl_jobs
  SET heartbeat_at = now(),
      lease_expires_at = now() + (
        (SELECT lease_seconds FROM crawl_settings WHERE crawl_settings.id = true) || ' seconds'
      )::interval
  WHERE crawl_jobs.id = p_job_id
    AND crawl_jobs.worker_id = p_worker_id
    AND crawl_jobs.status IN ('starting', 'crawling', 'extracting')
  RETURNING crawl_jobs.id, crawl_jobs.lease_expires_at;
$$;

/*
  # Fix claim_crawl_jobs to claim exactly one row per call

  Found during live 2-job concurrency testing: the original claim_crawl_jobs
  (20260713140000) claimed `LIMIT v_available` rows per call — when both
  concurrency slots were free, a single caller could win BOTH rows in one
  call. runWorkerLoop then processed its claimed rows with a `for...of` +
  `await` loop, i.e. sequentially within that one worker loop, while
  sibling loops got 0 rows and exited immediately. The claim itself was
  still fully safe (no double-claim, capacity never exceeded — both rows
  correctly got a valid lease), but real parallel execution wasn't
  guaranteed: two jobs claimed together by the same caller would run one
  after another, not concurrently.

  Fix: cap the claim at exactly 1 row per call regardless of how much
  capacity is free. Filling N free slots now requires N separate
  (concurrent) calls to claim_crawl_jobs — which is exactly what
  drainCrawlQueue's N independent worker loops already do. This is the
  "one worker loop per available slot" model the concurrency work was
  supposed to implement.
*/

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
      attempt = CASE WHEN status IN ('starting', 'crawling', 'extracting') THEN attempt + 1 ELSE attempt END,
      updated_at = now()
  WHERE id IN (
    SELECT id FROM crawl_jobs
    WHERE (status = 'queued' AND (retry_at IS NULL OR retry_at <= now()))
       OR (status IN ('starting', 'crawling', 'extracting') AND lease_expires_at IS NOT NULL AND lease_expires_at <= now())
    ORDER BY priority DESC, created_at ASC
    LIMIT 1
    FOR UPDATE SKIP LOCKED
  )
  RETURNING *;
END;
$$;

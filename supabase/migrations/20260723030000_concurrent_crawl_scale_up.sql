-- Real crawler-gateway load test (2026-07-23): 4 concurrent crawls stay
-- fast/100% reliable, 8 still succeed but visibly slow, 12 genuinely
-- start failing. email_discovery_scan/discovered_tool_email_scan now
-- process 4 tools concurrently per wave (schedulerRegistry.ts) instead of
-- one at a time, so batch_size needs to be large enough to fill several
-- waves within the per-tick wall-clock budget — 16 gives ~4 waves.
UPDATE scheduled_jobs
SET config = jsonb_set(config, '{batch_size}', '16')
WHERE job_key IN ('email_discovery_scan', 'discovered_tool_email_scan');

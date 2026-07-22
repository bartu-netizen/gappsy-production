-- Scale-up request: user wants to feed 120 mailboxes x 30 emails/day
-- (3600/day sending capacity) via Smartlead, far above current scraping
-- throughput (~1,360 tools/day combined, ~150-200 new clean emails/day).
--
-- Real per-tool crawl timing (verified directly, 2026-07-22/23): ~5-13s
-- per tool for both passes combined. At the existing 30s per-tick budget
-- (EMAIL_DISCOVERY_TICK_BUDGET_MS in schedulerRegistry.ts), a batch_size
-- of 4 already exceeds what actually fits in most invocations — real
-- effective throughput per tick is closer to ~2-3 tools, not 4, meaning
-- batch_size was never really the binding constraint. The safe lever is
-- running the tick itself more often: dropping interval_seconds from 180
-- to 60 (the DB's own minimum) triples how often each job gets a chance
-- to run per day with ZERO change to per-invocation resource usage —
-- the exact same crawl pattern that was already proven stable, just more
-- frequently attempted.
UPDATE scheduled_jobs
SET interval_seconds = 60
WHERE job_key IN ('email_discovery_scan', 'discovered_tool_email_scan');

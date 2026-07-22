/*
  # Change detection — scheduled jobs (Phase 5)

  Seeds the two new job_types registered in _shared/schedulerRegistry.ts
  (change_detection_scan, stale_source_retry) into the EXISTING scheduler
  (scheduled_jobs/scheduled_job_runs, from 20260713160000) — no new
  scheduler, same pg_cron-driven scheduler-tick that already drives
  discovery_refresh/crawl_queue_drain/etc.

  change_detection_scan runs every 10 minutes, bounded to 50 (tool,
  page_type) checks per tick (config.batch_size) — a fixed, modest,
  configurable share of scheduler-tick capacity so this never crowds out
  crawl_queue_drain, which remains the highest-priority job (priority 10
  vs this job's 0) per crawl_queue_drain's own seed comment. Existing
  Plesk websites and crawler limits remain protected: this issues plain
  bounded HTTP fetches (see changeDetection.ts's fetchPageSafely), never
  routes through the heavier Crawl4AI gateway, and only ENQUEUES a
  crawl_jobs row on a meaningful/critical change — actual recrawl
  throughput is still governed entirely by crawl_queue_drain's existing
  crawl_settings.max_concurrent_crawls cap.

  stale_source_retry runs once an hour, bounded to 20 backed-off pages per
  tick, retrying only pages that have been failing for
  change_detection_rules.max_consecutive_failures_before_backoff+
  consecutive checks — see select_stale_change_checks() in
  20260714100000_20260714_change_detection_selectors.sql.
*/

INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, priority, max_retries, config)
VALUES
  (
    'change_detection_scan', 'Change Detection Scan',
    'Scans a bounded batch of (tool, page_type) pairs due for a check (new tools get a first fingerprint snapshot; existing ones recheck every config.check_interval_hours), classifies no_change/minor/meaningful/critical/unavailable via changeDetection.ts, and enqueues a recrawl only on a fresh meaningful/critical transition. Never scrapes raw HTML into storage — only a bounded content hash + small structured extract are kept.',
    'change_detection_scan', 'interval', 600, true, now(), 0, 3,
    '{"batch_size": 50, "check_interval_hours": 24}'::jsonb
  ),
  (
    'stale_source_retry', 'Stale Source Retry',
    'Retries pages backed off by change detection (consecutive_failures at/above change_detection_rules.max_consecutive_failures_before_backoff) on a slower cadence (config.backoff_hours, default 7 days) than the main scan, so a permanently-dead source stops consuming the main scan''s batch budget every run while still eventually noticing a recovery.',
    'stale_source_retry', 'interval', 3600, true, now(), 0, 3,
    '{"batch_size": 20, "backoff_hours": 168}'::jsonb
  )
ON CONFLICT (job_key) DO NOTHING;

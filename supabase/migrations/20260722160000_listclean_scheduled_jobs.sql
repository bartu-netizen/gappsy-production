-- Registers the two scheduler jobs that make ListClean verification for
-- marketing agencies actually automatic. Both underlying edge functions
-- (listclean-credits-monitor, other-agencies-listclean-process-queue)
-- already existed and already worked correctly — the only real gap was
-- that nothing ever called them on a schedule. A prior attempt
-- (trigger_queue_worker_http, migration 20260308193208) wrote a pg_cron
-- function for this but never actually scheduled it; this uses the
-- modern scheduler (scheduled_jobs + schedulerRegistry.ts) instead.
INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, config)
VALUES
  (
    'listclean_credits_check', 'ListClean Credits Check',
    'Checks the ListClean account balance, sends warning/critical/recovered alert emails on threshold crossings, and auto-pauses/resumes the verification queue based on credit level (see listclean_monitor_state).',
    'listclean_credits_check', 'interval', 1800, true, now(), '{}'::jsonb
  ),
  (
    'listclean_queue_drain', 'ListClean Queue Drain (Agencies)',
    'Submits pending marketing-agency emails to ListClean for verification and downloads/applies results for already-submitted batches. Skips entirely while listclean_monitor_state.queue_auto_paused or manual_pause is set.',
    'listclean_queue_drain', 'interval', 600, true, now(), '{}'::jsonb
  )
ON CONFLICT (job_key) DO NOTHING;

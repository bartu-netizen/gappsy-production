/*
  # Stale-job watchdog column

  Tracks whether a "this job is badly overdue" alert has already been sent
  for the CURRENT overdue episode, so the watchdog in schedulerRunner.ts
  (tickScheduler -> healStaleJobs) sends exactly one email per episode
  instead of spamming every minute, and automatically re-arms once the job
  actually runs again (success or failure — either way it's no longer
  silently stuck).

  Prompted by stale_source_retry going 100+ minutes overdue with nothing
  detecting or surfacing it until a manual SQL query found it — see
  schedulerRunner.ts for the starvation bug fix this accompanies.
*/
ALTER TABLE scheduled_jobs
  ADD COLUMN IF NOT EXISTS stale_alert_sent_at timestamptz;

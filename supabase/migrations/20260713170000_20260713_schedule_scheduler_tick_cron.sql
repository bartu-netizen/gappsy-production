/*
  # Schedule the scheduler-tick heartbeat via pg_cron

  ONE permanent pg_cron entry, firing every minute, calling the
  scheduler-tick edge function. This is the platform's only real wall-clock
  trigger — every other schedule (scheduled_jobs.cron_expression /
  interval_seconds) is evaluated in TypeScript against this heartbeat, not
  as a separate pg_cron entry each. See _shared/schedulerRunner.ts.

  Auth: a dedicated vault secret (scheduler_tick_secret), NOT the
  supabase_service_role_key / supabase_url vault entries the existing
  daily-funnel-summary-email cron job (20260513184303) references — those
  turned out to be empty (SELECT * FROM vault.decrypted_secrets returns 0
  rows in this project; nothing ever populated them), which would silently
  make this job's own auth check a no-op if it depended on the same
  secrets. This migration creates its own secret via vault.create_secret,
  so it is self-contained and does not depend on that pre-existing gap
  being fixed. The same value must also be set as the SCHEDULER_TICK_SECRET
  edge function secret (done once via the Supabase CLI alongside this
  migration, not committed to git).
*/

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM vault.secrets WHERE name = 'scheduler_tick_secret') THEN
    PERFORM vault.create_secret(
      '5c99cf8ab531bb54a4b98f296082f64e441aa27a2891bfd774c8f96f7d00b98b',
      'scheduler_tick_secret',
      'Shared secret between pg_cron and the scheduler-tick edge function (bottleneck #2 orchestrator heartbeat).'
    );
  END IF;
END $$;

-- Supabase's edge function gateway enforces its own JWT check ahead of any
-- application code (verify_jwt, on by default) — a request needs a
-- recognized Authorization/apikey value to reach scheduler-tick's code at
-- all, separate from and in addition to this function's own
-- x-scheduler-secret check below. The anon key is public-safe (see
-- ENVIRONMENT_VARIABLES.md) and is already committed in netlify.toml /
-- .env.production, so hardcoding it here is consistent with the rest of
-- this repo, not a new secret exposure.
SELECT cron.schedule(
  'gappsy-scheduler-tick',
  '* * * * *',
  $$
  SELECT net.http_post(
    url := 'https://jczdgzhnsyzvbpfqueyy.supabase.co/functions/v1/scheduler-tick',
    headers := jsonb_build_object(
      'Content-Type', 'application/json',
      'apikey', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjemRnemhuc3l6dmJwZnF1ZXl5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxOTMzMjAsImV4cCI6MjA3OTc2OTMyMH0.YBz187aDqkiNHaURnGHcOfK5moytq7mcmVZYVGjHP3M',
      'Authorization', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjemRnemhuc3l6dmJwZnF1ZXl5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxOTMzMjAsImV4cCI6MjA3OTc2OTMyMH0.YBz187aDqkiNHaURnGHcOfK5moytq7mcmVZYVGjHP3M',
      'x-scheduler-secret', (SELECT decrypted_secret FROM vault.decrypted_secrets WHERE name = 'scheduler_tick_secret')
    ),
    body := '{"source":"pg_cron"}'::jsonb
  );
  $$
);

-- Schedules the lead-magnet comparison generator
-- (leadMagnetComparisonGeneratorHandler in _shared/schedulerRegistry.ts)
-- daily. Auto-creates a real, published "[Tool] vs [real competitor]"
-- comparison page for unclaimed tools with a valid contact email, before
-- ever emailing them — the outreach hook becomes "we already made this for
-- you" instead of an abstract pitch. Kept to a small batch (10/day) since
-- these are real, live, published pages.
INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, config, lease_seconds)
VALUES (
  'lead_magnet_comparison_generator', 'Lead Magnet Comparison Generator',
  'Creates a real "Tool vs Competitor" comparison page for unclaimed, emailable tools that don''t have one yet — the free hook used in cold outreach.',
  'lead_magnet_comparison_generator', 'interval', 86400, true, now(), '{"batch_size": 10}'::jsonb, 300
)
ON CONFLICT (job_key) DO NOTHING;

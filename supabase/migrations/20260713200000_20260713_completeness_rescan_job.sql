/*
  # Completeness rescan — dirty-tool lookup RPC + scheduled job

  get_dirty_tools_for_scoring: PostgREST's query builder can't express a
  column-to-column comparison (updated_at > last_scored_at) directly, so
  this is a small RPC rather than a .gt() filter. Used by the new
  completeness_rescan scheduler job_type (registered in
  _shared/schedulerRegistry.ts) to find and re-score only tools that
  changed since they were last scored, bounded per tick — reuses the
  bottleneck #2 scheduler rather than introducing a separate cron path.
*/

CREATE OR REPLACE FUNCTION get_dirty_tools_for_scoring(p_limit integer)
RETURNS TABLE(id uuid)
LANGUAGE sql
AS $$
  SELECT id FROM tools
  WHERE last_scored_at IS NULL OR updated_at > last_scored_at
  ORDER BY updated_at ASC
  LIMIT p_limit;
$$;

INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, priority, max_retries, config)
VALUES (
  'completeness_rescan', 'Completeness & Quality Rescan',
  'Recomputes completeness_percent/quality_score for tools changed since their last score (get_dirty_tools_for_scoring), bounded to config.batch_size per run (default 200) — keeps the Editorial Dashboard''s cached scores fresh without recomputing on every read.',
  'completeness_rescan', 'interval', 300, true, now(), 0, 3, '{"batch_size": 200}'::jsonb
)
ON CONFLICT (job_key) DO NOTHING;

-- Schedules the analytics retention cleanup (analyticsRetentionCleanupHandler
-- in _shared/schedulerRegistry.ts) daily. Prunes rows older than 400 days
-- from the raw per-event tracking tables (site_page_views, tool_page_views,
-- tool_outbound_clicks, smart_search_logs, tool_chat_messages) — fulfills
-- the privacy policy's own "we delete or anonymize data when no longer
-- needed" instead of letting these tables grow forever with no cleanup.
INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, config, lease_seconds)
VALUES (
  'analytics_retention_cleanup', 'Analytics Retention Cleanup',
  'Deletes rows older than 400 days from site_page_views, tool_page_views, tool_outbound_clicks, smart_search_logs, and tool_chat_messages.',
  'analytics_retention_cleanup', 'interval', 86400, true, now(), '{}'::jsonb, 300
)
ON CONFLICT (job_key) DO NOTHING;

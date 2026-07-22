INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, config)
VALUES (
  'tool_email_listclean_scan', 'ListClean Scan (Software Tools)',
  'Submits scraped software-tool vendor emails (tool_contact_emails) to ListClean for verification and applies clean/dirty/retry results once ready — same vocabulary as the marketing-agency pipeline, so only listclean_status=''valid'' emails are ever eligible for Smartlead outreach.',
  'tool_email_listclean_scan', 'interval', 300, true, now(), '{"submit_batch_size": 200}'::jsonb
)
ON CONFLICT (job_key) DO NOTHING;

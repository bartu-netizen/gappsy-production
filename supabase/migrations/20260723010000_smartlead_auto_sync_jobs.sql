-- Fully automates the last manual step of the scrape -> ListClean ->
-- Smartlead pipeline: sending clean, verified emails into their
-- campaign. Both campaigns already exist in Smartlead (confirmed live via
-- the Smartlead API on 2026-07-23) — campaign_id is baked into each job's
-- config since each source always goes to its own fixed campaign.
INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, config, lease_seconds)
VALUES (
  'tool_email_smartlead_sync', 'Smartlead Sync (Listed Tools)',
  'Sends every still-unsynced, ListClean-verified-clean email from tool_contact_emails into the "Software Tool Listed On Gappsy" Smartlead campaign.',
  'tool_email_smartlead_sync', 'interval', 300, true, now(), '{"campaign_id": "3707597"}'::jsonb, 180
)
ON CONFLICT (job_key) DO NOTHING;

INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, config, lease_seconds)
VALUES (
  'discovered_tool_email_smartlead_sync', 'Smartlead Sync (Not Yet Listed Tools)',
  'Sends every still-unsynced, ListClean-verified-clean email from discovered_tool_contact_emails into the "Software Tool NOT Listed On Gappsy" Smartlead campaign.',
  'discovered_tool_email_smartlead_sync', 'interval', 300, true, now(), '{"campaign_id": "3707931"}'::jsonb, 180
)
ON CONFLICT (job_key) DO NOTHING;

-- Second scraping/verification pipeline: contact emails for tools that
-- are NOT yet listed on Gappsy (sourced from the Discovery Engine's
-- discovered_tools staging table) instead of the already-published tools
-- table. Mirrors tool_contact_emails' shape and the same ListClean
-- clean/dirty/retry/failed vocabulary, kept as a separate table (not a
-- nullable dual-FK on tool_contact_emails) matching discovered_tools'
-- own existing duplicate_of_tool_id/duplicate_of_discovery_id convention
-- of two distinct FK targets living in two distinct columns.
--
-- Never targets open-source/GitHub-native candidates (own standing
-- business rule, not just this table) — enforced in the scheduler
-- handler's selection query, not here, since it depends on
-- discovery_providers.key.

ALTER TABLE discovered_tools
  ADD COLUMN IF NOT EXISTS email_discovery_status text CHECK (email_discovery_status IS NULL OR email_discovery_status IN ('done', 'failed')),
  ADD COLUMN IF NOT EXISTS email_discovery_attempts integer NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS email_discovery_checked_at timestamptz;

CREATE INDEX IF NOT EXISTS discovered_tools_email_discovery_pending_idx
  ON discovered_tools (status)
  WHERE email_discovery_status IS NULL;

CREATE TABLE IF NOT EXISTS discovered_tool_contact_emails (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  discovered_tool_id uuid NOT NULL REFERENCES discovered_tools(id) ON DELETE CASCADE,
  email text NOT NULL,
  source_url text,
  discovered_at timestamptz NOT NULL DEFAULT now(),

  listclean_status text CHECK (listclean_status IS NULL OR listclean_status IN ('submitted', 'valid', 'invalid', 'failed')),
  listclean_list_id bigint,
  listclean_external_status text,
  listclean_attempt_count integer NOT NULL DEFAULT 0,
  listclean_submitted_at timestamptz,
  listclean_checked_at timestamptz,

  smartlead_campaign_id text,
  smartlead_synced_at timestamptz,

  UNIQUE (discovered_tool_id, email)
);

CREATE INDEX IF NOT EXISTS discovered_tool_contact_emails_listclean_pending_idx
  ON discovered_tool_contact_emails ((listclean_status IS NULL OR listclean_status = 'submitted'));

CREATE INDEX IF NOT EXISTS discovered_tool_contact_emails_listclean_list_id_idx
  ON discovered_tool_contact_emails (listclean_list_id)
  WHERE listclean_status = 'submitted';

ALTER TABLE discovered_tool_contact_emails ENABLE ROW LEVEL SECURITY;

INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, config, lease_seconds)
VALUES (
  'discovered_tool_email_scan', 'Email Scan (Not-Yet-Listed Tools)',
  'Crawls each validated, non-open-source Discovery Engine candidate''s own website for a real contact email — same crawler-gateway pipeline as the listed-tools scan, sourced from discovered_tools instead of tools.',
  'discovered_tool_email_scan', 'interval', 180, true, now(), '{"batch_size": 4}'::jsonb, 180
)
ON CONFLICT (job_key) DO NOTHING;

INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, config, lease_seconds)
VALUES (
  'discovered_tool_email_listclean_scan', 'ListClean Scan (Not-Yet-Listed Tools)',
  'Submits scraped not-yet-listed-tool emails (discovered_tool_contact_emails) to ListClean for verification and applies clean/dirty/retry results once ready.',
  'discovered_tool_email_listclean_scan', 'interval', 300, true, now(), '{"submit_batch_size": 200}'::jsonb, 180
)
ON CONFLICT (job_key) DO NOTHING;

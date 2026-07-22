-- Vendor outreach: discovers real contact emails for paid (non-open-source)
-- tools by crawling their own website via the existing Crawl4AI gateway, so
-- they can be added to a Smartlead campaign. A tool can have several real
-- addresses (info@, sales@, a named founder@) — all discovered ones are kept,
-- not just the first match.
CREATE TABLE IF NOT EXISTS tool_contact_emails (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  email text NOT NULL,
  source_url text,
  discovered_at timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Plain-column (not lower(email)) so Supabase's .upsert(..., { onConflict })
-- can target it directly; emails are already lowercased before insert (see
-- _shared/emailExtraction.ts), so this is equivalent in practice.
CREATE UNIQUE INDEX IF NOT EXISTS idx_tool_contact_emails_tool_email ON tool_contact_emails (tool_id, email);
CREATE INDEX IF NOT EXISTS idx_tool_contact_emails_tool_id ON tool_contact_emails (tool_id);

-- Drives the scheduled scan's work queue: NULL = not yet attempted,
-- 'done'/'failed' = terminal for this pass (an admin can reset a row back to
-- NULL to force a recrawl). Never touched for is_open_source tools.
ALTER TABLE tools ADD COLUMN IF NOT EXISTS email_discovery_status text;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS email_discovery_checked_at timestamptz;

CREATE INDEX IF NOT EXISTS idx_tools_email_discovery_pending ON tools (id)
  WHERE email_discovery_status IS NULL AND is_open_source = false AND status = 'published';

-- Small batch (4), sequential crawls, every 5 minutes — deliberately slower
-- than crawl_queue_drain's 120s cadence since both share one 512MB/1CPU
-- Crawl4AI container; this backfill is a soak, not a race.
INSERT INTO scheduled_jobs (job_key, name, description, job_type, schedule_type, interval_seconds, enabled, next_run_at, config)
VALUES (
  'email_discovery_scan', 'Email Discovery Scan',
  'Crawls each paid (non-open-source) published tool''s own website via the Crawl4AI gateway and stores every self-published contact email found (mailto: links + plain-text matches) in tool_contact_emails, for vendor outreach.',
  'email_discovery_scan', 'interval', 300, true, now(), '{"batch_size": 4}'::jsonb
)
ON CONFLICT (job_key) DO NOTHING;

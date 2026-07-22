-- Tracks retry attempts for transient crawl failures (network/gateway
-- errors), so a single flaky attempt doesn't permanently give up on a
-- tool — only a genuinely unreachable/invalid site does, after a few tries.
ALTER TABLE tools ADD COLUMN IF NOT EXISTS email_discovery_attempts integer NOT NULL DEFAULT 0;

-- Give every tool a fresh shot under the improved logic (retry-aware +
-- a /contact fallback crawl when the homepage pass finds nothing) — only
-- 8 tools had been processed under the old single-pass logic, so this
-- costs nothing and guarantees all 2047 eligible tools get the same
-- best-effort treatment.
UPDATE tools SET email_discovery_status = NULL, email_discovery_attempts = 0
WHERE is_open_source = false AND status = 'published' AND email_discovery_status IS NOT NULL;

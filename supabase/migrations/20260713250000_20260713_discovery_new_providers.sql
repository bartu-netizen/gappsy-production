/*
  # Discovery scale — Phase 2/3: register new public-data providers,
  # document deferred sources

  Five new real providers (npm, PyPI, VS Code Marketplace, WordPress
  Plugin Directory, GitHub Topics), each with a genuine public
  API/registry-endpoint/feed — no credential required for any of them, so
  all are seeded enabled: true (unlike Product Hunt, which stays disabled
  until PRODUCT_HUNT_API_TOKEN exists). Conservative rate_limit_per_run
  (30-40) and 'daily' schedule_frequency, matching the existing
  providers' defaults — an admin can raise these via
  admin-discovery-providers once each is confirmed healthy in production
  (see the Phase 7 verification step for this batch of work).

  Also documents two more deferred sources (Chrome Web Store, StackShare)
  as registered-but-unimplemented stubs — verified (not assumed) in July
  2026 that neither has a public discovery mechanism appropriate for
  automated ingestion (see registry.ts for the specific finding per
  source) — and sharpens the existing four scraper stubs' disabled_reason
  to state exactly what would need to change to activate them, per the
  "document the exact requirement for activation" instruction.
*/

INSERT INTO discovery_providers (key, name, type, enabled, implemented, priority, rate_limit_per_run, schedule_frequency, disabled_reason, config) VALUES
  ('npm_registry', 'npm Registry', 'api', true, true, 30, 40, 'daily', NULL,
    '{"queries": ["cli tool", "developer tool", "self-hosted"]}'::jsonb),
  ('pypi', 'PyPI', 'api', true, true, 30, 30, 'daily', NULL, '{}'::jsonb),
  ('vscode_marketplace', 'VS Code Marketplace', 'api', true, true, 30, 40, 'daily', NULL,
    '{"categories": ["Other", "Snippets", "Linters", "Formatters", "Debuggers"]}'::jsonb),
  ('wordpress_plugins', 'WordPress Plugin Directory', 'api', true, true, 30, 40, 'daily', NULL, '{}'::jsonb),
  ('github_topics', 'GitHub Topics', 'api', true, true, 30, 40, 'daily', NULL,
    '{"topics": ["developer-tools", "self-hosted", "cli-app"]}'::jsonb),
  ('chrome_web_store', 'Chrome Web Store', 'scraper', false, false, 100, 50, 'weekly',
    'The Chrome Web Store API (v1/v2) is a publisher-management API (manage items YOU own via a Google service account) — it has no public search/browse/list-all-extensions endpoint. Verified July 2026. Activation requires Google introducing a public discovery API, or a verified, explicitly-permitted data partnership.',
    '{}'::jsonb),
  ('stackshare', 'StackShare', 'scraper', false, false, 100, 50, 'weekly',
    'StackShare''s public API was discontinued for general developer use (verified July 2026 — docs.stackshare.io exists but self-serve API access is not generally available). Activation requires StackShare shipping a new public API, or an explicit partnership/permitted-integration agreement.',
    '{}'::jsonb)
ON CONFLICT (key) DO NOTHING;

-- Sharpen the four pre-existing scraper stubs' disabled_reason with what
-- specifically would need to change to activate each — same generic
-- research finding for all four (no confirmed public API surfaced for
-- any of them as of this review), stated more actionably than the
-- original "pending a ToS review" phrasing.
UPDATE discovery_providers
SET disabled_reason = 'No confirmed public API. Activation requires either the vendor publishing a documented public API/data feed, or an explicit written permission/partnership agreement for automated access — scraping without permission is not an option (see CLAUDE.md).'
WHERE key IN ('peerlist', 'futuretools', 'alternativeto', 'saashub')
  AND implemented = false;

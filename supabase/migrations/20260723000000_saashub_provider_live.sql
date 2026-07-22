-- SaaSHub discovery provider goes live (real scraper built and verified
-- 2026-07-23 — see _shared/discoveryProviders/saashubProvider.ts) as the
-- primary "another way" to find not-yet-listed candidates after
-- github_topics/github_awesome_lists/npm_registry/pypi were disabled per
-- the standing no-open-source-discovery business rule.
UPDATE discovery_providers
SET enabled = true, implemented = true, schedule_frequency = 'daily'
WHERE key = 'saashub';

-- Standing business rule: never discover open-source/GitHub-native
-- candidates at all, not just skip them at outreach time (escalated
-- 2026-07-23). Idempotent alongside the earlier ad-hoc disable.
UPDATE discovery_providers
SET enabled = false
WHERE key IN ('github_topics', 'github_awesome_lists', 'npm_registry', 'pypi');

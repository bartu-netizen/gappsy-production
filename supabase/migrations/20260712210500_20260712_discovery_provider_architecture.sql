-- Discovery Engine: provider-based architecture. Fully additive — no
-- existing column, row, or constraint semantics are removed; only new
-- columns/tables/seed rows are added on top of the discovery engine
-- created in 20260712180000_20260712_create_discovery_engine.sql.
--
-- Turns discovery_providers from "Manual + CSV, admin-driven" into a
-- general registry that automated fetch providers (GitHub, Product Hunt,
-- future scrapers) register into, each with its own schedule, rate limit,
-- priority, and enabled/implemented state. Adding a new provider is still
-- "a migration seed row + a provider module" — no core schema change.

-- 'scraper' covers sources with no public API (Peerlist, FutureTools,
-- AlternativeTo, SaaSHub today) — registered so the admin UI can show them
-- as planned, even while `implemented = false`.
ALTER TABLE discovery_providers DROP CONSTRAINT IF EXISTS discovery_providers_type_check;
ALTER TABLE discovery_providers ADD CONSTRAINT discovery_providers_type_check
  CHECK (type IN ('manual', 'csv', 'api', 'scraper', 'crawler'));

ALTER TABLE discovery_providers
  ADD COLUMN IF NOT EXISTS description text,
  -- Lower number = runs first when multiple providers are due. Purely an
  -- ordering hint for the (future) scheduler and the admin dashboard.
  ADD COLUMN IF NOT EXISTS priority integer NOT NULL DEFAULT 100,
  -- Hard cap on candidates ingested in a single run — bounds cost/risk of
  -- a misbehaving or unexpectedly large upstream source.
  ADD COLUMN IF NOT EXISTS rate_limit_per_run integer NOT NULL DEFAULT 50 CHECK (rate_limit_per_run > 0),
  ADD COLUMN IF NOT EXISTS schedule_frequency text NOT NULL DEFAULT 'manual'
    CHECK (schedule_frequency IN ('hourly', 'daily', 'weekly', 'manual')),
  ADD COLUMN IF NOT EXISTS last_run_at timestamptz,
  ADD COLUMN IF NOT EXISTS next_run_at timestamptz,
  ADD COLUMN IF NOT EXISTS last_run_status text
    CHECK (last_run_status IS NULL OR last_run_status IN ('completed', 'failed', 'partial')),
  -- implemented=false means the provider module is a registered stub (no
  -- fetch logic yet, e.g. pending a credential or a ToS decision) — distinct
  -- from enabled=false, which just means "don't run this right now."
  ADD COLUMN IF NOT EXISTS implemented boolean NOT NULL DEFAULT true,
  ADD COLUMN IF NOT EXISTS disabled_reason text;

CREATE INDEX IF NOT EXISTS discovery_providers_next_run_idx ON discovery_providers (next_run_at) WHERE enabled AND implemented;

-- Execution history for every provider run (manual-trigger today; the same
-- row shape a future scheduled/retry run would write) — backs Provider
-- Health, Provider Logs, and Discovery Errors in the admin.
CREATE TABLE IF NOT EXISTS discovery_provider_runs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  provider_id uuid NOT NULL REFERENCES discovery_providers(id) ON DELETE CASCADE,
  trigger text NOT NULL DEFAULT 'manual' CHECK (trigger IN ('manual', 'scheduled', 'retry')),
  status text NOT NULL DEFAULT 'running' CHECK (status IN ('running', 'completed', 'failed', 'partial')),
  candidates_found integer NOT NULL DEFAULT 0,
  candidates_created integer NOT NULL DEFAULT 0,
  candidates_duplicate integer NOT NULL DEFAULT 0,
  candidates_rejected integer NOT NULL DEFAULT 0,
  rate_limit_remaining integer,
  cursor_out text,
  error_code text,
  error_message text,
  warnings jsonb NOT NULL DEFAULT '[]'::jsonb,
  started_at timestamptz NOT NULL DEFAULT now(),
  completed_at timestamptz,
  duration_ms integer,
  created_by text
);

CREATE INDEX IF NOT EXISTS discovery_provider_runs_provider_idx ON discovery_provider_runs (provider_id, started_at DESC);
CREATE INDEX IF NOT EXISTS discovery_provider_runs_status_idx ON discovery_provider_runs (status);

ALTER TABLE discovery_provider_runs ENABLE ROW LEVEL SECURITY;
-- No policies — admin/service-role only, same as every other discovery/
-- enrichment table.

-- Seed the new providers. GitHub Awesome Lists has no credential
-- requirement and is enabled by default; Product Hunt is registered with
-- real fetch logic but stays disabled until PRODUCT_HUNT_API_TOKEN exists;
-- the four scraper sources are registered stubs pending a ToS decision.
INSERT INTO discovery_providers (key, name, type, enabled, implemented, priority, rate_limit_per_run, schedule_frequency, disabled_reason, config) VALUES
  ('github_awesome_lists', 'GitHub Awesome Lists', 'api', true, true, 10, 100, 'daily', NULL,
    '{"repos": ["sindresorhus/awesome", "awesome-selfhosted/awesome-selfhosted"]}'::jsonb),
  ('product_hunt', 'Product Hunt', 'api', false, true, 20, 50, 'daily',
    'Missing PRODUCT_HUNT_API_TOKEN — add the secret in Supabase Functions and enable this provider to activate.',
    '{}'::jsonb),
  ('peerlist', 'Peerlist', 'scraper', false, false, 100, 50, 'weekly',
    'No confirmed public API — pending a ToS review before a scraper is built.', '{}'::jsonb),
  ('futuretools', 'FutureTools', 'scraper', false, false, 100, 50, 'weekly',
    'No confirmed public API — pending a ToS review before a scraper is built.', '{}'::jsonb),
  ('alternativeto', 'AlternativeTo', 'scraper', false, false, 100, 50, 'weekly',
    'No confirmed public API — pending a ToS review before a scraper is built.', '{}'::jsonb),
  ('saashub', 'SaaSHub', 'scraper', false, false, 100, 50, 'weekly',
    'No confirmed public API — pending a ToS review before a scraper is built.', '{}'::jsonb)
ON CONFLICT (key) DO NOTHING;

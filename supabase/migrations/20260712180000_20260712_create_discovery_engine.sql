-- Discovery Engine: candidate-tool staging pipeline that feeds the existing
-- Tools/Publishing system. Fully additive — no existing table is touched.
--
-- Pipeline: Discovery -> Validation -> Duplicate Detection -> Official
-- Website Resolution -> Quality Score -> Approved For Crawl. Nothing beyond
-- "Approved For Crawl" is built here — no extraction/AI/crawling is wired
-- up. A discovered_tools row only ever becomes a `tools` row via a future,
-- separate promotion stage (out of scope today).
--
-- Reuses tool_categories for taxonomy (no parallel category table) and the
-- existing admin_audit_log / admin_sessions infrastructure for audit trail
-- and auth — see the discovery-* edge functions.

-- Provider registry — "adding a provider = adding a row + a provider
-- module," never a core schema/UI change. Initial rows: Manual + CSV.
-- Future providers (Product Hunt, GitHub, npm, ...) are added the same way.
CREATE TABLE IF NOT EXISTS discovery_providers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  key text UNIQUE NOT NULL,
  name text NOT NULL,
  type text NOT NULL CHECK (type IN ('manual', 'csv', 'api', 'crawler')),
  enabled boolean NOT NULL DEFAULT true,
  config jsonb NOT NULL DEFAULT '{}'::jsonb,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- The core staging entity: a discovered candidate, not yet a tool.
CREATE TABLE IF NOT EXISTS discovered_tools (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text NOT NULL,
  official_website text NOT NULL,
  hostname text,
  category_id uuid REFERENCES tool_categories(id) ON DELETE SET NULL,
  provider_id uuid REFERENCES discovery_providers(id) ON DELETE SET NULL,
  source_url text,
  logo_url text,
  short_description text,
  status text NOT NULL DEFAULT 'new' CHECK (status IN (
    'new', 'validated', 'needs_review', 'duplicate', 'rejected', 'approved_for_crawl', 'crawled'
  )),
  -- confidence_score: how sure we are this is a real, legitimate product.
  -- duplicate_score: how likely this candidate already exists (tools or
  -- other discovered_tools rows). quality_score: composite readiness score
  -- computed from the above plus validation completeness — the gate before
  -- Approved For Crawl. All three are nullable until validation runs; never
  -- fabricated — see _shared/discoveryScoring.ts.
  confidence_score integer CHECK (confidence_score IS NULL OR (confidence_score >= 0 AND confidence_score <= 100)),
  duplicate_score integer CHECK (duplicate_score IS NULL OR (duplicate_score >= 0 AND duplicate_score <= 100)),
  quality_score integer CHECK (quality_score IS NULL OR (quality_score >= 0 AND quality_score <= 100)),
  validation_notes jsonb NOT NULL DEFAULT '{}'::jsonb,
  duplicate_of_tool_id uuid REFERENCES tools(id) ON DELETE SET NULL,
  duplicate_of_discovery_id uuid REFERENCES discovered_tools(id) ON DELETE SET NULL,
  reviewed_by text,
  reviewed_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS discovered_tools_slug_key ON discovered_tools (slug);
CREATE INDEX IF NOT EXISTS discovered_tools_status_idx ON discovered_tools (status);
CREATE INDEX IF NOT EXISTS discovered_tools_hostname_idx ON discovered_tools (hostname);
CREATE INDEX IF NOT EXISTS discovered_tools_provider_idx ON discovered_tools (provider_id);
CREATE INDEX IF NOT EXISTS discovered_tools_category_idx ON discovered_tools (category_id);
CREATE INDEX IF NOT EXISTS discovered_tools_created_at_idx ON discovered_tools (created_at);

-- CSV/bulk import batch progress tracking — mirrors tool_import_history's
-- shape for the existing Publishing pipeline, kept separate because this
-- tracks a whole file's progress, not one candidate's.
CREATE TABLE IF NOT EXISTS discovery_import_batches (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  provider_id uuid REFERENCES discovery_providers(id) ON DELETE SET NULL,
  file_name text,
  total_rows integer NOT NULL DEFAULT 0,
  processed_rows integer NOT NULL DEFAULT 0,
  success_count integer NOT NULL DEFAULT 0,
  error_count integer NOT NULL DEFAULT 0,
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'processing', 'completed', 'failed')),
  errors jsonb NOT NULL DEFAULT '[]'::jsonb,
  created_by text,
  created_at timestamptz NOT NULL DEFAULT now(),
  completed_at timestamptz
);

CREATE INDEX IF NOT EXISTS discovery_import_batches_status_idx ON discovery_import_batches (status);
CREATE INDEX IF NOT EXISTS discovery_import_batches_created_at_idx ON discovery_import_batches (created_at);

ALTER TABLE discovery_providers ENABLE ROW LEVEL SECURITY;
ALTER TABLE discovered_tools ENABLE ROW LEVEL SECURITY;
ALTER TABLE discovery_import_batches ENABLE ROW LEVEL SECURITY;
-- No policies on any of the three — admin/service-role only, exactly like
-- tool_import_history and tool_media. Never exposed to public/anon clients.

INSERT INTO discovery_providers (key, name, type, enabled, config) VALUES
  ('manual', 'Manual Import', 'manual', true, '{}'::jsonb),
  ('csv', 'CSV Import', 'csv', true, '{}'::jsonb)
ON CONFLICT (key) DO NOTHING;

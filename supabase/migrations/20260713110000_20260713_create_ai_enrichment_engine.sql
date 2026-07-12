-- AI Enrichment Engine: additive schema only.
--
-- Sits between Tool Draft (tools.status IN ('draft','needs_review')) and the
-- existing Publishing Queue. Nothing here changes existing columns, tables,
-- statuses, or RLS on `tools` / `crawl_jobs` / `discovered_tools`.
--
-- Provider-agnostic by design: `provider` columns below currently only ever
-- hold 'claude_code_batch' (a human-in-the-loop export/import workflow using
-- the admin's own Claude Code session — no AI API key required). Live API
-- providers (openai/anthropic/gemini) can be added later purely as new rows
-- in `enrichment_prompt_versions.provider_compatibility` / new `provider`
-- values — no schema change required to add one.

-- ---------------------------------------------------------------------------
-- 1. New editorial fields on `tools` (all nullable, additive, AI-suggested
--    prose that has no existing 1:1 column). Never auto-populated — always
--    written via the same admin-tools PUT path as every other tools field.
-- ---------------------------------------------------------------------------
ALTER TABLE tools
  ADD COLUMN IF NOT EXISTS best_for text,
  ADD COLUMN IF NOT EXISTS target_audience text,
  ADD COLUMN IF NOT EXISTS pricing_summary text,
  ADD COLUMN IF NOT EXISTS features_summary text,
  ADD COLUMN IF NOT EXISTS integrations_summary text,
  ADD COLUMN IF NOT EXISTS company_summary text,
  ADD COLUMN IF NOT EXISTS editorial_verdict text,
  ADD COLUMN IF NOT EXISTS llm_readable_summary text;

-- ---------------------------------------------------------------------------
-- 2. Prompt versioning. Rows are never overwritten — a "new version" is
--    always a new row (enforced by app code, not DB, to match the rest of
--    this schema's convention).
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS enrichment_prompt_versions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  prompt_key text NOT NULL,
  version int NOT NULL,
  name text NOT NULL,
  purpose text,
  system_template text NOT NULL,
  user_template text NOT NULL,
  required_input_fields jsonb NOT NULL DEFAULT '[]',
  output_schema jsonb NOT NULL,
  provider_compatibility text[] NOT NULL DEFAULT '{claude_code_batch}',
  model_recommendation text,
  active boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  created_by text,
  change_notes text,
  UNIQUE (prompt_key, version)
);

CREATE INDEX IF NOT EXISTS idx_enrichment_prompt_versions_key_active
  ON enrichment_prompt_versions (prompt_key, active);

-- ---------------------------------------------------------------------------
-- 3. Batches: the human-facing unit of work — one batch = one export
--    package the admin pastes into Claude Code, and one result they paste
--    back. A batch always contains >=1 tool.
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS enrichment_batches (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  status text NOT NULL DEFAULT 'queued'
    CHECK (status IN ('queued','exported','importing','completed','failed','partially_completed','cancelled')),
  tool_ids uuid[] NOT NULL,
  requested_fields text[] NOT NULL DEFAULT '{}',
  provider text NOT NULL DEFAULT 'claude_code_batch',
  prompt_version_id uuid REFERENCES enrichment_prompt_versions(id) ON DELETE SET NULL,
  export_package jsonb,
  exported_at timestamptz,
  import_raw jsonb,
  import_warnings jsonb NOT NULL DEFAULT '[]',
  imported_at timestamptz,
  error_code text,
  error_message text,
  created_by text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT enrichment_batches_tool_ids_not_empty CHECK (array_length(tool_ids, 1) > 0)
);

CREATE INDEX IF NOT EXISTS idx_enrichment_batches_status ON enrichment_batches (status);
CREATE INDEX IF NOT EXISTS idx_enrichment_batches_created_at ON enrichment_batches (created_at);

-- ---------------------------------------------------------------------------
-- 4. Jobs: one per tool per batch. Regenerating a tool (whole job or a
--    single field) always creates a NEW job row (generation_version + 1) —
--    history is never overwritten, per the regeneration requirement.
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS enrichment_jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  batch_id uuid NOT NULL REFERENCES enrichment_batches(id) ON DELETE CASCADE,
  tool_id uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  crawl_job_id uuid REFERENCES crawl_jobs(id) ON DELETE SET NULL,
  status text NOT NULL DEFAULT 'queued'
    CHECK (status IN ('queued','exported','needs_review','applied','failed','cancelled')),
  provider text NOT NULL DEFAULT 'claude_code_batch',
  model text,
  prompt_version_id uuid REFERENCES enrichment_prompt_versions(id) ON DELETE SET NULL,
  generation_version int NOT NULL DEFAULT 1,
  requested_fields text[] NOT NULL DEFAULT '{}',
  started_at timestamptz,
  completed_at timestamptz,
  duration_ms int,
  input_tokens int,
  output_tokens int,
  total_tokens int,
  estimated_cost_usd numeric(10,4),
  error_code text,
  error_message text,
  retry_count int NOT NULL DEFAULT 0,
  created_by text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_enrichment_jobs_tool_id ON enrichment_jobs (tool_id);
CREATE INDEX IF NOT EXISTS idx_enrichment_jobs_batch_id ON enrichment_jobs (batch_id);
CREATE INDEX IF NOT EXISTS idx_enrichment_jobs_status ON enrichment_jobs (status);
CREATE INDEX IF NOT EXISTS idx_enrichment_jobs_created_at ON enrichment_jobs (created_at);

-- One active (queued/exported) job per tool at a time — app code enforces
-- this too (matching the crawl_jobs convention), this is defense in depth.
CREATE UNIQUE INDEX IF NOT EXISTS idx_enrichment_jobs_one_active_per_tool
  ON enrichment_jobs (tool_id)
  WHERE status IN ('queued','exported');

-- ---------------------------------------------------------------------------
-- 5. Field suggestions: one row per field per job. Never mutated by a new
--    generation — a regenerate creates a new job with its own suggestion
--    rows, so editors can diff old vs new.
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS enrichment_field_suggestions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  enrichment_job_id uuid NOT NULL REFERENCES enrichment_jobs(id) ON DELETE CASCADE,
  field_key text NOT NULL,
  generated_value jsonb,
  confidence int NOT NULL DEFAULT 0 CHECK (confidence BETWEEN 0 AND 100),
  reason text,
  source_urls text[] NOT NULL DEFAULT '{}',
  supporting_evidence text,
  classification text NOT NULL DEFAULT 'editorial' CHECK (classification IN ('factual','editorial')),
  unsupported boolean NOT NULL DEFAULT false,
  warnings text[] NOT NULL DEFAULT '{}',
  review_status text NOT NULL DEFAULT 'pending'
    CHECK (review_status IN ('pending','approved','rejected','edited','unsupported')),
  approved_value jsonb,
  reviewer text,
  reviewed_at timestamptz,
  applied_to_tool boolean NOT NULL DEFAULT false,
  applied_at timestamptz,
  provider text,
  model text,
  prompt_version_id uuid REFERENCES enrichment_prompt_versions(id) ON DELETE SET NULL,
  generated_at timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_enrichment_field_suggestions_job_id
  ON enrichment_field_suggestions (enrichment_job_id);
CREATE INDEX IF NOT EXISTS idx_enrichment_field_suggestions_review_status
  ON enrichment_field_suggestions (review_status);
CREATE INDEX IF NOT EXISTS idx_enrichment_field_suggestions_field_key
  ON enrichment_field_suggestions (field_key);

-- ---------------------------------------------------------------------------
-- 6. Settings: singleton row, admin-configurable (confidence threshold for
--    "approve all eligible", batch size limits, active provider).
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS enrichment_settings (
  id boolean PRIMARY KEY DEFAULT true CHECK (id),
  active_provider text NOT NULL DEFAULT 'claude_code_batch',
  default_confidence_threshold int NOT NULL DEFAULT 90 CHECK (default_confidence_threshold BETWEEN 0 AND 100),
  default_batch_size int NOT NULL DEFAULT 10 CHECK (default_batch_size > 0),
  max_batch_size int NOT NULL DEFAULT 250 CHECK (max_batch_size > 0),
  default_prompt_key text NOT NULL DEFAULT 'tool_editorial_enrichment',
  updated_at timestamptz NOT NULL DEFAULT now(),
  updated_by text
);

INSERT INTO enrichment_settings (id) VALUES (true) ON CONFLICT (id) DO NOTHING;

-- ---------------------------------------------------------------------------
-- 7. RLS: admin/service-role only, matching discovered_tools / crawl_jobs —
--    RLS enabled, no policies (service-role client used by edge functions
--    bypasses RLS entirely; nothing here is ever exposed to anon/public).
-- ---------------------------------------------------------------------------
ALTER TABLE enrichment_prompt_versions ENABLE ROW LEVEL SECURITY;
ALTER TABLE enrichment_batches ENABLE ROW LEVEL SECURITY;
ALTER TABLE enrichment_jobs ENABLE ROW LEVEL SECURITY;
ALTER TABLE enrichment_field_suggestions ENABLE ROW LEVEL SECURITY;
ALTER TABLE enrichment_settings ENABLE ROW LEVEL SECURITY;

-- ---------------------------------------------------------------------------
-- 8. Seed the default prompt version so the system is usable immediately.
--    Field-key contract lives in _shared/enrichmentSchema.ts; kept in sync
--    here in prose form for the model's benefit, not machine-parsed.
-- ---------------------------------------------------------------------------
INSERT INTO enrichment_prompt_versions (
  prompt_key, version, name, purpose, system_template, user_template,
  required_input_fields, output_schema, provider_compatibility,
  model_recommendation, active, created_by, change_notes
) VALUES (
  'tool_editorial_enrichment',
  1,
  'Tool editorial enrichment v1',
  'Generate reviewable editorial content (descriptions, pros/cons, summaries, FAQs, SEO fields, category/tag suggestions) for a batch of Tool Drafts, grounded only in reviewed crawl evidence.',
  E'You are Gappsy''s editorial content generation assistant. You will receive a JSON batch of Tool Drafts, each with grounded factual evidence (from reviewed website crawls) and the tool''s current draft values.\n\n'
  || E'Hard rules:\n'
  || E'1. Never invent facts. Every factual field (pricing, features, integrations, company details, platform/API availability, languages, security claims) must be grounded in the provided evidence or explicit source URLs. If evidence is missing for a field, set "value" to null, "unsupported" to true, and explain what is missing in "reason".\n'
  || E'2. Editorial fields (best_for, target_audience, pros, cons, editorial_verdict) are Gappsy''s own editorial judgment, not objective facts — write them as such, and mark "classification":"editorial".\n'
  || E'3. Never generate or alter: editorial rating, review count, user reviews, popularity/traffic/market-share claims, or any comparison claim not directly supported by the provided evidence.\n'
  || E'4. Category/tag suggestions must be chosen only from the existing taxonomy list provided — never invent a new category or tag.\n'
  || E'5. Do not overwrite the intent of a non-empty existing draft value silently — if the tool already has a value for a field, treat your output as a *suggestion* to review against it, not a replacement.\n'
  || E'6. Output strictly valid JSON matching the provided output_schema — no prose outside the JSON.',
  'For each tool in the batch, generate the requested fields as an array of field suggestion objects: {field_key, value, confidence (0-100), reason, source_urls, evidence, classification ("factual"|"editorial"), unsupported (bool), warnings (string[])}. Only generate the fields listed in that tool''s "requested_fields". Return {"batch_id": "...", "results": [{"tool_id": "...", "fields": [...]}]}.',
  '["tool_id","existing_values","grounded_evidence","requested_fields","taxonomy"]'::jsonb,
  '{"type":"object","required":["batch_id","results"],"properties":{"batch_id":{"type":"string"},"results":{"type":"array","items":{"type":"object","required":["tool_id","fields"],"properties":{"tool_id":{"type":"string"},"fields":{"type":"array","items":{"type":"object","required":["field_key","confidence","classification"],"properties":{"field_key":{"type":"string"},"value":{},"confidence":{"type":"number","minimum":0,"maximum":100},"reason":{"type":"string"},"source_urls":{"type":"array","items":{"type":"string"}},"evidence":{"type":"string"},"classification":{"type":"string","enum":["factual","editorial"]},"unsupported":{"type":"boolean"},"warnings":{"type":"array","items":{"type":"string"}}}}}}}}}}'::jsonb,
  '{claude_code_batch}',
  'Claude Code (Claude Max subscription) — no API model id, run interactively',
  true,
  'system',
  'Initial seed version for the Claude Code Batch enrichment workflow.'
)
ON CONFLICT (prompt_key, version) DO NOTHING;

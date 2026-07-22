/*
  # Enterprise Editorial Platform — schema

  Builds on the already-mature completeness scorer (_shared/toolCompleteness.ts)
  and publish gates in admin-tools rather than replacing them. Three additive
  pieces:

  1. tools: cached completeness_percent / quality_score / last_scored_at so
     the Editorial Dashboard and list views never need to recompute
     completeness (a ~9-query batch operation) on every page render at
     scale. Populated by a new scheduler job_type (completeness_rescan,
     reusing the bottleneck #2 scheduler) that only rescans tools whose
     updated_at is newer than their last_scored_at.

  2. publishing_rules: makes the existing "first publish" strict gate
     (validateFirstPublishStrict in toolCompleteness.ts — logo, screenshots,
     features, FAQ, tags, meta title) admin-configurable instead of
     hardcoded, without touching the more fundamental base gate
     (name/slug/website/category/description/pricing — those stay
     hardcoded, they're structural, not editorial policy). Seeded with rows
     that exactly reproduce today's hardcoded behavior, so nothing changes
     until an admin edits a rule.

  3. admin_audit_log.duration_ms: one nullable column so the Review
     Workspace can report time-on-screen for a review action, enabling
     "average review time" in Editor Metrics — reusing the existing,
     already-wired-everywhere audit log instead of introducing a parallel
     events table.
*/

-- 1. tools: cached scores -----------------------------------------------

ALTER TABLE tools
  ADD COLUMN IF NOT EXISTS completeness_percent integer,
  ADD COLUMN IF NOT EXISTS quality_score integer,
  ADD COLUMN IF NOT EXISTS last_scored_at timestamptz;

CREATE INDEX IF NOT EXISTS idx_tools_needs_rescan
  ON tools (updated_at)
  WHERE last_scored_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_tools_completeness
  ON tools (status, completeness_percent);

-- 2. publishing_rules -----------------------------------------------------

CREATE TABLE IF NOT EXISTS publishing_rules (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  field_key text UNIQUE NOT NULL,
  label text NOT NULL,
  tier text NOT NULL DEFAULT 'first_publish' CHECK (tier IN ('first_publish')),
  required boolean NOT NULL DEFAULT true,
  enabled boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  updated_by text
);

ALTER TABLE publishing_rules ENABLE ROW LEVEL SECURITY;

INSERT INTO publishing_rules (field_key, label, tier, required, enabled) VALUES
  ('logo', 'Logo', 'first_publish', true, true),
  ('screenshots', 'Hero image / screenshot', 'first_publish', true, true),
  ('features', 'At least one feature', 'first_publish', true, true),
  ('faq', 'At least one FAQ', 'first_publish', true, true),
  ('tags', 'At least one tag', 'first_publish', true, true),
  ('seo_title', 'Meta title', 'first_publish', true, true)
ON CONFLICT (field_key) DO NOTHING;

-- 3. admin_audit_log: optional review duration ----------------------------

ALTER TABLE admin_audit_log
  ADD COLUMN IF NOT EXISTS duration_ms integer;

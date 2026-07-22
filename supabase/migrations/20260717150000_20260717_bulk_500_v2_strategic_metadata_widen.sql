-- Bulk import v2 (500 more preselected software targets) — widen
-- tool_strategic_metadata to also record the free-text priority tier and
-- blended opportunity score this manifest uses, without touching the
-- original strategic_segment enum used by the first 500-target batch.
ALTER TABLE tool_strategic_metadata ALTER COLUMN strategic_segment DROP NOT NULL;
ALTER TABLE tool_strategic_metadata ADD COLUMN IF NOT EXISTS priority_tier text;
ALTER TABLE tool_strategic_metadata ADD COLUMN IF NOT EXISTS opportunity_score numeric;

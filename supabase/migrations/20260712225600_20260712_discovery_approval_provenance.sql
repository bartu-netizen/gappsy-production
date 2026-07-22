-- Discovery Engine: dedicated approval provenance for the
-- Validated -> Approved For Crawl transition, distinct from the generic
-- reviewed_by/reviewed_at pair (which any status change sets). Fully
-- additive — no existing column or row is touched.

ALTER TABLE discovered_tools
  ADD COLUMN IF NOT EXISTS approved_by text,
  ADD COLUMN IF NOT EXISTS approved_at timestamptz;

CREATE INDEX IF NOT EXISTS discovered_tools_approved_at_idx ON discovered_tools (approved_at);

/*
  # tools.published_at — first-publish timestamp

  Needed for the Editorial Dashboard's "Published today" count: updated_at
  is touched on every edit (including edits to an already-published tool),
  so it can't answer "when did this first go live." published_at is set
  once, only on the draft/needs_review/ready_to_publish -> published
  transition (the same transition validateFirstPublishStrict already
  gates in admin-tools/index.ts), and never overwritten afterward.
*/

ALTER TABLE tools
  ADD COLUMN IF NOT EXISTS published_at timestamptz;

CREATE INDEX IF NOT EXISTS idx_tools_published_at ON tools (published_at);

-- Backfill: tools already published before this column existed get a
-- best-effort published_at from their existing updated_at, so historical
-- "published today" checks aren't wrong on day one for pre-existing data.
UPDATE tools SET published_at = updated_at WHERE status = 'published' AND published_at IS NULL;

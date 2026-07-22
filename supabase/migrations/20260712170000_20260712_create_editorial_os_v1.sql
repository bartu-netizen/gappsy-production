-- Editorial Operating System (Phase 5): media tracking, taxonomy polish,
-- comparison archiving, and a lightweight editor-assignment field. All
-- additive — no existing column, table, constraint, or row changes
-- meaning.
--
-- 1. tool_media — tracks every upload through admin-tool-media (which
--    previously had zero DB side effects) so a Media Library page can
--    list/search/delete/reuse files across tools instead of only seeing
--    whatever's currently attached to one tool's screenshots array.
-- 2. tools.assigned_editor — free-text label (there is no multi-admin
--    identity system today; this is honest lightweight bookkeeping, not a
--    real access-control assignment).
-- 3. tool_categories.is_featured — powers a "featured categories" toggle.
-- 4. tool_comparisons.status widens to allow 'archived' alongside the
--    existing 'draft'/'published'.

CREATE TABLE IF NOT EXISTS tool_media (
  id                uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id           uuid REFERENCES tools(id) ON DELETE SET NULL,
  file_url          text NOT NULL,
  file_path         text NOT NULL,
  kind              text NOT NULL DEFAULT 'screenshot' CHECK (kind IN ('logo', 'screenshot', 'video', 'other')),
  original_filename text,
  size_bytes        integer,
  uploaded_by       text,
  created_at        timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_media_tool_id ON tool_media (tool_id);
CREATE INDEX IF NOT EXISTS idx_tool_media_created_at ON tool_media (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_tool_media_kind ON tool_media (kind);

ALTER TABLE tool_media ENABLE ROW LEVEL SECURITY;
-- Admin-internal bookkeeping only (the files themselves are already public
-- via the tool-media Storage bucket) — no public SELECT policy needed.

ALTER TABLE tools ADD COLUMN IF NOT EXISTS assigned_editor text;
ALTER TABLE tool_categories ADD COLUMN IF NOT EXISTS is_featured boolean NOT NULL DEFAULT false;

ALTER TABLE tool_comparisons DROP CONSTRAINT IF EXISTS tool_comparisons_status_check;
ALTER TABLE tool_comparisons ADD CONSTRAINT tool_comparisons_status_check
  CHECK (status IN ('draft', 'published', 'archived'));

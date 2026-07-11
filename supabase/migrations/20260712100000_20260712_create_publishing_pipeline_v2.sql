-- Publishing pipeline v2 (Phase 3): scheduling, import history, and three
-- new editorial-content tables (videos, internal links, alternatives) that
-- the tool editor's new tabs manage. Fully additive — no existing column,
-- table, constraint, or row is altered or removed.
--
-- 1. tools.scheduled_publish_at + tools.canonical_url (SEO override,
--    optional; canonical otherwise derives from slug as it already does).
-- 2. tool_import_history — one row per wizard/bulk/api import attempt.
--    Admin-only (no public SELECT policy; only the service-role edge
--    functions read/write it).
-- 3. tool_videos, tool_internal_links, tool_alternatives — same shape and
--    RLS pattern as the existing tool_features / tool_pros table family
--    from the CMS migration: public SELECT only when the parent tool is
--    published, writes only via service-role admin edge functions.

-- 1. tools: scheduling + canonical override
ALTER TABLE tools ADD COLUMN IF NOT EXISTS scheduled_publish_at timestamptz;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS canonical_url text;

-- 2. tool_import_history
CREATE TABLE IF NOT EXISTS tool_import_history (
  id               uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id          uuid REFERENCES tools(id) ON DELETE SET NULL,
  source           text NOT NULL DEFAULT 'wizard',
  source_url       text,
  status           text NOT NULL DEFAULT 'success' CHECK (status IN ('pending', 'success', 'failed')),
  imported_sections jsonb NOT NULL DEFAULT '[]'::jsonb,
  errors           jsonb NOT NULL DEFAULT '[]'::jsonb,
  credits_used     integer NOT NULL DEFAULT 0,
  started_at       timestamptz NOT NULL DEFAULT now(),
  completed_at     timestamptz,
  created_at       timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_import_history_tool_id ON tool_import_history (tool_id);
CREATE INDEX IF NOT EXISTS idx_tool_import_history_created_at ON tool_import_history (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_tool_import_history_status ON tool_import_history (status);

ALTER TABLE tool_import_history ENABLE ROW LEVEL SECURITY;
-- Deliberately no policies: this is internal publishing-pipeline data, not
-- content ever shown on the public site. Only the service-role key (used by
-- admin edge functions, which always call requireAdminSession first) can
-- read or write it.

-- 3. tool_videos
CREATE TABLE IF NOT EXISTS tool_videos (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id       uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  title         text,
  video_url     text NOT NULL,
  thumbnail_url text,
  sort_order    integer NOT NULL DEFAULT 0,
  created_at    timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_videos_tool_id ON tool_videos (tool_id, sort_order);

-- 4. tool_internal_links
CREATE TABLE IF NOT EXISTS tool_internal_links (
  id         uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id    uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  label      text NOT NULL,
  url        text NOT NULL,
  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_internal_links_tool_id ON tool_internal_links (tool_id, sort_order);

-- 5. tool_alternatives
CREATE TABLE IF NOT EXISTS tool_alternatives (
  id                  uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id             uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  alternative_tool_id uuid REFERENCES tools(id) ON DELETE SET NULL,
  alternative_name    text,
  alternative_url     text,
  alternative_logo    text,
  note                text,
  sort_order          integer NOT NULL DEFAULT 0,
  created_at          timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_alternatives_tool_id ON tool_alternatives (tool_id, sort_order);

ALTER TABLE tool_videos ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_internal_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_alternatives ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "tool_videos_public_select" ON tool_videos;
CREATE POLICY "tool_videos_public_select"
  ON tool_videos FOR SELECT
  TO anon, authenticated
  USING (EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_videos.tool_id AND t.status = 'published'));

DROP POLICY IF EXISTS "tool_internal_links_public_select" ON tool_internal_links;
CREATE POLICY "tool_internal_links_public_select"
  ON tool_internal_links FOR SELECT
  TO anon, authenticated
  USING (EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_internal_links.tool_id AND t.status = 'published'));

DROP POLICY IF EXISTS "tool_alternatives_public_select" ON tool_alternatives;
CREATE POLICY "tool_alternatives_public_select"
  ON tool_alternatives FOR SELECT
  TO anon, authenticated
  USING (EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_alternatives.tool_id AND t.status = 'published'));

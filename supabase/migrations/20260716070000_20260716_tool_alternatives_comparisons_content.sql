-- Closes the gap where "flagship" listings (currently canva, figma) store
-- alternatives, quick-compare links, and long-form narrative content only
-- in static TS files under src/data/toolContent/*.ts. That content is
-- invisible to anything that can't import a frontend TS bundle — most
-- notably the ask-gappsy edge function (Deno, server-side, DB-only) and
-- any future admin/editor tooling. Moving it to DB tables (same
-- DB-first/file-fallback pattern already used for features/pros/cons/
-- use_cases/faqs, see ToolDetailPage.tsx mergedFeatures etc.) makes it
-- groundable for the AI assistant now, and scalable to every tool later
-- without another code deploy — which is also the more sustainable path
-- for growing unique per-tool SEO content over time.
--
-- Fully additive: extends the existing (currently admin-only, unused on
-- the public site) tool_alternatives table with nullable columns, and adds
-- two new tables. No existing column, table, or row is altered or removed.

-- 1. tool_alternatives: add the richer fields the static file shape has
--    (description, pros/cons, pricing summary) that the original
--    lightweight admin-editor shape didn't need.
ALTER TABLE tool_alternatives ADD COLUMN IF NOT EXISTS description text;
ALTER TABLE tool_alternatives ADD COLUMN IF NOT EXISTS pros text[] NOT NULL DEFAULT '{}';
ALTER TABLE tool_alternatives ADD COLUMN IF NOT EXISTS cons text[] NOT NULL DEFAULT '{}';
ALTER TABLE tool_alternatives ADD COLUMN IF NOT EXISTS pricing_summary text;

-- 2. tool_comparison_links — the lightweight "Canva vs Figma" / "Canva vs
--    Photoshop" quick-compare list shown on a tool page. href may point at
--    a real /compare/:slug page or, for pairs with no dedicated page yet,
--    a category-page fallback — same distinction ToolDetailPage.tsx's
--    quickCompareLinks already draws by filtering on the /compare/ prefix.
CREATE TABLE IF NOT EXISTS tool_comparison_links (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id     uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  label       text NOT NULL,
  href        text NOT NULL,
  sort_order  integer NOT NULL DEFAULT 0,
  created_at  timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_comparison_links_tool_id ON tool_comparison_links (tool_id, sort_order);

-- 3. tool_content_blocks — the long-form narrative article sections
--    (Overview, Who It's For, Main Features, ...) shown above the
--    structured feature grid on a tool page.
CREATE TABLE IF NOT EXISTS tool_content_blocks (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id     uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  block_key   text NOT NULL,
  heading     text NOT NULL,
  level       smallint NOT NULL DEFAULT 2 CHECK (level IN (2, 3)),
  paragraphs  text[] NOT NULL DEFAULT '{}',
  sort_order  integer NOT NULL DEFAULT 0,
  created_at  timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_content_blocks_tool_id ON tool_content_blocks (tool_id, sort_order);

ALTER TABLE tool_comparison_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_content_blocks ENABLE ROW LEVEL SECURITY;

-- Same public-read-when-published pattern as tool_features / tool_pros /
-- tool_alternatives.
DROP POLICY IF EXISTS "tool_comparison_links_public_select" ON tool_comparison_links;
CREATE POLICY "tool_comparison_links_public_select"
  ON tool_comparison_links FOR SELECT
  TO anon, authenticated
  USING (EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_comparison_links.tool_id AND t.status = 'published'));

DROP POLICY IF EXISTS "tool_content_blocks_public_select" ON tool_content_blocks;
CREATE POLICY "tool_content_blocks_public_select"
  ON tool_content_blocks FOR SELECT
  TO anon, authenticated
  USING (EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_content_blocks.tool_id AND t.status = 'published'));

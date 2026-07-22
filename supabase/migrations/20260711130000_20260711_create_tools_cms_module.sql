/*
  # Tools CMS — SEO overrides, editorial content tables, media flags

  ## Overview
  Fully additive schema supporting the premium /wp-admin Tools CMS:
  1. SEO override columns on `tools` (seo_title, seo_meta_description,
     og_title, og_description, og_image, noindex, sitemap_eligible) plus
     `is_editors_pick` — none of these existed before; the public site
     currently derives meta description from short/long_description only.
  2. `alt_text` / `is_featured` on `tool_screenshots`.
  3. `is_recommended` on `tool_pricing_plans`.
  4. Five new per-tool editorial-content tables — `tool_features`,
     `tool_pros`, `tool_cons`, `tool_use_cases`, `tool_faqs` — the
     database-backed home for content that today lives ONLY in the
     src/data/toolContent TypeScript files (Canva, Figma). This is the first step of a
     gradual file-to-database migration: a tool with no rows in these
     tables simply falls back to its file-based content, exactly as today,
     so Canva and Figma are completely unaffected until explicitly
     migrated through the new admin editor.

  No existing table, column, row, policy, or function is modified, dropped,
  or repaired.

  ## Security
  Same pattern as 20260710120000_create_tools_module.sql: RLS enabled,
  public (anon + authenticated) SELECT limited to rows whose parent tool is
  `status = 'published'` (and, for tool_faqs, additionally `status =
  'published'` on the FAQ row itself, mirroring tool_reviews). No
  INSERT/UPDATE/DELETE policies — all writes go through admin edge
  functions using the service-role key and requireAdminSession().
*/

-- ─────────────────────────────────────────────
-- 1. tools: SEO override + editor's pick columns
-- ─────────────────────────────────────────────
ALTER TABLE tools ADD COLUMN IF NOT EXISTS seo_title text;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS seo_meta_description text;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS og_title text;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS og_description text;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS og_image text;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS noindex boolean NOT NULL DEFAULT false;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS sitemap_eligible boolean NOT NULL DEFAULT true;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS is_editors_pick boolean NOT NULL DEFAULT false;

CREATE INDEX IF NOT EXISTS idx_tools_editors_pick ON tools (is_editors_pick) WHERE is_editors_pick = true;

-- ─────────────────────────────────────────────
-- 2. tool_screenshots: alt text + featured flag
-- ─────────────────────────────────────────────
ALTER TABLE tool_screenshots ADD COLUMN IF NOT EXISTS alt_text text;
ALTER TABLE tool_screenshots ADD COLUMN IF NOT EXISTS is_featured boolean NOT NULL DEFAULT false;

-- ─────────────────────────────────────────────
-- 3. tool_pricing_plans: recommended flag
-- ─────────────────────────────────────────────
ALTER TABLE tool_pricing_plans ADD COLUMN IF NOT EXISTS is_recommended boolean NOT NULL DEFAULT false;

-- ─────────────────────────────────────────────
-- 4. tool_features
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_features (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id      uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  group_name   text,
  title        text NOT NULL,
  description  text,
  sort_order   integer NOT NULL DEFAULT 0,
  created_at   timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_features_tool_id ON tool_features (tool_id, sort_order);

-- ─────────────────────────────────────────────
-- 5. tool_pros
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_pros (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id     uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  text        text NOT NULL,
  sort_order  integer NOT NULL DEFAULT 0,
  created_at  timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_pros_tool_id ON tool_pros (tool_id, sort_order);

-- ─────────────────────────────────────────────
-- 6. tool_cons
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_cons (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id     uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  text        text NOT NULL,
  sort_order  integer NOT NULL DEFAULT 0,
  created_at  timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_cons_tool_id ON tool_cons (tool_id, sort_order);

-- ─────────────────────────────────────────────
-- 7. tool_use_cases
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_use_cases (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id      uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  title        text NOT NULL,
  description  text,
  audience     text,
  sort_order   integer NOT NULL DEFAULT 0,
  created_at   timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_use_cases_tool_id ON tool_use_cases (tool_id, sort_order);

-- ─────────────────────────────────────────────
-- 8. tool_faqs
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_faqs (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id     uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  question    text NOT NULL,
  answer      text NOT NULL,
  status      text NOT NULL DEFAULT 'published' CHECK (status IN ('draft', 'published')),
  sort_order  integer NOT NULL DEFAULT 0,
  created_at  timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_faqs_tool_id ON tool_faqs (tool_id, sort_order);

-- ─────────────────────────────────────────────
-- Row Level Security
-- ─────────────────────────────────────────────
ALTER TABLE tool_features ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_pros ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_cons ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_use_cases ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_faqs ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "tool_features_public_select" ON tool_features;
CREATE POLICY "tool_features_public_select"
  ON tool_features FOR SELECT
  TO anon, authenticated
  USING (EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_features.tool_id AND t.status = 'published'));

DROP POLICY IF EXISTS "tool_pros_public_select" ON tool_pros;
CREATE POLICY "tool_pros_public_select"
  ON tool_pros FOR SELECT
  TO anon, authenticated
  USING (EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_pros.tool_id AND t.status = 'published'));

DROP POLICY IF EXISTS "tool_cons_public_select" ON tool_cons;
CREATE POLICY "tool_cons_public_select"
  ON tool_cons FOR SELECT
  TO anon, authenticated
  USING (EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_cons.tool_id AND t.status = 'published'));

DROP POLICY IF EXISTS "tool_use_cases_public_select" ON tool_use_cases;
CREATE POLICY "tool_use_cases_public_select"
  ON tool_use_cases FOR SELECT
  TO anon, authenticated
  USING (EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_use_cases.tool_id AND t.status = 'published'));

DROP POLICY IF EXISTS "tool_faqs_public_select" ON tool_faqs;
CREATE POLICY "tool_faqs_public_select"
  ON tool_faqs FOR SELECT
  TO anon, authenticated
  USING (
    status = 'published'
    AND EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_faqs.tool_id AND t.status = 'published')
  );

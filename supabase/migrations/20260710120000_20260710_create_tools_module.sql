/*
  # Tools Module — Entity Platform Foundation (Sprint 1A)

  ## Overview
  Creates the first entity-type module ("Tools") as a fully additive set of new tables.
  Does not modify any existing table. Future entity types (Agencies v2, MCP Servers, APIs,
  etc.) will follow the same shape: a primary entity table + categories + tags + link
  tables + child detail tables.

  Tables:
  1. tools                 — the core entity
  2. tool_categories       — taxonomy (one tool has one primary category, many secondary)
  3. tool_tags             — free-form taxonomy
  4. tool_category_links   — tool <-> category junction (composite PK)
  5. tool_tag_links        — tool <-> tag junction (composite PK)
  6. tool_screenshots      — gallery images per tool
  7. tool_pricing_plans    — structured pricing (schema only in Sprint 1A; no full UI yet)
  8. tool_integrations     — third-party integrations (schema only in Sprint 1A)
  9. tool_updates          — changelog/news entries (schema only in Sprint 1A)

  ## Security
  - RLS enabled on all 9 tables.
  - Public (anon + authenticated) SELECT:
    - tools: WHERE status = 'published'
    - tool_categories: WHERE status = 'published'
    - tool_tags: unrestricted (free-form taxonomy, no per-tool relationship data,
      no status column)
    - tool_category_links: WHERE the linked tool is published AND the linked
      category is published (EXISTS checks against tools/tool_categories)
    - tool_tag_links, tool_screenshots, tool_pricing_plans, tool_integrations,
      tool_updates: WHERE the linked tool is published (EXISTS check against tools)
    These EXISTS checks are enforced by Postgres RLS itself, not by frontend query
    shape — a direct anon-key REST call against any child table can never return a
    row belonging to a draft/archived tool or an unpublished category.
  - No INSERT/UPDATE/DELETE policies on any table. All writes go through admin edge
    functions (admin-tools, admin-tool-categories, admin-tool-tags) using the
    service-role key, which bypasses RLS and enforces requireAdminSession().
*/

-- ─────────────────────────────────────────────
-- 1. tools
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tools (
  id                 uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug               text UNIQUE NOT NULL,
  name               text NOT NULL,
  logo               text,
  website            text,
  affiliate_link     text,
  short_description  text,
  long_description   text,
  pricing_model      text,
  starting_price     text,
  youtube_url        text,
  verified           boolean NOT NULL DEFAULT false,
  featured           boolean NOT NULL DEFAULT false,
  rating             numeric NOT NULL DEFAULT 0,
  review_count       integer NOT NULL DEFAULT 0,
  status             text NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published', 'archived')),
  created_at         timestamptz NOT NULL DEFAULT now(),
  updated_at         timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tools_status ON tools (status);
CREATE INDEX IF NOT EXISTS idx_tools_featured ON tools (featured) WHERE featured = true;

-- ─────────────────────────────────────────────
-- 2. tool_categories
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_categories (
  id               uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug             text UNIQUE NOT NULL,
  name             text NOT NULL,
  description      text,
  seo_title        text,
  seo_description  text,
  icon             text,
  status           text NOT NULL DEFAULT 'published' CHECK (status IN ('draft', 'published', 'archived')),
  created_at       timestamptz NOT NULL DEFAULT now(),
  updated_at       timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_categories_status ON tool_categories (status);

-- ─────────────────────────────────────────────
-- 3. tool_tags
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_tags (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug         text UNIQUE NOT NULL,
  name         text NOT NULL,
  description  text,
  created_at   timestamptz NOT NULL DEFAULT now(),
  updated_at   timestamptz NOT NULL DEFAULT now()
);

-- ─────────────────────────────────────────────
-- 4. tool_category_links
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_category_links (
  tool_id            uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  category_id        uuid NOT NULL REFERENCES tool_categories(id) ON DELETE CASCADE,
  primary_category   boolean NOT NULL DEFAULT false,
  PRIMARY KEY (tool_id, category_id)
);

CREATE INDEX IF NOT EXISTS idx_tool_category_links_category ON tool_category_links (category_id);

-- ─────────────────────────────────────────────
-- 5. tool_tag_links
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_tag_links (
  tool_id   uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  tag_id    uuid NOT NULL REFERENCES tool_tags(id) ON DELETE CASCADE,
  PRIMARY KEY (tool_id, tag_id)
);

CREATE INDEX IF NOT EXISTS idx_tool_tag_links_tag ON tool_tag_links (tag_id);

-- ─────────────────────────────────────────────
-- 6. tool_screenshots
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_screenshots (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id     uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  image_url   text NOT NULL,
  caption     text,
  sort_order  integer NOT NULL DEFAULT 0,
  created_at  timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_screenshots_tool_id ON tool_screenshots (tool_id, sort_order);

-- ─────────────────────────────────────────────
-- 7. tool_pricing_plans (schema only — no full UI yet)
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_pricing_plans (
  id             uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id        uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  plan_name      text,
  price          text,
  billing_cycle  text,
  description    text,
  features       jsonb NOT NULL DEFAULT '[]'::jsonb,
  sort_order     integer NOT NULL DEFAULT 0,
  created_at     timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_pricing_plans_tool_id ON tool_pricing_plans (tool_id, sort_order);

-- ─────────────────────────────────────────────
-- 8. tool_integrations (schema only — no full UI yet)
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_integrations (
  id                 uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id            uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  integration_name   text NOT NULL,
  integration_slug   text,
  integration_logo   text,
  description        text,
  created_at         timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_integrations_tool_id ON tool_integrations (tool_id);

-- ─────────────────────────────────────────────
-- 9. tool_updates (schema only — no full UI yet)
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_updates (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id       uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  title         text NOT NULL,
  description   text,
  update_date   date,
  source_url    text,
  created_at    timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_tool_updates_tool_id ON tool_updates (tool_id, update_date DESC);

-- ─────────────────────────────────────────────
-- Row Level Security
-- ─────────────────────────────────────────────
ALTER TABLE tools ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_category_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_tag_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_screenshots ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_pricing_plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_integrations ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_updates ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "tools_public_select" ON tools;
CREATE POLICY "tools_public_select"
  ON tools FOR SELECT
  TO anon, authenticated
  USING (status = 'published');

DROP POLICY IF EXISTS "tool_categories_public_select" ON tool_categories;
CREATE POLICY "tool_categories_public_select"
  ON tool_categories FOR SELECT
  TO anon, authenticated
  USING (status = 'published');

DROP POLICY IF EXISTS "tool_tags_public_select" ON tool_tags;
CREATE POLICY "tool_tags_public_select"
  ON tool_tags FOR SELECT
  TO anon, authenticated
  USING (true);

-- tool_category_links: only visible when BOTH the linked tool is published AND
-- the linked category is published. This is the only child table whose rows
-- reference two parents with independent status columns.
DROP POLICY IF EXISTS "tool_category_links_public_select" ON tool_category_links;
CREATE POLICY "tool_category_links_public_select"
  ON tool_category_links FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_category_links.tool_id AND t.status = 'published'
    )
    AND EXISTS (
      SELECT 1 FROM tool_categories c
      WHERE c.id = tool_category_links.category_id AND c.status = 'published'
    )
  );

-- tool_tag_links: tags have no status column, so only the linked tool's status matters.
DROP POLICY IF EXISTS "tool_tag_links_public_select" ON tool_tag_links;
CREATE POLICY "tool_tag_links_public_select"
  ON tool_tag_links FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_tag_links.tool_id AND t.status = 'published'
    )
  );

DROP POLICY IF EXISTS "tool_screenshots_public_select" ON tool_screenshots;
CREATE POLICY "tool_screenshots_public_select"
  ON tool_screenshots FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_screenshots.tool_id AND t.status = 'published'
    )
  );

DROP POLICY IF EXISTS "tool_pricing_plans_public_select" ON tool_pricing_plans;
CREATE POLICY "tool_pricing_plans_public_select"
  ON tool_pricing_plans FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_pricing_plans.tool_id AND t.status = 'published'
    )
  );

DROP POLICY IF EXISTS "tool_integrations_public_select" ON tool_integrations;
CREATE POLICY "tool_integrations_public_select"
  ON tool_integrations FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_integrations.tool_id AND t.status = 'published'
    )
  );

DROP POLICY IF EXISTS "tool_updates_public_select" ON tool_updates;
CREATE POLICY "tool_updates_public_select"
  ON tool_updates FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_updates.tool_id AND t.status = 'published'
    )
  );

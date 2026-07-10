/*
  # Tool profile fields + reviews

  Additive schema for the Tool Detail Page V2:
    1. Four new nullable/defaulted columns on `tools` for sidebar facts that have
       no existing data source (founded_year, company_size, headquarters, languages).
    2. A new `tool_reviews` child table for individually-authored reviews (the
       existing `rating`/`review_count` columns on `tools` remain the aggregate
       shown in the Hero/Sidebar; this table backs a dedicated Reviews section).

  No existing column, table, row, or policy is modified.
*/

-- ─────────────────────────────────────────────
-- 1. tools: new profile columns
-- ─────────────────────────────────────────────
ALTER TABLE tools ADD COLUMN IF NOT EXISTS founded_year integer;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS company_size text;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS headquarters text;
ALTER TABLE tools ADD COLUMN IF NOT EXISTS languages text[] NOT NULL DEFAULT '{}';

-- ─────────────────────────────────────────────
-- 2. tool_reviews
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_reviews (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_id       uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  author_name   text NOT NULL,
  author_title  text,
  rating        numeric NOT NULL CHECK (rating >= 1 AND rating <= 5),
  quote         text NOT NULL,
  source        text,
  status        text NOT NULL DEFAULT 'published' CHECK (status IN ('draft', 'published')),
  sort_order    integer NOT NULL DEFAULT 0,
  created_at    timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_tool_reviews_tool_id ON tool_reviews (tool_id, sort_order);

ALTER TABLE tool_reviews ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "tool_reviews_public_select" ON tool_reviews;
CREATE POLICY "tool_reviews_public_select"
  ON tool_reviews FOR SELECT
  TO anon, authenticated
  USING (
    status = 'published'
    AND EXISTS (
      SELECT 1 FROM tools t
      WHERE t.id = tool_reviews.tool_id AND t.status = 'published'
    )
  );

/*
  # Tool Comparisons — Compare module foundation

  ## Overview
  Adds a single new table, `tool_comparisons`, as an approved-pairs registry
  for the /compare feature. Comparison pages are never auto-generated for
  every possible tool pair — a row only exists here when a pair has been
  deliberately approved for publishing, matching the same
  content-must-be-real philosophy as the `tools` module. Rich editorial
  content (verdict, best-for, key differences) lives in a static
  `src/data/comparisonContent/` registry keyed by slug, the same pattern
  `src/data/toolContent/` already uses for per-tool editorial content — this
  table only tracks which pair exists, its canonical slug, and its
  publish status.

  Does not modify any existing table.

  ## Canonical ordering
  `slug` is the single source of truth for the canonical URL
  (e.g. "canva-vs-figma", never also "figma-vs-canva"). A unique index on
  the unordered (tool_a_id, tool_b_id) pair — via LEAST/GREATEST — makes it
  impossible to insert both orderings of the same pair as two rows, even if
  the admin function's own slug-generation logic is bypassed.

  ## Security
  - RLS enabled.
  - Public (anon + authenticated) SELECT: WHERE status = 'published' AND
    both linked tools are published. This EXISTS check is enforced by
    Postgres RLS itself, not by frontend query shape.
  - No INSERT/UPDATE/DELETE policies — all writes go through the
    admin-tool-comparisons edge function using the service-role key, which
    bypasses RLS and enforces requireAdminSession().
*/

-- ─────────────────────────────────────────────
-- tool_comparisons
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tool_comparisons (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tool_a_id   uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  tool_b_id   uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  slug        text UNIQUE NOT NULL,
  status      text NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published')),
  created_at  timestamptz NOT NULL DEFAULT now(),
  updated_at  timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT tool_comparisons_distinct_tools CHECK (tool_a_id <> tool_b_id)
);

-- Prevents both (A, B) and (B, A) existing as separate rows for the same pair.
CREATE UNIQUE INDEX IF NOT EXISTS idx_tool_comparisons_pair_unique
  ON tool_comparisons (LEAST(tool_a_id, tool_b_id), GREATEST(tool_a_id, tool_b_id));

CREATE INDEX IF NOT EXISTS idx_tool_comparisons_status ON tool_comparisons (status);
CREATE INDEX IF NOT EXISTS idx_tool_comparisons_tool_a ON tool_comparisons (tool_a_id);
CREATE INDEX IF NOT EXISTS idx_tool_comparisons_tool_b ON tool_comparisons (tool_b_id);

ALTER TABLE tool_comparisons ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "tool_comparisons_public_select" ON tool_comparisons;
CREATE POLICY "tool_comparisons_public_select"
  ON tool_comparisons FOR SELECT
  TO anon, authenticated
  USING (
    status = 'published'
    AND EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_comparisons.tool_a_id AND t.status = 'published')
    AND EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_comparisons.tool_b_id AND t.status = 'published')
  );

-- ─────────────────────────────────────────────
-- Seed the one currently-approved comparison: Canva vs Figma. Both tools
-- have real, hand-authored editorial content (src/data/toolContent/) and a
-- matching comparison content file (src/data/comparisonContent/), so this
-- is the only pair with enough real structured data to publish today.
-- ─────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
SELECT a.id, b.id, 'canva-vs-figma', 'published'
FROM tools a, tools b
WHERE a.slug = 'canva' AND b.slug = 'figma'
ON CONFLICT (slug) DO NOTHING;

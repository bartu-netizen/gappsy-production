-- New, additive "roundup" comparison page type (3+ tools in one page),
-- separate from the existing pairwise tool_comparisons system so the 883
-- existing 2-tool comparison pages are completely unaffected. Mirrors the
-- tool_comparisons/tool_comparison_links pattern: a parent row + a member
-- join table (N tools instead of a fixed tool_a_id/tool_b_id pair), same
-- published/draft status gate and public-read RLS shape.

CREATE TABLE tool_roundups (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text UNIQUE NOT NULL,
  title text NOT NULL,
  verdict text,
  video_url text,
  status text NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published')),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE tool_roundup_members (
  roundup_id uuid NOT NULL REFERENCES tool_roundups(id) ON DELETE CASCADE,
  tool_id uuid NOT NULL REFERENCES tools(id) ON DELETE CASCADE,
  sort_order integer NOT NULL DEFAULT 0,
  best_for text,
  PRIMARY KEY (roundup_id, tool_id)
);

CREATE INDEX idx_tool_roundup_members_roundup ON tool_roundup_members(roundup_id, sort_order);
CREATE INDEX idx_tool_roundup_members_tool ON tool_roundup_members(tool_id);

ALTER TABLE tool_roundups ENABLE ROW LEVEL SECURITY;
ALTER TABLE tool_roundup_members ENABLE ROW LEVEL SECURITY;

-- Public read: published roundup, and only when every member tool is
-- itself published (mirrors tool_comparisons_public_select's guard against
-- ever exposing a draft/unpublished tool through a comparison page).
CREATE POLICY tool_roundups_public_select ON tool_roundups
  FOR SELECT
  USING (
    status = 'published'
    AND NOT EXISTS (
      SELECT 1 FROM tool_roundup_members m
      JOIN tools t ON t.id = m.tool_id
      WHERE m.roundup_id = tool_roundups.id AND t.status != 'published'
    )
  );

CREATE POLICY tool_roundup_members_public_select ON tool_roundup_members
  FOR SELECT
  USING (
    EXISTS (SELECT 1 FROM tools t WHERE t.id = tool_roundup_members.tool_id AND t.status = 'published')
    AND EXISTS (SELECT 1 FROM tool_roundups r WHERE r.id = tool_roundup_members.roundup_id AND r.status = 'published')
  );

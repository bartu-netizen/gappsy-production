-- Denormalized boolean derived from the 'open-source' tool_tags row, so
-- every existing "select from tools" query across the frontend/prerender
-- scripts can sort/filter on a plain column instead of each one needing its
-- own join to tool_tag_links + tool_tags. Kept in sync going forward by a
-- trigger on tool_tag_links (add/remove the open-source tag from any tool
-- and this flag updates automatically) rather than requiring every future
-- admin action to remember to set it by hand.
ALTER TABLE tools ADD COLUMN IF NOT EXISTS is_open_source boolean NOT NULL DEFAULT false;

CREATE INDEX IF NOT EXISTS idx_tools_is_open_source ON tools (is_open_source);

-- One-time backfill from the existing tag data.
UPDATE tools
SET is_open_source = true
WHERE id IN (
  SELECT tl.tool_id FROM tool_tag_links tl
  JOIN tool_tags t ON t.id = tl.tag_id
  WHERE t.slug = 'open-source'
)
AND is_open_source = false;

CREATE OR REPLACE FUNCTION sync_tools_is_open_source()
RETURNS TRIGGER AS $$
DECLARE
  affected_tool_id uuid;
  open_source_tag_id uuid;
BEGIN
  SELECT id INTO open_source_tag_id FROM tool_tags WHERE slug = 'open-source';
  IF open_source_tag_id IS NULL THEN
    RETURN COALESCE(NEW, OLD);
  END IF;

  affected_tool_id := COALESCE(NEW.tool_id, OLD.tool_id);
  IF COALESCE(NEW.tag_id, OLD.tag_id) IS DISTINCT FROM open_source_tag_id THEN
    RETURN COALESCE(NEW, OLD);
  END IF;

  UPDATE tools
  SET is_open_source = EXISTS (
    SELECT 1 FROM tool_tag_links
    WHERE tool_id = affected_tool_id AND tag_id = open_source_tag_id
  )
  WHERE id = affected_tool_id;

  RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_sync_tools_is_open_source ON tool_tag_links;
CREATE TRIGGER trg_sync_tools_is_open_source
AFTER INSERT OR DELETE ON tool_tag_links
FOR EACH ROW EXECUTE FUNCTION sync_tools_is_open_source();

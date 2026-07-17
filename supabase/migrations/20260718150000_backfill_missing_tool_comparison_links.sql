-- Backfills 4 missing tool_comparison_links rows found by audit: these 4
-- published comparisons only had the link inserted on one side (all 4
-- happen to be pre-existing Canva comparisons, not part of the 500-batch
-- apply pipeline, which inserts both sides atomically). Without this row,
-- the non-Canva tool's page has no "Comparisons" section entry pointing
-- back to the shared /compare/ page at all, even though the page itself is
-- published and reachable — a real internal-linking gap, not just a
-- cosmetic one. Mirrors the idempotent INSERT pattern used by
-- scripts/comparisons/apply-comparisons.mjs.
INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT t.id, 'vs Canva', '/compare/adobe-express-vs-canva',
  COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = t.id), 0)
FROM tools t WHERE t.slug = 'adobe-express'
AND NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = t.id AND href = '/compare/adobe-express-vs-canva');

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT t.id, 'vs Canva', '/compare/canva-vs-photoshop',
  COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = t.id), 0)
FROM tools t WHERE t.slug = 'photoshop'
AND NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = t.id AND href = '/compare/canva-vs-photoshop');

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT t.id, 'vs Canva', '/compare/canva-vs-vistacreate',
  COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = t.id), 0)
FROM tools t WHERE t.slug = 'vistacreate'
AND NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = t.id AND href = '/compare/canva-vs-vistacreate');

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT t.id, 'vs Canva', '/compare/canva-vs-microsoft-designer',
  COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = t.id), 0)
FROM tools t WHERE t.slug = 'microsoft-designer'
AND NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = t.id AND href = '/compare/canva-vs-microsoft-designer');

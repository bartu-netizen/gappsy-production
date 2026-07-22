-- Repoints Canva's tool_comparison_links rows (seeded in 20260716080000
-- from the static canva.ts content) at the real /compare/ pages created in
-- 20260716100000, replacing the category-page fallbacks they used before
-- those pages existed.
UPDATE tool_comparison_links SET href = '/compare/adobe-express-vs-canva'
  WHERE tool_id = '7e8227b7-0e90-46d7-92df-86b14a774f8a' AND label = 'Canva vs Adobe Express';
UPDATE tool_comparison_links SET href = '/compare/canva-vs-photoshop'
  WHERE tool_id = '7e8227b7-0e90-46d7-92df-86b14a774f8a' AND label = 'Canva vs Photoshop';
UPDATE tool_comparison_links SET href = '/compare/canva-vs-vistacreate'
  WHERE tool_id = '7e8227b7-0e90-46d7-92df-86b14a774f8a' AND label = 'Canva vs VistaCreate';
UPDATE tool_comparison_links SET href = '/compare/canva-vs-microsoft-designer'
  WHERE tool_id = '7e8227b7-0e90-46d7-92df-86b14a774f8a' AND label = 'Canva vs Microsoft Designer';

-- Comparison batch: nextra-vs-vitepress, nextra-vs-percy, keila-vs-listmonk, keila-vs-sendy, mautic-vs-sendy, affine-vs-timestripe, lunatask-vs-timestripe, lunatask-vs-sorted-3, noteplan-vs-sorted-3, noteplan-vs-scrintal, georanker-vs-local-falcon, georanker-vs-merchynt, bookstack-vs-gitbook, bookstack-vs-dokuwiki, dokuwiki-vs-tiddlywiki, orangehrm-vs-sift-org-chart, horilla-vs-minthcm, minthcm-vs-open-hrms, nuclei-vs-owasp-zap, gitleaks-vs-owasp-zap
-- Publishes 20 comparison page(s) with editorial content.

-- ── Nextra vs VitePress (nextra-vs-vitepress) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', '3fb0f468-f238-4fb1-a656-36ced87d1401', $q$nextra-vs-vitepress$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$vs VitePress$q$, $q$/compare/nextra-vs-vitepress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '81e4c7de-ab42-4127-ae48-4dd99e1894fb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '81e4c7de-ab42-4127-ae48-4dd99e1894fb' AND href = $q$/compare/nextra-vs-vitepress$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3fb0f468-f238-4fb1-a656-36ced87d1401', $q$vs Nextra$q$, $q$/compare/nextra-vs-vitepress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401' AND href = $q$/compare/nextra-vs-vitepress$q$);

-- ── Nextra vs Percy (nextra-vs-percy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', '0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$nextra-vs-percy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$vs Percy$q$, $q$/compare/nextra-vs-percy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '81e4c7de-ab42-4127-ae48-4dd99e1894fb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '81e4c7de-ab42-4127-ae48-4dd99e1894fb' AND href = $q$/compare/nextra-vs-percy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$vs Nextra$q$, $q$/compare/nextra-vs-percy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0521ec36-4a18-4308-8b35-efe654ddfaa1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0521ec36-4a18-4308-8b35-efe654ddfaa1' AND href = $q$/compare/nextra-vs-percy$q$);

-- ── Keila vs Listmonk (keila-vs-listmonk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', '84142957-2683-4f6e-9088-2169508d193b', $q$keila-vs-listmonk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$vs Listmonk$q$, $q$/compare/keila-vs-listmonk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9' AND href = $q$/compare/keila-vs-listmonk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '84142957-2683-4f6e-9088-2169508d193b', $q$vs Keila$q$, $q$/compare/keila-vs-listmonk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '84142957-2683-4f6e-9088-2169508d193b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '84142957-2683-4f6e-9088-2169508d193b' AND href = $q$/compare/keila-vs-listmonk$q$);

-- ── Keila vs Sendy (keila-vs-sendy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', '44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$keila-vs-sendy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$vs Sendy$q$, $q$/compare/keila-vs-sendy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9' AND href = $q$/compare/keila-vs-sendy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$vs Keila$q$, $q$/compare/keila-vs-sendy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '44d9699e-8d32-4e15-b625-c6a58b71f09e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '44d9699e-8d32-4e15-b625-c6a58b71f09e' AND href = $q$/compare/keila-vs-sendy$q$);

-- ── Mautic vs Sendy (mautic-vs-sendy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', '44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$mautic-vs-sendy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$vs Sendy$q$, $q$/compare/mautic-vs-sendy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '780f67bf-33b3-43f7-9cf1-e78a31b9f50f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '780f67bf-33b3-43f7-9cf1-e78a31b9f50f' AND href = $q$/compare/mautic-vs-sendy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$vs Mautic$q$, $q$/compare/mautic-vs-sendy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '44d9699e-8d32-4e15-b625-c6a58b71f09e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '44d9699e-8d32-4e15-b625-c6a58b71f09e' AND href = $q$/compare/mautic-vs-sendy$q$);

-- ── Affine vs Timestripe (affine-vs-timestripe) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', 'e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$affine-vs-timestripe$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b3923df9-f933-42f3-a870-8a16aaef419f', $q$vs Timestripe$q$, $q$/compare/affine-vs-timestripe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f' AND href = $q$/compare/affine-vs-timestripe$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$vs Affine$q$, $q$/compare/affine-vs-timestripe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e87249d5-d534-4dd2-b7ea-1a1690c96c53'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e87249d5-d534-4dd2-b7ea-1a1690c96c53' AND href = $q$/compare/affine-vs-timestripe$q$);

-- ── Lunatask vs Timestripe (lunatask-vs-timestripe) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', 'e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$lunatask-vs-timestripe$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$vs Timestripe$q$, $q$/compare/lunatask-vs-timestripe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0' AND href = $q$/compare/lunatask-vs-timestripe$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e87249d5-d534-4dd2-b7ea-1a1690c96c53', $q$vs Lunatask$q$, $q$/compare/lunatask-vs-timestripe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e87249d5-d534-4dd2-b7ea-1a1690c96c53'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e87249d5-d534-4dd2-b7ea-1a1690c96c53' AND href = $q$/compare/lunatask-vs-timestripe$q$);

-- ── Lunatask vs Sorted 3 (lunatask-vs-sorted-3) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', 'ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$lunatask-vs-sorted-3$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0', $q$vs Sorted 3$q$, $q$/compare/lunatask-vs-sorted-3$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a0d8e5e2-0822-4d08-807a-6b9e49ebe1b0' AND href = $q$/compare/lunatask-vs-sorted-3$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$vs Lunatask$q$, $q$/compare/lunatask-vs-sorted-3$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37' AND href = $q$/compare/lunatask-vs-sorted-3$q$);

-- ── NotePlan vs Sorted 3 (noteplan-vs-sorted-3) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', 'ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$noteplan-vs-sorted-3$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6b839ece-85d0-4b47-9358-2feed4175b10', $q$vs Sorted 3$q$, $q$/compare/noteplan-vs-sorted-3$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6b839ece-85d0-4b47-9358-2feed4175b10'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6b839ece-85d0-4b47-9358-2feed4175b10' AND href = $q$/compare/noteplan-vs-sorted-3$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$vs NotePlan$q$, $q$/compare/noteplan-vs-sorted-3$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37' AND href = $q$/compare/noteplan-vs-sorted-3$q$);

-- ── NotePlan vs Scrintal (noteplan-vs-scrintal) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6b839ece-85d0-4b47-9358-2feed4175b10', '44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$noteplan-vs-scrintal$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6b839ece-85d0-4b47-9358-2feed4175b10', $q$vs Scrintal$q$, $q$/compare/noteplan-vs-scrintal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6b839ece-85d0-4b47-9358-2feed4175b10'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6b839ece-85d0-4b47-9358-2feed4175b10' AND href = $q$/compare/noteplan-vs-scrintal$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '44be1d54-c2e8-47bb-b553-cdc2120d6458', $q$vs NotePlan$q$, $q$/compare/noteplan-vs-scrintal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '44be1d54-c2e8-47bb-b553-cdc2120d6458'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '44be1d54-c2e8-47bb-b553-cdc2120d6458' AND href = $q$/compare/noteplan-vs-scrintal$q$);

-- ── GeoRanker vs Local Falcon (georanker-vs-local-falcon) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', 'f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$georanker-vs-local-falcon$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$vs Local Falcon$q$, $q$/compare/georanker-vs-local-falcon$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5f976254-fda1-4e80-a22f-8c5674b5c9b6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5f976254-fda1-4e80-a22f-8c5674b5c9b6' AND href = $q$/compare/georanker-vs-local-falcon$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$vs GeoRanker$q$, $q$/compare/georanker-vs-local-falcon$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f3bfd847-c715-4e81-938c-aaa0b4445e79'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f3bfd847-c715-4e81-938c-aaa0b4445e79' AND href = $q$/compare/georanker-vs-local-falcon$q$);

-- ── GeoRanker vs Merchynt (georanker-vs-merchynt) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', '3b0618a9-c067-473b-869a-3d9864cb6eda', $q$georanker-vs-merchynt$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$vs Merchynt$q$, $q$/compare/georanker-vs-merchynt$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5f976254-fda1-4e80-a22f-8c5674b5c9b6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5f976254-fda1-4e80-a22f-8c5674b5c9b6' AND href = $q$/compare/georanker-vs-merchynt$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3b0618a9-c067-473b-869a-3d9864cb6eda', $q$vs GeoRanker$q$, $q$/compare/georanker-vs-merchynt$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3b0618a9-c067-473b-869a-3d9864cb6eda'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3b0618a9-c067-473b-869a-3d9864cb6eda' AND href = $q$/compare/georanker-vs-merchynt$q$);

-- ── BookStack vs GitBook (bookstack-vs-gitbook) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1c979afd-7472-4f90-be81-546475814887', '3af57a6b-aa7b-403a-a094-3150492f8e93', $q$bookstack-vs-gitbook$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1c979afd-7472-4f90-be81-546475814887', $q$vs GitBook$q$, $q$/compare/bookstack-vs-gitbook$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1c979afd-7472-4f90-be81-546475814887'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1c979afd-7472-4f90-be81-546475814887' AND href = $q$/compare/bookstack-vs-gitbook$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3af57a6b-aa7b-403a-a094-3150492f8e93', $q$vs BookStack$q$, $q$/compare/bookstack-vs-gitbook$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3af57a6b-aa7b-403a-a094-3150492f8e93'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3af57a6b-aa7b-403a-a094-3150492f8e93' AND href = $q$/compare/bookstack-vs-gitbook$q$);

-- ── BookStack vs DokuWiki (bookstack-vs-dokuwiki) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1c979afd-7472-4f90-be81-546475814887', 'bac55456-ac21-473d-a96f-b37ba84bb107', $q$bookstack-vs-dokuwiki$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1c979afd-7472-4f90-be81-546475814887', $q$vs DokuWiki$q$, $q$/compare/bookstack-vs-dokuwiki$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1c979afd-7472-4f90-be81-546475814887'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1c979afd-7472-4f90-be81-546475814887' AND href = $q$/compare/bookstack-vs-dokuwiki$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bac55456-ac21-473d-a96f-b37ba84bb107', $q$vs BookStack$q$, $q$/compare/bookstack-vs-dokuwiki$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bac55456-ac21-473d-a96f-b37ba84bb107'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bac55456-ac21-473d-a96f-b37ba84bb107' AND href = $q$/compare/bookstack-vs-dokuwiki$q$);

-- ── DokuWiki vs TiddlyWiki (dokuwiki-vs-tiddlywiki) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bac55456-ac21-473d-a96f-b37ba84bb107', '9083bc49-72a1-47d8-94f0-9eca973868b2', $q$dokuwiki-vs-tiddlywiki$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bac55456-ac21-473d-a96f-b37ba84bb107', $q$vs TiddlyWiki$q$, $q$/compare/dokuwiki-vs-tiddlywiki$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bac55456-ac21-473d-a96f-b37ba84bb107'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bac55456-ac21-473d-a96f-b37ba84bb107' AND href = $q$/compare/dokuwiki-vs-tiddlywiki$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9083bc49-72a1-47d8-94f0-9eca973868b2', $q$vs DokuWiki$q$, $q$/compare/dokuwiki-vs-tiddlywiki$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9083bc49-72a1-47d8-94f0-9eca973868b2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9083bc49-72a1-47d8-94f0-9eca973868b2' AND href = $q$/compare/dokuwiki-vs-tiddlywiki$q$);

-- ── OrangeHRM vs Sift Org Chart (orangehrm-vs-sift-org-chart) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c2a56d2f-1e25-421f-af5c-1494914a3095', '54840d54-d23f-400b-9a21-c910db72a31a', $q$orangehrm-vs-sift-org-chart$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c2a56d2f-1e25-421f-af5c-1494914a3095', $q$vs Sift Org Chart$q$, $q$/compare/orangehrm-vs-sift-org-chart$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c2a56d2f-1e25-421f-af5c-1494914a3095'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c2a56d2f-1e25-421f-af5c-1494914a3095' AND href = $q$/compare/orangehrm-vs-sift-org-chart$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '54840d54-d23f-400b-9a21-c910db72a31a', $q$vs OrangeHRM$q$, $q$/compare/orangehrm-vs-sift-org-chart$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '54840d54-d23f-400b-9a21-c910db72a31a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '54840d54-d23f-400b-9a21-c910db72a31a' AND href = $q$/compare/orangehrm-vs-sift-org-chart$q$);

-- ── Horilla vs MintHCM (horilla-vs-minthcm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', '6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$horilla-vs-minthcm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$vs MintHCM$q$, $q$/compare/horilla-vs-minthcm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6c4d248e-ed75-425f-a74f-2cfa5f36dc03'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6c4d248e-ed75-425f-a74f-2cfa5f36dc03' AND href = $q$/compare/horilla-vs-minthcm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$vs Horilla$q$, $q$/compare/horilla-vs-minthcm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6fd92840-a8d9-4354-97b1-b102f54b88d6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6fd92840-a8d9-4354-97b1-b102f54b88d6' AND href = $q$/compare/horilla-vs-minthcm$q$);

-- ── MintHCM vs Open HRMS (minthcm-vs-open-hrms) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', '8e6508f8-f264-449c-bf83-015dd51a8619', $q$minthcm-vs-open-hrms$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$vs Open HRMS$q$, $q$/compare/minthcm-vs-open-hrms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6fd92840-a8d9-4354-97b1-b102f54b88d6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6fd92840-a8d9-4354-97b1-b102f54b88d6' AND href = $q$/compare/minthcm-vs-open-hrms$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8e6508f8-f264-449c-bf83-015dd51a8619', $q$vs MintHCM$q$, $q$/compare/minthcm-vs-open-hrms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8e6508f8-f264-449c-bf83-015dd51a8619'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8e6508f8-f264-449c-bf83-015dd51a8619' AND href = $q$/compare/minthcm-vs-open-hrms$q$);

-- ── Nuclei vs OWASP ZAP (nuclei-vs-owasp-zap) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', '26fa7763-662c-4590-abb7-062fe17b309e', $q$nuclei-vs-owasp-zap$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$vs OWASP ZAP$q$, $q$/compare/nuclei-vs-owasp-zap$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb' AND href = $q$/compare/nuclei-vs-owasp-zap$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '26fa7763-662c-4590-abb7-062fe17b309e', $q$vs Nuclei$q$, $q$/compare/nuclei-vs-owasp-zap$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '26fa7763-662c-4590-abb7-062fe17b309e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '26fa7763-662c-4590-abb7-062fe17b309e' AND href = $q$/compare/nuclei-vs-owasp-zap$q$);

-- ── Gitleaks vs OWASP ZAP (gitleaks-vs-owasp-zap) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', '26fa7763-662c-4590-abb7-062fe17b309e', $q$gitleaks-vs-owasp-zap$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$vs OWASP ZAP$q$, $q$/compare/gitleaks-vs-owasp-zap$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0db8e4b7-3129-43e3-bd36-cff6d52f51bc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0db8e4b7-3129-43e3-bd36-cff6d52f51bc' AND href = $q$/compare/gitleaks-vs-owasp-zap$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '26fa7763-662c-4590-abb7-062fe17b309e', $q$vs Gitleaks$q$, $q$/compare/gitleaks-vs-owasp-zap$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '26fa7763-662c-4590-abb7-062fe17b309e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '26fa7763-662c-4590-abb7-062fe17b309e' AND href = $q$/compare/gitleaks-vs-owasp-zap$q$);


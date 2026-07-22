-- Comparison batch: asana-vs-trello, clickup-vs-monday, monday-vs-trello, asana-vs-linear, greenhouse-vs-lever, ashby-vs-greenhouse, greenhouse-vs-workable, breezy-hr-vs-jazzhr
-- Publishes 8 comparison page(s) with editorial content.

-- ── Asana vs Trello (asana-vs-trello) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', '08775de0-0ff3-40d7-ba33-f4d648f4381a', $q$asana-vs-trello$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$vs Trello$q$, $q$/compare/asana-vs-trello$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a' AND href = $q$/compare/asana-vs-trello$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '08775de0-0ff3-40d7-ba33-f4d648f4381a', $q$vs Asana$q$, $q$/compare/asana-vs-trello$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '08775de0-0ff3-40d7-ba33-f4d648f4381a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '08775de0-0ff3-40d7-ba33-f4d648f4381a' AND href = $q$/compare/asana-vs-trello$q$);

-- ── ClickUp vs monday.com (clickup-vs-monday) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dbd701b9-01ba-4402-984c-660c90af0d4b', '7bc1e8a6-de99-4eb8-9968-c92bb4254013', $q$clickup-vs-monday$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dbd701b9-01ba-4402-984c-660c90af0d4b', $q$vs monday.com$q$, $q$/compare/clickup-vs-monday$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dbd701b9-01ba-4402-984c-660c90af0d4b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dbd701b9-01ba-4402-984c-660c90af0d4b' AND href = $q$/compare/clickup-vs-monday$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7bc1e8a6-de99-4eb8-9968-c92bb4254013', $q$vs ClickUp$q$, $q$/compare/clickup-vs-monday$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7bc1e8a6-de99-4eb8-9968-c92bb4254013'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7bc1e8a6-de99-4eb8-9968-c92bb4254013' AND href = $q$/compare/clickup-vs-monday$q$);

-- ── monday.com vs Trello (monday-vs-trello) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7bc1e8a6-de99-4eb8-9968-c92bb4254013', '08775de0-0ff3-40d7-ba33-f4d648f4381a', $q$monday-vs-trello$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7bc1e8a6-de99-4eb8-9968-c92bb4254013', $q$vs Trello$q$, $q$/compare/monday-vs-trello$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7bc1e8a6-de99-4eb8-9968-c92bb4254013'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7bc1e8a6-de99-4eb8-9968-c92bb4254013' AND href = $q$/compare/monday-vs-trello$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '08775de0-0ff3-40d7-ba33-f4d648f4381a', $q$vs monday.com$q$, $q$/compare/monday-vs-trello$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '08775de0-0ff3-40d7-ba33-f4d648f4381a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '08775de0-0ff3-40d7-ba33-f4d648f4381a' AND href = $q$/compare/monday-vs-trello$q$);

-- ── Asana vs Linear (asana-vs-linear) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', 'e762d0b5-3f6a-4165-89d8-5d2a4889217d', $q$asana-vs-linear$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$vs Linear$q$, $q$/compare/asana-vs-linear$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a' AND href = $q$/compare/asana-vs-linear$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e762d0b5-3f6a-4165-89d8-5d2a4889217d', $q$vs Asana$q$, $q$/compare/asana-vs-linear$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e762d0b5-3f6a-4165-89d8-5d2a4889217d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e762d0b5-3f6a-4165-89d8-5d2a4889217d' AND href = $q$/compare/asana-vs-linear$q$);

-- ── Greenhouse vs Lever (greenhouse-vs-lever) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('69afcc2a-09a4-49b5-a478-dc5c7b9d0240', 'e059a784-d8bc-45d5-ab94-fea4f0338c4e', $q$greenhouse-vs-lever$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69afcc2a-09a4-49b5-a478-dc5c7b9d0240', $q$vs Lever$q$, $q$/compare/greenhouse-vs-lever$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69afcc2a-09a4-49b5-a478-dc5c7b9d0240'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69afcc2a-09a4-49b5-a478-dc5c7b9d0240' AND href = $q$/compare/greenhouse-vs-lever$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e059a784-d8bc-45d5-ab94-fea4f0338c4e', $q$vs Greenhouse$q$, $q$/compare/greenhouse-vs-lever$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e059a784-d8bc-45d5-ab94-fea4f0338c4e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e059a784-d8bc-45d5-ab94-fea4f0338c4e' AND href = $q$/compare/greenhouse-vs-lever$q$);

-- ── Ashby vs Greenhouse (ashby-vs-greenhouse) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', '69afcc2a-09a4-49b5-a478-dc5c7b9d0240', $q$ashby-vs-greenhouse$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$vs Greenhouse$q$, $q$/compare/ashby-vs-greenhouse$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a' AND href = $q$/compare/ashby-vs-greenhouse$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69afcc2a-09a4-49b5-a478-dc5c7b9d0240', $q$vs Ashby$q$, $q$/compare/ashby-vs-greenhouse$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69afcc2a-09a4-49b5-a478-dc5c7b9d0240'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69afcc2a-09a4-49b5-a478-dc5c7b9d0240' AND href = $q$/compare/ashby-vs-greenhouse$q$);

-- ── Greenhouse vs Workable (greenhouse-vs-workable) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('69afcc2a-09a4-49b5-a478-dc5c7b9d0240', '63552ca4-8785-47c6-9aaf-f0643adf97b5', $q$greenhouse-vs-workable$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69afcc2a-09a4-49b5-a478-dc5c7b9d0240', $q$vs Workable$q$, $q$/compare/greenhouse-vs-workable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69afcc2a-09a4-49b5-a478-dc5c7b9d0240'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69afcc2a-09a4-49b5-a478-dc5c7b9d0240' AND href = $q$/compare/greenhouse-vs-workable$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '63552ca4-8785-47c6-9aaf-f0643adf97b5', $q$vs Greenhouse$q$, $q$/compare/greenhouse-vs-workable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '63552ca4-8785-47c6-9aaf-f0643adf97b5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '63552ca4-8785-47c6-9aaf-f0643adf97b5' AND href = $q$/compare/greenhouse-vs-workable$q$);

-- ── Breezy HR vs JazzHR (breezy-hr-vs-jazzhr) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', '8edc4560-4c87-4f48-9ba0-8af1a559a2e7', $q$breezy-hr-vs-jazzhr$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$vs JazzHR$q$, $q$/compare/breezy-hr-vs-jazzhr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a' AND href = $q$/compare/breezy-hr-vs-jazzhr$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8edc4560-4c87-4f48-9ba0-8af1a559a2e7', $q$vs Breezy HR$q$, $q$/compare/breezy-hr-vs-jazzhr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8edc4560-4c87-4f48-9ba0-8af1a559a2e7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8edc4560-4c87-4f48-9ba0-8af1a559a2e7' AND href = $q$/compare/breezy-hr-vs-jazzhr$q$);


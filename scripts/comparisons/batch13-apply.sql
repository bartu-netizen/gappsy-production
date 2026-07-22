-- Comparison batch: coda-vs-notion, evernote-vs-notion, google-workspace-vs-microsoft-365, harvest-vs-toggl-track, dropbox-vs-google-drive, notion-vs-onenote, asana-vs-clickup, asana-vs-monday
-- Publishes 8 comparison page(s) with editorial content.

-- ── Coda (now Superhuman Docs) vs Notion (coda-vs-notion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('68d2cc39-83c1-4877-8a8c-2057a904b538', '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$coda-vs-notion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '68d2cc39-83c1-4877-8a8c-2057a904b538', $q$vs Notion$q$, $q$/compare/coda-vs-notion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '68d2cc39-83c1-4877-8a8c-2057a904b538'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '68d2cc39-83c1-4877-8a8c-2057a904b538' AND href = $q$/compare/coda-vs-notion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$vs Coda (now Superhuman Docs)$q$, $q$/compare/coda-vs-notion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871' AND href = $q$/compare/coda-vs-notion$q$);

-- ── Evernote vs Notion (evernote-vs-notion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('332223c1-f22b-409b-9580-2d82c4edda08', '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$evernote-vs-notion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '332223c1-f22b-409b-9580-2d82c4edda08', $q$vs Notion$q$, $q$/compare/evernote-vs-notion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '332223c1-f22b-409b-9580-2d82c4edda08'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '332223c1-f22b-409b-9580-2d82c4edda08' AND href = $q$/compare/evernote-vs-notion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$vs Evernote$q$, $q$/compare/evernote-vs-notion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871' AND href = $q$/compare/evernote-vs-notion$q$);

-- ── Google Workspace vs Microsoft 365 (google-workspace-vs-microsoft-365) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ebc7be94-6513-4a4f-9f90-be0618f1b431', '24098d22-ccb2-4c35-9926-5bedac902206', $q$google-workspace-vs-microsoft-365$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ebc7be94-6513-4a4f-9f90-be0618f1b431', $q$vs Microsoft 365$q$, $q$/compare/google-workspace-vs-microsoft-365$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ebc7be94-6513-4a4f-9f90-be0618f1b431'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ebc7be94-6513-4a4f-9f90-be0618f1b431' AND href = $q$/compare/google-workspace-vs-microsoft-365$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '24098d22-ccb2-4c35-9926-5bedac902206', $q$vs Google Workspace$q$, $q$/compare/google-workspace-vs-microsoft-365$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '24098d22-ccb2-4c35-9926-5bedac902206'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '24098d22-ccb2-4c35-9926-5bedac902206' AND href = $q$/compare/google-workspace-vs-microsoft-365$q$);

-- ── Harvest vs Toggl Track (harvest-vs-toggl-track) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8b4bc6ea-bad2-4c99-9750-883f839aa67e', '8077121d-2120-471d-a225-8abe93a45b3b', $q$harvest-vs-toggl-track$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8b4bc6ea-bad2-4c99-9750-883f839aa67e', $q$vs Toggl Track$q$, $q$/compare/harvest-vs-toggl-track$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8b4bc6ea-bad2-4c99-9750-883f839aa67e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8b4bc6ea-bad2-4c99-9750-883f839aa67e' AND href = $q$/compare/harvest-vs-toggl-track$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8077121d-2120-471d-a225-8abe93a45b3b', $q$vs Harvest$q$, $q$/compare/harvest-vs-toggl-track$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8077121d-2120-471d-a225-8abe93a45b3b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8077121d-2120-471d-a225-8abe93a45b3b' AND href = $q$/compare/harvest-vs-toggl-track$q$);

-- ── Dropbox vs Google Drive (dropbox-vs-google-drive) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('09bfad13-d346-4bb4-8adf-3ff6863d687e', 'bd2fce1d-50cd-44a2-927e-39cfe30406dd', $q$dropbox-vs-google-drive$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '09bfad13-d346-4bb4-8adf-3ff6863d687e', $q$vs Google Drive$q$, $q$/compare/dropbox-vs-google-drive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '09bfad13-d346-4bb4-8adf-3ff6863d687e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '09bfad13-d346-4bb4-8adf-3ff6863d687e' AND href = $q$/compare/dropbox-vs-google-drive$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bd2fce1d-50cd-44a2-927e-39cfe30406dd', $q$vs Dropbox$q$, $q$/compare/dropbox-vs-google-drive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bd2fce1d-50cd-44a2-927e-39cfe30406dd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bd2fce1d-50cd-44a2-927e-39cfe30406dd' AND href = $q$/compare/dropbox-vs-google-drive$q$);

-- ── Notion vs OneNote (notion-vs-onenote) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', '118f8753-a6ca-4e1e-90db-108a98a53646', $q$notion-vs-onenote$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$vs OneNote$q$, $q$/compare/notion-vs-onenote$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871' AND href = $q$/compare/notion-vs-onenote$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '118f8753-a6ca-4e1e-90db-108a98a53646', $q$vs Notion$q$, $q$/compare/notion-vs-onenote$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '118f8753-a6ca-4e1e-90db-108a98a53646'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '118f8753-a6ca-4e1e-90db-108a98a53646' AND href = $q$/compare/notion-vs-onenote$q$);

-- ── Asana vs ClickUp (asana-vs-clickup) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', 'dbd701b9-01ba-4402-984c-660c90af0d4b', $q$asana-vs-clickup$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$vs ClickUp$q$, $q$/compare/asana-vs-clickup$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a' AND href = $q$/compare/asana-vs-clickup$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dbd701b9-01ba-4402-984c-660c90af0d4b', $q$vs Asana$q$, $q$/compare/asana-vs-clickup$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dbd701b9-01ba-4402-984c-660c90af0d4b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dbd701b9-01ba-4402-984c-660c90af0d4b' AND href = $q$/compare/asana-vs-clickup$q$);

-- ── Asana vs monday.com (asana-vs-monday) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', '7bc1e8a6-de99-4eb8-9968-c92bb4254013', $q$asana-vs-monday$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$vs monday.com$q$, $q$/compare/asana-vs-monday$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a' AND href = $q$/compare/asana-vs-monday$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7bc1e8a6-de99-4eb8-9968-c92bb4254013', $q$vs Asana$q$, $q$/compare/asana-vs-monday$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7bc1e8a6-de99-4eb8-9968-c92bb4254013'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7bc1e8a6-de99-4eb8-9968-c92bb4254013' AND href = $q$/compare/asana-vs-monday$q$);


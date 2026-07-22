-- Comparison batch: microsoft-power-bi-vs-tableau, looker-vs-tableau, microsoft-power-bi-vs-qlik-sense, backblaze-vs-carbonite, amazon-s3-vs-google-cloud-storage, backblaze-vs-idrive, ringcentral-vs-vonage, ringcentral-vs-zoom-phone
-- Publishes 8 comparison page(s) with editorial content.

-- ── Microsoft Power BI vs Tableau (microsoft-power-bi-vs-tableau) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1ae91efd-338e-4ef0-9f0b-3f2a51548062', '3420577a-4640-4828-a64b-5afe612e65be', $q$microsoft-power-bi-vs-tableau$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1ae91efd-338e-4ef0-9f0b-3f2a51548062', $q$vs Tableau$q$, $q$/compare/microsoft-power-bi-vs-tableau$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1ae91efd-338e-4ef0-9f0b-3f2a51548062'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1ae91efd-338e-4ef0-9f0b-3f2a51548062' AND href = $q$/compare/microsoft-power-bi-vs-tableau$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3420577a-4640-4828-a64b-5afe612e65be', $q$vs Microsoft Power BI$q$, $q$/compare/microsoft-power-bi-vs-tableau$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3420577a-4640-4828-a64b-5afe612e65be'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3420577a-4640-4828-a64b-5afe612e65be' AND href = $q$/compare/microsoft-power-bi-vs-tableau$q$);

-- ── Looker vs Tableau (looker-vs-tableau) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f1fa4604-a254-46d0-ac89-4c0c21148bf3', '3420577a-4640-4828-a64b-5afe612e65be', $q$looker-vs-tableau$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f1fa4604-a254-46d0-ac89-4c0c21148bf3', $q$vs Tableau$q$, $q$/compare/looker-vs-tableau$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f1fa4604-a254-46d0-ac89-4c0c21148bf3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f1fa4604-a254-46d0-ac89-4c0c21148bf3' AND href = $q$/compare/looker-vs-tableau$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3420577a-4640-4828-a64b-5afe612e65be', $q$vs Looker$q$, $q$/compare/looker-vs-tableau$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3420577a-4640-4828-a64b-5afe612e65be'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3420577a-4640-4828-a64b-5afe612e65be' AND href = $q$/compare/looker-vs-tableau$q$);

-- ── Microsoft Power BI vs Qlik Sense (microsoft-power-bi-vs-qlik-sense) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1ae91efd-338e-4ef0-9f0b-3f2a51548062', '94b9a1ae-427d-49ec-bb26-75d68dd17562', $q$microsoft-power-bi-vs-qlik-sense$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1ae91efd-338e-4ef0-9f0b-3f2a51548062', $q$vs Qlik Sense$q$, $q$/compare/microsoft-power-bi-vs-qlik-sense$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1ae91efd-338e-4ef0-9f0b-3f2a51548062'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1ae91efd-338e-4ef0-9f0b-3f2a51548062' AND href = $q$/compare/microsoft-power-bi-vs-qlik-sense$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '94b9a1ae-427d-49ec-bb26-75d68dd17562', $q$vs Microsoft Power BI$q$, $q$/compare/microsoft-power-bi-vs-qlik-sense$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '94b9a1ae-427d-49ec-bb26-75d68dd17562'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '94b9a1ae-427d-49ec-bb26-75d68dd17562' AND href = $q$/compare/microsoft-power-bi-vs-qlik-sense$q$);

-- ── Backblaze vs Carbonite (backblaze-vs-carbonite) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', '26363614-3d73-4304-99d9-162b41b02814', $q$backblaze-vs-carbonite$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '42d5590c-1f80-447c-a591-4709d5198a5d', $q$vs Carbonite$q$, $q$/compare/backblaze-vs-carbonite$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d' AND href = $q$/compare/backblaze-vs-carbonite$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '26363614-3d73-4304-99d9-162b41b02814', $q$vs Backblaze$q$, $q$/compare/backblaze-vs-carbonite$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '26363614-3d73-4304-99d9-162b41b02814'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '26363614-3d73-4304-99d9-162b41b02814' AND href = $q$/compare/backblaze-vs-carbonite$q$);

-- ── Amazon S3 vs Google Cloud Storage (amazon-s3-vs-google-cloud-storage) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', '2d8614e8-6ffd-43b6-a2a4-26fe4217c0bd', $q$amazon-s3-vs-google-cloud-storage$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$vs Google Cloud Storage$q$, $q$/compare/amazon-s3-vs-google-cloud-storage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3' AND href = $q$/compare/amazon-s3-vs-google-cloud-storage$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2d8614e8-6ffd-43b6-a2a4-26fe4217c0bd', $q$vs Amazon S3$q$, $q$/compare/amazon-s3-vs-google-cloud-storage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2d8614e8-6ffd-43b6-a2a4-26fe4217c0bd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2d8614e8-6ffd-43b6-a2a4-26fe4217c0bd' AND href = $q$/compare/amazon-s3-vs-google-cloud-storage$q$);

-- ── Backblaze vs IDrive (backblaze-vs-idrive) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', 'cd90d7f0-266d-4308-84e4-03884e03b80c', $q$backblaze-vs-idrive$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '42d5590c-1f80-447c-a591-4709d5198a5d', $q$vs IDrive$q$, $q$/compare/backblaze-vs-idrive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d' AND href = $q$/compare/backblaze-vs-idrive$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cd90d7f0-266d-4308-84e4-03884e03b80c', $q$vs Backblaze$q$, $q$/compare/backblaze-vs-idrive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cd90d7f0-266d-4308-84e4-03884e03b80c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cd90d7f0-266d-4308-84e4-03884e03b80c' AND href = $q$/compare/backblaze-vs-idrive$q$);

-- ── RingCentral vs Vonage (ringcentral-vs-vonage) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('92a082b4-89b7-491c-a783-39088d0397e1', 'b0630601-9e1f-4c1c-928d-85768c104c56', $q$ringcentral-vs-vonage$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '92a082b4-89b7-491c-a783-39088d0397e1', $q$vs Vonage$q$, $q$/compare/ringcentral-vs-vonage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '92a082b4-89b7-491c-a783-39088d0397e1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '92a082b4-89b7-491c-a783-39088d0397e1' AND href = $q$/compare/ringcentral-vs-vonage$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b0630601-9e1f-4c1c-928d-85768c104c56', $q$vs RingCentral$q$, $q$/compare/ringcentral-vs-vonage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b0630601-9e1f-4c1c-928d-85768c104c56'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b0630601-9e1f-4c1c-928d-85768c104c56' AND href = $q$/compare/ringcentral-vs-vonage$q$);

-- ── RingCentral vs Zoom Phone (ringcentral-vs-zoom-phone) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('92a082b4-89b7-491c-a783-39088d0397e1', '96e91f43-5f01-4104-b90d-be66d79b5e88', $q$ringcentral-vs-zoom-phone$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '92a082b4-89b7-491c-a783-39088d0397e1', $q$vs Zoom Phone$q$, $q$/compare/ringcentral-vs-zoom-phone$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '92a082b4-89b7-491c-a783-39088d0397e1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '92a082b4-89b7-491c-a783-39088d0397e1' AND href = $q$/compare/ringcentral-vs-zoom-phone$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '96e91f43-5f01-4104-b90d-be66d79b5e88', $q$vs RingCentral$q$, $q$/compare/ringcentral-vs-zoom-phone$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '96e91f43-5f01-4104-b90d-be66d79b5e88'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '96e91f43-5f01-4104-b90d-be66d79b5e88' AND href = $q$/compare/ringcentral-vs-zoom-phone$q$);


-- Comparison batch: weebly-vs-wordpress, drchrono-vs-simplepractice, athenaone-vs-eclinicalworks, simplepractice-vs-tebra, quickbooks-online-vs-xero, quickbooks-online-vs-zoho-books, quickbooks-online-vs-wave, quickbooks-online-vs-sage-accounting
-- Publishes 8 comparison page(s) with editorial content.

-- ── Weebly vs WordPress (weebly-vs-wordpress) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0091d0a1-3952-450b-b212-e0a36e137352', '8741e733-7b13-489c-8696-9d50fbf35b42', $q$weebly-vs-wordpress$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0091d0a1-3952-450b-b212-e0a36e137352', $q$vs WordPress$q$, $q$/compare/weebly-vs-wordpress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0091d0a1-3952-450b-b212-e0a36e137352'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0091d0a1-3952-450b-b212-e0a36e137352' AND href = $q$/compare/weebly-vs-wordpress$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8741e733-7b13-489c-8696-9d50fbf35b42', $q$vs Weebly$q$, $q$/compare/weebly-vs-wordpress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8741e733-7b13-489c-8696-9d50fbf35b42'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8741e733-7b13-489c-8696-9d50fbf35b42' AND href = $q$/compare/weebly-vs-wordpress$q$);

-- ── DrChrono vs SimplePractice (drchrono-vs-simplepractice) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('658c8cb8-ea59-4b89-bc57-b008fda4a4bd', 'c1f93663-fc76-4430-8326-61a4f8cb731a', $q$drchrono-vs-simplepractice$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '658c8cb8-ea59-4b89-bc57-b008fda4a4bd', $q$vs SimplePractice$q$, $q$/compare/drchrono-vs-simplepractice$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '658c8cb8-ea59-4b89-bc57-b008fda4a4bd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '658c8cb8-ea59-4b89-bc57-b008fda4a4bd' AND href = $q$/compare/drchrono-vs-simplepractice$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c1f93663-fc76-4430-8326-61a4f8cb731a', $q$vs DrChrono$q$, $q$/compare/drchrono-vs-simplepractice$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c1f93663-fc76-4430-8326-61a4f8cb731a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c1f93663-fc76-4430-8326-61a4f8cb731a' AND href = $q$/compare/drchrono-vs-simplepractice$q$);

-- ── athenaOne vs eClinicalWorks (athenaone-vs-eclinicalworks) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', 'abea60cc-5f26-45e3-9696-3dec899a6984', $q$athenaone-vs-eclinicalworks$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$vs eClinicalWorks$q$, $q$/compare/athenaone-vs-eclinicalworks$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2debbb6c-85ad-4634-b256-8049d7c1bd11'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2debbb6c-85ad-4634-b256-8049d7c1bd11' AND href = $q$/compare/athenaone-vs-eclinicalworks$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'abea60cc-5f26-45e3-9696-3dec899a6984', $q$vs athenaOne$q$, $q$/compare/athenaone-vs-eclinicalworks$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'abea60cc-5f26-45e3-9696-3dec899a6984'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'abea60cc-5f26-45e3-9696-3dec899a6984' AND href = $q$/compare/athenaone-vs-eclinicalworks$q$);

-- ── SimplePractice vs Tebra (simplepractice-vs-tebra) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c1f93663-fc76-4430-8326-61a4f8cb731a', 'fdb22c7e-5eac-4888-bd83-48ca29adb96d', $q$simplepractice-vs-tebra$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c1f93663-fc76-4430-8326-61a4f8cb731a', $q$vs Tebra$q$, $q$/compare/simplepractice-vs-tebra$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c1f93663-fc76-4430-8326-61a4f8cb731a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c1f93663-fc76-4430-8326-61a4f8cb731a' AND href = $q$/compare/simplepractice-vs-tebra$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fdb22c7e-5eac-4888-bd83-48ca29adb96d', $q$vs SimplePractice$q$, $q$/compare/simplepractice-vs-tebra$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fdb22c7e-5eac-4888-bd83-48ca29adb96d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fdb22c7e-5eac-4888-bd83-48ca29adb96d' AND href = $q$/compare/simplepractice-vs-tebra$q$);

-- ── QuickBooks Online vs Xero (quickbooks-online-vs-xero) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9e200cb1-a048-4c0a-ac15-ece1a517f982', 'ab58553d-75b9-40f6-9b54-61fbab218754', $q$quickbooks-online-vs-xero$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9e200cb1-a048-4c0a-ac15-ece1a517f982', $q$vs Xero$q$, $q$/compare/quickbooks-online-vs-xero$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9e200cb1-a048-4c0a-ac15-ece1a517f982'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9e200cb1-a048-4c0a-ac15-ece1a517f982' AND href = $q$/compare/quickbooks-online-vs-xero$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ab58553d-75b9-40f6-9b54-61fbab218754', $q$vs QuickBooks Online$q$, $q$/compare/quickbooks-online-vs-xero$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ab58553d-75b9-40f6-9b54-61fbab218754'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ab58553d-75b9-40f6-9b54-61fbab218754' AND href = $q$/compare/quickbooks-online-vs-xero$q$);

-- ── QuickBooks Online vs Zoho Books (quickbooks-online-vs-zoho-books) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9e200cb1-a048-4c0a-ac15-ece1a517f982', '970dd292-16fa-475f-996d-e50070df18a1', $q$quickbooks-online-vs-zoho-books$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9e200cb1-a048-4c0a-ac15-ece1a517f982', $q$vs Zoho Books$q$, $q$/compare/quickbooks-online-vs-zoho-books$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9e200cb1-a048-4c0a-ac15-ece1a517f982'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9e200cb1-a048-4c0a-ac15-ece1a517f982' AND href = $q$/compare/quickbooks-online-vs-zoho-books$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '970dd292-16fa-475f-996d-e50070df18a1', $q$vs QuickBooks Online$q$, $q$/compare/quickbooks-online-vs-zoho-books$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '970dd292-16fa-475f-996d-e50070df18a1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '970dd292-16fa-475f-996d-e50070df18a1' AND href = $q$/compare/quickbooks-online-vs-zoho-books$q$);

-- ── QuickBooks Online vs Wave (quickbooks-online-vs-wave) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9e200cb1-a048-4c0a-ac15-ece1a517f982', 'e5e2d12b-a101-4a07-8262-007ffad934e6', $q$quickbooks-online-vs-wave$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9e200cb1-a048-4c0a-ac15-ece1a517f982', $q$vs Wave$q$, $q$/compare/quickbooks-online-vs-wave$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9e200cb1-a048-4c0a-ac15-ece1a517f982'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9e200cb1-a048-4c0a-ac15-ece1a517f982' AND href = $q$/compare/quickbooks-online-vs-wave$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e5e2d12b-a101-4a07-8262-007ffad934e6', $q$vs QuickBooks Online$q$, $q$/compare/quickbooks-online-vs-wave$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e5e2d12b-a101-4a07-8262-007ffad934e6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e5e2d12b-a101-4a07-8262-007ffad934e6' AND href = $q$/compare/quickbooks-online-vs-wave$q$);

-- ── QuickBooks Online vs Sage Accounting (quickbooks-online-vs-sage-accounting) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9e200cb1-a048-4c0a-ac15-ece1a517f982', 'f4698c6b-f210-42dd-bcc1-bc0d8ae274f3', $q$quickbooks-online-vs-sage-accounting$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9e200cb1-a048-4c0a-ac15-ece1a517f982', $q$vs Sage Accounting$q$, $q$/compare/quickbooks-online-vs-sage-accounting$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9e200cb1-a048-4c0a-ac15-ece1a517f982'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9e200cb1-a048-4c0a-ac15-ece1a517f982' AND href = $q$/compare/quickbooks-online-vs-sage-accounting$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f4698c6b-f210-42dd-bcc1-bc0d8ae274f3', $q$vs QuickBooks Online$q$, $q$/compare/quickbooks-online-vs-sage-accounting$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f4698c6b-f210-42dd-bcc1-bc0d8ae274f3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f4698c6b-f210-42dd-bcc1-bc0d8ae274f3' AND href = $q$/compare/quickbooks-online-vs-sage-accounting$q$);


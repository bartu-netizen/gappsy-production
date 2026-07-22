-- Comparison batch: salesforce-vs-yetiforce, arc-vs-braintree, arc-vs-stripe, founderpath-vs-rho, founderpath-vs-payhawk, dealhub-cpq-vs-letterdrop, apollo-io-vs-dealhub-cpq, airflow-vs-webhook-site, nectar-hr-vs-workmotion, chiefonboarding-vs-nectar-hr, burp-suite-vs-openarchiver, advancedmd-vs-doctolib, doctolib-vs-simplepractice, clio-vs-cloudlex, amazinghiring-vs-juicebox, juicebox-vs-recruitee, corteza-crm-vs-kylas, corteza-crm-vs-salesforce, activepieces-vs-statuscake, matomo-vs-uxcam, podia-vs-shopware, qloapps-vs-shopware, asana-vs-planka, expensify-vs-frappe-books, frappe-books-vs-quickbooks-online, billsby-vs-kill-bill, fastspring-vs-kill-bill, latenode-vs-process-street, latenode-vs-make, axiom-vs-huginn, activepieces-vs-huginn, ghost-vs-withknown, notion-vs-taskwarrior, notion-vs-obsidian, alf-vs-easyappointments, documize-vs-outline, archivesspace-vs-documize, goldcast-vs-restream, goldcast-vs-goto-meeting, bravo-studio-vs-nocodb, bubble-vs-nocodb, hygraph-vs-statamic, statamic-vs-substack, keystonejs-vs-substack, publii-vs-substack, lexion-vs-trustarc, clio-vs-lexion, activepieces-vs-onedev, activepieces-vs-stackstorm, dittofeed-vs-listmonk, dittofeed-vs-mautic, growthbar-vs-local-falcon, local-falcon-vs-vybefind-connector, chiefonboarding-vs-horilla, boundary-vs-openarchiver, openproject-vs-planview, asana-vs-openproject, freescout-vs-servicenow, alteryx-vs-redash, microsoft-power-bi-vs-redash, make-vs-rudderstack, make-vs-streamsets, documenso-vs-dropbox-sign, odoo-point-of-sale-vs-sevenrooms, sevenrooms-vs-toast, jitter-vs-squadcast, final-cut-pro-vs-squadcast, dify-vs-stack-ai, dify-vs-glean, coolify-vs-stormkit, coolify-vs-fly-io, activepieces-vs-nagios, activepieces-vs-jaeger, airflow-vs-flagsmith, mariadb-vs-turso, ckan-vs-mariadb, ckan-vs-opensearch, chroma-vs-ckan, goatcounter-vs-matomo, kong-vs-sqd
-- Publishes 80 comparison page(s) with editorial content.

-- ── Salesforce vs YetiForce (salesforce-vs-yetiforce) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d43ee8f4-1247-4fdd-8035-fef66e1db0b3', 'ad091561-b390-481a-bf66-f43ea55efb9d', $q$salesforce-vs-yetiforce$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3', $q$vs YetiForce$q$, $q$/compare/salesforce-vs-yetiforce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3' AND href = $q$/compare/salesforce-vs-yetiforce$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ad091561-b390-481a-bf66-f43ea55efb9d', $q$vs Salesforce$q$, $q$/compare/salesforce-vs-yetiforce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ad091561-b390-481a-bf66-f43ea55efb9d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ad091561-b390-481a-bf66-f43ea55efb9d' AND href = $q$/compare/salesforce-vs-yetiforce$q$);

-- ── Arc vs Braintree (arc-vs-braintree) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', '633df78b-c6d3-45d8-a067-207679f3055d', $q$arc-vs-braintree$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5b1475af-f4bc-459d-ac77-e29162361ec3', $q$vs Braintree$q$, $q$/compare/arc-vs-braintree$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3' AND href = $q$/compare/arc-vs-braintree$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '633df78b-c6d3-45d8-a067-207679f3055d', $q$vs Arc$q$, $q$/compare/arc-vs-braintree$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '633df78b-c6d3-45d8-a067-207679f3055d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '633df78b-c6d3-45d8-a067-207679f3055d' AND href = $q$/compare/arc-vs-braintree$q$);

-- ── Arc vs Stripe (arc-vs-stripe) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', 'a42a7c3c-6971-460f-b902-9c4f09a2e764', $q$arc-vs-stripe$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5b1475af-f4bc-459d-ac77-e29162361ec3', $q$vs Stripe$q$, $q$/compare/arc-vs-stripe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5b1475af-f4bc-459d-ac77-e29162361ec3' AND href = $q$/compare/arc-vs-stripe$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a42a7c3c-6971-460f-b902-9c4f09a2e764', $q$vs Arc$q$, $q$/compare/arc-vs-stripe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a42a7c3c-6971-460f-b902-9c4f09a2e764'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a42a7c3c-6971-460f-b902-9c4f09a2e764' AND href = $q$/compare/arc-vs-stripe$q$);

-- ── Founderpath vs Rho (founderpath-vs-rho) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', '04370e5b-5bb7-44db-b5e6-2db98849560d', $q$founderpath-vs-rho$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$vs Rho$q$, $q$/compare/founderpath-vs-rho$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '806674db-f3e6-419b-a6a4-aa3e4199d96e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '806674db-f3e6-419b-a6a4-aa3e4199d96e' AND href = $q$/compare/founderpath-vs-rho$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '04370e5b-5bb7-44db-b5e6-2db98849560d', $q$vs Founderpath$q$, $q$/compare/founderpath-vs-rho$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '04370e5b-5bb7-44db-b5e6-2db98849560d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '04370e5b-5bb7-44db-b5e6-2db98849560d' AND href = $q$/compare/founderpath-vs-rho$q$);

-- ── Founderpath vs Payhawk (founderpath-vs-payhawk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', '72083907-7b29-4e6e-80d3-6134cca542d6', $q$founderpath-vs-payhawk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$vs Payhawk$q$, $q$/compare/founderpath-vs-payhawk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '806674db-f3e6-419b-a6a4-aa3e4199d96e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '806674db-f3e6-419b-a6a4-aa3e4199d96e' AND href = $q$/compare/founderpath-vs-payhawk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '72083907-7b29-4e6e-80d3-6134cca542d6', $q$vs Founderpath$q$, $q$/compare/founderpath-vs-payhawk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '72083907-7b29-4e6e-80d3-6134cca542d6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '72083907-7b29-4e6e-80d3-6134cca542d6' AND href = $q$/compare/founderpath-vs-payhawk$q$);

-- ── DealHub CPQ vs Letterdrop (dealhub-cpq-vs-letterdrop) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', '9edefa30-90ff-46ea-8aa7-f8de6be4c79c', $q$dealhub-cpq-vs-letterdrop$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$vs Letterdrop$q$, $q$/compare/dealhub-cpq-vs-letterdrop$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa' AND href = $q$/compare/dealhub-cpq-vs-letterdrop$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9edefa30-90ff-46ea-8aa7-f8de6be4c79c', $q$vs DealHub CPQ$q$, $q$/compare/dealhub-cpq-vs-letterdrop$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9edefa30-90ff-46ea-8aa7-f8de6be4c79c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9edefa30-90ff-46ea-8aa7-f8de6be4c79c' AND href = $q$/compare/dealhub-cpq-vs-letterdrop$q$);

-- ── Apollo.io vs DealHub CPQ (apollo-io-vs-dealhub-cpq) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$apollo-io-vs-dealhub-cpq$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '18089863-a0de-4693-8d26-13ead8c01a88', $q$vs DealHub CPQ$q$, $q$/compare/apollo-io-vs-dealhub-cpq$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88' AND href = $q$/compare/apollo-io-vs-dealhub-cpq$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$vs Apollo.io$q$, $q$/compare/apollo-io-vs-dealhub-cpq$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa' AND href = $q$/compare/apollo-io-vs-dealhub-cpq$q$);

-- ── airflow vs Webhook.site (airflow-vs-webhook-site) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$airflow-vs-webhook-site$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$vs Webhook.site$q$, $q$/compare/airflow-vs-webhook-site$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND href = $q$/compare/airflow-vs-webhook-site$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$vs airflow$q$, $q$/compare/airflow-vs-webhook-site$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8' AND href = $q$/compare/airflow-vs-webhook-site$q$);

-- ── Nectar HR vs WorkMotion (nectar-hr-vs-workmotion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bc67bcec-f876-4c54-a194-c179aa6f1b6e', '1a0ac46b-2692-406a-b868-73e8c7b627db', $q$nectar-hr-vs-workmotion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$vs WorkMotion$q$, $q$/compare/nectar-hr-vs-workmotion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bc67bcec-f876-4c54-a194-c179aa6f1b6e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bc67bcec-f876-4c54-a194-c179aa6f1b6e' AND href = $q$/compare/nectar-hr-vs-workmotion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1a0ac46b-2692-406a-b868-73e8c7b627db', $q$vs Nectar HR$q$, $q$/compare/nectar-hr-vs-workmotion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1a0ac46b-2692-406a-b868-73e8c7b627db'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1a0ac46b-2692-406a-b868-73e8c7b627db' AND href = $q$/compare/nectar-hr-vs-workmotion$q$);

-- ── chiefonboarding vs Nectar HR (chiefonboarding-vs-nectar-hr) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('244c73b2-067b-49f8-9f82-b83dd0e0dfce', 'bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$chiefonboarding-vs-nectar-hr$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '244c73b2-067b-49f8-9f82-b83dd0e0dfce', $q$vs Nectar HR$q$, $q$/compare/chiefonboarding-vs-nectar-hr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '244c73b2-067b-49f8-9f82-b83dd0e0dfce'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '244c73b2-067b-49f8-9f82-b83dd0e0dfce' AND href = $q$/compare/chiefonboarding-vs-nectar-hr$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bc67bcec-f876-4c54-a194-c179aa6f1b6e', $q$vs chiefonboarding$q$, $q$/compare/chiefonboarding-vs-nectar-hr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bc67bcec-f876-4c54-a194-c179aa6f1b6e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bc67bcec-f876-4c54-a194-c179aa6f1b6e' AND href = $q$/compare/chiefonboarding-vs-nectar-hr$q$);

-- ── Burp Suite vs openarchiver (burp-suite-vs-openarchiver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$burp-suite-vs-openarchiver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$vs openarchiver$q$, $q$/compare/burp-suite-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '753226c3-cede-4bbb-9fad-9d73dd9827e4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '753226c3-cede-4bbb-9fad-9d73dd9827e4' AND href = $q$/compare/burp-suite-vs-openarchiver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs Burp Suite$q$, $q$/compare/burp-suite-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/burp-suite-vs-openarchiver$q$);

-- ── AdvancedMD vs Doctolib (advancedmd-vs-doctolib) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', 'd3824531-7fee-4eb7-9d43-f3de065cb703', $q$advancedmd-vs-doctolib$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '57bca61a-8bf5-445a-b275-cddca078e066', $q$vs Doctolib$q$, $q$/compare/advancedmd-vs-doctolib$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '57bca61a-8bf5-445a-b275-cddca078e066'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '57bca61a-8bf5-445a-b275-cddca078e066' AND href = $q$/compare/advancedmd-vs-doctolib$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd3824531-7fee-4eb7-9d43-f3de065cb703', $q$vs AdvancedMD$q$, $q$/compare/advancedmd-vs-doctolib$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd3824531-7fee-4eb7-9d43-f3de065cb703'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd3824531-7fee-4eb7-9d43-f3de065cb703' AND href = $q$/compare/advancedmd-vs-doctolib$q$);

-- ── Doctolib vs SimplePractice (doctolib-vs-simplepractice) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', 'c1f93663-fc76-4430-8326-61a4f8cb731a', $q$doctolib-vs-simplepractice$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd3824531-7fee-4eb7-9d43-f3de065cb703', $q$vs SimplePractice$q$, $q$/compare/doctolib-vs-simplepractice$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd3824531-7fee-4eb7-9d43-f3de065cb703'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd3824531-7fee-4eb7-9d43-f3de065cb703' AND href = $q$/compare/doctolib-vs-simplepractice$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c1f93663-fc76-4430-8326-61a4f8cb731a', $q$vs Doctolib$q$, $q$/compare/doctolib-vs-simplepractice$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c1f93663-fc76-4430-8326-61a4f8cb731a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c1f93663-fc76-4430-8326-61a4f8cb731a' AND href = $q$/compare/doctolib-vs-simplepractice$q$);

-- ── Clio vs CloudLex (clio-vs-cloudlex) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4a9597db-c7eb-4543-a969-70c7a5b25c4e', '963e1b92-071f-415e-9b5e-38f557ab5057', $q$clio-vs-cloudlex$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4a9597db-c7eb-4543-a969-70c7a5b25c4e', $q$vs CloudLex$q$, $q$/compare/clio-vs-cloudlex$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e' AND href = $q$/compare/clio-vs-cloudlex$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '963e1b92-071f-415e-9b5e-38f557ab5057', $q$vs Clio$q$, $q$/compare/clio-vs-cloudlex$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057' AND href = $q$/compare/clio-vs-cloudlex$q$);

-- ── AmazingHiring vs Juicebox (amazinghiring-vs-juicebox) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4c209af5-e769-4601-8b16-169d41b98725', '4cc45ff7-31f0-4735-be09-538439350dbc', $q$amazinghiring-vs-juicebox$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4c209af5-e769-4601-8b16-169d41b98725', $q$vs Juicebox$q$, $q$/compare/amazinghiring-vs-juicebox$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4c209af5-e769-4601-8b16-169d41b98725'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4c209af5-e769-4601-8b16-169d41b98725' AND href = $q$/compare/amazinghiring-vs-juicebox$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4cc45ff7-31f0-4735-be09-538439350dbc', $q$vs AmazingHiring$q$, $q$/compare/amazinghiring-vs-juicebox$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4cc45ff7-31f0-4735-be09-538439350dbc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4cc45ff7-31f0-4735-be09-538439350dbc' AND href = $q$/compare/amazinghiring-vs-juicebox$q$);

-- ── Juicebox vs Recruitee (juicebox-vs-recruitee) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4cc45ff7-31f0-4735-be09-538439350dbc', '6b1fba57-cd15-424e-804c-46b51d8f4396', $q$juicebox-vs-recruitee$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4cc45ff7-31f0-4735-be09-538439350dbc', $q$vs Recruitee$q$, $q$/compare/juicebox-vs-recruitee$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4cc45ff7-31f0-4735-be09-538439350dbc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4cc45ff7-31f0-4735-be09-538439350dbc' AND href = $q$/compare/juicebox-vs-recruitee$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6b1fba57-cd15-424e-804c-46b51d8f4396', $q$vs Juicebox$q$, $q$/compare/juicebox-vs-recruitee$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6b1fba57-cd15-424e-804c-46b51d8f4396'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6b1fba57-cd15-424e-804c-46b51d8f4396' AND href = $q$/compare/juicebox-vs-recruitee$q$);

-- ── Corteza CRM vs Kylas (corteza-crm-vs-kylas) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', '75d9ec55-139d-48db-86d9-199f725ad9e3', $q$corteza-crm-vs-kylas$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$vs Kylas$q$, $q$/compare/corteza-crm-vs-kylas$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '016aac11-14a9-4e56-958c-3b361e5b1ef4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '016aac11-14a9-4e56-958c-3b361e5b1ef4' AND href = $q$/compare/corteza-crm-vs-kylas$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '75d9ec55-139d-48db-86d9-199f725ad9e3', $q$vs Corteza CRM$q$, $q$/compare/corteza-crm-vs-kylas$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '75d9ec55-139d-48db-86d9-199f725ad9e3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '75d9ec55-139d-48db-86d9-199f725ad9e3' AND href = $q$/compare/corteza-crm-vs-kylas$q$);

-- ── Corteza CRM vs Salesforce (corteza-crm-vs-salesforce) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3', $q$corteza-crm-vs-salesforce$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$vs Salesforce$q$, $q$/compare/corteza-crm-vs-salesforce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '016aac11-14a9-4e56-958c-3b361e5b1ef4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '016aac11-14a9-4e56-958c-3b361e5b1ef4' AND href = $q$/compare/corteza-crm-vs-salesforce$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3', $q$vs Corteza CRM$q$, $q$/compare/corteza-crm-vs-salesforce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3' AND href = $q$/compare/corteza-crm-vs-salesforce$q$);

-- ── activepieces vs StatusCake (activepieces-vs-statuscake) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$activepieces-vs-statuscake$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs StatusCake$q$, $q$/compare/activepieces-vs-statuscake$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-statuscake$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$vs activepieces$q$, $q$/compare/activepieces-vs-statuscake$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c4af54de-4e6f-4013-b444-8a17c0797dd0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c4af54de-4e6f-4013-b444-8a17c0797dd0' AND href = $q$/compare/activepieces-vs-statuscake$q$);

-- ── matomo vs UXCam (matomo-vs-uxcam) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f83fc3c6-361d-4fca-8f70-695fa0c9ab4f', 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$matomo-vs-uxcam$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f', $q$vs UXCam$q$, $q$/compare/matomo-vs-uxcam$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f' AND href = $q$/compare/matomo-vs-uxcam$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$vs matomo$q$, $q$/compare/matomo-vs-uxcam$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77' AND href = $q$/compare/matomo-vs-uxcam$q$);

-- ── Podia vs Shopware (podia-vs-shopware) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('11aeaa6f-ca3a-4980-80c9-07d68c56564a', '4129c50a-55d6-450e-8940-28027dd14508', $q$podia-vs-shopware$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '11aeaa6f-ca3a-4980-80c9-07d68c56564a', $q$vs Shopware$q$, $q$/compare/podia-vs-shopware$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '11aeaa6f-ca3a-4980-80c9-07d68c56564a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '11aeaa6f-ca3a-4980-80c9-07d68c56564a' AND href = $q$/compare/podia-vs-shopware$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4129c50a-55d6-450e-8940-28027dd14508', $q$vs Podia$q$, $q$/compare/podia-vs-shopware$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508' AND href = $q$/compare/podia-vs-shopware$q$);

-- ── qloapps vs Shopware (qloapps-vs-shopware) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('51ea1f9e-aff0-454a-b76c-ee99eb846f9c', '4129c50a-55d6-450e-8940-28027dd14508', $q$qloapps-vs-shopware$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '51ea1f9e-aff0-454a-b76c-ee99eb846f9c', $q$vs Shopware$q$, $q$/compare/qloapps-vs-shopware$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '51ea1f9e-aff0-454a-b76c-ee99eb846f9c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '51ea1f9e-aff0-454a-b76c-ee99eb846f9c' AND href = $q$/compare/qloapps-vs-shopware$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4129c50a-55d6-450e-8940-28027dd14508', $q$vs qloapps$q$, $q$/compare/qloapps-vs-shopware$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508' AND href = $q$/compare/qloapps-vs-shopware$q$);

-- ── Asana vs Planka (asana-vs-planka) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', 'bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$asana-vs-planka$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$vs Planka$q$, $q$/compare/asana-vs-planka$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a' AND href = $q$/compare/asana-vs-planka$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$vs Asana$q$, $q$/compare/asana-vs-planka$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bfc32b77-2902-4a87-8ab8-27743eb3989b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bfc32b77-2902-4a87-8ab8-27743eb3989b' AND href = $q$/compare/asana-vs-planka$q$);

-- ── Expensify vs Frappe Books (expensify-vs-frappe-books) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('22ab0c21-f5e6-4e9a-919f-4e80fdc79abb', '99b0c7e3-3443-428c-9117-bae2653976d1', $q$expensify-vs-frappe-books$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '22ab0c21-f5e6-4e9a-919f-4e80fdc79abb', $q$vs Frappe Books$q$, $q$/compare/expensify-vs-frappe-books$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '22ab0c21-f5e6-4e9a-919f-4e80fdc79abb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '22ab0c21-f5e6-4e9a-919f-4e80fdc79abb' AND href = $q$/compare/expensify-vs-frappe-books$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '99b0c7e3-3443-428c-9117-bae2653976d1', $q$vs Expensify$q$, $q$/compare/expensify-vs-frappe-books$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '99b0c7e3-3443-428c-9117-bae2653976d1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '99b0c7e3-3443-428c-9117-bae2653976d1' AND href = $q$/compare/expensify-vs-frappe-books$q$);

-- ── Frappe Books vs QuickBooks Online (frappe-books-vs-quickbooks-online) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', '9e200cb1-a048-4c0a-ac15-ece1a517f982', $q$frappe-books-vs-quickbooks-online$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '99b0c7e3-3443-428c-9117-bae2653976d1', $q$vs QuickBooks Online$q$, $q$/compare/frappe-books-vs-quickbooks-online$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '99b0c7e3-3443-428c-9117-bae2653976d1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '99b0c7e3-3443-428c-9117-bae2653976d1' AND href = $q$/compare/frappe-books-vs-quickbooks-online$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9e200cb1-a048-4c0a-ac15-ece1a517f982', $q$vs Frappe Books$q$, $q$/compare/frappe-books-vs-quickbooks-online$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9e200cb1-a048-4c0a-ac15-ece1a517f982'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9e200cb1-a048-4c0a-ac15-ece1a517f982' AND href = $q$/compare/frappe-books-vs-quickbooks-online$q$);

-- ── Billsby vs Kill Bill (billsby-vs-kill-bill) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', '07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$billsby-vs-kill-bill$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$vs Kill Bill$q$, $q$/compare/billsby-vs-kill-bill$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf' AND href = $q$/compare/billsby-vs-kill-bill$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$vs Billsby$q$, $q$/compare/billsby-vs-kill-bill$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '07fb8b20-d497-452b-ab9e-d61603e77eb7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '07fb8b20-d497-452b-ab9e-d61603e77eb7' AND href = $q$/compare/billsby-vs-kill-bill$q$);

-- ── FastSpring vs Kill Bill (fastspring-vs-kill-bill) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', '07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$fastspring-vs-kill-bill$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$vs Kill Bill$q$, $q$/compare/fastspring-vs-kill-bill$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e' AND href = $q$/compare/fastspring-vs-kill-bill$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$vs FastSpring$q$, $q$/compare/fastspring-vs-kill-bill$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '07fb8b20-d497-452b-ab9e-d61603e77eb7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '07fb8b20-d497-452b-ab9e-d61603e77eb7' AND href = $q$/compare/fastspring-vs-kill-bill$q$);

-- ── Latenode vs Process Street (latenode-vs-process-street) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', '14d1d9d1-5e67-4b61-a083-8bace97b6d67', $q$latenode-vs-process-street$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$vs Process Street$q$, $q$/compare/latenode-vs-process-street$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f977f684-1fe1-4506-a3eb-4159d62fd97f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f977f684-1fe1-4506-a3eb-4159d62fd97f' AND href = $q$/compare/latenode-vs-process-street$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '14d1d9d1-5e67-4b61-a083-8bace97b6d67', $q$vs Latenode$q$, $q$/compare/latenode-vs-process-street$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '14d1d9d1-5e67-4b61-a083-8bace97b6d67'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '14d1d9d1-5e67-4b61-a083-8bace97b6d67' AND href = $q$/compare/latenode-vs-process-street$q$);

-- ── Latenode vs Make (latenode-vs-make) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', 'bf487e99-d6ce-4329-b02b-a9efe905e265', $q$latenode-vs-make$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$vs Make$q$, $q$/compare/latenode-vs-make$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f977f684-1fe1-4506-a3eb-4159d62fd97f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f977f684-1fe1-4506-a3eb-4159d62fd97f' AND href = $q$/compare/latenode-vs-make$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bf487e99-d6ce-4329-b02b-a9efe905e265', $q$vs Latenode$q$, $q$/compare/latenode-vs-make$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bf487e99-d6ce-4329-b02b-a9efe905e265'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bf487e99-d6ce-4329-b02b-a9efe905e265' AND href = $q$/compare/latenode-vs-make$q$);

-- ── Axiom vs Huginn (axiom-vs-huginn) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7', $q$axiom-vs-huginn$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '61ccc648-9278-4f3b-87f3-026966a4a47f', $q$vs Huginn$q$, $q$/compare/axiom-vs-huginn$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '61ccc648-9278-4f3b-87f3-026966a4a47f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '61ccc648-9278-4f3b-87f3-026966a4a47f' AND href = $q$/compare/axiom-vs-huginn$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7', $q$vs Axiom$q$, $q$/compare/axiom-vs-huginn$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7' AND href = $q$/compare/axiom-vs-huginn$q$);

-- ── activepieces vs Huginn (activepieces-vs-huginn) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7', $q$activepieces-vs-huginn$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Huginn$q$, $q$/compare/activepieces-vs-huginn$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-huginn$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7', $q$vs activepieces$q$, $q$/compare/activepieces-vs-huginn$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7' AND href = $q$/compare/activepieces-vs-huginn$q$);

-- ── ghost vs withknown (ghost-vs-withknown) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('079eef6a-7551-42f9-8218-0e4c4e82dc10', 'ece3f5b6-3302-4069-a41e-b5e480349b71', $q$ghost-vs-withknown$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '079eef6a-7551-42f9-8218-0e4c4e82dc10', $q$vs withknown$q$, $q$/compare/ghost-vs-withknown$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '079eef6a-7551-42f9-8218-0e4c4e82dc10'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '079eef6a-7551-42f9-8218-0e4c4e82dc10' AND href = $q$/compare/ghost-vs-withknown$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ece3f5b6-3302-4069-a41e-b5e480349b71', $q$vs ghost$q$, $q$/compare/ghost-vs-withknown$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ece3f5b6-3302-4069-a41e-b5e480349b71'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ece3f5b6-3302-4069-a41e-b5e480349b71' AND href = $q$/compare/ghost-vs-withknown$q$);

-- ── Notion vs Taskwarrior (notion-vs-taskwarrior) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', '083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$notion-vs-taskwarrior$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$vs Taskwarrior$q$, $q$/compare/notion-vs-taskwarrior$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871' AND href = $q$/compare/notion-vs-taskwarrior$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$vs Notion$q$, $q$/compare/notion-vs-taskwarrior$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884' AND href = $q$/compare/notion-vs-taskwarrior$q$);

-- ── Notion vs Obsidian (notion-vs-obsidian) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', '45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$notion-vs-obsidian$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$vs Obsidian$q$, $q$/compare/notion-vs-obsidian$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f2cd50a-fcbc-4f86-9f47-5b2d1457d871' AND href = $q$/compare/notion-vs-obsidian$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$vs Notion$q$, $q$/compare/notion-vs-obsidian$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '45916754-f5bf-43e2-98ed-4d4cec40d20c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '45916754-f5bf-43e2-98ed-4d4cec40d20c' AND href = $q$/compare/notion-vs-obsidian$q$);

-- ── alf vs easyappointments (alf-vs-easyappointments) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', '1c4c7eb8-4d91-4764-a260-79baa4f12ad4', $q$alf-vs-easyappointments$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$vs easyappointments$q$, $q$/compare/alf-vs-easyappointments$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '433a3a94-7166-44ad-9b8c-9a9efd28f698'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '433a3a94-7166-44ad-9b8c-9a9efd28f698' AND href = $q$/compare/alf-vs-easyappointments$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1c4c7eb8-4d91-4764-a260-79baa4f12ad4', $q$vs alf$q$, $q$/compare/alf-vs-easyappointments$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1c4c7eb8-4d91-4764-a260-79baa4f12ad4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1c4c7eb8-4d91-4764-a260-79baa4f12ad4' AND href = $q$/compare/alf-vs-easyappointments$q$);

-- ── Documize vs Outline (documize-vs-outline) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3', $q$documize-vs-outline$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dc626839-0d04-4df9-9c03-63658e2f415a', $q$vs Outline$q$, $q$/compare/documize-vs-outline$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dc626839-0d04-4df9-9c03-63658e2f415a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dc626839-0d04-4df9-9c03-63658e2f415a' AND href = $q$/compare/documize-vs-outline$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3', $q$vs Documize$q$, $q$/compare/documize-vs-outline$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3' AND href = $q$/compare/documize-vs-outline$q$);

-- ── archivesspace vs Documize (archivesspace-vs-documize) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', 'dc626839-0d04-4df9-9c03-63658e2f415a', $q$archivesspace-vs-documize$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$vs Documize$q$, $q$/compare/archivesspace-vs-documize$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9fff7050-4742-4d9d-90c3-b117262e1fcf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9fff7050-4742-4d9d-90c3-b117262e1fcf' AND href = $q$/compare/archivesspace-vs-documize$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dc626839-0d04-4df9-9c03-63658e2f415a', $q$vs archivesspace$q$, $q$/compare/archivesspace-vs-documize$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dc626839-0d04-4df9-9c03-63658e2f415a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dc626839-0d04-4df9-9c03-63658e2f415a' AND href = $q$/compare/archivesspace-vs-documize$q$);

-- ── Goldcast vs Restream (goldcast-vs-restream) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', '24fcbb9a-223c-4b44-b8fd-07484fe7b8e4', $q$goldcast-vs-restream$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$vs Restream$q$, $q$/compare/goldcast-vs-restream$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ebccc093-34ed-4258-b26b-8a95b2400c1e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ebccc093-34ed-4258-b26b-8a95b2400c1e' AND href = $q$/compare/goldcast-vs-restream$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '24fcbb9a-223c-4b44-b8fd-07484fe7b8e4', $q$vs Goldcast$q$, $q$/compare/goldcast-vs-restream$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '24fcbb9a-223c-4b44-b8fd-07484fe7b8e4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '24fcbb9a-223c-4b44-b8fd-07484fe7b8e4' AND href = $q$/compare/goldcast-vs-restream$q$);

-- ── Goldcast vs GoTo Meeting (goldcast-vs-goto-meeting) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', 'c6868389-8d0e-4fab-b74c-b58f1badba46', $q$goldcast-vs-goto-meeting$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$vs GoTo Meeting$q$, $q$/compare/goldcast-vs-goto-meeting$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ebccc093-34ed-4258-b26b-8a95b2400c1e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ebccc093-34ed-4258-b26b-8a95b2400c1e' AND href = $q$/compare/goldcast-vs-goto-meeting$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6868389-8d0e-4fab-b74c-b58f1badba46', $q$vs Goldcast$q$, $q$/compare/goldcast-vs-goto-meeting$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6868389-8d0e-4fab-b74c-b58f1badba46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6868389-8d0e-4fab-b74c-b58f1badba46' AND href = $q$/compare/goldcast-vs-goto-meeting$q$);

-- ── Bravo Studio vs NocoDB (bravo-studio-vs-nocodb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', '8e0b83b6-71ce-4357-81d5-6f9274821112', $q$bravo-studio-vs-nocodb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2a22cd72-a223-425f-872a-827407f67bb9', $q$vs NocoDB$q$, $q$/compare/bravo-studio-vs-nocodb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2a22cd72-a223-425f-872a-827407f67bb9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2a22cd72-a223-425f-872a-827407f67bb9' AND href = $q$/compare/bravo-studio-vs-nocodb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8e0b83b6-71ce-4357-81d5-6f9274821112', $q$vs Bravo Studio$q$, $q$/compare/bravo-studio-vs-nocodb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8e0b83b6-71ce-4357-81d5-6f9274821112'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8e0b83b6-71ce-4357-81d5-6f9274821112' AND href = $q$/compare/bravo-studio-vs-nocodb$q$);

-- ── Bubble vs NocoDB (bubble-vs-nocodb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('cdbd18ff-a281-4cb1-87dc-90ab666683fe', '8e0b83b6-71ce-4357-81d5-6f9274821112', $q$bubble-vs-nocodb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cdbd18ff-a281-4cb1-87dc-90ab666683fe', $q$vs NocoDB$q$, $q$/compare/bubble-vs-nocodb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cdbd18ff-a281-4cb1-87dc-90ab666683fe'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cdbd18ff-a281-4cb1-87dc-90ab666683fe' AND href = $q$/compare/bubble-vs-nocodb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8e0b83b6-71ce-4357-81d5-6f9274821112', $q$vs Bubble$q$, $q$/compare/bubble-vs-nocodb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8e0b83b6-71ce-4357-81d5-6f9274821112'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8e0b83b6-71ce-4357-81d5-6f9274821112' AND href = $q$/compare/bubble-vs-nocodb$q$);

-- ── Hygraph vs Statamic (hygraph-vs-statamic) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b211eaab-26f2-46f7-b63b-6470f8655fa2', 'f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$hygraph-vs-statamic$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b211eaab-26f2-46f7-b63b-6470f8655fa2', $q$vs Statamic$q$, $q$/compare/hygraph-vs-statamic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b211eaab-26f2-46f7-b63b-6470f8655fa2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b211eaab-26f2-46f7-b63b-6470f8655fa2' AND href = $q$/compare/hygraph-vs-statamic$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$vs Hygraph$q$, $q$/compare/hygraph-vs-statamic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f9925de6-28c3-40f9-a148-3dd0616aa66f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f9925de6-28c3-40f9-a148-3dd0616aa66f' AND href = $q$/compare/hygraph-vs-statamic$q$);

-- ── Statamic vs Substack (statamic-vs-substack) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', '3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$statamic-vs-substack$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$vs Substack$q$, $q$/compare/statamic-vs-substack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f9925de6-28c3-40f9-a148-3dd0616aa66f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f9925de6-28c3-40f9-a148-3dd0616aa66f' AND href = $q$/compare/statamic-vs-substack$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$vs Statamic$q$, $q$/compare/statamic-vs-substack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2' AND href = $q$/compare/statamic-vs-substack$q$);

-- ── KeystoneJS vs Substack (keystonejs-vs-substack) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', '3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$keystonejs-vs-substack$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$vs Substack$q$, $q$/compare/keystonejs-vs-substack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff' AND href = $q$/compare/keystonejs-vs-substack$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$vs KeystoneJS$q$, $q$/compare/keystonejs-vs-substack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2' AND href = $q$/compare/keystonejs-vs-substack$q$);

-- ── Publii vs Substack (publii-vs-substack) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', '3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$publii-vs-substack$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$vs Substack$q$, $q$/compare/publii-vs-substack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aef99ec6-cc74-4f51-80a7-2b4686dc1465'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aef99ec6-cc74-4f51-80a7-2b4686dc1465' AND href = $q$/compare/publii-vs-substack$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$vs Publii$q$, $q$/compare/publii-vs-substack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2' AND href = $q$/compare/publii-vs-substack$q$);

-- ── Lexion vs TrustArc (lexion-vs-trustarc) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', '9a7a119c-cb78-4261-9173-2f602bd0dde1', $q$lexion-vs-trustarc$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dcb87420-fbd7-430c-9df6-534d57e84b61', $q$vs TrustArc$q$, $q$/compare/lexion-vs-trustarc$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dcb87420-fbd7-430c-9df6-534d57e84b61'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dcb87420-fbd7-430c-9df6-534d57e84b61' AND href = $q$/compare/lexion-vs-trustarc$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9a7a119c-cb78-4261-9173-2f602bd0dde1', $q$vs Lexion$q$, $q$/compare/lexion-vs-trustarc$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9a7a119c-cb78-4261-9173-2f602bd0dde1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9a7a119c-cb78-4261-9173-2f602bd0dde1' AND href = $q$/compare/lexion-vs-trustarc$q$);

-- ── Clio vs Lexion (clio-vs-lexion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4a9597db-c7eb-4543-a969-70c7a5b25c4e', 'dcb87420-fbd7-430c-9df6-534d57e84b61', $q$clio-vs-lexion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4a9597db-c7eb-4543-a969-70c7a5b25c4e', $q$vs Lexion$q$, $q$/compare/clio-vs-lexion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e' AND href = $q$/compare/clio-vs-lexion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dcb87420-fbd7-430c-9df6-534d57e84b61', $q$vs Clio$q$, $q$/compare/clio-vs-lexion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dcb87420-fbd7-430c-9df6-534d57e84b61'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dcb87420-fbd7-430c-9df6-534d57e84b61' AND href = $q$/compare/clio-vs-lexion$q$);

-- ── activepieces vs OneDev (activepieces-vs-onedev) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$activepieces-vs-onedev$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs OneDev$q$, $q$/compare/activepieces-vs-onedev$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-onedev$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$vs activepieces$q$, $q$/compare/activepieces-vs-onedev$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5' AND href = $q$/compare/activepieces-vs-onedev$q$);

-- ── activepieces vs stackstorm (activepieces-vs-stackstorm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$activepieces-vs-stackstorm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs stackstorm$q$, $q$/compare/activepieces-vs-stackstorm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-stackstorm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$vs activepieces$q$, $q$/compare/activepieces-vs-stackstorm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7' AND href = $q$/compare/activepieces-vs-stackstorm$q$);

-- ── dittofeed vs Listmonk (dittofeed-vs-listmonk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c39707a3-e756-48c8-929c-f10fe278ae92', '84142957-2683-4f6e-9088-2169508d193b', $q$dittofeed-vs-listmonk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c39707a3-e756-48c8-929c-f10fe278ae92', $q$vs Listmonk$q$, $q$/compare/dittofeed-vs-listmonk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c39707a3-e756-48c8-929c-f10fe278ae92'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c39707a3-e756-48c8-929c-f10fe278ae92' AND href = $q$/compare/dittofeed-vs-listmonk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '84142957-2683-4f6e-9088-2169508d193b', $q$vs dittofeed$q$, $q$/compare/dittofeed-vs-listmonk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '84142957-2683-4f6e-9088-2169508d193b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '84142957-2683-4f6e-9088-2169508d193b' AND href = $q$/compare/dittofeed-vs-listmonk$q$);

-- ── dittofeed vs Mautic (dittofeed-vs-mautic) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c39707a3-e756-48c8-929c-f10fe278ae92', '780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$dittofeed-vs-mautic$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c39707a3-e756-48c8-929c-f10fe278ae92', $q$vs Mautic$q$, $q$/compare/dittofeed-vs-mautic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c39707a3-e756-48c8-929c-f10fe278ae92'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c39707a3-e756-48c8-929c-f10fe278ae92' AND href = $q$/compare/dittofeed-vs-mautic$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$vs dittofeed$q$, $q$/compare/dittofeed-vs-mautic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '780f67bf-33b3-43f7-9cf1-e78a31b9f50f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '780f67bf-33b3-43f7-9cf1-e78a31b9f50f' AND href = $q$/compare/dittofeed-vs-mautic$q$);

-- ── GrowthBar vs Local Falcon (growthbar-vs-local-falcon) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e7ffaae8-d151-4f81-9afa-a3539c05ff4f', 'f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$growthbar-vs-local-falcon$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f', $q$vs Local Falcon$q$, $q$/compare/growthbar-vs-local-falcon$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f' AND href = $q$/compare/growthbar-vs-local-falcon$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$vs GrowthBar$q$, $q$/compare/growthbar-vs-local-falcon$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f3bfd847-c715-4e81-938c-aaa0b4445e79'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f3bfd847-c715-4e81-938c-aaa0b4445e79' AND href = $q$/compare/growthbar-vs-local-falcon$q$);

-- ── Local Falcon vs VybeFind (local-falcon-vs-vybefind-connector) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', '5043fbf8-77be-4672-94ea-22de9a4dbb5d', $q$local-falcon-vs-vybefind-connector$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$vs VybeFind$q$, $q$/compare/local-falcon-vs-vybefind-connector$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f3bfd847-c715-4e81-938c-aaa0b4445e79'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f3bfd847-c715-4e81-938c-aaa0b4445e79' AND href = $q$/compare/local-falcon-vs-vybefind-connector$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5043fbf8-77be-4672-94ea-22de9a4dbb5d', $q$vs Local Falcon$q$, $q$/compare/local-falcon-vs-vybefind-connector$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5043fbf8-77be-4672-94ea-22de9a4dbb5d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5043fbf8-77be-4672-94ea-22de9a4dbb5d' AND href = $q$/compare/local-falcon-vs-vybefind-connector$q$);

-- ── chiefonboarding vs Horilla (chiefonboarding-vs-horilla) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('244c73b2-067b-49f8-9f82-b83dd0e0dfce', '6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$chiefonboarding-vs-horilla$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '244c73b2-067b-49f8-9f82-b83dd0e0dfce', $q$vs Horilla$q$, $q$/compare/chiefonboarding-vs-horilla$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '244c73b2-067b-49f8-9f82-b83dd0e0dfce'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '244c73b2-067b-49f8-9f82-b83dd0e0dfce' AND href = $q$/compare/chiefonboarding-vs-horilla$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$vs chiefonboarding$q$, $q$/compare/chiefonboarding-vs-horilla$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6c4d248e-ed75-425f-a74f-2cfa5f36dc03'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6c4d248e-ed75-425f-a74f-2cfa5f36dc03' AND href = $q$/compare/chiefonboarding-vs-horilla$q$);

-- ── Boundary vs openarchiver (boundary-vs-openarchiver) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$boundary-vs-openarchiver$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$vs openarchiver$q$, $q$/compare/boundary-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'af04c60a-0edd-428f-9f5c-f88f9ad98f64'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'af04c60a-0edd-428f-9f5c-f88f9ad98f64' AND href = $q$/compare/boundary-vs-openarchiver$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$vs Boundary$q$, $q$/compare/boundary-vs-openarchiver$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eb3daa84-88c9-499e-95e5-0b30eb01de90' AND href = $q$/compare/boundary-vs-openarchiver$q$);

-- ── OpenProject vs Planview (openproject-vs-planview) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7c81a24e-2f8d-479b-aeeb-638429dd55ec', '8c9f13c9-cf6c-446e-bb2f-8847796544ec', $q$openproject-vs-planview$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$vs Planview$q$, $q$/compare/openproject-vs-planview$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7c81a24e-2f8d-479b-aeeb-638429dd55ec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7c81a24e-2f8d-479b-aeeb-638429dd55ec' AND href = $q$/compare/openproject-vs-planview$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8c9f13c9-cf6c-446e-bb2f-8847796544ec', $q$vs OpenProject$q$, $q$/compare/openproject-vs-planview$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8c9f13c9-cf6c-446e-bb2f-8847796544ec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8c9f13c9-cf6c-446e-bb2f-8847796544ec' AND href = $q$/compare/openproject-vs-planview$q$);

-- ── Asana vs OpenProject (asana-vs-openproject) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', '7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$asana-vs-openproject$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$vs OpenProject$q$, $q$/compare/asana-vs-openproject$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a' AND href = $q$/compare/asana-vs-openproject$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7c81a24e-2f8d-479b-aeeb-638429dd55ec', $q$vs Asana$q$, $q$/compare/asana-vs-openproject$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7c81a24e-2f8d-479b-aeeb-638429dd55ec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7c81a24e-2f8d-479b-aeeb-638429dd55ec' AND href = $q$/compare/asana-vs-openproject$q$);

-- ── FreeScout vs ServiceNow (freescout-vs-servicenow) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', 'dba954e7-42de-4597-adda-d2b1563a9303', $q$freescout-vs-servicenow$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd4008e96-5007-46e7-98c7-0f90f45c63fa', $q$vs ServiceNow$q$, $q$/compare/freescout-vs-servicenow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd4008e96-5007-46e7-98c7-0f90f45c63fa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd4008e96-5007-46e7-98c7-0f90f45c63fa' AND href = $q$/compare/freescout-vs-servicenow$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dba954e7-42de-4597-adda-d2b1563a9303', $q$vs FreeScout$q$, $q$/compare/freescout-vs-servicenow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dba954e7-42de-4597-adda-d2b1563a9303'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dba954e7-42de-4597-adda-d2b1563a9303' AND href = $q$/compare/freescout-vs-servicenow$q$);

-- ── Alteryx vs Redash (alteryx-vs-redash) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', 'b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$alteryx-vs-redash$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$vs Redash$q$, $q$/compare/alteryx-vs-redash$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09' AND href = $q$/compare/alteryx-vs-redash$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$vs Alteryx$q$, $q$/compare/alteryx-vs-redash$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b4fe35bb-b786-4c89-83e9-c43385bfe93b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b4fe35bb-b786-4c89-83e9-c43385bfe93b' AND href = $q$/compare/alteryx-vs-redash$q$);

-- ── Microsoft Power BI vs Redash (microsoft-power-bi-vs-redash) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1ae91efd-338e-4ef0-9f0b-3f2a51548062', 'b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$microsoft-power-bi-vs-redash$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1ae91efd-338e-4ef0-9f0b-3f2a51548062', $q$vs Redash$q$, $q$/compare/microsoft-power-bi-vs-redash$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1ae91efd-338e-4ef0-9f0b-3f2a51548062'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1ae91efd-338e-4ef0-9f0b-3f2a51548062' AND href = $q$/compare/microsoft-power-bi-vs-redash$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$vs Microsoft Power BI$q$, $q$/compare/microsoft-power-bi-vs-redash$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b4fe35bb-b786-4c89-83e9-c43385bfe93b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b4fe35bb-b786-4c89-83e9-c43385bfe93b' AND href = $q$/compare/microsoft-power-bi-vs-redash$q$);

-- ── Make vs RudderStack (make-vs-rudderstack) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bf487e99-d6ce-4329-b02b-a9efe905e265', 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$make-vs-rudderstack$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bf487e99-d6ce-4329-b02b-a9efe905e265', $q$vs RudderStack$q$, $q$/compare/make-vs-rudderstack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bf487e99-d6ce-4329-b02b-a9efe905e265'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bf487e99-d6ce-4329-b02b-a9efe905e265' AND href = $q$/compare/make-vs-rudderstack$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$vs Make$q$, $q$/compare/make-vs-rudderstack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20' AND href = $q$/compare/make-vs-rudderstack$q$);

-- ── Make vs StreamSets (make-vs-streamsets) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bf487e99-d6ce-4329-b02b-a9efe905e265', 'af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$make-vs-streamsets$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bf487e99-d6ce-4329-b02b-a9efe905e265', $q$vs StreamSets$q$, $q$/compare/make-vs-streamsets$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bf487e99-d6ce-4329-b02b-a9efe905e265'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bf487e99-d6ce-4329-b02b-a9efe905e265' AND href = $q$/compare/make-vs-streamsets$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$vs Make$q$, $q$/compare/make-vs-streamsets$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'af41f8fc-b90f-4d77-80ef-840d3baf8120'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'af41f8fc-b90f-4d77-80ef-840d3baf8120' AND href = $q$/compare/make-vs-streamsets$q$);

-- ── Documenso vs Dropbox Sign (documenso-vs-dropbox-sign) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', 'd81fd94a-547f-4b52-8585-6375a6414c6d', $q$documenso-vs-dropbox-sign$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4da77cfa-32ce-403c-8b98-4e1620167573', $q$vs Dropbox Sign$q$, $q$/compare/documenso-vs-dropbox-sign$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4da77cfa-32ce-403c-8b98-4e1620167573'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4da77cfa-32ce-403c-8b98-4e1620167573' AND href = $q$/compare/documenso-vs-dropbox-sign$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd81fd94a-547f-4b52-8585-6375a6414c6d', $q$vs Documenso$q$, $q$/compare/documenso-vs-dropbox-sign$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd81fd94a-547f-4b52-8585-6375a6414c6d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd81fd94a-547f-4b52-8585-6375a6414c6d' AND href = $q$/compare/documenso-vs-dropbox-sign$q$);

-- ── Odoo Point of Sale vs SevenRooms (odoo-point-of-sale-vs-sevenrooms) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('35eab88b-4ba3-4039-82ea-b4ff8bda85b1', '2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$odoo-point-of-sale-vs-sevenrooms$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '35eab88b-4ba3-4039-82ea-b4ff8bda85b1', $q$vs SevenRooms$q$, $q$/compare/odoo-point-of-sale-vs-sevenrooms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '35eab88b-4ba3-4039-82ea-b4ff8bda85b1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '35eab88b-4ba3-4039-82ea-b4ff8bda85b1' AND href = $q$/compare/odoo-point-of-sale-vs-sevenrooms$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$vs Odoo Point of Sale$q$, $q$/compare/odoo-point-of-sale-vs-sevenrooms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2d77d287-461d-4b2b-b185-9fa78b3a2e55'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2d77d287-461d-4b2b-b185-9fa78b3a2e55' AND href = $q$/compare/odoo-point-of-sale-vs-sevenrooms$q$);

-- ── SevenRooms vs Toast (sevenrooms-vs-toast) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', 'cd25a08d-37be-447e-ac4c-280238739e44', $q$sevenrooms-vs-toast$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$vs Toast$q$, $q$/compare/sevenrooms-vs-toast$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2d77d287-461d-4b2b-b185-9fa78b3a2e55'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2d77d287-461d-4b2b-b185-9fa78b3a2e55' AND href = $q$/compare/sevenrooms-vs-toast$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cd25a08d-37be-447e-ac4c-280238739e44', $q$vs SevenRooms$q$, $q$/compare/sevenrooms-vs-toast$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cd25a08d-37be-447e-ac4c-280238739e44'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cd25a08d-37be-447e-ac4c-280238739e44' AND href = $q$/compare/sevenrooms-vs-toast$q$);

-- ── Jitter vs SquadCast (jitter-vs-squadcast) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', '3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$jitter-vs-squadcast$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '78d1d55e-3d44-4509-a118-9b5206efa57a', $q$vs SquadCast$q$, $q$/compare/jitter-vs-squadcast$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '78d1d55e-3d44-4509-a118-9b5206efa57a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '78d1d55e-3d44-4509-a118-9b5206efa57a' AND href = $q$/compare/jitter-vs-squadcast$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$vs Jitter$q$, $q$/compare/jitter-vs-squadcast$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f' AND href = $q$/compare/jitter-vs-squadcast$q$);

-- ── Final Cut Pro vs SquadCast (final-cut-pro-vs-squadcast) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c90dc5e6-33dc-4dc9-a0be-2c6675db08aa', '3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$final-cut-pro-vs-squadcast$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa', $q$vs SquadCast$q$, $q$/compare/final-cut-pro-vs-squadcast$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa' AND href = $q$/compare/final-cut-pro-vs-squadcast$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$vs Final Cut Pro$q$, $q$/compare/final-cut-pro-vs-squadcast$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f' AND href = $q$/compare/final-cut-pro-vs-squadcast$q$);

-- ── Dify vs Stack AI (dify-vs-stack-ai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', '24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$dify-vs-stack-ai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd515660a-2710-4138-a906-19ab0c3f0a81', $q$vs Stack AI$q$, $q$/compare/dify-vs-stack-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd515660a-2710-4138-a906-19ab0c3f0a81'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd515660a-2710-4138-a906-19ab0c3f0a81' AND href = $q$/compare/dify-vs-stack-ai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$vs Dify$q$, $q$/compare/dify-vs-stack-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c' AND href = $q$/compare/dify-vs-stack-ai$q$);

-- ── Dify vs Glean (dify-vs-glean) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', 'b17dc713-2772-438d-a1a1-bbb8b11b6afc', $q$dify-vs-glean$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd515660a-2710-4138-a906-19ab0c3f0a81', $q$vs Glean$q$, $q$/compare/dify-vs-glean$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd515660a-2710-4138-a906-19ab0c3f0a81'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd515660a-2710-4138-a906-19ab0c3f0a81' AND href = $q$/compare/dify-vs-glean$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b17dc713-2772-438d-a1a1-bbb8b11b6afc', $q$vs Dify$q$, $q$/compare/dify-vs-glean$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b17dc713-2772-438d-a1a1-bbb8b11b6afc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b17dc713-2772-438d-a1a1-bbb8b11b6afc' AND href = $q$/compare/dify-vs-glean$q$);

-- ── Coolify vs Stormkit (coolify-vs-stormkit) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', '8b67fa90-7a4e-4cd5-aaaf-5828ca0f9a2a', $q$coolify-vs-stormkit$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '005bfac7-53dd-49b7-9c17-ef452a208620', $q$vs Stormkit$q$, $q$/compare/coolify-vs-stormkit$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '005bfac7-53dd-49b7-9c17-ef452a208620'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '005bfac7-53dd-49b7-9c17-ef452a208620' AND href = $q$/compare/coolify-vs-stormkit$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8b67fa90-7a4e-4cd5-aaaf-5828ca0f9a2a', $q$vs Coolify$q$, $q$/compare/coolify-vs-stormkit$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8b67fa90-7a4e-4cd5-aaaf-5828ca0f9a2a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8b67fa90-7a4e-4cd5-aaaf-5828ca0f9a2a' AND href = $q$/compare/coolify-vs-stormkit$q$);

-- ── Coolify vs Fly.io (coolify-vs-fly-io) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', '11db7b95-8347-45df-a13b-c3e8b6ea53f7', $q$coolify-vs-fly-io$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '005bfac7-53dd-49b7-9c17-ef452a208620', $q$vs Fly.io$q$, $q$/compare/coolify-vs-fly-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '005bfac7-53dd-49b7-9c17-ef452a208620'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '005bfac7-53dd-49b7-9c17-ef452a208620' AND href = $q$/compare/coolify-vs-fly-io$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '11db7b95-8347-45df-a13b-c3e8b6ea53f7', $q$vs Coolify$q$, $q$/compare/coolify-vs-fly-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '11db7b95-8347-45df-a13b-c3e8b6ea53f7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '11db7b95-8347-45df-a13b-c3e8b6ea53f7' AND href = $q$/compare/coolify-vs-fly-io$q$);

-- ── activepieces vs Nagios (activepieces-vs-nagios) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '6fe712b1-9844-4be1-8956-48e550068b64', $q$activepieces-vs-nagios$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Nagios$q$, $q$/compare/activepieces-vs-nagios$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-nagios$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6fe712b1-9844-4be1-8956-48e550068b64', $q$vs activepieces$q$, $q$/compare/activepieces-vs-nagios$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6fe712b1-9844-4be1-8956-48e550068b64'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6fe712b1-9844-4be1-8956-48e550068b64' AND href = $q$/compare/activepieces-vs-nagios$q$);

-- ── activepieces vs Jaeger (activepieces-vs-jaeger) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '117d354d-ba1d-4901-852d-f37b6680c972', $q$activepieces-vs-jaeger$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$vs Jaeger$q$, $q$/compare/activepieces-vs-jaeger$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND href = $q$/compare/activepieces-vs-jaeger$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '117d354d-ba1d-4901-852d-f37b6680c972', $q$vs activepieces$q$, $q$/compare/activepieces-vs-jaeger$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '117d354d-ba1d-4901-852d-f37b6680c972'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '117d354d-ba1d-4901-852d-f37b6680c972' AND href = $q$/compare/activepieces-vs-jaeger$q$);

-- ── airflow vs Flagsmith (airflow-vs-flagsmith) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', '019204fd-182f-40f5-9827-49ed1e395308', $q$airflow-vs-flagsmith$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$vs Flagsmith$q$, $q$/compare/airflow-vs-flagsmith$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e1a3b50-0d7b-473f-98ec-f11907a0a5a9' AND href = $q$/compare/airflow-vs-flagsmith$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '019204fd-182f-40f5-9827-49ed1e395308', $q$vs airflow$q$, $q$/compare/airflow-vs-flagsmith$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '019204fd-182f-40f5-9827-49ed1e395308'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '019204fd-182f-40f5-9827-49ed1e395308' AND href = $q$/compare/airflow-vs-flagsmith$q$);

-- ── MariaDB vs Turso (mariadb-vs-turso) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', '8f8c6456-68f6-4f02-bd51-cf48403d7a42', $q$mariadb-vs-turso$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$vs Turso$q$, $q$/compare/mariadb-vs-turso$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b06d1d19-b0b8-4c54-894b-14a56a483e6c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b06d1d19-b0b8-4c54-894b-14a56a483e6c' AND href = $q$/compare/mariadb-vs-turso$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8f8c6456-68f6-4f02-bd51-cf48403d7a42', $q$vs MariaDB$q$, $q$/compare/mariadb-vs-turso$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8f8c6456-68f6-4f02-bd51-cf48403d7a42'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8f8c6456-68f6-4f02-bd51-cf48403d7a42' AND href = $q$/compare/mariadb-vs-turso$q$);

-- ── ckan vs MariaDB (ckan-vs-mariadb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e8f32075-0ef5-42f6-8b94-a8c3c8544c46', 'b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$ckan-vs-mariadb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e8f32075-0ef5-42f6-8b94-a8c3c8544c46', $q$vs MariaDB$q$, $q$/compare/ckan-vs-mariadb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e8f32075-0ef5-42f6-8b94-a8c3c8544c46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e8f32075-0ef5-42f6-8b94-a8c3c8544c46' AND href = $q$/compare/ckan-vs-mariadb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$vs ckan$q$, $q$/compare/ckan-vs-mariadb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b06d1d19-b0b8-4c54-894b-14a56a483e6c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b06d1d19-b0b8-4c54-894b-14a56a483e6c' AND href = $q$/compare/ckan-vs-mariadb$q$);

-- ── ckan vs OpenSearch (ckan-vs-opensearch) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e8f32075-0ef5-42f6-8b94-a8c3c8544c46', '897517f2-e813-44cf-9a91-5b3befd56d44', $q$ckan-vs-opensearch$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e8f32075-0ef5-42f6-8b94-a8c3c8544c46', $q$vs OpenSearch$q$, $q$/compare/ckan-vs-opensearch$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e8f32075-0ef5-42f6-8b94-a8c3c8544c46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e8f32075-0ef5-42f6-8b94-a8c3c8544c46' AND href = $q$/compare/ckan-vs-opensearch$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '897517f2-e813-44cf-9a91-5b3befd56d44', $q$vs ckan$q$, $q$/compare/ckan-vs-opensearch$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '897517f2-e813-44cf-9a91-5b3befd56d44'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '897517f2-e813-44cf-9a91-5b3befd56d44' AND href = $q$/compare/ckan-vs-opensearch$q$);

-- ── Chroma vs ckan (chroma-vs-ckan) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', 'e8f32075-0ef5-42f6-8b94-a8c3c8544c46', $q$chroma-vs-ckan$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$vs ckan$q$, $q$/compare/chroma-vs-ckan$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cd5a43d0-6c12-4d8c-95e4-dbcf7e682046'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cd5a43d0-6c12-4d8c-95e4-dbcf7e682046' AND href = $q$/compare/chroma-vs-ckan$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e8f32075-0ef5-42f6-8b94-a8c3c8544c46', $q$vs Chroma$q$, $q$/compare/chroma-vs-ckan$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e8f32075-0ef5-42f6-8b94-a8c3c8544c46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e8f32075-0ef5-42f6-8b94-a8c3c8544c46' AND href = $q$/compare/chroma-vs-ckan$q$);

-- ── goatcounter vs matomo (goatcounter-vs-matomo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a134f9f9-ee6d-4f7d-9d03-413bbcf4e3ec', 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f', $q$goatcounter-vs-matomo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a134f9f9-ee6d-4f7d-9d03-413bbcf4e3ec', $q$vs matomo$q$, $q$/compare/goatcounter-vs-matomo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a134f9f9-ee6d-4f7d-9d03-413bbcf4e3ec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a134f9f9-ee6d-4f7d-9d03-413bbcf4e3ec' AND href = $q$/compare/goatcounter-vs-matomo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f', $q$vs goatcounter$q$, $q$/compare/goatcounter-vs-matomo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f83fc3c6-361d-4fca-8f70-695fa0c9ab4f' AND href = $q$/compare/goatcounter-vs-matomo$q$);

-- ── Kong vs SQD (kong-vs-sqd) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', '4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$kong-vs-sqd$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$vs SQD$q$, $q$/compare/kong-vs-sqd$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '739a3d06-32a8-47ca-88cb-0b897c628ff9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '739a3d06-32a8-47ca-88cb-0b897c628ff9' AND href = $q$/compare/kong-vs-sqd$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$vs Kong$q$, $q$/compare/kong-vs-sqd$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425' AND href = $q$/compare/kong-vs-sqd$q$);


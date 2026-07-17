-- Comparison batch: baserow-vs-grist, grist-vs-seatable, seatable-vs-teable, mathesar-vs-teable, craft-cms-vs-statamic, craft-cms-vs-grav, grav-vs-october-cms, october-cms-vs-processwire, concrete-cms-vs-processwire, concrete-cms-vs-typo3, typo3-vs-umbraco, backdrop-cms-vs-umbraco, backdrop-cms-vs-silverstripe-cms, keystonejs-vs-silverstripe-cms, keystonejs-vs-tinacms, cockpit-cms-vs-tinacms, cockpit-cms-vs-publii, micro-blog-vs-publii, blot-vs-micro-blog, bear-blog-vs-blot, autumn-vs-hyperline, cliniko-vs-jane-app, cliniko-vs-healthie, healthie-vs-practice-better, ohmd-vs-practice-better, ohmd-vs-weave, cosmolex-vs-litify, cosmolex-vs-timesolv, actionstep-vs-timesolv, actionstep-vs-everlaw, everlaw-vs-relativityone, relativityone-vs-reveal, dover-vs-recruiterflow, dover-vs-metaview, metaview-vs-paraform, hireez-vs-paraform, aha-vs-productboard, craft-io-vs-productboard, craft-io-vs-productplan, productplan-vs-savio, frill-vs-savio, frill-vs-upvoty, featurebase-vs-upvoty, marqii-vs-uberall, chromatic-vs-testingbot, leapsome-vs-orgvue, falco-vs-scalekit, hireez-vs-recruit-crm, benepass-vs-leapsome, clair-vs-falco, authentik-vs-clair, authentik-vs-supertokens, automatisch-vs-huginn, hyperdx-vs-oh-dear, affine-vs-obsidian, gitbook-vs-hedgedoc, dolibarr-vs-idempiere, pretalx-vs-webinarjam, bettermode-vs-nodebb, node-red-vs-rudderstack, pabau-vs-weave, juro-vs-lexion, reveal-vs-spellbook, featurebase-vs-prodpad, birdeye-vs-marqii, order-co-vs-tradogram, captivate-vs-rss-com, statuscake-vs-thanos, beeceptor-vs-chromatic, contentsquare-vs-lucky-orange, benepass-vs-orangehrm, nuclei-vs-supertokens, findem-vs-recruit-crm, cloudlex-vs-robin-ai, harness-vs-onedev, coralogix-vs-oh-dear, coralogix-vs-honeycomb, honeycomb-vs-uptrace, beeceptor-vs-readme, readme-vs-vitepress
-- Publishes 80 comparison page(s) with editorial content.

-- ── Baserow vs Grist (baserow-vs-grist) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', 'b0a59332-e7cb-4428-afe9-3934017982dd', $q$baserow-vs-grist$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$vs Grist$q$, $q$/compare/baserow-vs-grist$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8a277ff8-0957-4069-9f79-4ef1be818b6e' AND href = $q$/compare/baserow-vs-grist$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b0a59332-e7cb-4428-afe9-3934017982dd', $q$vs Baserow$q$, $q$/compare/baserow-vs-grist$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b0a59332-e7cb-4428-afe9-3934017982dd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b0a59332-e7cb-4428-afe9-3934017982dd' AND href = $q$/compare/baserow-vs-grist$q$);

-- ── Grist vs SeaTable (grist-vs-seatable) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', '0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$grist-vs-seatable$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b0a59332-e7cb-4428-afe9-3934017982dd', $q$vs SeaTable$q$, $q$/compare/grist-vs-seatable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b0a59332-e7cb-4428-afe9-3934017982dd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b0a59332-e7cb-4428-afe9-3934017982dd' AND href = $q$/compare/grist-vs-seatable$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$vs Grist$q$, $q$/compare/grist-vs-seatable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0909fefb-ee91-4a8f-972b-d6cce78f8b1e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0909fefb-ee91-4a8f-972b-d6cce78f8b1e' AND href = $q$/compare/grist-vs-seatable$q$);

-- ── SeaTable vs Teable (seatable-vs-teable) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$seatable-vs-teable$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$vs Teable$q$, $q$/compare/seatable-vs-teable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0909fefb-ee91-4a8f-972b-d6cce78f8b1e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0909fefb-ee91-4a8f-972b-d6cce78f8b1e' AND href = $q$/compare/seatable-vs-teable$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$vs SeaTable$q$, $q$/compare/seatable-vs-teable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f' AND href = $q$/compare/seatable-vs-teable$q$);

-- ── Mathesar vs Teable (mathesar-vs-teable) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$mathesar-vs-teable$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$vs Teable$q$, $q$/compare/mathesar-vs-teable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b425d59b-1c35-4d02-b5ba-62b13f0c3db7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b425d59b-1c35-4d02-b5ba-62b13f0c3db7' AND href = $q$/compare/mathesar-vs-teable$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$vs Mathesar$q$, $q$/compare/mathesar-vs-teable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f' AND href = $q$/compare/mathesar-vs-teable$q$);

-- ── Craft CMS vs Statamic (craft-cms-vs-statamic) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', 'f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$craft-cms-vs-statamic$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '35e4bc85-6298-43d3-bc27-0854ea063792', $q$vs Statamic$q$, $q$/compare/craft-cms-vs-statamic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '35e4bc85-6298-43d3-bc27-0854ea063792'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '35e4bc85-6298-43d3-bc27-0854ea063792' AND href = $q$/compare/craft-cms-vs-statamic$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$vs Craft CMS$q$, $q$/compare/craft-cms-vs-statamic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f9925de6-28c3-40f9-a148-3dd0616aa66f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f9925de6-28c3-40f9-a148-3dd0616aa66f' AND href = $q$/compare/craft-cms-vs-statamic$q$);

-- ── Craft CMS vs Grav (craft-cms-vs-grav) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', 'fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$craft-cms-vs-grav$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '35e4bc85-6298-43d3-bc27-0854ea063792', $q$vs Grav$q$, $q$/compare/craft-cms-vs-grav$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '35e4bc85-6298-43d3-bc27-0854ea063792'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '35e4bc85-6298-43d3-bc27-0854ea063792' AND href = $q$/compare/craft-cms-vs-grav$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$vs Craft CMS$q$, $q$/compare/craft-cms-vs-grav$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fbbd32cd-6120-4478-b00a-9de654f9e59e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fbbd32cd-6120-4478-b00a-9de654f9e59e' AND href = $q$/compare/craft-cms-vs-grav$q$);

-- ── Grav vs October CMS (grav-vs-october-cms) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', '960def45-b280-43d5-9fc8-858cdf44c8e2', $q$grav-vs-october-cms$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$vs October CMS$q$, $q$/compare/grav-vs-october-cms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fbbd32cd-6120-4478-b00a-9de654f9e59e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fbbd32cd-6120-4478-b00a-9de654f9e59e' AND href = $q$/compare/grav-vs-october-cms$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '960def45-b280-43d5-9fc8-858cdf44c8e2', $q$vs Grav$q$, $q$/compare/grav-vs-october-cms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '960def45-b280-43d5-9fc8-858cdf44c8e2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '960def45-b280-43d5-9fc8-858cdf44c8e2' AND href = $q$/compare/grav-vs-october-cms$q$);

-- ── October CMS vs ProcessWire (october-cms-vs-processwire) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', '41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$october-cms-vs-processwire$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '960def45-b280-43d5-9fc8-858cdf44c8e2', $q$vs ProcessWire$q$, $q$/compare/october-cms-vs-processwire$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '960def45-b280-43d5-9fc8-858cdf44c8e2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '960def45-b280-43d5-9fc8-858cdf44c8e2' AND href = $q$/compare/october-cms-vs-processwire$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$vs October CMS$q$, $q$/compare/october-cms-vs-processwire$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '41d3c6d5-f1bd-4474-a701-bf4a104a118c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '41d3c6d5-f1bd-4474-a701-bf4a104a118c' AND href = $q$/compare/october-cms-vs-processwire$q$);

-- ── Concrete CMS vs ProcessWire (concrete-cms-vs-processwire) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', '41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$concrete-cms-vs-processwire$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$vs ProcessWire$q$, $q$/compare/concrete-cms-vs-processwire$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7442e6d9-b040-4cc3-a601-2e27ba36cb13'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7442e6d9-b040-4cc3-a601-2e27ba36cb13' AND href = $q$/compare/concrete-cms-vs-processwire$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$vs Concrete CMS$q$, $q$/compare/concrete-cms-vs-processwire$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '41d3c6d5-f1bd-4474-a701-bf4a104a118c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '41d3c6d5-f1bd-4474-a701-bf4a104a118c' AND href = $q$/compare/concrete-cms-vs-processwire$q$);

-- ── Concrete CMS vs TYPO3 (concrete-cms-vs-typo3) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', '5534f256-62d0-46af-b02c-4c789873abc7', $q$concrete-cms-vs-typo3$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$vs TYPO3$q$, $q$/compare/concrete-cms-vs-typo3$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7442e6d9-b040-4cc3-a601-2e27ba36cb13'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7442e6d9-b040-4cc3-a601-2e27ba36cb13' AND href = $q$/compare/concrete-cms-vs-typo3$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5534f256-62d0-46af-b02c-4c789873abc7', $q$vs Concrete CMS$q$, $q$/compare/concrete-cms-vs-typo3$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7' AND href = $q$/compare/concrete-cms-vs-typo3$q$);

-- ── TYPO3 vs Umbraco (typo3-vs-umbraco) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$typo3-vs-umbraco$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5534f256-62d0-46af-b02c-4c789873abc7', $q$vs Umbraco$q$, $q$/compare/typo3-vs-umbraco$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7' AND href = $q$/compare/typo3-vs-umbraco$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$vs TYPO3$q$, $q$/compare/typo3-vs-umbraco$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db' AND href = $q$/compare/typo3-vs-umbraco$q$);

-- ── Backdrop CMS vs Umbraco (backdrop-cms-vs-umbraco) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$backdrop-cms-vs-umbraco$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$vs Umbraco$q$, $q$/compare/backdrop-cms-vs-umbraco$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493' AND href = $q$/compare/backdrop-cms-vs-umbraco$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$vs Backdrop CMS$q$, $q$/compare/backdrop-cms-vs-umbraco$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db' AND href = $q$/compare/backdrop-cms-vs-umbraco$q$);

-- ── Backdrop CMS vs Silverstripe CMS (backdrop-cms-vs-silverstripe-cms) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$backdrop-cms-vs-silverstripe-cms$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$vs Silverstripe CMS$q$, $q$/compare/backdrop-cms-vs-silverstripe-cms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493' AND href = $q$/compare/backdrop-cms-vs-silverstripe-cms$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$vs Backdrop CMS$q$, $q$/compare/backdrop-cms-vs-silverstripe-cms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba' AND href = $q$/compare/backdrop-cms-vs-silverstripe-cms$q$);

-- ── KeystoneJS vs Silverstripe CMS (keystonejs-vs-silverstripe-cms) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$keystonejs-vs-silverstripe-cms$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$vs Silverstripe CMS$q$, $q$/compare/keystonejs-vs-silverstripe-cms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff' AND href = $q$/compare/keystonejs-vs-silverstripe-cms$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$vs KeystoneJS$q$, $q$/compare/keystonejs-vs-silverstripe-cms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba' AND href = $q$/compare/keystonejs-vs-silverstripe-cms$q$);

-- ── KeystoneJS vs TinaCMS (keystonejs-vs-tinacms) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', '10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$keystonejs-vs-tinacms$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$vs TinaCMS$q$, $q$/compare/keystonejs-vs-tinacms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff' AND href = $q$/compare/keystonejs-vs-tinacms$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$vs KeystoneJS$q$, $q$/compare/keystonejs-vs-tinacms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '10cff4ac-f281-4d9e-998a-dc5742fcfd08'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '10cff4ac-f281-4d9e-998a-dc5742fcfd08' AND href = $q$/compare/keystonejs-vs-tinacms$q$);

-- ── Cockpit CMS vs TinaCMS (cockpit-cms-vs-tinacms) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', '10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$cockpit-cms-vs-tinacms$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '26315baf-61aa-4fda-b2de-4986fe3babe9', $q$vs TinaCMS$q$, $q$/compare/cockpit-cms-vs-tinacms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '26315baf-61aa-4fda-b2de-4986fe3babe9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '26315baf-61aa-4fda-b2de-4986fe3babe9' AND href = $q$/compare/cockpit-cms-vs-tinacms$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$vs Cockpit CMS$q$, $q$/compare/cockpit-cms-vs-tinacms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '10cff4ac-f281-4d9e-998a-dc5742fcfd08'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '10cff4ac-f281-4d9e-998a-dc5742fcfd08' AND href = $q$/compare/cockpit-cms-vs-tinacms$q$);

-- ── Cockpit CMS vs Publii (cockpit-cms-vs-publii) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', 'aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$cockpit-cms-vs-publii$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '26315baf-61aa-4fda-b2de-4986fe3babe9', $q$vs Publii$q$, $q$/compare/cockpit-cms-vs-publii$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '26315baf-61aa-4fda-b2de-4986fe3babe9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '26315baf-61aa-4fda-b2de-4986fe3babe9' AND href = $q$/compare/cockpit-cms-vs-publii$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$vs Cockpit CMS$q$, $q$/compare/cockpit-cms-vs-publii$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aef99ec6-cc74-4f51-80a7-2b4686dc1465'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aef99ec6-cc74-4f51-80a7-2b4686dc1465' AND href = $q$/compare/cockpit-cms-vs-publii$q$);

-- ── Micro.blog vs Publii (micro-blog-vs-publii) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', 'aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$micro-blog-vs-publii$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$vs Publii$q$, $q$/compare/micro-blog-vs-publii$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18' AND href = $q$/compare/micro-blog-vs-publii$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$vs Micro.blog$q$, $q$/compare/micro-blog-vs-publii$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aef99ec6-cc74-4f51-80a7-2b4686dc1465'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aef99ec6-cc74-4f51-80a7-2b4686dc1465' AND href = $q$/compare/micro-blog-vs-publii$q$);

-- ── Blot vs Micro.blog (blot-vs-micro-blog) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$blot-vs-micro-blog$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$vs Micro.blog$q$, $q$/compare/blot-vs-micro-blog$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '53ba4185-9c98-4925-94b6-7aa6336c54d0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '53ba4185-9c98-4925-94b6-7aa6336c54d0' AND href = $q$/compare/blot-vs-micro-blog$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$vs Blot$q$, $q$/compare/blot-vs-micro-blog$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18' AND href = $q$/compare/blot-vs-micro-blog$q$);

-- ── Bear Blog vs Blot (bear-blog-vs-blot) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', '53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$bear-blog-vs-blot$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3bc33713-c005-4ff3-a44a-039f94585dff', $q$vs Blot$q$, $q$/compare/bear-blog-vs-blot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3bc33713-c005-4ff3-a44a-039f94585dff'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3bc33713-c005-4ff3-a44a-039f94585dff' AND href = $q$/compare/bear-blog-vs-blot$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$vs Bear Blog$q$, $q$/compare/bear-blog-vs-blot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '53ba4185-9c98-4925-94b6-7aa6336c54d0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '53ba4185-9c98-4925-94b6-7aa6336c54d0' AND href = $q$/compare/bear-blog-vs-blot$q$);

-- ── Autumn vs Hyperline (autumn-vs-hyperline) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$autumn-vs-hyperline$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$vs Hyperline$q$, $q$/compare/autumn-vs-hyperline$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016' AND href = $q$/compare/autumn-vs-hyperline$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$vs Autumn$q$, $q$/compare/autumn-vs-hyperline$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92' AND href = $q$/compare/autumn-vs-hyperline$q$);

-- ── Cliniko vs Jane App (cliniko-vs-jane-app) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', 'e495d174-9d89-4a75-aaca-d48d89a2581f', $q$cliniko-vs-jane-app$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$vs Jane App$q$, $q$/compare/cliniko-vs-jane-app$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83' AND href = $q$/compare/cliniko-vs-jane-app$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e495d174-9d89-4a75-aaca-d48d89a2581f', $q$vs Cliniko$q$, $q$/compare/cliniko-vs-jane-app$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e495d174-9d89-4a75-aaca-d48d89a2581f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e495d174-9d89-4a75-aaca-d48d89a2581f' AND href = $q$/compare/cliniko-vs-jane-app$q$);

-- ── Cliniko vs Healthie (cliniko-vs-healthie) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', '8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$cliniko-vs-healthie$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$vs Healthie$q$, $q$/compare/cliniko-vs-healthie$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83' AND href = $q$/compare/cliniko-vs-healthie$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$vs Cliniko$q$, $q$/compare/cliniko-vs-healthie$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8ca5d5be-9880-4ce7-94dd-56ab90d70f72'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8ca5d5be-9880-4ce7-94dd-56ab90d70f72' AND href = $q$/compare/cliniko-vs-healthie$q$);

-- ── Healthie vs Practice Better (healthie-vs-practice-better) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', '3d1c8fab-760d-491b-9864-dafede147c46', $q$healthie-vs-practice-better$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$vs Practice Better$q$, $q$/compare/healthie-vs-practice-better$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8ca5d5be-9880-4ce7-94dd-56ab90d70f72'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8ca5d5be-9880-4ce7-94dd-56ab90d70f72' AND href = $q$/compare/healthie-vs-practice-better$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3d1c8fab-760d-491b-9864-dafede147c46', $q$vs Healthie$q$, $q$/compare/healthie-vs-practice-better$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3d1c8fab-760d-491b-9864-dafede147c46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3d1c8fab-760d-491b-9864-dafede147c46' AND href = $q$/compare/healthie-vs-practice-better$q$);

-- ── OhMD vs Practice Better (ohmd-vs-practice-better) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', '3d1c8fab-760d-491b-9864-dafede147c46', $q$ohmd-vs-practice-better$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$vs Practice Better$q$, $q$/compare/ohmd-vs-practice-better$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0827d2c4-33ac-4c46-a57f-b360cc0f698b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0827d2c4-33ac-4c46-a57f-b360cc0f698b' AND href = $q$/compare/ohmd-vs-practice-better$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3d1c8fab-760d-491b-9864-dafede147c46', $q$vs OhMD$q$, $q$/compare/ohmd-vs-practice-better$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3d1c8fab-760d-491b-9864-dafede147c46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3d1c8fab-760d-491b-9864-dafede147c46' AND href = $q$/compare/ohmd-vs-practice-better$q$);

-- ── OhMD vs Weave (ohmd-vs-weave) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', '122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$ohmd-vs-weave$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$vs Weave$q$, $q$/compare/ohmd-vs-weave$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0827d2c4-33ac-4c46-a57f-b360cc0f698b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0827d2c4-33ac-4c46-a57f-b360cc0f698b' AND href = $q$/compare/ohmd-vs-weave$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$vs OhMD$q$, $q$/compare/ohmd-vs-weave$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '122093a2-2cf8-46b9-8fcf-07070f5d37e2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '122093a2-2cf8-46b9-8fcf-07070f5d37e2' AND href = $q$/compare/ohmd-vs-weave$q$);

-- ── CosmoLex vs Litify (cosmolex-vs-litify) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', 'dc263e36-ce97-42d4-be53-04c312ae1484', $q$cosmolex-vs-litify$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$vs Litify$q$, $q$/compare/cosmolex-vs-litify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cee2123f-c1f7-4345-90bb-fd1586f42fd7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cee2123f-c1f7-4345-90bb-fd1586f42fd7' AND href = $q$/compare/cosmolex-vs-litify$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dc263e36-ce97-42d4-be53-04c312ae1484', $q$vs CosmoLex$q$, $q$/compare/cosmolex-vs-litify$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dc263e36-ce97-42d4-be53-04c312ae1484'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dc263e36-ce97-42d4-be53-04c312ae1484' AND href = $q$/compare/cosmolex-vs-litify$q$);

-- ── CosmoLex vs TimeSolv (cosmolex-vs-timesolv) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', 'a06b1be4-eb20-4b50-a730-a18c95839a81', $q$cosmolex-vs-timesolv$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$vs TimeSolv$q$, $q$/compare/cosmolex-vs-timesolv$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cee2123f-c1f7-4345-90bb-fd1586f42fd7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cee2123f-c1f7-4345-90bb-fd1586f42fd7' AND href = $q$/compare/cosmolex-vs-timesolv$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a06b1be4-eb20-4b50-a730-a18c95839a81', $q$vs CosmoLex$q$, $q$/compare/cosmolex-vs-timesolv$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a06b1be4-eb20-4b50-a730-a18c95839a81'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a06b1be4-eb20-4b50-a730-a18c95839a81' AND href = $q$/compare/cosmolex-vs-timesolv$q$);

-- ── Actionstep vs TimeSolv (actionstep-vs-timesolv) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', 'a06b1be4-eb20-4b50-a730-a18c95839a81', $q$actionstep-vs-timesolv$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '83af1af4-6221-4015-833c-810c8bd8d57f', $q$vs TimeSolv$q$, $q$/compare/actionstep-vs-timesolv$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f' AND href = $q$/compare/actionstep-vs-timesolv$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a06b1be4-eb20-4b50-a730-a18c95839a81', $q$vs Actionstep$q$, $q$/compare/actionstep-vs-timesolv$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a06b1be4-eb20-4b50-a730-a18c95839a81'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a06b1be4-eb20-4b50-a730-a18c95839a81' AND href = $q$/compare/actionstep-vs-timesolv$q$);

-- ── Actionstep vs Everlaw (actionstep-vs-everlaw) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', '2ca87f00-e097-436b-b238-146a0f31af0e', $q$actionstep-vs-everlaw$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '83af1af4-6221-4015-833c-810c8bd8d57f', $q$vs Everlaw$q$, $q$/compare/actionstep-vs-everlaw$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '83af1af4-6221-4015-833c-810c8bd8d57f' AND href = $q$/compare/actionstep-vs-everlaw$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2ca87f00-e097-436b-b238-146a0f31af0e', $q$vs Actionstep$q$, $q$/compare/actionstep-vs-everlaw$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2ca87f00-e097-436b-b238-146a0f31af0e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2ca87f00-e097-436b-b238-146a0f31af0e' AND href = $q$/compare/actionstep-vs-everlaw$q$);

-- ── Everlaw vs RelativityOne (everlaw-vs-relativityone) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', '6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$everlaw-vs-relativityone$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2ca87f00-e097-436b-b238-146a0f31af0e', $q$vs RelativityOne$q$, $q$/compare/everlaw-vs-relativityone$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2ca87f00-e097-436b-b238-146a0f31af0e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2ca87f00-e097-436b-b238-146a0f31af0e' AND href = $q$/compare/everlaw-vs-relativityone$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$vs Everlaw$q$, $q$/compare/everlaw-vs-relativityone$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6b59bfb3-5ea0-4d33-92fe-b141944faacf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6b59bfb3-5ea0-4d33-92fe-b141944faacf' AND href = $q$/compare/everlaw-vs-relativityone$q$);

-- ── RelativityOne vs Reveal (relativityone-vs-reveal) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', '9f433b75-2930-48b2-9563-119f142dab72', $q$relativityone-vs-reveal$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$vs Reveal$q$, $q$/compare/relativityone-vs-reveal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6b59bfb3-5ea0-4d33-92fe-b141944faacf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6b59bfb3-5ea0-4d33-92fe-b141944faacf' AND href = $q$/compare/relativityone-vs-reveal$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9f433b75-2930-48b2-9563-119f142dab72', $q$vs RelativityOne$q$, $q$/compare/relativityone-vs-reveal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9f433b75-2930-48b2-9563-119f142dab72'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9f433b75-2930-48b2-9563-119f142dab72' AND href = $q$/compare/relativityone-vs-reveal$q$);

-- ── Dover vs Recruiterflow (dover-vs-recruiterflow) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$dover-vs-recruiterflow$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$vs Recruiterflow$q$, $q$/compare/dover-vs-recruiterflow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4f4357a3-4447-4c5e-a99e-78f3aab7061b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4f4357a3-4447-4c5e-a99e-78f3aab7061b' AND href = $q$/compare/dover-vs-recruiterflow$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576', $q$vs Dover$q$, $q$/compare/dover-vs-recruiterflow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e1cdadd8-bcfb-4fe7-a40d-88b82d009576' AND href = $q$/compare/dover-vs-recruiterflow$q$);

-- ── Dover vs Metaview (dover-vs-metaview) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4f4357a3-4447-4c5e-a99e-78f3aab7061b', '337159a2-d409-432a-86c7-1ec8ab203620', $q$dover-vs-metaview$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4f4357a3-4447-4c5e-a99e-78f3aab7061b', $q$vs Metaview$q$, $q$/compare/dover-vs-metaview$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4f4357a3-4447-4c5e-a99e-78f3aab7061b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4f4357a3-4447-4c5e-a99e-78f3aab7061b' AND href = $q$/compare/dover-vs-metaview$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '337159a2-d409-432a-86c7-1ec8ab203620', $q$vs Dover$q$, $q$/compare/dover-vs-metaview$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '337159a2-d409-432a-86c7-1ec8ab203620'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '337159a2-d409-432a-86c7-1ec8ab203620' AND href = $q$/compare/dover-vs-metaview$q$);

-- ── Metaview vs Paraform (metaview-vs-paraform) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('337159a2-d409-432a-86c7-1ec8ab203620', '0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$metaview-vs-paraform$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '337159a2-d409-432a-86c7-1ec8ab203620', $q$vs Paraform$q$, $q$/compare/metaview-vs-paraform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '337159a2-d409-432a-86c7-1ec8ab203620'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '337159a2-d409-432a-86c7-1ec8ab203620' AND href = $q$/compare/metaview-vs-paraform$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$vs Metaview$q$, $q$/compare/metaview-vs-paraform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0abb883b-fe31-411e-a600-34ef2c9cdba6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0abb883b-fe31-411e-a600-34ef2c9cdba6' AND href = $q$/compare/metaview-vs-paraform$q$);

-- ── HireEZ vs Paraform (hireez-vs-paraform) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', '0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$hireez-vs-paraform$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '75de4905-e02e-4641-aa2f-074c25a04d63', $q$vs Paraform$q$, $q$/compare/hireez-vs-paraform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '75de4905-e02e-4641-aa2f-074c25a04d63'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '75de4905-e02e-4641-aa2f-074c25a04d63' AND href = $q$/compare/hireez-vs-paraform$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0abb883b-fe31-411e-a600-34ef2c9cdba6', $q$vs HireEZ$q$, $q$/compare/hireez-vs-paraform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0abb883b-fe31-411e-a600-34ef2c9cdba6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0abb883b-fe31-411e-a600-34ef2c9cdba6' AND href = $q$/compare/hireez-vs-paraform$q$);

-- ── Aha! vs Productboard (aha-vs-productboard) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', '44247eb4-4fad-4252-a448-315159706699', $q$aha-vs-productboard$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1d3b022c-eecd-4869-9efc-0b614824aa91', $q$vs Productboard$q$, $q$/compare/aha-vs-productboard$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91' AND href = $q$/compare/aha-vs-productboard$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '44247eb4-4fad-4252-a448-315159706699', $q$vs Aha!$q$, $q$/compare/aha-vs-productboard$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '44247eb4-4fad-4252-a448-315159706699'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '44247eb4-4fad-4252-a448-315159706699' AND href = $q$/compare/aha-vs-productboard$q$);

-- ── Craft.io vs Productboard (craft-io-vs-productboard) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', '44247eb4-4fad-4252-a448-315159706699', $q$craft-io-vs-productboard$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$vs Productboard$q$, $q$/compare/craft-io-vs-productboard$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '78f287c8-68d3-4606-a4ac-c4ef808b1063'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '78f287c8-68d3-4606-a4ac-c4ef808b1063' AND href = $q$/compare/craft-io-vs-productboard$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '44247eb4-4fad-4252-a448-315159706699', $q$vs Craft.io$q$, $q$/compare/craft-io-vs-productboard$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '44247eb4-4fad-4252-a448-315159706699'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '44247eb4-4fad-4252-a448-315159706699' AND href = $q$/compare/craft-io-vs-productboard$q$);

-- ── Craft.io vs ProductPlan (craft-io-vs-productplan) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', '73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$craft-io-vs-productplan$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$vs ProductPlan$q$, $q$/compare/craft-io-vs-productplan$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '78f287c8-68d3-4606-a4ac-c4ef808b1063'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '78f287c8-68d3-4606-a4ac-c4ef808b1063' AND href = $q$/compare/craft-io-vs-productplan$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$vs Craft.io$q$, $q$/compare/craft-io-vs-productplan$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '73f568cf-6fdf-4904-bb21-3fb27cb40d1c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '73f568cf-6fdf-4904-bb21-3fb27cb40d1c' AND href = $q$/compare/craft-io-vs-productplan$q$);

-- ── ProductPlan vs Savio (productplan-vs-savio) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', '69b064f9-d2d3-4029-9481-48380ca63924', $q$productplan-vs-savio$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$vs Savio$q$, $q$/compare/productplan-vs-savio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '73f568cf-6fdf-4904-bb21-3fb27cb40d1c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '73f568cf-6fdf-4904-bb21-3fb27cb40d1c' AND href = $q$/compare/productplan-vs-savio$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69b064f9-d2d3-4029-9481-48380ca63924', $q$vs ProductPlan$q$, $q$/compare/productplan-vs-savio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69b064f9-d2d3-4029-9481-48380ca63924'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69b064f9-d2d3-4029-9481-48380ca63924' AND href = $q$/compare/productplan-vs-savio$q$);

-- ── Frill vs Savio (frill-vs-savio) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', '69b064f9-d2d3-4029-9481-48380ca63924', $q$frill-vs-savio$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$vs Savio$q$, $q$/compare/frill-vs-savio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05' AND href = $q$/compare/frill-vs-savio$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69b064f9-d2d3-4029-9481-48380ca63924', $q$vs Frill$q$, $q$/compare/frill-vs-savio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69b064f9-d2d3-4029-9481-48380ca63924'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69b064f9-d2d3-4029-9481-48380ca63924' AND href = $q$/compare/frill-vs-savio$q$);

-- ── Frill vs Upvoty (frill-vs-upvoty) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', 'b032034e-3c48-43b1-b97e-319af0c7611f', $q$frill-vs-upvoty$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$vs Upvoty$q$, $q$/compare/frill-vs-upvoty$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05' AND href = $q$/compare/frill-vs-upvoty$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b032034e-3c48-43b1-b97e-319af0c7611f', $q$vs Frill$q$, $q$/compare/frill-vs-upvoty$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b032034e-3c48-43b1-b97e-319af0c7611f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b032034e-3c48-43b1-b97e-319af0c7611f' AND href = $q$/compare/frill-vs-upvoty$q$);

-- ── Featurebase vs Upvoty (featurebase-vs-upvoty) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', 'b032034e-3c48-43b1-b97e-319af0c7611f', $q$featurebase-vs-upvoty$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$vs Upvoty$q$, $q$/compare/featurebase-vs-upvoty$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69ed37d5-2093-4b7b-87b5-2affc6a03505'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69ed37d5-2093-4b7b-87b5-2affc6a03505' AND href = $q$/compare/featurebase-vs-upvoty$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b032034e-3c48-43b1-b97e-319af0c7611f', $q$vs Featurebase$q$, $q$/compare/featurebase-vs-upvoty$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b032034e-3c48-43b1-b97e-319af0c7611f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b032034e-3c48-43b1-b97e-319af0c7611f' AND href = $q$/compare/featurebase-vs-upvoty$q$);

-- ── Marqii vs Uberall (marqii-vs-uberall) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', 'b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$marqii-vs-uberall$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fd376b9a-76da-4d57-99b7-dede36f6af47', $q$vs Uberall$q$, $q$/compare/marqii-vs-uberall$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fd376b9a-76da-4d57-99b7-dede36f6af47'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fd376b9a-76da-4d57-99b7-dede36f6af47' AND href = $q$/compare/marqii-vs-uberall$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$vs Marqii$q$, $q$/compare/marqii-vs-uberall$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484' AND href = $q$/compare/marqii-vs-uberall$q$);

-- ── Chromatic vs TestingBot (chromatic-vs-testingbot) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', '1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$chromatic-vs-testingbot$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$vs TestingBot$q$, $q$/compare/chromatic-vs-testingbot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d' AND href = $q$/compare/chromatic-vs-testingbot$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$vs Chromatic$q$, $q$/compare/chromatic-vs-testingbot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa' AND href = $q$/compare/chromatic-vs-testingbot$q$);

-- ── Leapsome vs Orgvue (leapsome-vs-orgvue) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fdee0987-278e-4695-be35-6f8d4a24d46b', '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$leapsome-vs-orgvue$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fdee0987-278e-4695-be35-6f8d4a24d46b', $q$vs Orgvue$q$, $q$/compare/leapsome-vs-orgvue$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fdee0987-278e-4695-be35-6f8d4a24d46b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fdee0987-278e-4695-be35-6f8d4a24d46b' AND href = $q$/compare/leapsome-vs-orgvue$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f', $q$vs Leapsome$q$, $q$/compare/leapsome-vs-orgvue$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4cd26b5d-cf7d-49f1-82c5-0fb63f754a1f' AND href = $q$/compare/leapsome-vs-orgvue$q$);

-- ── Falco vs Scalekit (falco-vs-scalekit) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', 'f089f3d0-931d-41ab-b83c-765e387a247e', $q$falco-vs-scalekit$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$vs Scalekit$q$, $q$/compare/falco-vs-scalekit$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '07f5df46-0b11-4627-b5f3-78e1a12e546e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '07f5df46-0b11-4627-b5f3-78e1a12e546e' AND href = $q$/compare/falco-vs-scalekit$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f089f3d0-931d-41ab-b83c-765e387a247e', $q$vs Falco$q$, $q$/compare/falco-vs-scalekit$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f089f3d0-931d-41ab-b83c-765e387a247e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f089f3d0-931d-41ab-b83c-765e387a247e' AND href = $q$/compare/falco-vs-scalekit$q$);

-- ── HireEZ vs Recruit CRM (hireez-vs-recruit-crm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('75de4905-e02e-4641-aa2f-074c25a04d63', '16d7a916-ff92-4379-8cb9-06913256e22d', $q$hireez-vs-recruit-crm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '75de4905-e02e-4641-aa2f-074c25a04d63', $q$vs Recruit CRM$q$, $q$/compare/hireez-vs-recruit-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '75de4905-e02e-4641-aa2f-074c25a04d63'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '75de4905-e02e-4641-aa2f-074c25a04d63' AND href = $q$/compare/hireez-vs-recruit-crm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '16d7a916-ff92-4379-8cb9-06913256e22d', $q$vs HireEZ$q$, $q$/compare/hireez-vs-recruit-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '16d7a916-ff92-4379-8cb9-06913256e22d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '16d7a916-ff92-4379-8cb9-06913256e22d' AND href = $q$/compare/hireez-vs-recruit-crm$q$);

-- ── Benepass vs Leapsome (benepass-vs-leapsome) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', 'fdee0987-278e-4695-be35-6f8d4a24d46b', $q$benepass-vs-leapsome$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$vs Leapsome$q$, $q$/compare/benepass-vs-leapsome$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c' AND href = $q$/compare/benepass-vs-leapsome$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fdee0987-278e-4695-be35-6f8d4a24d46b', $q$vs Benepass$q$, $q$/compare/benepass-vs-leapsome$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fdee0987-278e-4695-be35-6f8d4a24d46b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fdee0987-278e-4695-be35-6f8d4a24d46b' AND href = $q$/compare/benepass-vs-leapsome$q$);

-- ── Clair vs Falco (clair-vs-falco) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('caec6253-7f1b-408d-968e-1099f0367648', '07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$clair-vs-falco$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'caec6253-7f1b-408d-968e-1099f0367648', $q$vs Falco$q$, $q$/compare/clair-vs-falco$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'caec6253-7f1b-408d-968e-1099f0367648'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'caec6253-7f1b-408d-968e-1099f0367648' AND href = $q$/compare/clair-vs-falco$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$vs Clair$q$, $q$/compare/clair-vs-falco$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '07f5df46-0b11-4627-b5f3-78e1a12e546e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '07f5df46-0b11-4627-b5f3-78e1a12e546e' AND href = $q$/compare/clair-vs-falco$q$);

-- ── Authentik vs Clair (authentik-vs-clair) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', 'caec6253-7f1b-408d-968e-1099f0367648', $q$authentik-vs-clair$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$vs Clair$q$, $q$/compare/authentik-vs-clair$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9' AND href = $q$/compare/authentik-vs-clair$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'caec6253-7f1b-408d-968e-1099f0367648', $q$vs Authentik$q$, $q$/compare/authentik-vs-clair$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'caec6253-7f1b-408d-968e-1099f0367648'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'caec6253-7f1b-408d-968e-1099f0367648' AND href = $q$/compare/authentik-vs-clair$q$);

-- ── Authentik vs SuperTokens (authentik-vs-supertokens) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', '3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$authentik-vs-supertokens$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$vs SuperTokens$q$, $q$/compare/authentik-vs-supertokens$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9' AND href = $q$/compare/authentik-vs-supertokens$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$vs Authentik$q$, $q$/compare/authentik-vs-supertokens$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3a5bd012-2f3f-4dff-ab18-daad2501a4b0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3a5bd012-2f3f-4dff-ab18-daad2501a4b0' AND href = $q$/compare/authentik-vs-supertokens$q$);

-- ── automatisch vs Huginn (automatisch-vs-huginn) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bc3ebf83-b451-4f8b-add7-98a7a3a4bead', 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7', $q$automatisch-vs-huginn$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead', $q$vs Huginn$q$, $q$/compare/automatisch-vs-huginn$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bc3ebf83-b451-4f8b-add7-98a7a3a4bead' AND href = $q$/compare/automatisch-vs-huginn$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7', $q$vs automatisch$q$, $q$/compare/automatisch-vs-huginn$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fafc24bd-5a3c-4d63-b22a-5c5090aec3d7' AND href = $q$/compare/automatisch-vs-huginn$q$);

-- ── HyperDX vs Oh Dear (hyperdx-vs-oh-dear) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', '7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$hyperdx-vs-oh-dear$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd0fed099-679d-4702-a509-fbb8a5115476', $q$vs Oh Dear$q$, $q$/compare/hyperdx-vs-oh-dear$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd0fed099-679d-4702-a509-fbb8a5115476'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd0fed099-679d-4702-a509-fbb8a5115476' AND href = $q$/compare/hyperdx-vs-oh-dear$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$vs HyperDX$q$, $q$/compare/hyperdx-vs-oh-dear$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7f675195-8d9d-4857-a42d-0da0b4ca4707'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7f675195-8d9d-4857-a42d-0da0b4ca4707' AND href = $q$/compare/hyperdx-vs-oh-dear$q$);

-- ── Affine vs Obsidian (affine-vs-obsidian) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$affine-vs-obsidian$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b3923df9-f933-42f3-a870-8a16aaef419f', $q$vs Obsidian$q$, $q$/compare/affine-vs-obsidian$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f' AND href = $q$/compare/affine-vs-obsidian$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '45916754-f5bf-43e2-98ed-4d4cec40d20c', $q$vs Affine$q$, $q$/compare/affine-vs-obsidian$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '45916754-f5bf-43e2-98ed-4d4cec40d20c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '45916754-f5bf-43e2-98ed-4d4cec40d20c' AND href = $q$/compare/affine-vs-obsidian$q$);

-- ── GitBook vs HedgeDoc (gitbook-vs-hedgedoc) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3af57a6b-aa7b-403a-a094-3150492f8e93', '6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$gitbook-vs-hedgedoc$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3af57a6b-aa7b-403a-a094-3150492f8e93', $q$vs HedgeDoc$q$, $q$/compare/gitbook-vs-hedgedoc$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3af57a6b-aa7b-403a-a094-3150492f8e93'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3af57a6b-aa7b-403a-a094-3150492f8e93' AND href = $q$/compare/gitbook-vs-hedgedoc$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$vs GitBook$q$, $q$/compare/gitbook-vs-hedgedoc$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6c79fd04-1ff8-447b-b662-4ad9e3fff565'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6c79fd04-1ff8-447b-b662-4ad9e3fff565' AND href = $q$/compare/gitbook-vs-hedgedoc$q$);

-- ── Dolibarr vs iDempiere (dolibarr-vs-idempiere) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('da85131f-6520-4e7e-b70d-0a49a665a0fa', 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$dolibarr-vs-idempiere$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'da85131f-6520-4e7e-b70d-0a49a665a0fa', $q$vs iDempiere$q$, $q$/compare/dolibarr-vs-idempiere$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'da85131f-6520-4e7e-b70d-0a49a665a0fa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'da85131f-6520-4e7e-b70d-0a49a665a0fa' AND href = $q$/compare/dolibarr-vs-idempiere$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0', $q$vs Dolibarr$q$, $q$/compare/dolibarr-vs-idempiere$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bfdc0210-d2c7-4bbc-8413-b007ecdc67e0' AND href = $q$/compare/dolibarr-vs-idempiere$q$);

-- ── Pretalx vs WebinarJam (pretalx-vs-webinarjam) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', '5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$pretalx-vs-webinarjam$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$vs WebinarJam$q$, $q$/compare/pretalx-vs-webinarjam$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8' AND href = $q$/compare/pretalx-vs-webinarjam$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$vs Pretalx$q$, $q$/compare/pretalx-vs-webinarjam$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3' AND href = $q$/compare/pretalx-vs-webinarjam$q$);

-- ── Bettermode vs NodeBB (bettermode-vs-nodebb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', '8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$bettermode-vs-nodebb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$vs NodeBB$q$, $q$/compare/bettermode-vs-nodebb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3' AND href = $q$/compare/bettermode-vs-nodebb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$vs Bettermode$q$, $q$/compare/bettermode-vs-nodebb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8cded24f-f6e3-445f-86fb-dc2b2871d6b2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8cded24f-f6e3-445f-86fb-dc2b2871d6b2' AND href = $q$/compare/bettermode-vs-nodebb$q$);

-- ── Node-RED vs RudderStack (node-red-vs-rudderstack) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$node-red-vs-rudderstack$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$vs RudderStack$q$, $q$/compare/node-red-vs-rudderstack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b0f2485e-46a1-44ad-84ac-a606befaef5f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b0f2485e-46a1-44ad-84ac-a606befaef5f' AND href = $q$/compare/node-red-vs-rudderstack$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$vs Node-RED$q$, $q$/compare/node-red-vs-rudderstack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20' AND href = $q$/compare/node-red-vs-rudderstack$q$);

-- ── Pabau vs Weave (pabau-vs-weave) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', '122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$pabau-vs-weave$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$vs Weave$q$, $q$/compare/pabau-vs-weave$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fcc0d22f-68b0-41c4-80f4-5ebf02a902a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fcc0d22f-68b0-41c4-80f4-5ebf02a902a9' AND href = $q$/compare/pabau-vs-weave$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$vs Pabau$q$, $q$/compare/pabau-vs-weave$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '122093a2-2cf8-46b9-8fcf-07070f5d37e2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '122093a2-2cf8-46b9-8fcf-07070f5d37e2' AND href = $q$/compare/pabau-vs-weave$q$);

-- ── Juro vs Lexion (juro-vs-lexion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', 'dcb87420-fbd7-430c-9df6-534d57e84b61', $q$juro-vs-lexion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$vs Lexion$q$, $q$/compare/juro-vs-lexion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b3138f4f-7b47-4597-bf67-8ea806a1edd0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b3138f4f-7b47-4597-bf67-8ea806a1edd0' AND href = $q$/compare/juro-vs-lexion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dcb87420-fbd7-430c-9df6-534d57e84b61', $q$vs Juro$q$, $q$/compare/juro-vs-lexion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dcb87420-fbd7-430c-9df6-534d57e84b61'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dcb87420-fbd7-430c-9df6-534d57e84b61' AND href = $q$/compare/juro-vs-lexion$q$);

-- ── Reveal vs Spellbook (reveal-vs-spellbook) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9f433b75-2930-48b2-9563-119f142dab72', '4518f944-7168-437d-a54e-83df3dc6c03e', $q$reveal-vs-spellbook$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9f433b75-2930-48b2-9563-119f142dab72', $q$vs Spellbook$q$, $q$/compare/reveal-vs-spellbook$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9f433b75-2930-48b2-9563-119f142dab72'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9f433b75-2930-48b2-9563-119f142dab72' AND href = $q$/compare/reveal-vs-spellbook$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4518f944-7168-437d-a54e-83df3dc6c03e', $q$vs Reveal$q$, $q$/compare/reveal-vs-spellbook$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4518f944-7168-437d-a54e-83df3dc6c03e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4518f944-7168-437d-a54e-83df3dc6c03e' AND href = $q$/compare/reveal-vs-spellbook$q$);

-- ── Featurebase vs ProdPad (featurebase-vs-prodpad) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', 'f214525d-5b01-44d9-b029-88a13d27b4e6', $q$featurebase-vs-prodpad$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$vs ProdPad$q$, $q$/compare/featurebase-vs-prodpad$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '69ed37d5-2093-4b7b-87b5-2affc6a03505'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '69ed37d5-2093-4b7b-87b5-2affc6a03505' AND href = $q$/compare/featurebase-vs-prodpad$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f214525d-5b01-44d9-b029-88a13d27b4e6', $q$vs Featurebase$q$, $q$/compare/featurebase-vs-prodpad$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f214525d-5b01-44d9-b029-88a13d27b4e6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f214525d-5b01-44d9-b029-88a13d27b4e6' AND href = $q$/compare/featurebase-vs-prodpad$q$);

-- ── Birdeye vs Marqii (birdeye-vs-marqii) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', 'fd376b9a-76da-4d57-99b7-dede36f6af47', $q$birdeye-vs-marqii$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$vs Marqii$q$, $q$/compare/birdeye-vs-marqii$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '96e7ec06-f2ec-4702-94ef-ddc083739f48'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '96e7ec06-f2ec-4702-94ef-ddc083739f48' AND href = $q$/compare/birdeye-vs-marqii$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fd376b9a-76da-4d57-99b7-dede36f6af47', $q$vs Birdeye$q$, $q$/compare/birdeye-vs-marqii$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fd376b9a-76da-4d57-99b7-dede36f6af47'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fd376b9a-76da-4d57-99b7-dede36f6af47' AND href = $q$/compare/birdeye-vs-marqii$q$);

-- ── Order.co vs Tradogram (order-co-vs-tradogram) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', '3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$order-co-vs-tradogram$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a442a095-0271-47c3-9bde-0e4be198b2c6', $q$vs Tradogram$q$, $q$/compare/order-co-vs-tradogram$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a442a095-0271-47c3-9bde-0e4be198b2c6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a442a095-0271-47c3-9bde-0e4be198b2c6' AND href = $q$/compare/order-co-vs-tradogram$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$vs Order.co$q$, $q$/compare/order-co-vs-tradogram$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3f5fd302-9cde-4c0c-9ce1-23c0223b163f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3f5fd302-9cde-4c0c-9ce1-23c0223b163f' AND href = $q$/compare/order-co-vs-tradogram$q$);

-- ── Captivate vs RSS.com (captivate-vs-rss-com) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', '486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$captivate-vs-rss-com$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$vs RSS.com$q$, $q$/compare/captivate-vs-rss-com$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63' AND href = $q$/compare/captivate-vs-rss-com$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$vs Captivate$q$, $q$/compare/captivate-vs-rss-com$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '486dac3f-e396-4ba6-9c6e-20a5f563c673'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '486dac3f-e396-4ba6-9c6e-20a5f563c673' AND href = $q$/compare/captivate-vs-rss-com$q$);

-- ── StatusCake vs Thanos (statuscake-vs-thanos) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$statuscake-vs-thanos$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$vs Thanos$q$, $q$/compare/statuscake-vs-thanos$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c4af54de-4e6f-4013-b444-8a17c0797dd0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c4af54de-4e6f-4013-b444-8a17c0797dd0' AND href = $q$/compare/statuscake-vs-thanos$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$vs StatusCake$q$, $q$/compare/statuscake-vs-thanos$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2' AND href = $q$/compare/statuscake-vs-thanos$q$);

-- ── Beeceptor vs Chromatic (beeceptor-vs-chromatic) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$beeceptor-vs-chromatic$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$vs Chromatic$q$, $q$/compare/beeceptor-vs-chromatic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810' AND href = $q$/compare/beeceptor-vs-chromatic$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$vs Beeceptor$q$, $q$/compare/beeceptor-vs-chromatic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d' AND href = $q$/compare/beeceptor-vs-chromatic$q$);

-- ── Contentsquare vs Lucky Orange (contentsquare-vs-lucky-orange) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', '33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$contentsquare-vs-lucky-orange$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '416c2613-6ccd-4b41-aea6-5f51b4411966', $q$vs Lucky Orange$q$, $q$/compare/contentsquare-vs-lucky-orange$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '416c2613-6ccd-4b41-aea6-5f51b4411966'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '416c2613-6ccd-4b41-aea6-5f51b4411966' AND href = $q$/compare/contentsquare-vs-lucky-orange$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$vs Contentsquare$q$, $q$/compare/contentsquare-vs-lucky-orange$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '33ec13b1-2e9a-4373-9b50-55b018d5adaa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '33ec13b1-2e9a-4373-9b50-55b018d5adaa' AND href = $q$/compare/contentsquare-vs-lucky-orange$q$);

-- ── Benepass vs OrangeHRM (benepass-vs-orangehrm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ce82b7a0-b1b6-4191-9b58-41a63c85525c', 'c2a56d2f-1e25-421f-af5c-1494914a3095', $q$benepass-vs-orangehrm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ce82b7a0-b1b6-4191-9b58-41a63c85525c', $q$vs OrangeHRM$q$, $q$/compare/benepass-vs-orangehrm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ce82b7a0-b1b6-4191-9b58-41a63c85525c' AND href = $q$/compare/benepass-vs-orangehrm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c2a56d2f-1e25-421f-af5c-1494914a3095', $q$vs Benepass$q$, $q$/compare/benepass-vs-orangehrm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c2a56d2f-1e25-421f-af5c-1494914a3095'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c2a56d2f-1e25-421f-af5c-1494914a3095' AND href = $q$/compare/benepass-vs-orangehrm$q$);

-- ── Nuclei vs SuperTokens (nuclei-vs-supertokens) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', '3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$nuclei-vs-supertokens$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$vs SuperTokens$q$, $q$/compare/nuclei-vs-supertokens$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb' AND href = $q$/compare/nuclei-vs-supertokens$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$vs Nuclei$q$, $q$/compare/nuclei-vs-supertokens$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3a5bd012-2f3f-4dff-ab18-daad2501a4b0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3a5bd012-2f3f-4dff-ab18-daad2501a4b0' AND href = $q$/compare/nuclei-vs-supertokens$q$);

-- ── Findem vs Recruit CRM (findem-vs-recruit-crm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', '16d7a916-ff92-4379-8cb9-06913256e22d', $q$findem-vs-recruit-crm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a0c6b3bc-611c-40b8-83f8-691d0b5c6aed', $q$vs Recruit CRM$q$, $q$/compare/findem-vs-recruit-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a0c6b3bc-611c-40b8-83f8-691d0b5c6aed'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a0c6b3bc-611c-40b8-83f8-691d0b5c6aed' AND href = $q$/compare/findem-vs-recruit-crm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '16d7a916-ff92-4379-8cb9-06913256e22d', $q$vs Findem$q$, $q$/compare/findem-vs-recruit-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '16d7a916-ff92-4379-8cb9-06913256e22d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '16d7a916-ff92-4379-8cb9-06913256e22d' AND href = $q$/compare/findem-vs-recruit-crm$q$);

-- ── CloudLex vs Robin AI (cloudlex-vs-robin-ai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', 'fb49326f-7c73-43d6-b58a-39f713485eed', $q$cloudlex-vs-robin-ai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '963e1b92-071f-415e-9b5e-38f557ab5057', $q$vs Robin AI$q$, $q$/compare/cloudlex-vs-robin-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '963e1b92-071f-415e-9b5e-38f557ab5057' AND href = $q$/compare/cloudlex-vs-robin-ai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fb49326f-7c73-43d6-b58a-39f713485eed', $q$vs CloudLex$q$, $q$/compare/cloudlex-vs-robin-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fb49326f-7c73-43d6-b58a-39f713485eed'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fb49326f-7c73-43d6-b58a-39f713485eed' AND href = $q$/compare/cloudlex-vs-robin-ai$q$);

-- ── Harness vs OneDev (harness-vs-onedev) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$harness-vs-onedev$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$vs OneDev$q$, $q$/compare/harness-vs-onedev$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f' AND href = $q$/compare/harness-vs-onedev$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$vs Harness$q$, $q$/compare/harness-vs-onedev$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5' AND href = $q$/compare/harness-vs-onedev$q$);

-- ── Coralogix vs Oh Dear (coralogix-vs-oh-dear) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', '7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$coralogix-vs-oh-dear$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$vs Oh Dear$q$, $q$/compare/coralogix-vs-oh-dear$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '87d8b957-ca86-43e1-bf19-a249b1bd836a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '87d8b957-ca86-43e1-bf19-a249b1bd836a' AND href = $q$/compare/coralogix-vs-oh-dear$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$vs Coralogix$q$, $q$/compare/coralogix-vs-oh-dear$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7f675195-8d9d-4857-a42d-0da0b4ca4707'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7f675195-8d9d-4857-a42d-0da0b4ca4707' AND href = $q$/compare/coralogix-vs-oh-dear$q$);

-- ── Coralogix vs Honeycomb (coralogix-vs-honeycomb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', '5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$coralogix-vs-honeycomb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$vs Honeycomb$q$, $q$/compare/coralogix-vs-honeycomb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '87d8b957-ca86-43e1-bf19-a249b1bd836a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '87d8b957-ca86-43e1-bf19-a249b1bd836a' AND href = $q$/compare/coralogix-vs-honeycomb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$vs Coralogix$q$, $q$/compare/coralogix-vs-honeycomb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5fe9efca-ce0e-4fb2-974d-c293416b1200'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5fe9efca-ce0e-4fb2-974d-c293416b1200' AND href = $q$/compare/coralogix-vs-honeycomb$q$);

-- ── Honeycomb vs Uptrace (honeycomb-vs-uptrace) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', 'e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$honeycomb-vs-uptrace$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$vs Uptrace$q$, $q$/compare/honeycomb-vs-uptrace$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5fe9efca-ce0e-4fb2-974d-c293416b1200'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5fe9efca-ce0e-4fb2-974d-c293416b1200' AND href = $q$/compare/honeycomb-vs-uptrace$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$vs Honeycomb$q$, $q$/compare/honeycomb-vs-uptrace$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e7a0b53e-f0d9-4f9d-ac95-70d431887088'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e7a0b53e-f0d9-4f9d-ac95-70d431887088' AND href = $q$/compare/honeycomb-vs-uptrace$q$);

-- ── Beeceptor vs ReadMe (beeceptor-vs-readme) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', '889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$beeceptor-vs-readme$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$vs ReadMe$q$, $q$/compare/beeceptor-vs-readme$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810' AND href = $q$/compare/beeceptor-vs-readme$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$vs Beeceptor$q$, $q$/compare/beeceptor-vs-readme$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '889a35b0-763a-4ca4-86bc-b657c47e2c33'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '889a35b0-763a-4ca4-86bc-b657c47e2c33' AND href = $q$/compare/beeceptor-vs-readme$q$);

-- ── ReadMe vs VitePress (readme-vs-vitepress) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', '3fb0f468-f238-4fb1-a656-36ced87d1401', $q$readme-vs-vitepress$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$vs VitePress$q$, $q$/compare/readme-vs-vitepress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '889a35b0-763a-4ca4-86bc-b657c47e2c33'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '889a35b0-763a-4ca4-86bc-b657c47e2c33' AND href = $q$/compare/readme-vs-vitepress$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3fb0f468-f238-4fb1-a656-36ced87d1401', $q$vs ReadMe$q$, $q$/compare/readme-vs-vitepress$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401' AND href = $q$/compare/readme-vs-vitepress$q$);


-- Comparison batch: clever-cloud-vs-northflank, justworks-vs-multiplier, oyster-vs-papaya-global, remotepass-vs-workmotion, breathehr-vs-charliehr, charliehr-vs-humaans, fastspring-vs-lemon-squeezy, billsby-vs-metronome, metronome-vs-orb, guru-vs-slab, nuclino-vs-slite, document360-vs-helpjuice, archbee-vs-clickhelp, outline-vs-tettra, chaport-vs-smartsupp, onesignal-vs-pushengage, moengage-vs-webengage, kissflow-vs-pipefy, ninox-vs-stacker, noloco-vs-weweb, process-street-vs-tallyfy, braintree-vs-checkout-com, gocardless-vs-mollie, melio-vs-payoneer, avidxchange-vs-tipalti, cleanshot-x-vs-xnapper, craft-vs-fibery, icims-vs-smartrecruiters, bullhorn-vs-manatal, fetcher-vs-gem, jobvite-vs-pinpoint, apollo-io-vs-zoominfo, instantly-vs-smartlead, lemlist-vs-woodpecker, mailshake-vs-saleshandy, klenty-vs-outplay, amplemarket-vs-warmly, common-room-vs-usergems, kaspr-vs-wiza, hunter-vs-snov-io, cognism-vs-lusha, leadiq-vs-seamless-ai, clay-vs-warmly, cal-com-vs-savvycal, calday-vs-zencal, oncehub-vs-youcanbookme, doodle-vs-rallly, appointlet-vs-setmore, cronofy-vs-zeeg, semgrep-vs-snyk, orca-security-vs-wiz, drata-vs-vanta, sprinto-vs-thoropass, duo-security-vs-jumpcloud, teleport-vs-twingate, strongdm-vs-twingate, gitguardian-vs-socket, aikido-security-vs-astra-security, rapid7-vs-tenable, hyperproof-vs-scrut-automation, snyk-vs-sonarqube-cloud, rank-math-vs-yoast-seo, all-in-one-seo-vs-yoast-seo, keysearch-vs-keyword-insights
-- Publishes 64 comparison page(s) with editorial content.

-- ── Clever Cloud vs Northflank (clever-cloud-vs-northflank) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('040862c3-0d04-4dd4-af23-2164939cfd29', '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb', $q$clever-cloud-vs-northflank$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '040862c3-0d04-4dd4-af23-2164939cfd29', $q$vs Northflank$q$, $q$/compare/clever-cloud-vs-northflank$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '040862c3-0d04-4dd4-af23-2164939cfd29'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '040862c3-0d04-4dd4-af23-2164939cfd29' AND href = $q$/compare/clever-cloud-vs-northflank$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb', $q$vs Clever Cloud$q$, $q$/compare/clever-cloud-vs-northflank$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb' AND href = $q$/compare/clever-cloud-vs-northflank$q$);

-- ── Justworks vs Multiplier (justworks-vs-multiplier) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', 'da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$justworks-vs-multiplier$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$vs Multiplier$q$, $q$/compare/justworks-vs-multiplier$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '938ab555-9fbc-47d8-a414-f6dbfadcc473'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '938ab555-9fbc-47d8-a414-f6dbfadcc473' AND href = $q$/compare/justworks-vs-multiplier$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$vs Justworks$q$, $q$/compare/justworks-vs-multiplier$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'da1eed86-f886-4ac0-9587-89ab0dce35f5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'da1eed86-f886-4ac0-9587-89ab0dce35f5' AND href = $q$/compare/justworks-vs-multiplier$q$);

-- ── Oyster vs Papaya Global (oyster-vs-papaya-global) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', '1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$oyster-vs-papaya-global$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '44ab8232-5537-40f1-b180-862658c8fcf5', $q$vs Papaya Global$q$, $q$/compare/oyster-vs-papaya-global$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '44ab8232-5537-40f1-b180-862658c8fcf5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '44ab8232-5537-40f1-b180-862658c8fcf5' AND href = $q$/compare/oyster-vs-papaya-global$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$vs Oyster$q$, $q$/compare/oyster-vs-papaya-global$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1ccd5534-faa4-40e5-8b15-5ca13db08e2e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1ccd5534-faa4-40e5-8b15-5ca13db08e2e' AND href = $q$/compare/oyster-vs-papaya-global$q$);

-- ── RemotePass vs WorkMotion (remotepass-vs-workmotion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', '1a0ac46b-2692-406a-b868-73e8c7b627db', $q$remotepass-vs-workmotion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ad918d40-0018-4143-a607-5a36dd55baf6', $q$vs WorkMotion$q$, $q$/compare/remotepass-vs-workmotion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ad918d40-0018-4143-a607-5a36dd55baf6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ad918d40-0018-4143-a607-5a36dd55baf6' AND href = $q$/compare/remotepass-vs-workmotion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1a0ac46b-2692-406a-b868-73e8c7b627db', $q$vs RemotePass$q$, $q$/compare/remotepass-vs-workmotion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1a0ac46b-2692-406a-b868-73e8c7b627db'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1a0ac46b-2692-406a-b868-73e8c7b627db' AND href = $q$/compare/remotepass-vs-workmotion$q$);

-- ── BreatheHR vs CharlieHR (breathehr-vs-charliehr) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', '28db2214-8104-44f7-8d16-5482ac920f21', $q$breathehr-vs-charliehr$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$vs CharlieHR$q$, $q$/compare/breathehr-vs-charliehr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91' AND href = $q$/compare/breathehr-vs-charliehr$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28db2214-8104-44f7-8d16-5482ac920f21', $q$vs BreatheHR$q$, $q$/compare/breathehr-vs-charliehr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28db2214-8104-44f7-8d16-5482ac920f21'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28db2214-8104-44f7-8d16-5482ac920f21' AND href = $q$/compare/breathehr-vs-charliehr$q$);

-- ── CharlieHR vs Humaans (charliehr-vs-humaans) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', '263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$charliehr-vs-humaans$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28db2214-8104-44f7-8d16-5482ac920f21', $q$vs Humaans$q$, $q$/compare/charliehr-vs-humaans$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28db2214-8104-44f7-8d16-5482ac920f21'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28db2214-8104-44f7-8d16-5482ac920f21' AND href = $q$/compare/charliehr-vs-humaans$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$vs CharlieHR$q$, $q$/compare/charliehr-vs-humaans$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '263780ad-dbb8-4862-b01a-e1ce95f8fa3a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '263780ad-dbb8-4862-b01a-e1ce95f8fa3a' AND href = $q$/compare/charliehr-vs-humaans$q$);

-- ── FastSpring vs Lemon Squeezy (fastspring-vs-lemon-squeezy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', '38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$fastspring-vs-lemon-squeezy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$vs Lemon Squeezy$q$, $q$/compare/fastspring-vs-lemon-squeezy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e' AND href = $q$/compare/fastspring-vs-lemon-squeezy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$vs FastSpring$q$, $q$/compare/fastspring-vs-lemon-squeezy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '38ebcc23-ac70-4e3b-9657-c3d8f9ce03db'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '38ebcc23-ac70-4e3b-9657-c3d8f9ce03db' AND href = $q$/compare/fastspring-vs-lemon-squeezy$q$);

-- ── Billsby vs Metronome (billsby-vs-metronome) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', '3979638f-c194-4be0-8b95-c01a647146b8', $q$billsby-vs-metronome$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$vs Metronome$q$, $q$/compare/billsby-vs-metronome$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf' AND href = $q$/compare/billsby-vs-metronome$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3979638f-c194-4be0-8b95-c01a647146b8', $q$vs Billsby$q$, $q$/compare/billsby-vs-metronome$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3979638f-c194-4be0-8b95-c01a647146b8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3979638f-c194-4be0-8b95-c01a647146b8' AND href = $q$/compare/billsby-vs-metronome$q$);

-- ── Metronome vs Orb (metronome-vs-orb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', 'a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$metronome-vs-orb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3979638f-c194-4be0-8b95-c01a647146b8', $q$vs Orb$q$, $q$/compare/metronome-vs-orb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3979638f-c194-4be0-8b95-c01a647146b8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3979638f-c194-4be0-8b95-c01a647146b8' AND href = $q$/compare/metronome-vs-orb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$vs Metronome$q$, $q$/compare/metronome-vs-orb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a1062364-3f5b-45dc-b882-5a0283cbb0a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a1062364-3f5b-45dc-b882-5a0283cbb0a9' AND href = $q$/compare/metronome-vs-orb$q$);

-- ── Guru vs Slab (guru-vs-slab) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('79fe800c-3b4a-461b-be9d-1206811b507d', 'c7421519-f70d-433d-a80c-ccd25012d50b', $q$guru-vs-slab$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '79fe800c-3b4a-461b-be9d-1206811b507d', $q$vs Slab$q$, $q$/compare/guru-vs-slab$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '79fe800c-3b4a-461b-be9d-1206811b507d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '79fe800c-3b4a-461b-be9d-1206811b507d' AND href = $q$/compare/guru-vs-slab$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c7421519-f70d-433d-a80c-ccd25012d50b', $q$vs Guru$q$, $q$/compare/guru-vs-slab$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c7421519-f70d-433d-a80c-ccd25012d50b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c7421519-f70d-433d-a80c-ccd25012d50b' AND href = $q$/compare/guru-vs-slab$q$);

-- ── Nuclino vs Slite (nuclino-vs-slite) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('31891521-7412-481e-8809-b74fa059bcf3', 'e4de8a34-adf7-4d4e-8978-1426321c23f0', $q$nuclino-vs-slite$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '31891521-7412-481e-8809-b74fa059bcf3', $q$vs Slite$q$, $q$/compare/nuclino-vs-slite$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '31891521-7412-481e-8809-b74fa059bcf3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '31891521-7412-481e-8809-b74fa059bcf3' AND href = $q$/compare/nuclino-vs-slite$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e4de8a34-adf7-4d4e-8978-1426321c23f0', $q$vs Nuclino$q$, $q$/compare/nuclino-vs-slite$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e4de8a34-adf7-4d4e-8978-1426321c23f0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e4de8a34-adf7-4d4e-8978-1426321c23f0' AND href = $q$/compare/nuclino-vs-slite$q$);

-- ── Document360 vs Helpjuice (document360-vs-helpjuice) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c7727b97-e9ad-4f83-862e-ffc1b256280f', '2632cf96-67cf-472b-ba2a-9e7b8ce56e16', $q$document360-vs-helpjuice$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c7727b97-e9ad-4f83-862e-ffc1b256280f', $q$vs Helpjuice$q$, $q$/compare/document360-vs-helpjuice$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c7727b97-e9ad-4f83-862e-ffc1b256280f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c7727b97-e9ad-4f83-862e-ffc1b256280f' AND href = $q$/compare/document360-vs-helpjuice$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2632cf96-67cf-472b-ba2a-9e7b8ce56e16', $q$vs Document360$q$, $q$/compare/document360-vs-helpjuice$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2632cf96-67cf-472b-ba2a-9e7b8ce56e16'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2632cf96-67cf-472b-ba2a-9e7b8ce56e16' AND href = $q$/compare/document360-vs-helpjuice$q$);

-- ── Archbee vs ClickHelp (archbee-vs-clickhelp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', 'f0712a2a-3c5e-47ea-8501-6e6e45003e44', $q$archbee-vs-clickhelp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0eab6628-ac5f-4215-9f5b-92be748bae51', $q$vs ClickHelp$q$, $q$/compare/archbee-vs-clickhelp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0eab6628-ac5f-4215-9f5b-92be748bae51'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0eab6628-ac5f-4215-9f5b-92be748bae51' AND href = $q$/compare/archbee-vs-clickhelp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0712a2a-3c5e-47ea-8501-6e6e45003e44', $q$vs Archbee$q$, $q$/compare/archbee-vs-clickhelp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0712a2a-3c5e-47ea-8501-6e6e45003e44'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0712a2a-3c5e-47ea-8501-6e6e45003e44' AND href = $q$/compare/archbee-vs-clickhelp$q$);

-- ── Outline vs Tettra (outline-vs-tettra) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3', 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$outline-vs-tettra$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3', $q$vs Tettra$q$, $q$/compare/outline-vs-tettra$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3' AND href = $q$/compare/outline-vs-tettra$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$vs Outline$q$, $q$/compare/outline-vs-tettra$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6' AND href = $q$/compare/outline-vs-tettra$q$);

-- ── Chaport vs Smartsupp (chaport-vs-smartsupp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', 'f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$chaport-vs-smartsupp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$vs Smartsupp$q$, $q$/compare/chaport-vs-smartsupp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '02537e9f-5e3e-4e2f-9b7e-a73669114bd6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '02537e9f-5e3e-4e2f-9b7e-a73669114bd6' AND href = $q$/compare/chaport-vs-smartsupp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$vs Chaport$q$, $q$/compare/chaport-vs-smartsupp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f54afb02-05b6-4fdd-aaff-7d81680e4f4d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f54afb02-05b6-4fdd-aaff-7d81680e4f4d' AND href = $q$/compare/chaport-vs-smartsupp$q$);

-- ── OneSignal vs PushEngage (onesignal-vs-pushengage) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8fe2e620-1117-42fb-88de-78ba0088f595', 'be4ad86d-af43-4e18-94b3-70bb1cb7d4f1', $q$onesignal-vs-pushengage$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8fe2e620-1117-42fb-88de-78ba0088f595', $q$vs PushEngage$q$, $q$/compare/onesignal-vs-pushengage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8fe2e620-1117-42fb-88de-78ba0088f595'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8fe2e620-1117-42fb-88de-78ba0088f595' AND href = $q$/compare/onesignal-vs-pushengage$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'be4ad86d-af43-4e18-94b3-70bb1cb7d4f1', $q$vs OneSignal$q$, $q$/compare/onesignal-vs-pushengage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'be4ad86d-af43-4e18-94b3-70bb1cb7d4f1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'be4ad86d-af43-4e18-94b3-70bb1cb7d4f1' AND href = $q$/compare/onesignal-vs-pushengage$q$);

-- ── MoEngage vs WebEngage (moengage-vs-webengage) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e8e2b2b1-e626-4b69-b056-d2cfa9a442ef', '99f73517-cbd3-40ff-94a7-89a7c44a0b54', $q$moengage-vs-webengage$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e8e2b2b1-e626-4b69-b056-d2cfa9a442ef', $q$vs WebEngage$q$, $q$/compare/moengage-vs-webengage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e8e2b2b1-e626-4b69-b056-d2cfa9a442ef'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e8e2b2b1-e626-4b69-b056-d2cfa9a442ef' AND href = $q$/compare/moengage-vs-webengage$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '99f73517-cbd3-40ff-94a7-89a7c44a0b54', $q$vs MoEngage$q$, $q$/compare/moengage-vs-webengage$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '99f73517-cbd3-40ff-94a7-89a7c44a0b54'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '99f73517-cbd3-40ff-94a7-89a7c44a0b54' AND href = $q$/compare/moengage-vs-webengage$q$);

-- ── Kissflow vs Pipefy (kissflow-vs-pipefy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('20fb5336-a872-4aeb-a58f-5087fa3de0ba', '67b19345-c927-42e2-946a-1bb82ab00b60', $q$kissflow-vs-pipefy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '20fb5336-a872-4aeb-a58f-5087fa3de0ba', $q$vs Pipefy$q$, $q$/compare/kissflow-vs-pipefy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '20fb5336-a872-4aeb-a58f-5087fa3de0ba'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '20fb5336-a872-4aeb-a58f-5087fa3de0ba' AND href = $q$/compare/kissflow-vs-pipefy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '67b19345-c927-42e2-946a-1bb82ab00b60', $q$vs Kissflow$q$, $q$/compare/kissflow-vs-pipefy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '67b19345-c927-42e2-946a-1bb82ab00b60'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '67b19345-c927-42e2-946a-1bb82ab00b60' AND href = $q$/compare/kissflow-vs-pipefy$q$);

-- ── Ninox vs Stacker (ninox-vs-stacker) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b2929b76-2d2c-496e-a42b-392fc1b54699', '443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$ninox-vs-stacker$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b2929b76-2d2c-496e-a42b-392fc1b54699', $q$vs Stacker$q$, $q$/compare/ninox-vs-stacker$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b2929b76-2d2c-496e-a42b-392fc1b54699'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b2929b76-2d2c-496e-a42b-392fc1b54699' AND href = $q$/compare/ninox-vs-stacker$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$vs Ninox$q$, $q$/compare/ninox-vs-stacker$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee' AND href = $q$/compare/ninox-vs-stacker$q$);

-- ── Noloco vs WeWeb (noloco-vs-weweb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f9bc7649-dc5b-4824-b0b4-1f220d996bc3', 'f43a5180-ad73-4b48-95ac-b2cd02106791', $q$noloco-vs-weweb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f9bc7649-dc5b-4824-b0b4-1f220d996bc3', $q$vs WeWeb$q$, $q$/compare/noloco-vs-weweb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f9bc7649-dc5b-4824-b0b4-1f220d996bc3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f9bc7649-dc5b-4824-b0b4-1f220d996bc3' AND href = $q$/compare/noloco-vs-weweb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f43a5180-ad73-4b48-95ac-b2cd02106791', $q$vs Noloco$q$, $q$/compare/noloco-vs-weweb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f43a5180-ad73-4b48-95ac-b2cd02106791'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f43a5180-ad73-4b48-95ac-b2cd02106791' AND href = $q$/compare/noloco-vs-weweb$q$);

-- ── Process Street vs Tallyfy (process-street-vs-tallyfy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('14d1d9d1-5e67-4b61-a083-8bace97b6d67', '117a7e22-499f-462f-92ab-79295cfef946', $q$process-street-vs-tallyfy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '14d1d9d1-5e67-4b61-a083-8bace97b6d67', $q$vs Tallyfy$q$, $q$/compare/process-street-vs-tallyfy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '14d1d9d1-5e67-4b61-a083-8bace97b6d67'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '14d1d9d1-5e67-4b61-a083-8bace97b6d67' AND href = $q$/compare/process-street-vs-tallyfy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '117a7e22-499f-462f-92ab-79295cfef946', $q$vs Process Street$q$, $q$/compare/process-street-vs-tallyfy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '117a7e22-499f-462f-92ab-79295cfef946'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '117a7e22-499f-462f-92ab-79295cfef946' AND href = $q$/compare/process-street-vs-tallyfy$q$);

-- ── Braintree vs Checkout.com (braintree-vs-checkout-com) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', '23986f65-446a-4255-8e2d-e265951f2262', $q$braintree-vs-checkout-com$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '633df78b-c6d3-45d8-a067-207679f3055d', $q$vs Checkout.com$q$, $q$/compare/braintree-vs-checkout-com$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '633df78b-c6d3-45d8-a067-207679f3055d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '633df78b-c6d3-45d8-a067-207679f3055d' AND href = $q$/compare/braintree-vs-checkout-com$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '23986f65-446a-4255-8e2d-e265951f2262', $q$vs Braintree$q$, $q$/compare/braintree-vs-checkout-com$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '23986f65-446a-4255-8e2d-e265951f2262'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '23986f65-446a-4255-8e2d-e265951f2262' AND href = $q$/compare/braintree-vs-checkout-com$q$);

-- ── GoCardless vs Mollie (gocardless-vs-mollie) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', 'd50744af-e272-48a8-a0dc-044078b5dab2', $q$gocardless-vs-mollie$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$vs Mollie$q$, $q$/compare/gocardless-vs-mollie$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '44e76fa8-8fba-447b-a227-c3bb42e2b74f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '44e76fa8-8fba-447b-a227-c3bb42e2b74f' AND href = $q$/compare/gocardless-vs-mollie$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd50744af-e272-48a8-a0dc-044078b5dab2', $q$vs GoCardless$q$, $q$/compare/gocardless-vs-mollie$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd50744af-e272-48a8-a0dc-044078b5dab2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd50744af-e272-48a8-a0dc-044078b5dab2' AND href = $q$/compare/gocardless-vs-mollie$q$);

-- ── Melio vs Payoneer (melio-vs-payoneer) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', 'f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$melio-vs-payoneer$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '849e570b-901b-439e-b55b-ab7c7b657c2c', $q$vs Payoneer$q$, $q$/compare/melio-vs-payoneer$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '849e570b-901b-439e-b55b-ab7c7b657c2c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '849e570b-901b-439e-b55b-ab7c7b657c2c' AND href = $q$/compare/melio-vs-payoneer$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$vs Melio$q$, $q$/compare/melio-vs-payoneer$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f63dc78f-9d0d-4816-9ca0-858dd2947329'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f63dc78f-9d0d-4816-9ca0-858dd2947329' AND href = $q$/compare/melio-vs-payoneer$q$);

-- ── AvidXchange vs Tipalti (avidxchange-vs-tipalti) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', '3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$avidxchange-vs-tipalti$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5893a7aa-99e0-4440-9c42-21e023145c91', $q$vs Tipalti$q$, $q$/compare/avidxchange-vs-tipalti$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5893a7aa-99e0-4440-9c42-21e023145c91'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5893a7aa-99e0-4440-9c42-21e023145c91' AND href = $q$/compare/avidxchange-vs-tipalti$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$vs AvidXchange$q$, $q$/compare/avidxchange-vs-tipalti$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3cb98c1a-15c7-489f-9a78-52137ee7cc38'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3cb98c1a-15c7-489f-9a78-52137ee7cc38' AND href = $q$/compare/avidxchange-vs-tipalti$q$);

-- ── CleanShot X vs Xnapper (cleanshot-x-vs-xnapper) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', '75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$cleanshot-x-vs-xnapper$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$vs Xnapper$q$, $q$/compare/cleanshot-x-vs-xnapper$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e49a063e-cf60-43ca-ac4b-f2c2740a9b67'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e49a063e-cf60-43ca-ac4b-f2c2740a9b67' AND href = $q$/compare/cleanshot-x-vs-xnapper$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$vs CleanShot X$q$, $q$/compare/cleanshot-x-vs-xnapper$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '75b7cec6-4a39-4456-8f5f-bb719bb42775'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '75b7cec6-4a39-4456-8f5f-bb719bb42775' AND href = $q$/compare/cleanshot-x-vs-xnapper$q$);

-- ── Craft vs Fibery (craft-vs-fibery) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c7ea5abe-ea46-4e4c-b5e4-246810a1c777', '5c2ab174-aec9-445e-96e3-c908a6741904', $q$craft-vs-fibery$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c7ea5abe-ea46-4e4c-b5e4-246810a1c777', $q$vs Fibery$q$, $q$/compare/craft-vs-fibery$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c7ea5abe-ea46-4e4c-b5e4-246810a1c777'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c7ea5abe-ea46-4e4c-b5e4-246810a1c777' AND href = $q$/compare/craft-vs-fibery$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5c2ab174-aec9-445e-96e3-c908a6741904', $q$vs Craft$q$, $q$/compare/craft-vs-fibery$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5c2ab174-aec9-445e-96e3-c908a6741904'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5c2ab174-aec9-445e-96e3-c908a6741904' AND href = $q$/compare/craft-vs-fibery$q$);

-- ── iCIMS vs SmartRecruiters (icims-vs-smartrecruiters) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', '7018fde8-f2e0-455a-ae95-59b95db2c107', $q$icims-vs-smartrecruiters$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$vs SmartRecruiters$q$, $q$/compare/icims-vs-smartrecruiters$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'af2f837c-b8e2-4cf6-bb19-100a26c709af'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'af2f837c-b8e2-4cf6-bb19-100a26c709af' AND href = $q$/compare/icims-vs-smartrecruiters$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7018fde8-f2e0-455a-ae95-59b95db2c107', $q$vs iCIMS$q$, $q$/compare/icims-vs-smartrecruiters$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7018fde8-f2e0-455a-ae95-59b95db2c107'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7018fde8-f2e0-455a-ae95-59b95db2c107' AND href = $q$/compare/icims-vs-smartrecruiters$q$);

-- ── Bullhorn vs Manatal (bullhorn-vs-manatal) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', 'd4790e8a-5afa-40c4-9e80-1e6489a84434', $q$bullhorn-vs-manatal$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$vs Manatal$q$, $q$/compare/bullhorn-vs-manatal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9' AND href = $q$/compare/bullhorn-vs-manatal$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd4790e8a-5afa-40c4-9e80-1e6489a84434', $q$vs Bullhorn$q$, $q$/compare/bullhorn-vs-manatal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd4790e8a-5afa-40c4-9e80-1e6489a84434'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd4790e8a-5afa-40c4-9e80-1e6489a84434' AND href = $q$/compare/bullhorn-vs-manatal$q$);

-- ── Fetcher vs Gem (fetcher-vs-gem) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', '3ade06e5-b645-47e5-8350-a2890ac101e4', $q$fetcher-vs-gem$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$vs Gem$q$, $q$/compare/fetcher-vs-gem$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2' AND href = $q$/compare/fetcher-vs-gem$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3ade06e5-b645-47e5-8350-a2890ac101e4', $q$vs Fetcher$q$, $q$/compare/fetcher-vs-gem$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3ade06e5-b645-47e5-8350-a2890ac101e4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3ade06e5-b645-47e5-8350-a2890ac101e4' AND href = $q$/compare/fetcher-vs-gem$q$);

-- ── Jobvite vs Pinpoint (jobvite-vs-pinpoint) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', '1850649f-0915-4e09-87b7-b7aa588ddd00', $q$jobvite-vs-pinpoint$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$vs Pinpoint$q$, $q$/compare/jobvite-vs-pinpoint$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '06eb9255-8dff-49b4-92cb-b6dfc17d5493'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '06eb9255-8dff-49b4-92cb-b6dfc17d5493' AND href = $q$/compare/jobvite-vs-pinpoint$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1850649f-0915-4e09-87b7-b7aa588ddd00', $q$vs Jobvite$q$, $q$/compare/jobvite-vs-pinpoint$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1850649f-0915-4e09-87b7-b7aa588ddd00'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1850649f-0915-4e09-87b7-b7aa588ddd00' AND href = $q$/compare/jobvite-vs-pinpoint$q$);

-- ── Apollo.io vs ZoomInfo (apollo-io-vs-zoominfo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', 'ca7fc750-3534-46bb-99e5-aed53ba7b5c8', $q$apollo-io-vs-zoominfo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '18089863-a0de-4693-8d26-13ead8c01a88', $q$vs ZoomInfo$q$, $q$/compare/apollo-io-vs-zoominfo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88' AND href = $q$/compare/apollo-io-vs-zoominfo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ca7fc750-3534-46bb-99e5-aed53ba7b5c8', $q$vs Apollo.io$q$, $q$/compare/apollo-io-vs-zoominfo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ca7fc750-3534-46bb-99e5-aed53ba7b5c8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ca7fc750-3534-46bb-99e5-aed53ba7b5c8' AND href = $q$/compare/apollo-io-vs-zoominfo$q$);

-- ── Instantly vs Smartlead (instantly-vs-smartlead) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('83d74d9a-40c7-43db-b149-f6f2fdadf0e5', '7593c957-95bc-41e2-b981-f617ce468030', $q$instantly-vs-smartlead$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '83d74d9a-40c7-43db-b149-f6f2fdadf0e5', $q$vs Smartlead$q$, $q$/compare/instantly-vs-smartlead$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '83d74d9a-40c7-43db-b149-f6f2fdadf0e5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '83d74d9a-40c7-43db-b149-f6f2fdadf0e5' AND href = $q$/compare/instantly-vs-smartlead$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7593c957-95bc-41e2-b981-f617ce468030', $q$vs Instantly$q$, $q$/compare/instantly-vs-smartlead$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7593c957-95bc-41e2-b981-f617ce468030'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7593c957-95bc-41e2-b981-f617ce468030' AND href = $q$/compare/instantly-vs-smartlead$q$);

-- ── Lemlist vs Woodpecker (lemlist-vs-woodpecker) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('15ddf167-bf8b-4750-8dd7-0a160f126943', '9716dcf4-3238-4e9c-b8bc-c5a16aa3e250', $q$lemlist-vs-woodpecker$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '15ddf167-bf8b-4750-8dd7-0a160f126943', $q$vs Woodpecker$q$, $q$/compare/lemlist-vs-woodpecker$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '15ddf167-bf8b-4750-8dd7-0a160f126943'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '15ddf167-bf8b-4750-8dd7-0a160f126943' AND href = $q$/compare/lemlist-vs-woodpecker$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9716dcf4-3238-4e9c-b8bc-c5a16aa3e250', $q$vs Lemlist$q$, $q$/compare/lemlist-vs-woodpecker$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9716dcf4-3238-4e9c-b8bc-c5a16aa3e250'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9716dcf4-3238-4e9c-b8bc-c5a16aa3e250' AND href = $q$/compare/lemlist-vs-woodpecker$q$);

-- ── Mailshake vs Saleshandy (mailshake-vs-saleshandy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7a471ce8-ee50-4dac-866b-2e8ef45618fa', '76fff3bb-4eec-44a2-9bbd-0790b17495c7', $q$mailshake-vs-saleshandy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7a471ce8-ee50-4dac-866b-2e8ef45618fa', $q$vs Saleshandy$q$, $q$/compare/mailshake-vs-saleshandy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7a471ce8-ee50-4dac-866b-2e8ef45618fa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7a471ce8-ee50-4dac-866b-2e8ef45618fa' AND href = $q$/compare/mailshake-vs-saleshandy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '76fff3bb-4eec-44a2-9bbd-0790b17495c7', $q$vs Mailshake$q$, $q$/compare/mailshake-vs-saleshandy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '76fff3bb-4eec-44a2-9bbd-0790b17495c7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '76fff3bb-4eec-44a2-9bbd-0790b17495c7' AND href = $q$/compare/mailshake-vs-saleshandy$q$);

-- ── Klenty vs Outplay (klenty-vs-outplay) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6ea439db-0c8a-4902-ad45-6e5684c0f9ee', '909a6d6a-53a7-4fd9-8771-f0bad14e7055', $q$klenty-vs-outplay$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6ea439db-0c8a-4902-ad45-6e5684c0f9ee', $q$vs Outplay$q$, $q$/compare/klenty-vs-outplay$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6ea439db-0c8a-4902-ad45-6e5684c0f9ee'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6ea439db-0c8a-4902-ad45-6e5684c0f9ee' AND href = $q$/compare/klenty-vs-outplay$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '909a6d6a-53a7-4fd9-8771-f0bad14e7055', $q$vs Klenty$q$, $q$/compare/klenty-vs-outplay$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '909a6d6a-53a7-4fd9-8771-f0bad14e7055'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '909a6d6a-53a7-4fd9-8771-f0bad14e7055' AND href = $q$/compare/klenty-vs-outplay$q$);

-- ── Amplemarket vs Warmly (amplemarket-vs-warmly) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', '4acb5d47-918c-44a6-ad53-de5ddb07110f', $q$amplemarket-vs-warmly$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$vs Warmly$q$, $q$/compare/amplemarket-vs-warmly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a' AND href = $q$/compare/amplemarket-vs-warmly$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4acb5d47-918c-44a6-ad53-de5ddb07110f', $q$vs Amplemarket$q$, $q$/compare/amplemarket-vs-warmly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4acb5d47-918c-44a6-ad53-de5ddb07110f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4acb5d47-918c-44a6-ad53-de5ddb07110f' AND href = $q$/compare/amplemarket-vs-warmly$q$);

-- ── Common Room vs UserGems (common-room-vs-usergems) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ba720441-8cc7-4c09-b643-008d959f36c9', 'e257953a-6b46-421c-9a74-ccd15dc7c9a2', $q$common-room-vs-usergems$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ba720441-8cc7-4c09-b643-008d959f36c9', $q$vs UserGems$q$, $q$/compare/common-room-vs-usergems$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ba720441-8cc7-4c09-b643-008d959f36c9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ba720441-8cc7-4c09-b643-008d959f36c9' AND href = $q$/compare/common-room-vs-usergems$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e257953a-6b46-421c-9a74-ccd15dc7c9a2', $q$vs Common Room$q$, $q$/compare/common-room-vs-usergems$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e257953a-6b46-421c-9a74-ccd15dc7c9a2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e257953a-6b46-421c-9a74-ccd15dc7c9a2' AND href = $q$/compare/common-room-vs-usergems$q$);

-- ── Kaspr vs Wiza (kaspr-vs-wiza) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5019ca62-2bfd-4c78-a7e8-0c678cbbaa68', '5118dfca-71e6-4897-bbc7-33e7b849b457', $q$kaspr-vs-wiza$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5019ca62-2bfd-4c78-a7e8-0c678cbbaa68', $q$vs Wiza$q$, $q$/compare/kaspr-vs-wiza$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5019ca62-2bfd-4c78-a7e8-0c678cbbaa68'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5019ca62-2bfd-4c78-a7e8-0c678cbbaa68' AND href = $q$/compare/kaspr-vs-wiza$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5118dfca-71e6-4897-bbc7-33e7b849b457', $q$vs Kaspr$q$, $q$/compare/kaspr-vs-wiza$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5118dfca-71e6-4897-bbc7-33e7b849b457'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5118dfca-71e6-4897-bbc7-33e7b849b457' AND href = $q$/compare/kaspr-vs-wiza$q$);

-- ── Hunter vs Snov.io (hunter-vs-snov-io) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('572625cb-f9cb-4961-b33c-f1f81f45c14d', 'e8093051-703e-41a0-bd92-e48c69e925b9', $q$hunter-vs-snov-io$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '572625cb-f9cb-4961-b33c-f1f81f45c14d', $q$vs Snov.io$q$, $q$/compare/hunter-vs-snov-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '572625cb-f9cb-4961-b33c-f1f81f45c14d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '572625cb-f9cb-4961-b33c-f1f81f45c14d' AND href = $q$/compare/hunter-vs-snov-io$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e8093051-703e-41a0-bd92-e48c69e925b9', $q$vs Hunter$q$, $q$/compare/hunter-vs-snov-io$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e8093051-703e-41a0-bd92-e48c69e925b9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e8093051-703e-41a0-bd92-e48c69e925b9' AND href = $q$/compare/hunter-vs-snov-io$q$);

-- ── Cognism vs Lusha (cognism-vs-lusha) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('48c4e035-ee4a-4d7c-9e7a-7d9f3a3f6d4e', 'cb38ef74-ed67-4950-a546-3ece2c203f18', $q$cognism-vs-lusha$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '48c4e035-ee4a-4d7c-9e7a-7d9f3a3f6d4e', $q$vs Lusha$q$, $q$/compare/cognism-vs-lusha$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '48c4e035-ee4a-4d7c-9e7a-7d9f3a3f6d4e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '48c4e035-ee4a-4d7c-9e7a-7d9f3a3f6d4e' AND href = $q$/compare/cognism-vs-lusha$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cb38ef74-ed67-4950-a546-3ece2c203f18', $q$vs Cognism$q$, $q$/compare/cognism-vs-lusha$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cb38ef74-ed67-4950-a546-3ece2c203f18'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cb38ef74-ed67-4950-a546-3ece2c203f18' AND href = $q$/compare/cognism-vs-lusha$q$);

-- ── LeadIQ vs Seamless.AI (leadiq-vs-seamless-ai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('88b216db-d52e-49cb-b940-093f9a2044aa', 'c106a3ac-ef7c-4e45-a70c-a482ca2fea51', $q$leadiq-vs-seamless-ai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '88b216db-d52e-49cb-b940-093f9a2044aa', $q$vs Seamless.AI$q$, $q$/compare/leadiq-vs-seamless-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '88b216db-d52e-49cb-b940-093f9a2044aa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '88b216db-d52e-49cb-b940-093f9a2044aa' AND href = $q$/compare/leadiq-vs-seamless-ai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c106a3ac-ef7c-4e45-a70c-a482ca2fea51', $q$vs LeadIQ$q$, $q$/compare/leadiq-vs-seamless-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c106a3ac-ef7c-4e45-a70c-a482ca2fea51'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c106a3ac-ef7c-4e45-a70c-a482ca2fea51' AND href = $q$/compare/leadiq-vs-seamless-ai$q$);

-- ── Clay vs Warmly (clay-vs-warmly) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c5a72856-c532-4882-bce1-c4c3664d929b', '4acb5d47-918c-44a6-ad53-de5ddb07110f', $q$clay-vs-warmly$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c5a72856-c532-4882-bce1-c4c3664d929b', $q$vs Warmly$q$, $q$/compare/clay-vs-warmly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c5a72856-c532-4882-bce1-c4c3664d929b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c5a72856-c532-4882-bce1-c4c3664d929b' AND href = $q$/compare/clay-vs-warmly$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4acb5d47-918c-44a6-ad53-de5ddb07110f', $q$vs Clay$q$, $q$/compare/clay-vs-warmly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4acb5d47-918c-44a6-ad53-de5ddb07110f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4acb5d47-918c-44a6-ad53-de5ddb07110f' AND href = $q$/compare/clay-vs-warmly$q$);

-- ── Cal.com vs SavvyCal (cal-com-vs-savvycal) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', '7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$cal-com-vs-savvycal$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$vs SavvyCal$q$, $q$/compare/cal-com-vs-savvycal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7' AND href = $q$/compare/cal-com-vs-savvycal$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$vs Cal.com$q$, $q$/compare/cal-com-vs-savvycal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7bb0117d-0174-4a18-963f-a0a873a4b2b1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7bb0117d-0174-4a18-963f-a0a873a4b2b1' AND href = $q$/compare/cal-com-vs-savvycal$q$);

-- ── Calday vs Zencal (calday-vs-zencal) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', 'bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$calday-vs-zencal$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$vs Zencal$q$, $q$/compare/calday-vs-zencal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '59765ae5-0390-4cfe-8c3d-77fc6b87aa0d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '59765ae5-0390-4cfe-8c3d-77fc6b87aa0d' AND href = $q$/compare/calday-vs-zencal$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$vs Calday$q$, $q$/compare/calday-vs-zencal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bef9e8d8-86d1-4254-b054-8fdc286672d5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bef9e8d8-86d1-4254-b054-8fdc286672d5' AND href = $q$/compare/calday-vs-zencal$q$);

-- ── OnceHub vs YouCanBookMe (oncehub-vs-youcanbookme) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', '523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$oncehub-vs-youcanbookme$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$vs YouCanBookMe$q$, $q$/compare/oncehub-vs-youcanbookme$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bde29d40-4c62-40a8-861e-ba3a8862dedc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bde29d40-4c62-40a8-861e-ba3a8862dedc' AND href = $q$/compare/oncehub-vs-youcanbookme$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$vs OnceHub$q$, $q$/compare/oncehub-vs-youcanbookme$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '523ab821-6dbc-4f0a-ad9c-477f20ab7e52'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '523ab821-6dbc-4f0a-ad9c-477f20ab7e52' AND href = $q$/compare/oncehub-vs-youcanbookme$q$);

-- ── Doodle vs rallly (doodle-vs-rallly) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', '03916389-8c72-4b6c-ac5d-c652f169146c', $q$doodle-vs-rallly$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f952f07d-b3f7-4527-af58-4d07608f83cf', $q$vs rallly$q$, $q$/compare/doodle-vs-rallly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f952f07d-b3f7-4527-af58-4d07608f83cf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f952f07d-b3f7-4527-af58-4d07608f83cf' AND href = $q$/compare/doodle-vs-rallly$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '03916389-8c72-4b6c-ac5d-c652f169146c', $q$vs Doodle$q$, $q$/compare/doodle-vs-rallly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '03916389-8c72-4b6c-ac5d-c652f169146c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '03916389-8c72-4b6c-ac5d-c652f169146c' AND href = $q$/compare/doodle-vs-rallly$q$);

-- ── Appointlet vs Setmore (appointlet-vs-setmore) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', 'd498e2a2-205f-436a-b281-0d60d3a97b18', $q$appointlet-vs-setmore$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$vs Setmore$q$, $q$/compare/appointlet-vs-setmore$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc' AND href = $q$/compare/appointlet-vs-setmore$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd498e2a2-205f-436a-b281-0d60d3a97b18', $q$vs Appointlet$q$, $q$/compare/appointlet-vs-setmore$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd498e2a2-205f-436a-b281-0d60d3a97b18'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd498e2a2-205f-436a-b281-0d60d3a97b18' AND href = $q$/compare/appointlet-vs-setmore$q$);

-- ── Cronofy vs Zeeg (cronofy-vs-zeeg) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', '3be42f56-bb10-429e-833e-4732e857fc3a', $q$cronofy-vs-zeeg$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$vs Zeeg$q$, $q$/compare/cronofy-vs-zeeg$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6e0d85c-8664-4863-9ef9-fd20448bffd6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6e0d85c-8664-4863-9ef9-fd20448bffd6' AND href = $q$/compare/cronofy-vs-zeeg$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3be42f56-bb10-429e-833e-4732e857fc3a', $q$vs Cronofy$q$, $q$/compare/cronofy-vs-zeeg$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3be42f56-bb10-429e-833e-4732e857fc3a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3be42f56-bb10-429e-833e-4732e857fc3a' AND href = $q$/compare/cronofy-vs-zeeg$q$);

-- ── Semgrep vs Snyk (semgrep-vs-snyk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', '7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$semgrep-vs-snyk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$vs Snyk$q$, $q$/compare/semgrep-vs-snyk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7b87aa12-a696-4762-9cbd-1a738f0fd2c7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7b87aa12-a696-4762-9cbd-1a738f0fd2c7' AND href = $q$/compare/semgrep-vs-snyk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$vs Semgrep$q$, $q$/compare/semgrep-vs-snyk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8' AND href = $q$/compare/semgrep-vs-snyk$q$);

-- ── Orca Security vs Wiz (orca-security-vs-wiz) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', 'e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$orca-security-vs-wiz$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'de412e9f-bb56-438d-8972-125d8b06d414', $q$vs Wiz$q$, $q$/compare/orca-security-vs-wiz$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'de412e9f-bb56-438d-8972-125d8b06d414'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'de412e9f-bb56-438d-8972-125d8b06d414' AND href = $q$/compare/orca-security-vs-wiz$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$vs Orca Security$q$, $q$/compare/orca-security-vs-wiz$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4' AND href = $q$/compare/orca-security-vs-wiz$q$);

-- ── Drata vs Vanta (drata-vs-vanta) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', 'afc32d91-8855-4308-bcef-20828d9e78e2', $q$drata-vs-vanta$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b0661eaf-0146-4993-862a-300b62279f7d', $q$vs Vanta$q$, $q$/compare/drata-vs-vanta$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b0661eaf-0146-4993-862a-300b62279f7d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b0661eaf-0146-4993-862a-300b62279f7d' AND href = $q$/compare/drata-vs-vanta$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'afc32d91-8855-4308-bcef-20828d9e78e2', $q$vs Drata$q$, $q$/compare/drata-vs-vanta$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'afc32d91-8855-4308-bcef-20828d9e78e2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'afc32d91-8855-4308-bcef-20828d9e78e2' AND href = $q$/compare/drata-vs-vanta$q$);

-- ── Sprinto vs Thoropass (sprinto-vs-thoropass) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', '39e085ba-918c-440b-8ad4-af576ba5ba03', $q$sprinto-vs-thoropass$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$vs Thoropass$q$, $q$/compare/sprinto-vs-thoropass$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '01db3fa1-4544-4df3-b94a-c8779f0ed121'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '01db3fa1-4544-4df3-b94a-c8779f0ed121' AND href = $q$/compare/sprinto-vs-thoropass$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '39e085ba-918c-440b-8ad4-af576ba5ba03', $q$vs Sprinto$q$, $q$/compare/sprinto-vs-thoropass$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '39e085ba-918c-440b-8ad4-af576ba5ba03'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '39e085ba-918c-440b-8ad4-af576ba5ba03' AND href = $q$/compare/sprinto-vs-thoropass$q$);

-- ── Duo Security vs JumpCloud (duo-security-vs-jumpcloud) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', 'e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$duo-security-vs-jumpcloud$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$vs JumpCloud$q$, $q$/compare/duo-security-vs-jumpcloud$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '70bf6be7-f47b-4ba4-936b-47ece1be0301'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '70bf6be7-f47b-4ba4-936b-47ece1be0301' AND href = $q$/compare/duo-security-vs-jumpcloud$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$vs Duo Security$q$, $q$/compare/duo-security-vs-jumpcloud$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb' AND href = $q$/compare/duo-security-vs-jumpcloud$q$);

-- ── Teleport vs Twingate (teleport-vs-twingate) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', 'b790465f-8d9b-4776-8b1b-364273fb48a0', $q$teleport-vs-twingate$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '621c1563-301c-4006-9dc0-beb9d7803b61', $q$vs Twingate$q$, $q$/compare/teleport-vs-twingate$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '621c1563-301c-4006-9dc0-beb9d7803b61'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '621c1563-301c-4006-9dc0-beb9d7803b61' AND href = $q$/compare/teleport-vs-twingate$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b790465f-8d9b-4776-8b1b-364273fb48a0', $q$vs Teleport$q$, $q$/compare/teleport-vs-twingate$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b790465f-8d9b-4776-8b1b-364273fb48a0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b790465f-8d9b-4776-8b1b-364273fb48a0' AND href = $q$/compare/teleport-vs-twingate$q$);

-- ── StrongDM vs Twingate (strongdm-vs-twingate) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', 'b790465f-8d9b-4776-8b1b-364273fb48a0', $q$strongdm-vs-twingate$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$vs Twingate$q$, $q$/compare/strongdm-vs-twingate$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3a50e7f9-8dac-4f95-a6a8-044c2a5b961d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3a50e7f9-8dac-4f95-a6a8-044c2a5b961d' AND href = $q$/compare/strongdm-vs-twingate$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b790465f-8d9b-4776-8b1b-364273fb48a0', $q$vs StrongDM$q$, $q$/compare/strongdm-vs-twingate$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b790465f-8d9b-4776-8b1b-364273fb48a0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b790465f-8d9b-4776-8b1b-364273fb48a0' AND href = $q$/compare/strongdm-vs-twingate$q$);

-- ── GitGuardian vs Socket (gitguardian-vs-socket) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', '95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$gitguardian-vs-socket$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$vs Socket$q$, $q$/compare/gitguardian-vs-socket$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f79bb617-e492-4f3f-b2e0-6a6ffd43dc71'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f79bb617-e492-4f3f-b2e0-6a6ffd43dc71' AND href = $q$/compare/gitguardian-vs-socket$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$vs GitGuardian$q$, $q$/compare/gitguardian-vs-socket$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f' AND href = $q$/compare/gitguardian-vs-socket$q$);

-- ── Aikido Security vs Astra Security (aikido-security-vs-astra-security) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$aikido-security-vs-astra-security$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '500f337a-c890-4561-b62d-d9dfd247fbc6', $q$vs Astra Security$q$, $q$/compare/aikido-security-vs-astra-security$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '500f337a-c890-4561-b62d-d9dfd247fbc6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '500f337a-c890-4561-b62d-d9dfd247fbc6' AND href = $q$/compare/aikido-security-vs-astra-security$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$vs Aikido Security$q$, $q$/compare/aikido-security-vs-astra-security$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6' AND href = $q$/compare/aikido-security-vs-astra-security$q$);

-- ── Rapid7 vs Tenable (rapid7-vs-tenable) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$rapid7-vs-tenable$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$vs Tenable$q$, $q$/compare/rapid7-vs-tenable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '13b772a5-dcc4-4861-96b2-092a5abf26bb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '13b772a5-dcc4-4861-96b2-092a5abf26bb' AND href = $q$/compare/rapid7-vs-tenable$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$vs Rapid7$q$, $q$/compare/rapid7-vs-tenable$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406' AND href = $q$/compare/rapid7-vs-tenable$q$);

-- ── Hyperproof vs Scrut Automation (hyperproof-vs-scrut-automation) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', '52bf5267-89af-4200-b109-d8ec448cc105', $q$hyperproof-vs-scrut-automation$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0412c80c-5647-4376-b362-9ccece4ef8e5', $q$vs Scrut Automation$q$, $q$/compare/hyperproof-vs-scrut-automation$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0412c80c-5647-4376-b362-9ccece4ef8e5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0412c80c-5647-4376-b362-9ccece4ef8e5' AND href = $q$/compare/hyperproof-vs-scrut-automation$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '52bf5267-89af-4200-b109-d8ec448cc105', $q$vs Hyperproof$q$, $q$/compare/hyperproof-vs-scrut-automation$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '52bf5267-89af-4200-b109-d8ec448cc105'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '52bf5267-89af-4200-b109-d8ec448cc105' AND href = $q$/compare/hyperproof-vs-scrut-automation$q$);

-- ── Snyk vs SonarQube Cloud (snyk-vs-sonarqube-cloud) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', '19756a8e-09b5-44fb-801b-926184dbba14', $q$snyk-vs-sonarqube-cloud$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$vs SonarQube Cloud$q$, $q$/compare/snyk-vs-sonarqube-cloud$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8' AND href = $q$/compare/snyk-vs-sonarqube-cloud$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '19756a8e-09b5-44fb-801b-926184dbba14', $q$vs Snyk$q$, $q$/compare/snyk-vs-sonarqube-cloud$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '19756a8e-09b5-44fb-801b-926184dbba14'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '19756a8e-09b5-44fb-801b-926184dbba14' AND href = $q$/compare/snyk-vs-sonarqube-cloud$q$);

-- ── Rank Math vs Yoast SEO (rank-math-vs-yoast-seo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c0b93c88-b6a7-4966-a55f-54c933658952', '2490007c-e3b7-41a2-a1fb-ad0b93df009d', $q$rank-math-vs-yoast-seo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c0b93c88-b6a7-4966-a55f-54c933658952', $q$vs Yoast SEO$q$, $q$/compare/rank-math-vs-yoast-seo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c0b93c88-b6a7-4966-a55f-54c933658952'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c0b93c88-b6a7-4966-a55f-54c933658952' AND href = $q$/compare/rank-math-vs-yoast-seo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2490007c-e3b7-41a2-a1fb-ad0b93df009d', $q$vs Rank Math$q$, $q$/compare/rank-math-vs-yoast-seo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2490007c-e3b7-41a2-a1fb-ad0b93df009d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2490007c-e3b7-41a2-a1fb-ad0b93df009d' AND href = $q$/compare/rank-math-vs-yoast-seo$q$);

-- ── All in One SEO vs Yoast SEO (all-in-one-seo-vs-yoast-seo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('945d46de-1541-423b-ad90-a8381853daad', '2490007c-e3b7-41a2-a1fb-ad0b93df009d', $q$all-in-one-seo-vs-yoast-seo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '945d46de-1541-423b-ad90-a8381853daad', $q$vs Yoast SEO$q$, $q$/compare/all-in-one-seo-vs-yoast-seo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '945d46de-1541-423b-ad90-a8381853daad'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '945d46de-1541-423b-ad90-a8381853daad' AND href = $q$/compare/all-in-one-seo-vs-yoast-seo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2490007c-e3b7-41a2-a1fb-ad0b93df009d', $q$vs All in One SEO$q$, $q$/compare/all-in-one-seo-vs-yoast-seo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2490007c-e3b7-41a2-a1fb-ad0b93df009d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2490007c-e3b7-41a2-a1fb-ad0b93df009d' AND href = $q$/compare/all-in-one-seo-vs-yoast-seo$q$);

-- ── Keysearch vs Keyword Insights (keysearch-vs-keyword-insights) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6902e4ce-4e99-4913-bcb5-bbb569db7b67', '017afd53-6702-45ee-8be8-f9561ba970a4', $q$keysearch-vs-keyword-insights$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6902e4ce-4e99-4913-bcb5-bbb569db7b67', $q$vs Keyword Insights$q$, $q$/compare/keysearch-vs-keyword-insights$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6902e4ce-4e99-4913-bcb5-bbb569db7b67'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6902e4ce-4e99-4913-bcb5-bbb569db7b67' AND href = $q$/compare/keysearch-vs-keyword-insights$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '017afd53-6702-45ee-8be8-f9561ba970a4', $q$vs Keysearch$q$, $q$/compare/keysearch-vs-keyword-insights$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '017afd53-6702-45ee-8be8-f9561ba970a4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '017afd53-6702-45ee-8be8-f9561ba970a4' AND href = $q$/compare/keysearch-vs-keyword-insights$q$);


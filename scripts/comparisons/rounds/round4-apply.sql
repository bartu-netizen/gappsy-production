-- Comparison batch: accuranker-vs-wincher, advanced-web-ranking-vs-nightwatch, oncrawl-vs-sitebulb, botify-vs-lumar, seobility-vs-woorank, dashword-vs-growthbar, accuranker-vs-proranktracker, hypefury-vs-taplio, tweethunter-vs-typefully, awario-vs-brand24, plann-vs-sked-social, contentstudio-vs-feedhive, meetedgar-vs-recurpost, ocoya-vs-pallyy, rival-iq-vs-social-blade, morningfame-vs-vidiq, repurpose-io-vs-statusbrew, camtasia-vs-screenflow, screen-studio-vs-tella, jitter-vs-shots, jimdo-vs-strikingly, site123-vs-webnode, readymag-vs-tilda, siter-io-vs-unicorn-platform, format-vs-pixpa, typedream-vs-ucraft
-- Publishes 26 comparison page(s) with editorial content.

-- ── AccuRanker vs Wincher (accuranker-vs-wincher) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', '758cebc7-97dc-4ae8-9b04-1a2c822140e0', $q$accuranker-vs-wincher$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '324f0aed-4d17-4a2b-951a-1b9488398905', $q$vs Wincher$q$, $q$/compare/accuranker-vs-wincher$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905' AND href = $q$/compare/accuranker-vs-wincher$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '758cebc7-97dc-4ae8-9b04-1a2c822140e0', $q$vs AccuRanker$q$, $q$/compare/accuranker-vs-wincher$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '758cebc7-97dc-4ae8-9b04-1a2c822140e0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '758cebc7-97dc-4ae8-9b04-1a2c822140e0' AND href = $q$/compare/accuranker-vs-wincher$q$);

-- ── Advanced Web Ranking vs Nightwatch (advanced-web-ranking-vs-nightwatch) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', 'f0a86c30-0218-4428-94b5-d143c569c1a2', $q$advanced-web-ranking-vs-nightwatch$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$vs Nightwatch$q$, $q$/compare/advanced-web-ranking-vs-nightwatch$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46' AND href = $q$/compare/advanced-web-ranking-vs-nightwatch$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0a86c30-0218-4428-94b5-d143c569c1a2', $q$vs Advanced Web Ranking$q$, $q$/compare/advanced-web-ranking-vs-nightwatch$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0a86c30-0218-4428-94b5-d143c569c1a2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0a86c30-0218-4428-94b5-d143c569c1a2' AND href = $q$/compare/advanced-web-ranking-vs-nightwatch$q$);

-- ── Oncrawl vs Sitebulb (oncrawl-vs-sitebulb) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bb746904-348f-44b6-aca5-49626cad1b9a', '578e0b1c-942b-4b1c-95fa-56e1bee56a20', $q$oncrawl-vs-sitebulb$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bb746904-348f-44b6-aca5-49626cad1b9a', $q$vs Sitebulb$q$, $q$/compare/oncrawl-vs-sitebulb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bb746904-348f-44b6-aca5-49626cad1b9a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bb746904-348f-44b6-aca5-49626cad1b9a' AND href = $q$/compare/oncrawl-vs-sitebulb$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '578e0b1c-942b-4b1c-95fa-56e1bee56a20', $q$vs Oncrawl$q$, $q$/compare/oncrawl-vs-sitebulb$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '578e0b1c-942b-4b1c-95fa-56e1bee56a20'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '578e0b1c-942b-4b1c-95fa-56e1bee56a20' AND href = $q$/compare/oncrawl-vs-sitebulb$q$);

-- ── Botify vs Lumar (botify-vs-lumar) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c4629fa6-78c7-459c-a10b-102467a283fa', '76b116d0-5bc2-4a6a-93eb-906109fc7d61', $q$botify-vs-lumar$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c4629fa6-78c7-459c-a10b-102467a283fa', $q$vs Lumar$q$, $q$/compare/botify-vs-lumar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c4629fa6-78c7-459c-a10b-102467a283fa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c4629fa6-78c7-459c-a10b-102467a283fa' AND href = $q$/compare/botify-vs-lumar$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '76b116d0-5bc2-4a6a-93eb-906109fc7d61', $q$vs Botify$q$, $q$/compare/botify-vs-lumar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '76b116d0-5bc2-4a6a-93eb-906109fc7d61'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '76b116d0-5bc2-4a6a-93eb-906109fc7d61' AND href = $q$/compare/botify-vs-lumar$q$);

-- ── Seobility vs WooRank (seobility-vs-woorank) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2cab4d47-cd2e-4600-ae0e-4f3f03317244', '72ffb4a5-e2e0-4903-8155-e17e23b71215', $q$seobility-vs-woorank$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2cab4d47-cd2e-4600-ae0e-4f3f03317244', $q$vs WooRank$q$, $q$/compare/seobility-vs-woorank$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2cab4d47-cd2e-4600-ae0e-4f3f03317244'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2cab4d47-cd2e-4600-ae0e-4f3f03317244' AND href = $q$/compare/seobility-vs-woorank$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '72ffb4a5-e2e0-4903-8155-e17e23b71215', $q$vs Seobility$q$, $q$/compare/seobility-vs-woorank$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '72ffb4a5-e2e0-4903-8155-e17e23b71215'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '72ffb4a5-e2e0-4903-8155-e17e23b71215' AND href = $q$/compare/seobility-vs-woorank$q$);

-- ── Dashword vs GrowthBar (dashword-vs-growthbar) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6d0ecf12-94ea-40bf-8961-2c520ff5df26', 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f', $q$dashword-vs-growthbar$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6d0ecf12-94ea-40bf-8961-2c520ff5df26', $q$vs GrowthBar$q$, $q$/compare/dashword-vs-growthbar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6d0ecf12-94ea-40bf-8961-2c520ff5df26'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6d0ecf12-94ea-40bf-8961-2c520ff5df26' AND href = $q$/compare/dashword-vs-growthbar$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f', $q$vs Dashword$q$, $q$/compare/dashword-vs-growthbar$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f' AND href = $q$/compare/dashword-vs-growthbar$q$);

-- ── AccuRanker vs ProRankTracker (accuranker-vs-proranktracker) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', 'f3b79627-754a-459e-a5e6-8dd73f648ba7', $q$accuranker-vs-proranktracker$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '324f0aed-4d17-4a2b-951a-1b9488398905', $q$vs ProRankTracker$q$, $q$/compare/accuranker-vs-proranktracker$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '324f0aed-4d17-4a2b-951a-1b9488398905' AND href = $q$/compare/accuranker-vs-proranktracker$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f3b79627-754a-459e-a5e6-8dd73f648ba7', $q$vs AccuRanker$q$, $q$/compare/accuranker-vs-proranktracker$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f3b79627-754a-459e-a5e6-8dd73f648ba7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f3b79627-754a-459e-a5e6-8dd73f648ba7' AND href = $q$/compare/accuranker-vs-proranktracker$q$);

-- ── Hypefury vs Taplio (hypefury-vs-taplio) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3d7e53a2-7024-463c-8941-1eaf38f894b8', '9fbb459a-6fd6-4391-b245-3ff74a1dfdb4', $q$hypefury-vs-taplio$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3d7e53a2-7024-463c-8941-1eaf38f894b8', $q$vs Taplio$q$, $q$/compare/hypefury-vs-taplio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3d7e53a2-7024-463c-8941-1eaf38f894b8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3d7e53a2-7024-463c-8941-1eaf38f894b8' AND href = $q$/compare/hypefury-vs-taplio$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9fbb459a-6fd6-4391-b245-3ff74a1dfdb4', $q$vs Hypefury$q$, $q$/compare/hypefury-vs-taplio$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9fbb459a-6fd6-4391-b245-3ff74a1dfdb4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9fbb459a-6fd6-4391-b245-3ff74a1dfdb4' AND href = $q$/compare/hypefury-vs-taplio$q$);

-- ── TweetHunter vs Typefully (tweethunter-vs-typefully) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('54c7cb92-5f47-43ad-bdf6-8b7349f90a2d', '05a53179-48a2-447f-a61a-608232327b8e', $q$tweethunter-vs-typefully$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '54c7cb92-5f47-43ad-bdf6-8b7349f90a2d', $q$vs Typefully$q$, $q$/compare/tweethunter-vs-typefully$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '54c7cb92-5f47-43ad-bdf6-8b7349f90a2d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '54c7cb92-5f47-43ad-bdf6-8b7349f90a2d' AND href = $q$/compare/tweethunter-vs-typefully$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '05a53179-48a2-447f-a61a-608232327b8e', $q$vs TweetHunter$q$, $q$/compare/tweethunter-vs-typefully$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '05a53179-48a2-447f-a61a-608232327b8e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '05a53179-48a2-447f-a61a-608232327b8e' AND href = $q$/compare/tweethunter-vs-typefully$q$);

-- ── Awario vs Brand24 (awario-vs-brand24) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', '70a19bf7-581a-4046-9e3d-4778823d9374', $q$awario-vs-brand24$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5c850061-a601-4133-8e98-e91d2b6054af', $q$vs Brand24$q$, $q$/compare/awario-vs-brand24$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5c850061-a601-4133-8e98-e91d2b6054af'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5c850061-a601-4133-8e98-e91d2b6054af' AND href = $q$/compare/awario-vs-brand24$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '70a19bf7-581a-4046-9e3d-4778823d9374', $q$vs Awario$q$, $q$/compare/awario-vs-brand24$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '70a19bf7-581a-4046-9e3d-4778823d9374'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '70a19bf7-581a-4046-9e3d-4778823d9374' AND href = $q$/compare/awario-vs-brand24$q$);

-- ── Plann vs Sked Social (plann-vs-sked-social) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('83b2c83b-806d-4059-8675-877f2b95353d', 'f4d365b4-e7ab-418b-af7c-34a65c4165e9', $q$plann-vs-sked-social$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '83b2c83b-806d-4059-8675-877f2b95353d', $q$vs Sked Social$q$, $q$/compare/plann-vs-sked-social$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '83b2c83b-806d-4059-8675-877f2b95353d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '83b2c83b-806d-4059-8675-877f2b95353d' AND href = $q$/compare/plann-vs-sked-social$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f4d365b4-e7ab-418b-af7c-34a65c4165e9', $q$vs Plann$q$, $q$/compare/plann-vs-sked-social$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f4d365b4-e7ab-418b-af7c-34a65c4165e9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f4d365b4-e7ab-418b-af7c-34a65c4165e9' AND href = $q$/compare/plann-vs-sked-social$q$);

-- ── ContentStudio vs FeedHive (contentstudio-vs-feedhive) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('781eb9ec-2374-430e-a835-e05378d167bf', '0e6192b5-0793-49cb-96c6-12757f88b772', $q$contentstudio-vs-feedhive$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '781eb9ec-2374-430e-a835-e05378d167bf', $q$vs FeedHive$q$, $q$/compare/contentstudio-vs-feedhive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '781eb9ec-2374-430e-a835-e05378d167bf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '781eb9ec-2374-430e-a835-e05378d167bf' AND href = $q$/compare/contentstudio-vs-feedhive$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0e6192b5-0793-49cb-96c6-12757f88b772', $q$vs ContentStudio$q$, $q$/compare/contentstudio-vs-feedhive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0e6192b5-0793-49cb-96c6-12757f88b772'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0e6192b5-0793-49cb-96c6-12757f88b772' AND href = $q$/compare/contentstudio-vs-feedhive$q$);

-- ── MeetEdgar vs RecurPost (meetedgar-vs-recurpost) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('fa6c1b1f-237c-41bd-973b-da2acee05d7b', '410b0dd0-b940-4829-8aac-3c86129e1d0d', $q$meetedgar-vs-recurpost$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fa6c1b1f-237c-41bd-973b-da2acee05d7b', $q$vs RecurPost$q$, $q$/compare/meetedgar-vs-recurpost$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fa6c1b1f-237c-41bd-973b-da2acee05d7b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fa6c1b1f-237c-41bd-973b-da2acee05d7b' AND href = $q$/compare/meetedgar-vs-recurpost$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '410b0dd0-b940-4829-8aac-3c86129e1d0d', $q$vs MeetEdgar$q$, $q$/compare/meetedgar-vs-recurpost$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '410b0dd0-b940-4829-8aac-3c86129e1d0d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '410b0dd0-b940-4829-8aac-3c86129e1d0d' AND href = $q$/compare/meetedgar-vs-recurpost$q$);

-- ── Ocoya vs Pallyy (ocoya-vs-pallyy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7a51d912-95c6-4dbd-990d-21e5074290dc', 'b464dfda-017c-4855-b431-a807ed2c1ace', $q$ocoya-vs-pallyy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7a51d912-95c6-4dbd-990d-21e5074290dc', $q$vs Pallyy$q$, $q$/compare/ocoya-vs-pallyy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7a51d912-95c6-4dbd-990d-21e5074290dc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7a51d912-95c6-4dbd-990d-21e5074290dc' AND href = $q$/compare/ocoya-vs-pallyy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b464dfda-017c-4855-b431-a807ed2c1ace', $q$vs Ocoya$q$, $q$/compare/ocoya-vs-pallyy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b464dfda-017c-4855-b431-a807ed2c1ace'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b464dfda-017c-4855-b431-a807ed2c1ace' AND href = $q$/compare/ocoya-vs-pallyy$q$);

-- ── Rival IQ vs Social Blade (rival-iq-vs-social-blade) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('87329a02-5754-42b3-a8d2-700263b8cdd5', '20893471-10cd-4caf-9754-dcf19b7c21a8', $q$rival-iq-vs-social-blade$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '87329a02-5754-42b3-a8d2-700263b8cdd5', $q$vs Social Blade$q$, $q$/compare/rival-iq-vs-social-blade$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '87329a02-5754-42b3-a8d2-700263b8cdd5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '87329a02-5754-42b3-a8d2-700263b8cdd5' AND href = $q$/compare/rival-iq-vs-social-blade$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '20893471-10cd-4caf-9754-dcf19b7c21a8', $q$vs Rival IQ$q$, $q$/compare/rival-iq-vs-social-blade$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '20893471-10cd-4caf-9754-dcf19b7c21a8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '20893471-10cd-4caf-9754-dcf19b7c21a8' AND href = $q$/compare/rival-iq-vs-social-blade$q$);

-- ── Morningfame vs VidIQ (morningfame-vs-vidiq) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bac1828c-1e04-4f20-976c-9a0ea0ed8e67', '23610ab0-1a86-4d06-82b8-503bd3931d89', $q$morningfame-vs-vidiq$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bac1828c-1e04-4f20-976c-9a0ea0ed8e67', $q$vs VidIQ$q$, $q$/compare/morningfame-vs-vidiq$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bac1828c-1e04-4f20-976c-9a0ea0ed8e67'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bac1828c-1e04-4f20-976c-9a0ea0ed8e67' AND href = $q$/compare/morningfame-vs-vidiq$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '23610ab0-1a86-4d06-82b8-503bd3931d89', $q$vs Morningfame$q$, $q$/compare/morningfame-vs-vidiq$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '23610ab0-1a86-4d06-82b8-503bd3931d89'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '23610ab0-1a86-4d06-82b8-503bd3931d89' AND href = $q$/compare/morningfame-vs-vidiq$q$);

-- ── Repurpose.io vs Statusbrew (repurpose-io-vs-statusbrew) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f07f9c22-d47c-4952-97ad-64f962870184', '79992a38-a613-4b56-91d4-2a13d7ad2204', $q$repurpose-io-vs-statusbrew$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f07f9c22-d47c-4952-97ad-64f962870184', $q$vs Statusbrew$q$, $q$/compare/repurpose-io-vs-statusbrew$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f07f9c22-d47c-4952-97ad-64f962870184'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f07f9c22-d47c-4952-97ad-64f962870184' AND href = $q$/compare/repurpose-io-vs-statusbrew$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '79992a38-a613-4b56-91d4-2a13d7ad2204', $q$vs Repurpose.io$q$, $q$/compare/repurpose-io-vs-statusbrew$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '79992a38-a613-4b56-91d4-2a13d7ad2204'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '79992a38-a613-4b56-91d4-2a13d7ad2204' AND href = $q$/compare/repurpose-io-vs-statusbrew$q$);

-- ── Camtasia vs ScreenFlow (camtasia-vs-screenflow) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', '45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$camtasia-vs-screenflow$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '217a3242-bd27-4f82-bf44-e768e2d249f8', $q$vs ScreenFlow$q$, $q$/compare/camtasia-vs-screenflow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '217a3242-bd27-4f82-bf44-e768e2d249f8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '217a3242-bd27-4f82-bf44-e768e2d249f8' AND href = $q$/compare/camtasia-vs-screenflow$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$vs Camtasia$q$, $q$/compare/camtasia-vs-screenflow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '45e6cf2f-5a73-4152-bc7c-35947a2f985f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '45e6cf2f-5a73-4152-bc7c-35947a2f985f' AND href = $q$/compare/camtasia-vs-screenflow$q$);

-- ── Screen Studio vs Tella (screen-studio-vs-tella) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', 'b1850e50-e82f-45cf-a0c9-accb892735a7', $q$screen-studio-vs-tella$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '79f83550-468f-4378-89d2-b95607e2f72e', $q$vs Tella$q$, $q$/compare/screen-studio-vs-tella$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '79f83550-468f-4378-89d2-b95607e2f72e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '79f83550-468f-4378-89d2-b95607e2f72e' AND href = $q$/compare/screen-studio-vs-tella$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b1850e50-e82f-45cf-a0c9-accb892735a7', $q$vs Screen Studio$q$, $q$/compare/screen-studio-vs-tella$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b1850e50-e82f-45cf-a0c9-accb892735a7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b1850e50-e82f-45cf-a0c9-accb892735a7' AND href = $q$/compare/screen-studio-vs-tella$q$);

-- ── Jitter vs Shots (jitter-vs-shots) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', '4ed46725-5825-4345-b71d-388bad6fdf91', $q$jitter-vs-shots$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '78d1d55e-3d44-4509-a118-9b5206efa57a', $q$vs Shots$q$, $q$/compare/jitter-vs-shots$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '78d1d55e-3d44-4509-a118-9b5206efa57a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '78d1d55e-3d44-4509-a118-9b5206efa57a' AND href = $q$/compare/jitter-vs-shots$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4ed46725-5825-4345-b71d-388bad6fdf91', $q$vs Jitter$q$, $q$/compare/jitter-vs-shots$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4ed46725-5825-4345-b71d-388bad6fdf91'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4ed46725-5825-4345-b71d-388bad6fdf91' AND href = $q$/compare/jitter-vs-shots$q$);

-- ── Jimdo vs Strikingly (jimdo-vs-strikingly) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4a66d624-b348-4934-a255-2bc306fdcf7b', 'aa13d6c0-d32a-426d-805b-8124f40390e4', $q$jimdo-vs-strikingly$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4a66d624-b348-4934-a255-2bc306fdcf7b', $q$vs Strikingly$q$, $q$/compare/jimdo-vs-strikingly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4a66d624-b348-4934-a255-2bc306fdcf7b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4a66d624-b348-4934-a255-2bc306fdcf7b' AND href = $q$/compare/jimdo-vs-strikingly$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aa13d6c0-d32a-426d-805b-8124f40390e4', $q$vs Jimdo$q$, $q$/compare/jimdo-vs-strikingly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aa13d6c0-d32a-426d-805b-8124f40390e4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aa13d6c0-d32a-426d-805b-8124f40390e4' AND href = $q$/compare/jimdo-vs-strikingly$q$);

-- ── SITE123 vs Webnode (site123-vs-webnode) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8ab99a23-e2f0-4b0d-b603-9ded27a0f2c6', '46a8e7ec-2b99-40e2-adca-8f81f3b71e57', $q$site123-vs-webnode$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8ab99a23-e2f0-4b0d-b603-9ded27a0f2c6', $q$vs Webnode$q$, $q$/compare/site123-vs-webnode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8ab99a23-e2f0-4b0d-b603-9ded27a0f2c6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8ab99a23-e2f0-4b0d-b603-9ded27a0f2c6' AND href = $q$/compare/site123-vs-webnode$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '46a8e7ec-2b99-40e2-adca-8f81f3b71e57', $q$vs SITE123$q$, $q$/compare/site123-vs-webnode$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '46a8e7ec-2b99-40e2-adca-8f81f3b71e57'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '46a8e7ec-2b99-40e2-adca-8f81f3b71e57' AND href = $q$/compare/site123-vs-webnode$q$);

-- ── Readymag vs Tilda (readymag-vs-tilda) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4251d844-33b1-400c-bb7b-088d475cef82', '6ad7c247-5d9a-4f7e-b32d-198c140b1f0b', $q$readymag-vs-tilda$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4251d844-33b1-400c-bb7b-088d475cef82', $q$vs Tilda$q$, $q$/compare/readymag-vs-tilda$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4251d844-33b1-400c-bb7b-088d475cef82'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4251d844-33b1-400c-bb7b-088d475cef82' AND href = $q$/compare/readymag-vs-tilda$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6ad7c247-5d9a-4f7e-b32d-198c140b1f0b', $q$vs Readymag$q$, $q$/compare/readymag-vs-tilda$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6ad7c247-5d9a-4f7e-b32d-198c140b1f0b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6ad7c247-5d9a-4f7e-b32d-198c140b1f0b' AND href = $q$/compare/readymag-vs-tilda$q$);

-- ── Siter.io vs Unicorn Platform (siter-io-vs-unicorn-platform) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ca133bfb-1107-4109-8688-45beef7d4d03', '745e7d51-96b5-4e49-8391-846941129c95', $q$siter-io-vs-unicorn-platform$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ca133bfb-1107-4109-8688-45beef7d4d03', $q$vs Unicorn Platform$q$, $q$/compare/siter-io-vs-unicorn-platform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ca133bfb-1107-4109-8688-45beef7d4d03'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ca133bfb-1107-4109-8688-45beef7d4d03' AND href = $q$/compare/siter-io-vs-unicorn-platform$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '745e7d51-96b5-4e49-8391-846941129c95', $q$vs Siter.io$q$, $q$/compare/siter-io-vs-unicorn-platform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '745e7d51-96b5-4e49-8391-846941129c95'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '745e7d51-96b5-4e49-8391-846941129c95' AND href = $q$/compare/siter-io-vs-unicorn-platform$q$);

-- ── Format vs Pixpa (format-vs-pixpa) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('036ebb4f-fc22-4057-831e-b9e581009137', 'eef4f17c-1c20-4cb2-9bf7-47a0e5632c8c', $q$format-vs-pixpa$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '036ebb4f-fc22-4057-831e-b9e581009137', $q$vs Pixpa$q$, $q$/compare/format-vs-pixpa$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '036ebb4f-fc22-4057-831e-b9e581009137'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '036ebb4f-fc22-4057-831e-b9e581009137' AND href = $q$/compare/format-vs-pixpa$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'eef4f17c-1c20-4cb2-9bf7-47a0e5632c8c', $q$vs Format$q$, $q$/compare/format-vs-pixpa$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'eef4f17c-1c20-4cb2-9bf7-47a0e5632c8c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'eef4f17c-1c20-4cb2-9bf7-47a0e5632c8c' AND href = $q$/compare/format-vs-pixpa$q$);

-- ── Typedream vs Ucraft (typedream-vs-ucraft) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c98b6563-0ec6-441b-b5ed-0beb5d47e8f7', '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$typedream-vs-ucraft$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c98b6563-0ec6-441b-b5ed-0beb5d47e8f7', $q$vs Ucraft$q$, $q$/compare/typedream-vs-ucraft$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c98b6563-0ec6-441b-b5ed-0beb5d47e8f7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c98b6563-0ec6-441b-b5ed-0beb5d47e8f7' AND href = $q$/compare/typedream-vs-ucraft$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$vs Typedream$q$, $q$/compare/typedream-vs-ucraft$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4' AND href = $q$/compare/typedream-vs-ucraft$q$);


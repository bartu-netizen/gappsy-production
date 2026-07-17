-- Data for the v2 500-target bulk import (see 20260717150000 for the
-- companion schema widening). Idempotent: every INSERT is ON CONFLICT DO
-- NOTHING keyed on tools.slug or tool_strategic_metadata.tool_id.
-- New tools land as status='needs_review', noindex=true,
-- sitemap_eligible=false — invisible to the public site until enrichment
-- (Phase B) reviews and publishes them.

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b17dc713-2772-438d-a1a1-bbb8b11b6afc', $q$glean$q$, $q$Glean$q$, $q$https://www.glean.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b17dc713-2772-438d-a1a1-bbb8b11b6afc', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b17dc713-2772-438d-a1a1-bbb8b11b6afc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d9bbada-62bd-4fae-b98c-356fa0441d5f', $q$writerzen$q$, $q$WriterZen$q$, $q$https://writerzen.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d9bbada-62bd-4fae-b98c-356fa0441d5f', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d9bbada-62bd-4fae-b98c-356fa0441d5f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('96e6b159-e2df-47d3-a4b4-493bd926551e', $q$koala-ai$q$, $q$Koala AI$q$, $q$https://koala.sh$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '96e6b159-e2df-47d3-a4b4-493bd926551e', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96e6b159-e2df-47d3-a4b4-493bd926551e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('edd89103-eecb-4cc8-a616-763b16cac7ba', $q$longshot-ai$q$, $q$LongShot AI$q$, $q$https://www.longshot.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'edd89103-eecb-4cc8-a616-763b16cac7ba', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edd89103-eecb-4cc8-a616-763b16cac7ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bf2ad475-4159-470c-96a3-52be9e6eafbf', $q$peppertype$q$, $q$Peppertype$q$, $q$https://www.peppertype.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bf2ad475-4159-470c-96a3-52be9e6eafbf', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf2ad475-4159-470c-96a3-52be9e6eafbf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6f8e138d-a5e5-4a77-8e06-6e2cb41eb180', $q$content-at-scale$q$, $q$Content at Scale$q$, $q$https://contentatscale.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6f8e138d-a5e5-4a77-8e06-6e2cb41eb180', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f8e138d-a5e5-4a77-8e06-6e2cb41eb180')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0bde3010-1ecd-4551-bb6f-bd6036268ef7', $q$copysmith$q$, $q$Copysmith$q$, $q$https://copysmith.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0bde3010-1ecd-4551-bb6f-bd6036268ef7', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0bde3010-1ecd-4551-bb6f-bd6036268ef7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cbb957cc-8de9-4968-928e-1b42cfb27349', $q$hypotenuse-ai$q$, $q$Hypotenuse AI$q$, $q$https://www.hypotenuse.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cbb957cc-8de9-4968-928e-1b42cfb27349', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cbb957cc-8de9-4968-928e-1b42cfb27349')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f9a72ac4-b017-4bd7-b4fd-5cb3bd343b9e', $q$paragraphai$q$, $q$ParagraphAI$q$, $q$https://paragraphai.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f9a72ac4-b017-4bd7-b4fd-5cb3bd343b9e', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9a72ac4-b017-4bd7-b4fd-5cb3bd343b9e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6aee23c-70db-420b-83e9-7069be0216f1', $q$simplified$q$, $q$Simplified$q$, $q$https://simplified.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6aee23c-70db-420b-83e9-7069be0216f1', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6aee23c-70db-420b-83e9-7069be0216f1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('71403b09-3361-45de-9911-89b692d11395', $q$jenni-ai$q$, $q$Jenni AI$q$, $q$https://jenni.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '71403b09-3361-45de-9911-89b692d11395', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71403b09-3361-45de-9911-89b692d11395')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6741ec68-b40f-4b14-9d8b-2af8c98c0e2f', $q$wordhero$q$, $q$WordHero$q$, $q$https://wordhero.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6741ec68-b40f-4b14-9d8b-2af8c98c0e2f', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6741ec68-b40f-4b14-9d8b-2af8c98c0e2f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b2d202f-7b55-42b3-92d2-b93413c40359', $q$moonbeam$q$, $q$Moonbeam$q$, $q$https://www.gomoonbeam.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b2d202f-7b55-42b3-92d2-b93413c40359', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b2d202f-7b55-42b3-92d2-b93413c40359')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1f2bcc6e-4367-4eee-be32-0ccfd23149e3', $q$compose-ai$q$, $q$Compose AI$q$, $q$https://www.compose.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1f2bcc6e-4367-4eee-be32-0ccfd23149e3', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f2bcc6e-4367-4eee-be32-0ccfd23149e3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76d57e8b-f525-42a1-a189-fcf48f10fecf', $q$lavender$q$, $q$Lavender$q$, $q$https://www.lavender.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76d57e8b-f525-42a1-a189-fcf48f10fecf', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76d57e8b-f525-42a1-a189-fcf48f10fecf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('50a14386-9f18-49e2-abdb-80c88d9cb7a2', $q$regie-ai$q$, $q$Regie.ai$q$, $q$https://www.regie.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '50a14386-9f18-49e2-abdb-80c88d9cb7a2', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50a14386-9f18-49e2-abdb-80c88d9cb7a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ec42083-c5d1-42c4-9cd9-94afe6946788', $q$mutiny$q$, $q$Mutiny$q$, $q$https://www.mutinyhq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ec42083-c5d1-42c4-9cd9-94afe6946788', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ec42083-c5d1-42c4-9cd9-94afe6946788')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('123b8401-6f03-436d-a3b8-572de129cfec', $q$typeface$q$, $q$Typeface$q$, $q$https://www.typeface.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '123b8401-6f03-436d-a3b8-572de129cfec', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '123b8401-6f03-436d-a3b8-572de129cfec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e162b95f-b9ff-4468-a12d-35d5c34b4108', $q$persado$q$, $q$Persado$q$, $q$https://www.persado.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e162b95f-b9ff-4468-a12d-35d5c34b4108', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e162b95f-b9ff-4468-a12d-35d5c34b4108')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05200050-aef1-41d1-8a4c-687d3c1ab299', $q$acrolinx$q$, $q$Acrolinx$q$, $q$https://www.acrolinx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05200050-aef1-41d1-8a4c-687d3c1ab299', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05200050-aef1-41d1-8a4c-687d3c1ab299')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6538daa1-08cc-42e4-8b4c-aa9dc077271e', $q$anysummary$q$, $q$AnySummary$q$, $q$https://www.anysummary.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6538daa1-08cc-42e4-8b4c-aa9dc077271e', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6538daa1-08cc-42e4-8b4c-aa9dc077271e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6a57cb1c-0dcd-43da-80a0-d2bca18f6aa5', $q$mem$q$, $q$Mem$q$, $q$https://mem.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6a57cb1c-0dcd-43da-80a0-d2bca18f6aa5', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a57cb1c-0dcd-43da-80a0-d2bca18f6aa5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('19599bd9-0e9f-44d9-89bc-3dc73d9018b8', $q$reflect$q$, $q$Reflect$q$, $q$https://reflect.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '19599bd9-0e9f-44d9-89bc-3dc73d9018b8', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19599bd9-0e9f-44d9-89bc-3dc73d9018b8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('83e84bc7-624a-4103-b7df-a6cdfba35f21', $q$taskade$q$, $q$Taskade$q$, $q$https://www.taskade.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '83e84bc7-624a-4103-b7df-a6cdfba35f21', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83e84bc7-624a-4103-b7df-a6cdfba35f21')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$voicenotes$q$, $q$Voicenotes$q$, $q$https://voicenotes.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d3bbba7-c253-4909-80c5-e0f40e0575ba', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20246395-4c99-4ebe-aa25-c4a917239735', $q$fliki$q$, $q$Fliki$q$, $q$https://fliki.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20246395-4c99-4ebe-aa25-c4a917239735', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20246395-4c99-4ebe-aa25-c4a917239735')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3f6fe0d-a0c1-42eb-8614-9f5fd7e21256', $q$colossyan$q$, $q$Colossyan$q$, $q$https://www.colossyan.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3f6fe0d-a0c1-42eb-8614-9f5fd7e21256', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3f6fe0d-a0c1-42eb-8614-9f5fd7e21256')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e765d41-8506-4bbb-8502-4b6b293c5c29', $q$elai$q$, $q$Elai$q$, $q$https://elai.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e765d41-8506-4bbb-8502-4b6b293c5c29', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e765d41-8506-4bbb-8502-4b6b293c5c29')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ead4735-16b7-46e9-9aeb-8a5fca6b3715', $q$deepbrain-ai$q$, $q$DeepBrain AI$q$, $q$https://www.deepbrain.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ead4735-16b7-46e9-9aeb-8a5fca6b3715', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ead4735-16b7-46e9-9aeb-8a5fca6b3715')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d74871a2-7b61-4f74-8163-24f082fb6c1a', $q$hour-one$q$, $q$Hour One$q$, $q$https://hourone.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd74871a2-7b61-4f74-8163-24f082fb6c1a', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd74871a2-7b61-4f74-8163-24f082fb6c1a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4e2e35d0-4b3f-44fd-9859-4de0cee91c3f', $q$d-id$q$, $q$D-ID$q$, $q$https://www.d-id.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4e2e35d0-4b3f-44fd-9859-4de0cee91c3f', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e2e35d0-4b3f-44fd-9859-4de0cee91c3f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('280ff386-aa0f-4c47-904e-14db30865949', $q$yepic-ai$q$, $q$Yepic AI$q$, $q$https://www.yepic.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '280ff386-aa0f-4c47-904e-14db30865949', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '280ff386-aa0f-4c47-904e-14db30865949')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2be62c7d-8a72-47ca-92fc-54be568dbb61', $q$rephrase-ai$q$, $q$Rephrase.ai$q$, $q$https://www.rephrase.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2be62c7d-8a72-47ca-92fc-54be568dbb61', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2be62c7d-8a72-47ca-92fc-54be568dbb61')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2dbc4826-ac2f-4e63-b546-bdd1459a0b34', $q$vidnoz$q$, $q$Vidnoz$q$, $q$https://www.vidnoz.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2dbc4826-ac2f-4e63-b546-bdd1459a0b34', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2dbc4826-ac2f-4e63-b546-bdd1459a0b34')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('847ca3ae-c901-4b57-8fe3-f9b3380035c8', $q$captions$q$, $q$Captions$q$, $q$https://www.captions.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '847ca3ae-c901-4b57-8fe3-f9b3380035c8', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '847ca3ae-c901-4b57-8fe3-f9b3380035c8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4513bb43-aeb2-4840-9feb-1d13971e78ee', $q$wisecut$q$, $q$Wisecut$q$, $q$https://www.wisecut.video$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4513bb43-aeb2-4840-9feb-1d13971e78ee', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4513bb43-aeb2-4840-9feb-1d13971e78ee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$vizard$q$, $q$Vizard$q$, $q$https://vizard.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a5863480-2bee-4075-812b-c253720b03cb', $q$munch$q$, $q$Munch$q$, $q$https://www.getmunch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a5863480-2bee-4075-812b-c253720b03cb', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5863480-2bee-4075-812b-c253720b03cb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('79b50fbc-218a-44ae-a060-2d87cb1dda56', $q$quso-ai$q$, $q$Quso.ai$q$, $q$https://quso.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '79b50fbc-218a-44ae-a060-2d87cb1dda56', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79b50fbc-218a-44ae-a060-2d87cb1dda56')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('38555de6-1fcf-4d7c-93ad-8c32a3e08da5', $q$podcastle$q$, $q$Podcastle$q$, $q$https://podcastle.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '38555de6-1fcf-4d7c-93ad-8c32a3e08da5', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38555de6-1fcf-4d7c-93ad-8c32a3e08da5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a9d84fa-11cb-4542-942a-2ec680e31383', $q$cleanvoice$q$, $q$Cleanvoice$q$, $q$https://cleanvoice.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a9d84fa-11cb-4542-942a-2ec680e31383', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a9d84fa-11cb-4542-942a-2ec680e31383')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7e673235-0981-4c36-a2e4-4e051b04105c', $q$krisp$q$, $q$Krisp$q$, $q$https://krisp.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7e673235-0981-4c36-a2e4-4e051b04105c', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e673235-0981-4c36-a2e4-4e051b04105c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$auphonic$q$, $q$Auphonic$q$, $q$https://auphonic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('79f3d550-5ec1-491d-9aa7-919a574aa346', $q$resemble-ai$q$, $q$Resemble AI$q$, $q$https://www.resemble.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '79f3d550-5ec1-491d-9aa7-919a574aa346', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79f3d550-5ec1-491d-9aa7-919a574aa346')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c573bcab-43f7-4674-9b3c-db4e5f59bd2c', $q$playht$q$, $q$PlayHT$q$, $q$https://play.ht$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c573bcab-43f7-4674-9b3c-db4e5f59bd2c', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c573bcab-43f7-4674-9b3c-db4e5f59bd2c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('279a89e2-68a4-41dd-89a0-fc4c8b2a5cce', $q$lovo$q$, $q$LOVO$q$, $q$https://lovo.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '279a89e2-68a4-41dd-89a0-fc4c8b2a5cce', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '279a89e2-68a4-41dd-89a0-fc4c8b2a5cce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('219b186e-c25c-4fd3-b6af-3d5e32e6319e', $q$wellsaid-labs$q$, $q$WellSaid Labs$q$, $q$https://wellsaidlabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '219b186e-c25c-4fd3-b6af-3d5e32e6319e', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '219b186e-c25c-4fd3-b6af-3d5e32e6319e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7927ea27-2515-47df-a4f2-3f5c7bd4db63', $q$listnr$q$, $q$Listnr$q$, $q$https://www.listnr.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7927ea27-2515-47df-a4f2-3f5c7bd4db63', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7927ea27-2515-47df-a4f2-3f5c7bd4db63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ae5f4c8-55ec-488c-9254-ee6bfcb40f73', $q$podium$q$, $q$Podium$q$, $q$https://www.podium.page$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ae5f4c8-55ec-488c-9254-ee6bfcb40f73', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ae5f4c8-55ec-488c-9254-ee6bfcb40f73')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7edbb0f5-1514-498d-bc96-95c18bc2328b', $q$rask-ai$q$, $q$Rask AI$q$, $q$https://www.rask.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7edbb0f5-1514-498d-bc96-95c18bc2328b', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7edbb0f5-1514-498d-bc96-95c18bc2328b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$apollo-io$q$, $q$Apollo.io$q$, $q$https://www.apollo.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '18089863-a0de-4693-8d26-13ead8c01a88', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18089863-a0de-4693-8d26-13ead8c01a88')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('83d74d9a-40c7-43db-b149-f6f2fdadf0e5', $q$instantly$q$, $q$Instantly$q$, $q$https://instantly.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '83d74d9a-40c7-43db-b149-f6f2fdadf0e5', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83d74d9a-40c7-43db-b149-f6f2fdadf0e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('15ddf167-bf8b-4750-8dd7-0a160f126943', $q$lemlist$q$, $q$Lemlist$q$, $q$https://www.lemlist.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '15ddf167-bf8b-4750-8dd7-0a160f126943', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15ddf167-bf8b-4750-8dd7-0a160f126943')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7593c957-95bc-41e2-b981-f617ce468030', $q$smartlead$q$, $q$Smartlead$q$, $q$https://www.smartlead.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7593c957-95bc-41e2-b981-f617ce468030', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7593c957-95bc-41e2-b981-f617ce468030')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f427a9e9-0965-4ebd-b38b-a318d6e0017f', $q$reply-io$q$, $q$Reply.io$q$, $q$https://reply.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f427a9e9-0965-4ebd-b38b-a318d6e0017f', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f427a9e9-0965-4ebd-b38b-a318d6e0017f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9716dcf4-3238-4e9c-b8bc-c5a16aa3e250', $q$woodpecker$q$, $q$Woodpecker$q$, $q$https://woodpecker.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9716dcf4-3238-4e9c-b8bc-c5a16aa3e250', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9716dcf4-3238-4e9c-b8bc-c5a16aa3e250')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76fff3bb-4eec-44a2-9bbd-0790b17495c7', $q$saleshandy$q$, $q$Saleshandy$q$, $q$https://www.saleshandy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76fff3bb-4eec-44a2-9bbd-0790b17495c7', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76fff3bb-4eec-44a2-9bbd-0790b17495c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a471ce8-ee50-4dac-866b-2e8ef45618fa', $q$mailshake$q$, $q$Mailshake$q$, $q$https://mailshake.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a471ce8-ee50-4dac-866b-2e8ef45618fa', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a471ce8-ee50-4dac-866b-2e8ef45618fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ea439db-0c8a-4902-ad45-6e5684c0f9ee', $q$klenty$q$, $q$Klenty$q$, $q$https://www.klenty.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ea439db-0c8a-4902-ad45-6e5684c0f9ee', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ea439db-0c8a-4902-ad45-6e5684c0f9ee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('909a6d6a-53a7-4fd9-8771-f0bad14e7055', $q$outplay$q$, $q$Outplay$q$, $q$https://outplayhq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '909a6d6a-53a7-4fd9-8771-f0bad14e7055', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '909a6d6a-53a7-4fd9-8771-f0bad14e7055')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$amplemarket$q$, $q$Amplemarket$q$, $q$https://www.amplemarket.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dd857f35-23df-41ff-8428-e550f0e3cf2a', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba720441-8cc7-4c09-b643-008d959f36c9', $q$common-room$q$, $q$Common Room$q$, $q$https://www.commonroom.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba720441-8cc7-4c09-b643-008d959f36c9', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba720441-8cc7-4c09-b643-008d959f36c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e257953a-6b46-421c-9a74-ccd15dc7c9a2', $q$usergems$q$, $q$UserGems$q$, $q$https://www.usergems.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e257953a-6b46-421c-9a74-ccd15dc7c9a2', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e257953a-6b46-421c-9a74-ccd15dc7c9a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4acb5d47-918c-44a6-ad53-de5ddb07110f', $q$warmly$q$, $q$Warmly$q$, $q$https://www.warmly.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4acb5d47-918c-44a6-ad53-de5ddb07110f', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4acb5d47-918c-44a6-ad53-de5ddb07110f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c5a72856-c532-4882-bce1-c4c3664d929b', $q$clay$q$, $q$Clay$q$, $q$https://www.clay.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c5a72856-c532-4882-bce1-c4c3664d929b', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5a72856-c532-4882-bce1-c4c3664d929b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5118dfca-71e6-4897-bbc7-33e7b849b457', $q$wiza$q$, $q$Wiza$q$, $q$https://wiza.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5118dfca-71e6-4897-bbc7-33e7b849b457', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5118dfca-71e6-4897-bbc7-33e7b849b457')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5019ca62-2bfd-4c78-a7e8-0c678cbbaa68', $q$kaspr$q$, $q$Kaspr$q$, $q$https://www.kaspr.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5019ca62-2bfd-4c78-a7e8-0c678cbbaa68', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5019ca62-2bfd-4c78-a7e8-0c678cbbaa68')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('572625cb-f9cb-4961-b33c-f1f81f45c14d', $q$hunter$q$, $q$Hunter$q$, $q$https://hunter.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '572625cb-f9cb-4961-b33c-f1f81f45c14d', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '572625cb-f9cb-4961-b33c-f1f81f45c14d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e8093051-703e-41a0-bd92-e48c69e925b9', $q$snov-io$q$, $q$Snov.io$q$, $q$https://snov.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e8093051-703e-41a0-bd92-e48c69e925b9', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8093051-703e-41a0-bd92-e48c69e925b9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c19eea91-a5a0-45e9-a13c-1f2c45844387', $q$rocketreach$q$, $q$RocketReach$q$, $q$https://rocketreach.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c19eea91-a5a0-45e9-a13c-1f2c45844387', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c19eea91-a5a0-45e9-a13c-1f2c45844387')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb38ef74-ed67-4950-a546-3ece2c203f18', $q$lusha$q$, $q$Lusha$q$, $q$https://www.lusha.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb38ef74-ed67-4950-a546-3ece2c203f18', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb38ef74-ed67-4950-a546-3ece2c203f18')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48c4e035-ee4a-4d7c-9e7a-7d9f3a3f6d4e', $q$cognism$q$, $q$Cognism$q$, $q$https://www.cognism.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48c4e035-ee4a-4d7c-9e7a-7d9f3a3f6d4e', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48c4e035-ee4a-4d7c-9e7a-7d9f3a3f6d4e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('88b216db-d52e-49cb-b940-093f9a2044aa', $q$leadiq$q$, $q$LeadIQ$q$, $q$https://leadiq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '88b216db-d52e-49cb-b940-093f9a2044aa', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88b216db-d52e-49cb-b940-093f9a2044aa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca7fc750-3534-46bb-99e5-aed53ba7b5c8', $q$zoominfo$q$, $q$ZoomInfo$q$, $q$https://www.zoominfo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca7fc750-3534-46bb-99e5-aed53ba7b5c8', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca7fc750-3534-46bb-99e5-aed53ba7b5c8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c106a3ac-ef7c-4e45-a70c-a482ca2fea51', $q$seamless-ai$q$, $q$Seamless.AI$q$, $q$https://seamless.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c106a3ac-ef7c-4e45-a70c-a482ca2fea51', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c106a3ac-ef7c-4e45-a70c-a482ca2fea51')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$attio$q$, $q$Attio$q$, $q$https://attio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de92e42f-5f05-4f16-b06e-4b8b254d19ad', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0cb20c33-a4d5-4832-b97f-e2284e29675a', $q$capsule-crm$q$, $q$Capsule CRM$q$, $q$https://capsulecrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0cb20c33-a4d5-4832-b97f-e2284e29675a', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0cb20c33-a4d5-4832-b97f-e2284e29675a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ec5fff7f-2e72-4779-b7d5-769d8491fa4f', $q$streak$q$, $q$Streak$q$, $q$https://www.streak.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ec5fff7f-2e72-4779-b7d5-769d8491fa4f', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ec5fff7f-2e72-4779-b7d5-769d8491fa4f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7f48b7ce-b6d6-4a03-9a89-b0fe089765f6', $q$folk$q$, $q$Folk$q$, $q$https://www.folk.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7f48b7ce-b6d6-4a03-9a89-b0fe089765f6', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f48b7ce-b6d6-4a03-9a89-b0fe089765f6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6ed054f-8434-4025-8ef7-01e474837fea', $q$twenty$q$, $q$Twenty$q$, $q$https://twenty.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6ed054f-8434-4025-8ef7-01e474837fea', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6ed054f-8434-4025-8ef7-01e474837fea')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$breakcold$q$, $q$Breakcold$q$, $q$https://www.breakcold.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7986cf0f-17ab-4528-acea-8231ffbd3ebc', $q$salesmate$q$, $q$Salesmate$q$, $q$https://www.salesmate.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7986cf0f-17ab-4528-acea-8231ffbd3ebc', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7986cf0f-17ab-4528-acea-8231ffbd3ebc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2ab1000-e26f-4d01-88d3-85475427db72', $q$pipeline-crm$q$, $q$Pipeline CRM$q$, $q$https://pipelinecrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2ab1000-e26f-4d01-88d3-85475427db72', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2ab1000-e26f-4d01-88d3-85475427db72')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7effa4cf-f18e-4d12-bf52-83b570f6c948', $q$onepagecrm$q$, $q$OnePageCRM$q$, $q$https://www.onepagecrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7effa4cf-f18e-4d12-bf52-83b570f6c948', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7effa4cf-f18e-4d12-bf52-83b570f6c948')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('61f5e19c-7e36-43c9-9e96-50d55146d278', $q$engagebay$q$, $q$EngageBay$q$, $q$https://www.engagebay.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '61f5e19c-7e36-43c9-9e96-50d55146d278', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61f5e19c-7e36-43c9-9e96-50d55146d278')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$agile-crm$q$, $q$Agile CRM$q$, $q$https://www.agilecrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '33a462fe-f0a6-4c70-938b-0538e6e0b70b', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('298926b4-3ab4-4ee9-ae5b-9ee1b3900150', $q$vtiger$q$, $q$Vtiger$q$, $q$https://www.vtiger.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '298926b4-3ab4-4ee9-ae5b-9ee1b3900150', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '298926b4-3ab4-4ee9-ae5b-9ee1b3900150')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c5e37344-4c0e-4962-b411-76bbbd950cbd', $q$kommo$q$, $q$Kommo$q$, $q$https://www.kommo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c5e37344-4c0e-4962-b411-76bbbd950cbd', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5e37344-4c0e-4962-b411-76bbbd950cbd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aade9c0c-6fb6-412a-9dc0-66e5e626d8a8', $q$nethunt-crm$q$, $q$NetHunt CRM$q$, $q$https://nethunt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aade9c0c-6fb6-412a-9dc0-66e5e626d8a8', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aade9c0c-6fb6-412a-9dc0-66e5e626d8a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$teamgate$q$, $q$Teamgate$q$, $q$https://www.teamgate.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('90966f6f-0569-4df9-9b4b-7d8285e5e30f', $q$nocrm-io$q$, $q$noCRM.io$q$, $q$https://www.nocrm.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '90966f6f-0569-4df9-9b4b-7d8285e5e30f', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90966f6f-0569-4df9-9b4b-7d8285e5e30f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6001dba5-087f-4eac-ba48-438b4efa098d', $q$really-simple-systems$q$, $q$Really Simple Systems$q$, $q$https://www.reallysimplesystems.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6001dba5-087f-4eac-ba48-438b4efa098d', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6001dba5-087f-4eac-ba48-438b4efa098d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27104aee-384b-47e0-8d77-8ae9c9dbfe01', $q$daylite$q$, $q$Daylite$q$, $q$https://www.marketcircle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27104aee-384b-47e0-8d77-8ae9c9dbfe01', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27104aee-384b-47e0-8d77-8ae9c9dbfe01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('75d9ec55-139d-48db-86d9-199f725ad9e3', $q$kylas$q$, $q$Kylas$q$, $q$https://kylas.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '75d9ec55-139d-48db-86d9-199f725ad9e3', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75d9ec55-139d-48db-86d9-199f725ad9e3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d89ed73f-80e0-4221-8c89-5c539a41247e', $q$revenuecat$q$, $q$RevenueCat$q$, $q$https://www.revenuecat.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd89ed73f-80e0-4221-8c89-5c539a41247e', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd89ed73f-80e0-4221-8c89-5c539a41247e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1434441b-2134-4477-a5b0-4cc5bca3bb34', $q$chartmogul$q$, $q$ChartMogul$q$, $q$https://chartmogul.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1434441b-2134-4477-a5b0-4cc5bca3bb34', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1434441b-2134-4477-a5b0-4cc5bca3bb34')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', $q$baremetrics$q$, $q$Baremetrics$q$, $q$https://baremetrics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28f21e6a-228f-419e-9602-09cb10f941a9', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28f21e6a-228f-419e-9602-09cb10f941a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c580a7ae-24fa-4cd2-a2fb-ffc0619a71c0', $q$maxio$q$, $q$Maxio$q$, $q$https://www.maxio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c580a7ae-24fa-4cd2-a2fb-ffc0619a71c0', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c580a7ae-24fa-4cd2-a2fb-ffc0619a71c0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6216dfaa-05dd-4223-a596-dbb3ee514d3c', $q$ortto$q$, $q$Ortto$q$, $q$https://ortto.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6216dfaa-05dd-4223-a596-dbb3ee514d3c', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6216dfaa-05dd-4223-a596-dbb3ee514d3c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6af548d4-ec3e-4639-a001-7473d57669b6', $q$encharge$q$, $q$Encharge$q$, $q$https://encharge.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6af548d4-ec3e-4639-a001-7473d57669b6', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6af548d4-ec3e-4639-a001-7473d57669b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95a1cd47-8a75-47d2-b10b-b9d86a58c71c', $q$userlist$q$, $q$Userlist$q$, $q$https://userlist.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95a1cd47-8a75-47d2-b10b-b9d86a58c71c', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95a1cd47-8a75-47d2-b10b-b9d86a58c71c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6a0e0878-222a-49ef-85d7-6e633b7c96fc', $q$loops$q$, $q$Loops$q$, $q$https://loops.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6a0e0878-222a-49ef-85d7-6e633b7c96fc', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a0e0878-222a-49ef-85d7-6e633b7c96fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c', $q$resend$q$, $q$Resend$q$, $q$https://resend.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3180928a-7b88-4db5-a439-ca674656c46e', $q$postmark$q$, $q$Postmark$q$, $q$https://postmarkapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3180928a-7b88-4db5-a439-ca674656c46e', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3180928a-7b88-4db5-a439-ca674656c46e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e42b88f9-4910-4f3d-aacc-b784e0b8f957', $q$mailgun$q$, $q$Mailgun$q$, $q$https://www.mailgun.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e42b88f9-4910-4f3d-aacc-b784e0b8f957', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e42b88f9-4910-4f3d-aacc-b784e0b8f957')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d6c91d2-4c18-4368-83f2-7ea2115662de', $q$sendgrid$q$, $q$SendGrid$q$, $q$https://sendgrid.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d6c91d2-4c18-4368-83f2-7ea2115662de', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d6c91d2-4c18-4368-83f2-7ea2115662de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0884da11-18e8-4de8-bdba-1469c9e43607', $q$elastic-email$q$, $q$Elastic Email$q$, $q$https://elasticemail.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0884da11-18e8-4de8-bdba-1469c9e43607', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0884da11-18e8-4de8-bdba-1469c9e43607')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb61be61-826d-402e-93f5-17aed2eb85a3', $q$emailoctopus$q$, $q$EmailOctopus$q$, $q$https://emailoctopus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb61be61-826d-402e-93f5-17aed2eb85a3', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb61be61-826d-402e-93f5-17aed2eb85a3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2f6cc627-c241-4361-a9fa-09e2b287d75b', $q$campaigner$q$, $q$Campaigner$q$, $q$https://www.campaigner.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2f6cc627-c241-4361-a9fa-09e2b287d75b', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f6cc627-c241-4361-a9fa-09e2b287d75b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$benchmark-email$q$, $q$Benchmark Email$q$, $q$https://www.benchmarkemail.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('12459a1a-3818-4e4e-89a8-720e89fe4675', $q$sender$q$, $q$Sender$q$, $q$https://www.sender.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '12459a1a-3818-4e4e-89a8-720e89fe4675', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '12459a1a-3818-4e4e-89a8-720e89fe4675')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3d598c49-9a29-4abb-82c3-8560ce7dd623', $q$sendpulse$q$, $q$SendPulse$q$, $q$https://sendpulse.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3d598c49-9a29-4abb-82c3-8560ce7dd623', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d598c49-9a29-4abb-82c3-8560ce7dd623')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ae57dc6-eaf6-4dcb-af35-03f42db55697', $q$maropost$q$, $q$Maropost$q$, $q$https://www.maropost.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ae57dc6-eaf6-4dcb-af35-03f42db55697', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ae57dc6-eaf6-4dcb-af35-03f42db55697')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a7e05556-33fe-45dc-becd-a33082027c3f', $q$autopilot$q$, $q$Autopilot$q$, $q$https://www.autopilothq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a7e05556-33fe-45dc-becd-a33082027c3f', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a7e05556-33fe-45dc-becd-a33082027c3f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$vero$q$, $q$Vero$q$, $q$https://www.getvero.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f7085ee3-8eca-48ce-b699-465aca0fb0ee', $q$messagebird$q$, $q$MessageBird$q$, $q$https://messagebird.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f7085ee3-8eca-48ce-b699-465aca0fb0ee', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7085ee3-8eca-48ce-b699-465aca0fb0ee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8fe2e620-1117-42fb-88de-78ba0088f595', $q$onesignal$q$, $q$OneSignal$q$, $q$https://onesignal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8fe2e620-1117-42fb-88de-78ba0088f595', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8fe2e620-1117-42fb-88de-78ba0088f595')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be4ad86d-af43-4e18-94b3-70bb1cb7d4f1', $q$pushengage$q$, $q$PushEngage$q$, $q$https://www.pushengage.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be4ad86d-af43-4e18-94b3-70bb1cb7d4f1', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be4ad86d-af43-4e18-94b3-70bb1cb7d4f1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99f73517-cbd3-40ff-94a7-89a7c44a0b54', $q$webengage$q$, $q$WebEngage$q$, $q$https://webengage.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99f73517-cbd3-40ff-94a7-89a7c44a0b54', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99f73517-cbd3-40ff-94a7-89a7c44a0b54')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('493fc80e-5729-4ff6-8605-b8b43debc054', $q$clevertap$q$, $q$CleverTap$q$, $q$https://clevertap.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '493fc80e-5729-4ff6-8605-b8b43debc054', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '493fc80e-5729-4ff6-8605-b8b43debc054')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e8e2b2b1-e626-4b69-b056-d2cfa9a442ef', $q$moengage$q$, $q$MoEngage$q$, $q$https://www.moengage.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e8e2b2b1-e626-4b69-b056-d2cfa9a442ef', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8e2b2b1-e626-4b69-b056-d2cfa9a442ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ce91b27c-4bec-4c15-be87-ad67051e784e', $q$insider$q$, $q$Insider$q$, $q$https://useinsider.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ce91b27c-4bec-4c15-be87-ad67051e784e', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce91b27c-4bec-4c15-be87-ad67051e784e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('56718531-ed0e-4776-9bde-25e1988eb432', $q$lowfruits$q$, $q$LowFruits$q$, $q$https://lowfruits.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '56718531-ed0e-4776-9bde-25e1988eb432', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56718531-ed0e-4776-9bde-25e1988eb432')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('017afd53-6702-45ee-8be8-f9561ba970a4', $q$keyword-insights$q$, $q$Keyword Insights$q$, $q$https://www.keywordinsights.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '017afd53-6702-45ee-8be8-f9561ba970a4', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '017afd53-6702-45ee-8be8-f9561ba970a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa5300c4-25eb-4332-a853-62f0a9c59d1a', $q$keyword-chef$q$, $q$Keyword Chef$q$, $q$https://keywordchef.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa5300c4-25eb-4332-a853-62f0a9c59d1a', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa5300c4-25eb-4332-a853-62f0a9c59d1a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6902e4ce-4e99-4913-bcb5-bbb569db7b67', $q$keysearch$q$, $q$Keysearch$q$, $q$https://www.keysearch.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6902e4ce-4e99-4913-bcb5-bbb569db7b67', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6902e4ce-4e99-4913-bcb5-bbb569db7b67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('324f0aed-4d17-4a2b-951a-1b9488398905', $q$accuranker$q$, $q$AccuRanker$q$, $q$https://www.accuranker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '324f0aed-4d17-4a2b-951a-1b9488398905', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '324f0aed-4d17-4a2b-951a-1b9488398905')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('758cebc7-97dc-4ae8-9b04-1a2c822140e0', $q$wincher$q$, $q$Wincher$q$, $q$https://www.wincher.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '758cebc7-97dc-4ae8-9b04-1a2c822140e0', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '758cebc7-97dc-4ae8-9b04-1a2c822140e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0a86c30-0218-4428-94b5-d143c569c1a2', $q$nightwatch$q$, $q$Nightwatch$q$, $q$https://nightwatch.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0a86c30-0218-4428-94b5-d143c569c1a2', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0a86c30-0218-4428-94b5-d143c569c1a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f3b79627-754a-459e-a5e6-8dd73f648ba7', $q$proranktracker$q$, $q$ProRankTracker$q$, $q$https://proranktracker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f3b79627-754a-459e-a5e6-8dd73f648ba7', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3b79627-754a-459e-a5e6-8dd73f648ba7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b2cf1cf0-7ea7-4346-a42e-7a3f6c6998cf', $q$rank-ranger$q$, $q$Rank Ranger$q$, $q$https://www.rankranger.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b2cf1cf0-7ea7-4346-a42e-7a3f6c6998cf', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2cf1cf0-7ea7-4346-a42e-7a3f6c6998cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$advanced-web-ranking$q$, $q$Advanced Web Ranking$q$, $q$https://www.advancedwebranking.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1a8a972-7236-4fd3-b7d5-579291a22d46', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('578e0b1c-942b-4b1c-95fa-56e1bee56a20', $q$sitebulb$q$, $q$Sitebulb$q$, $q$https://sitebulb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '578e0b1c-942b-4b1c-95fa-56e1bee56a20', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '578e0b1c-942b-4b1c-95fa-56e1bee56a20')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d187108-39b3-4079-8b9b-01b74263686b', $q$contentking$q$, $q$ContentKing$q$, $q$https://www.contentkingapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d187108-39b3-4079-8b9b-01b74263686b', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d187108-39b3-4079-8b9b-01b74263686b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bb746904-348f-44b6-aca5-49626cad1b9a', $q$oncrawl$q$, $q$Oncrawl$q$, $q$https://www.oncrawl.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bb746904-348f-44b6-aca5-49626cad1b9a', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb746904-348f-44b6-aca5-49626cad1b9a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c4629fa6-78c7-459c-a10b-102467a283fa', $q$botify$q$, $q$Botify$q$, $q$https://www.botify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c4629fa6-78c7-459c-a10b-102467a283fa', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4629fa6-78c7-459c-a10b-102467a283fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76b116d0-5bc2-4a6a-93eb-906109fc7d61', $q$lumar$q$, $q$Lumar$q$, $q$https://www.lumar.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76b116d0-5bc2-4a6a-93eb-906109fc7d61', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76b116d0-5bc2-4a6a-93eb-906109fc7d61')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2cab4d47-cd2e-4600-ae0e-4f3f03317244', $q$seobility$q$, $q$Seobility$q$, $q$https://www.seobility.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2cab4d47-cd2e-4600-ae0e-4f3f03317244', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2cab4d47-cd2e-4600-ae0e-4f3f03317244')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('72ffb4a5-e2e0-4903-8155-e17e23b71215', $q$woorank$q$, $q$WooRank$q$, $q$https://www.woorank.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '72ffb4a5-e2e0-4903-8155-e17e23b71215', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72ffb4a5-e2e0-4903-8155-e17e23b71215')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c0b93c88-b6a7-4966-a55f-54c933658952', $q$rank-math$q$, $q$Rank Math$q$, $q$https://rankmath.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c0b93c88-b6a7-4966-a55f-54c933658952', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0b93c88-b6a7-4966-a55f-54c933658952')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2490007c-e3b7-41a2-a1fb-ad0b93df009d', $q$yoast-seo$q$, $q$Yoast SEO$q$, $q$https://yoast.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2490007c-e3b7-41a2-a1fb-ad0b93df009d', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2490007c-e3b7-41a2-a1fb-ad0b93df009d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('945d46de-1541-423b-ad90-a8381853daad', $q$all-in-one-seo$q$, $q$All in One SEO$q$, $q$https://aioseo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '945d46de-1541-423b-ad90-a8381853daad', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '945d46de-1541-423b-ad90-a8381853daad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9f9df18c-f8de-4006-956e-f16fecbef694', $q$linkwhisper$q$, $q$LinkWhisper$q$, $q$https://linkwhisper.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9f9df18c-f8de-4006-956e-f16fecbef694', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f9df18c-f8de-4006-956e-f16fecbef694')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$squirrly-seo$q$, $q$Squirrly SEO$q$, $q$https://www.squirrly.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2bc1080d-a815-4f4e-a679-844e458a7639', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2bc1080d-a815-4f4e-a679-844e458a7639')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d0ecf12-94ea-40bf-8961-2c520ff5df26', $q$dashword$q$, $q$Dashword$q$, $q$https://www.dashword.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d0ecf12-94ea-40bf-8961-2c520ff5df26', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d0ecf12-94ea-40bf-8961-2c520ff5df26')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a45dcfee-2733-4780-ad36-f10f7ad29f41', $q$topic$q$, $q$Topic$q$, $q$https://www.topic.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a45dcfee-2733-4780-ad36-f10f7ad29f41', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a45dcfee-2733-4780-ad36-f10f7ad29f41')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7ffaae8-d151-4f81-9afa-a3539c05ff4f', $q$growthbar$q$, $q$GrowthBar$q$, $q$https://www.growthbarseo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9fbb459a-6fd6-4391-b245-3ff74a1dfdb4', $q$taplio$q$, $q$Taplio$q$, $q$https://taplio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9fbb459a-6fd6-4391-b245-3ff74a1dfdb4', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9fbb459a-6fd6-4391-b245-3ff74a1dfdb4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3d7e53a2-7024-463c-8941-1eaf38f894b8', $q$hypefury$q$, $q$Hypefury$q$, $q$https://hypefury.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3d7e53a2-7024-463c-8941-1eaf38f894b8', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d7e53a2-7024-463c-8941-1eaf38f894b8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$typefully$q$, $q$Typefully$q$, $q$https://typefully.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05a53179-48a2-447f-a61a-608232327b8e', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05a53179-48a2-447f-a61a-608232327b8e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54c7cb92-5f47-43ad-bdf6-8b7349f90a2d', $q$tweethunter$q$, $q$TweetHunter$q$, $q$https://tweethunter.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54c7cb92-5f47-43ad-bdf6-8b7349f90a2d', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54c7cb92-5f47-43ad-bdf6-8b7349f90a2d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('554ba712-0d17-49af-a355-1b54add650cf', $q$blackmagic$q$, $q$Blackmagic$q$, $q$https://blackmagic.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '554ba712-0d17-49af-a355-1b54add650cf', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '554ba712-0d17-49af-a355-1b54add650cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0e6192b5-0793-49cb-96c6-12757f88b772', $q$feedhive$q$, $q$FeedHive$q$, $q$https://www.feedhive.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0e6192b5-0793-49cb-96c6-12757f88b772', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0e6192b5-0793-49cb-96c6-12757f88b772')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('781eb9ec-2374-430e-a835-e05378d167bf', $q$contentstudio$q$, $q$ContentStudio$q$, $q$https://contentstudio.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '781eb9ec-2374-430e-a835-e05378d167bf', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '781eb9ec-2374-430e-a835-e05378d167bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('79992a38-a613-4b56-91d4-2a13d7ad2204', $q$statusbrew$q$, $q$Statusbrew$q$, $q$https://statusbrew.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '79992a38-a613-4b56-91d4-2a13d7ad2204', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79992a38-a613-4b56-91d4-2a13d7ad2204')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f83b75c9-db10-4c41-b43c-62b6ac32e76e', $q$crowdfire$q$, $q$Crowdfire$q$, $q$https://www.crowdfireapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f83b75c9-db10-4c41-b43c-62b6ac32e76e', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f83b75c9-db10-4c41-b43c-62b6ac32e76e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fa6c1b1f-237c-41bd-973b-da2acee05d7b', $q$meetedgar$q$, $q$MeetEdgar$q$, $q$https://meetedgar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fa6c1b1f-237c-41bd-973b-da2acee05d7b', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa6c1b1f-237c-41bd-973b-da2acee05d7b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('410b0dd0-b940-4829-8aac-3c86129e1d0d', $q$recurpost$q$, $q$RecurPost$q$, $q$https://recurpost.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '410b0dd0-b940-4829-8aac-3c86129e1d0d', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '410b0dd0-b940-4829-8aac-3c86129e1d0d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b464dfda-017c-4855-b431-a807ed2c1ace', $q$pallyy$q$, $q$Pallyy$q$, $q$https://pallyy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b464dfda-017c-4855-b431-a807ed2c1ace', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b464dfda-017c-4855-b431-a807ed2c1ace')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c4fbcf36-e8f5-467e-bd97-d644a834805e', $q$predis-ai$q$, $q$Predis.ai$q$, $q$https://predis.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c4fbcf36-e8f5-467e-bd97-d644a834805e', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4fbcf36-e8f5-467e-bd97-d644a834805e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a51d912-95c6-4dbd-990d-21e5074290dc', $q$ocoya$q$, $q$Ocoya$q$, $q$https://www.ocoya.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a51d912-95c6-4dbd-990d-21e5074290dc', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a51d912-95c6-4dbd-990d-21e5074290dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('83b2c83b-806d-4059-8675-877f2b95353d', $q$plann$q$, $q$Plann$q$, $q$https://www.plannthat.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '83b2c83b-806d-4059-8675-877f2b95353d', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83b2c83b-806d-4059-8675-877f2b95353d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f4d365b4-e7ab-418b-af7c-34a65c4165e9', $q$sked-social$q$, $q$Sked Social$q$, $q$https://skedsocial.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f4d365b4-e7ab-418b-af7c-34a65c4165e9', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4d365b4-e7ab-418b-af7c-34a65c4165e9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('70a19bf7-581a-4046-9e3d-4778823d9374', $q$brand24$q$, $q$Brand24$q$, $q$https://brand24.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '70a19bf7-581a-4046-9e3d-4778823d9374', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70a19bf7-581a-4046-9e3d-4778823d9374')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$awario$q$, $q$Awario$q$, $q$https://awario.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5c850061-a601-4133-8e98-e91d2b6054af', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c850061-a601-4133-8e98-e91d2b6054af')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d8efa14-311b-446b-ab6c-e61a88e216f0', $q$keyhole$q$, $q$Keyhole$q$, $q$https://keyhole.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d8efa14-311b-446b-ab6c-e61a88e216f0', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d8efa14-311b-446b-ab6c-e61a88e216f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87329a02-5754-42b3-a8d2-700263b8cdd5', $q$rival-iq$q$, $q$Rival IQ$q$, $q$https://www.rivaliq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87329a02-5754-42b3-a8d2-700263b8cdd5', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87329a02-5754-42b3-a8d2-700263b8cdd5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99b92e04-95eb-419b-a055-2ebe15ca7b5e', $q$tubebuddy$q$, $q$Tubebuddy$q$, $q$https://www.tubebuddy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99b92e04-95eb-419b-a055-2ebe15ca7b5e', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99b92e04-95eb-419b-a055-2ebe15ca7b5e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23610ab0-1a86-4d06-82b8-503bd3931d89', $q$vidiq$q$, $q$VidIQ$q$, $q$https://vidiq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23610ab0-1a86-4d06-82b8-503bd3931d89', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23610ab0-1a86-4d06-82b8-503bd3931d89')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bac1828c-1e04-4f20-976c-9a0ea0ed8e67', $q$morningfame$q$, $q$Morningfame$q$, $q$https://morningfa.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bac1828c-1e04-4f20-976c-9a0ea0ed8e67', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bac1828c-1e04-4f20-976c-9a0ea0ed8e67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$social-blade$q$, $q$Social Blade$q$, $q$https://socialblade.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20893471-10cd-4caf-9754-dcf19b7c21a8', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20893471-10cd-4caf-9754-dcf19b7c21a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f07f9c22-d47c-4952-97ad-64f962870184', $q$repurpose-io$q$, $q$Repurpose.io$q$, $q$https://repurpose.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f07f9c22-d47c-4952-97ad-64f962870184', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f07f9c22-d47c-4952-97ad-64f962870184')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bf92d64e-0be1-4ba9-986c-37463bbdbdeb', $q$motion$q$, $q$Motion$q$, $q$https://www.usemotion.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bf92d64e-0be1-4ba9-986c-37463bbdbdeb', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf92d64e-0be1-4ba9-986c-37463bbdbdeb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$akiflow$q$, $q$Akiflow$q$, $q$https://akiflow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6a4f04ff-7cde-4b44-8fe3-2960a4980493', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('366134f6-a5b9-48d8-883a-e54211d7dd34', $q$sunsama$q$, $q$Sunsama$q$, $q$https://www.sunsama.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '366134f6-a5b9-48d8-883a-e54211d7dd34', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '366134f6-a5b9-48d8-883a-e54211d7dd34')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('00e620ce-3d58-4944-af9e-bc0f5e8779e6', $q$routine$q$, $q$Routine$q$, $q$https://routine.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '00e620ce-3d58-4944-af9e-bc0f5e8779e6', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00e620ce-3d58-4944-af9e-bc0f5e8779e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f44a5433-17b4-408d-9f04-3a38418faa5d', $q$morgen$q$, $q$Morgen$q$, $q$https://www.morgen.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f44a5433-17b4-408d-9f04-3a38418faa5d', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f44a5433-17b4-408d-9f04-3a38418faa5d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$amie$q$, $q$Amie$q$, $q$https://amie.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c847d46-b23f-437e-8dd9-7f034b7c3c9f', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('812088ef-3fdd-41e2-b15a-3a9f36f05e57', $q$cron$q$, $q$Cron$q$, $q$https://cron.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '812088ef-3fdd-41e2-b15a-3a9f36f05e57', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '812088ef-3fdd-41e2-b15a-3a9f36f05e57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$superhuman$q$, $q$Superhuman$q$, $q$https://superhuman.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '331db11d-c5e0-4d89-b61b-3caeaaa512ad', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$spark-mail$q$, $q$Spark Mail$q$, $q$https://sparkmailapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '301e0188-6ae0-49e7-ab7f-56b0c0bf8656', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2e0ce45d-dae1-4d7d-8c4b-eae668045f9e', $q$missive$q$, $q$Missive$q$, $q$https://missiveapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2e0ce45d-dae1-4d7d-8c4b-eae668045f9e', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2e0ce45d-dae1-4d7d-8c4b-eae668045f9e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$spike$q$, $q$Spike$q$, $q$https://www.spikenow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7803795-ad28-4f0d-b4c7-34871b2be738', $q$twist$q$, $q$Twist$q$, $q$https://twist.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7803795-ad28-4f0d-b4c7-34871b2be738', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7803795-ad28-4f0d-b4c7-34871b2be738')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b1f3b00-6e09-441c-a0b6-e202cea7f985', $q$threads$q$, $q$Threads$q$, $q$https://www.threads.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b1f3b00-6e09-441c-a0b6-e202cea7f985', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b1f3b00-6e09-441c-a0b6-e202cea7f985')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5c2ab174-aec9-445e-96e3-c908a6741904', $q$fibery$q$, $q$Fibery$q$, $q$https://fibery.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5c2ab174-aec9-445e-96e3-c908a6741904', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c2ab174-aec9-445e-96e3-c908a6741904')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7ea5abe-ea46-4e4c-b5e4-246810a1c777', $q$craft$q$, $q$Craft$q$, $q$https://www.craft.do$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7ea5abe-ea46-4e4c-b5e4-246810a1c777', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7ea5abe-ea46-4e4c-b5e4-246810a1c777')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e4de8a34-adf7-4d4e-8978-1426321c23f0', $q$slite$q$, $q$Slite$q$, $q$https://slite.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e4de8a34-adf7-4d4e-8978-1426321c23f0', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4de8a34-adf7-4d4e-8978-1426321c23f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('31891521-7412-481e-8809-b74fa059bcf3', $q$nuclino$q$, $q$Nuclino$q$, $q$https://www.nuclino.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '31891521-7412-481e-8809-b74fa059bcf3', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31891521-7412-481e-8809-b74fa059bcf3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$tettra$q$, $q$Tettra$q$, $q$https://tettra.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('79fe800c-3b4a-461b-be9d-1206811b507d', $q$guru$q$, $q$Guru$q$, $q$https://www.getguru.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '79fe800c-3b4a-461b-be9d-1206811b507d', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79fe800c-3b4a-461b-be9d-1206811b507d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7727b97-e9ad-4f83-862e-ffc1b256280f', $q$document360$q$, $q$Document360$q$, $q$https://document360.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7727b97-e9ad-4f83-862e-ffc1b256280f', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7727b97-e9ad-4f83-862e-ffc1b256280f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2632cf96-67cf-472b-ba2a-9e7b8ce56e16', $q$helpjuice$q$, $q$Helpjuice$q$, $q$https://helpjuice.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2632cf96-67cf-472b-ba2a-9e7b8ce56e16', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2632cf96-67cf-472b-ba2a-9e7b8ce56e16')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0eab6628-ac5f-4215-9f5b-92be748bae51', $q$archbee$q$, $q$Archbee$q$, $q$https://www.archbee.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0eab6628-ac5f-4215-9f5b-92be748bae51', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0eab6628-ac5f-4215-9f5b-92be748bae51')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0712a2a-3c5e-47ea-8501-6e6e45003e44', $q$clickhelp$q$, $q$ClickHelp$q$, $q$https://clickhelp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0712a2a-3c5e-47ea-8501-6e6e45003e44', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0712a2a-3c5e-47ea-8501-6e6e45003e44')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7421519-f70d-433d-a80c-ccd25012d50b', $q$slab$q$, $q$Slab$q$, $q$https://slab.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7421519-f70d-433d-a80c-ccd25012d50b', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7421519-f70d-433d-a80c-ccd25012d50b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3', $q$outline$q$, $q$Outline$q$, $q$https://www.getoutline.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('462722d4-4165-434a-8b0c-980f54d3e95b', $q$logrocket$q$, $q$LogRocket$q$, $q$https://logrocket.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '462722d4-4165-434a-8b0c-980f54d3e95b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '462722d4-4165-434a-8b0c-980f54d3e95b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$bugsnag$q$, $q$Bugsnag$q$, $q$https://www.bugsnag.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '66c6f447-c37a-4d38-b8f4-1f3f354d23b1', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c7fb478-76a0-467c-ace5-e21d349568e4', $q$rollbar$q$, $q$Rollbar$q$, $q$https://rollbar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c7fb478-76a0-467c-ace5-e21d349568e4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c7fb478-76a0-467c-ace5-e21d349568e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7af487a9-50b6-47ff-94cd-63ca690c3618', $q$honeybadger$q$, $q$Honeybadger$q$, $q$https://www.honeybadger.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7af487a9-50b6-47ff-94cd-63ca690c3618', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7af487a9-50b6-47ff-94cd-63ca690c3618')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ff22411-f622-417d-9bda-6ec2bdfd971c', $q$better-stack$q$, $q$Better Stack$q$, $q$https://betterstack.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ff22411-f622-417d-9bda-6ec2bdfd971c', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ff22411-f622-417d-9bda-6ec2bdfd971c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('40705dad-5bab-4f5b-a448-d25aaa9e4cbc', $q$uptimerobot$q$, $q$UptimeRobot$q$, $q$https://uptimerobot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '40705dad-5bab-4f5b-a448-d25aaa9e4cbc', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40705dad-5bab-4f5b-a448-d25aaa9e4cbc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0f7793fe-24f6-455d-942f-7c400a00d262', $q$pingdom$q$, $q$Pingdom$q$, $q$https://www.pingdom.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0f7793fe-24f6-455d-942f-7c400a00d262', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f7793fe-24f6-455d-942f-7c400a00d262')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f65f0d8b-0765-4d7b-b21b-657a547c6e7f', $q$instatus$q$, $q$Instatus$q$, $q$https://instatus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f65f0d8b-0765-4d7b-b21b-657a547c6e7f', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f65f0d8b-0765-4d7b-b21b-657a547c6e7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9bfeb77a-1467-4d17-be6d-b78ad5d914b1', $q$pulsetic$q$, $q$Pulsetic$q$, $q$https://pulsetic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9bfeb77a-1467-4d17-be6d-b78ad5d914b1', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9bfeb77a-1467-4d17-be6d-b78ad5d914b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87089195-3dd1-46cf-905d-b16e26fbbd31', $q$checkly$q$, $q$Checkly$q$, $q$https://www.checklyhq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87089195-3dd1-46cf-905d-b16e26fbbd31', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87089195-3dd1-46cf-905d-b16e26fbbd31')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f2373499-d34a-47fe-8420-a3176c8cceb3', $q$sematext$q$, $q$Sematext$q$, $q$https://sematext.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f2373499-d34a-47fe-8420-a3176c8cceb3', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f2373499-d34a-47fe-8420-a3176c8cceb3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5ffdb2ec-9868-4c01-a2ab-458f8bba752a', $q$better-uptime$q$, $q$Better Uptime$q$, $q$https://betteruptime.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5ffdb2ec-9868-4c01-a2ab-458f8bba752a', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ffdb2ec-9868-4c01-a2ab-458f8bba752a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('64fcba47-1f37-4b44-92d6-1d4880760b16', $q$raygun$q$, $q$Raygun$q$, $q$https://raygun.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '64fcba47-1f37-4b44-92d6-1d4880760b16', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64fcba47-1f37-4b44-92d6-1d4880760b16')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$appsignal$q$, $q$AppSignal$q$, $q$https://www.appsignal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a088bca4-e021-4feb-af5d-c1d5769b5a38', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('66aef3e8-fdf4-4871-a16f-ccd3d0ecfe6d', $q$scout-apm$q$, $q$Scout APM$q$, $q$https://scoutapm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '66aef3e8-fdf4-4871-a16f-ccd3d0ecfe6d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '66aef3e8-fdf4-4871-a16f-ccd3d0ecfe6d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c326978a-2a64-44b7-a572-f9fb892fc271', $q$papertrail$q$, $q$Papertrail$q$, $q$https://www.papertrail.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c326978a-2a64-44b7-a572-f9fb892fc271', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c326978a-2a64-44b7-a572-f9fb892fc271')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$axiom$q$, $q$Axiom$q$, $q$https://axiom.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '61ccc648-9278-4f3b-87f3-026966a4a47f', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61ccc648-9278-4f3b-87f3-026966a4a47f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f6d6eb38-8f44-43cb-b351-fe77b22730dd', $q$highlight-io$q$, $q$Highlight.io$q$, $q$https://www.highlight.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f6d6eb38-8f44-43cb-b351-fe77b22730dd', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6d6eb38-8f44-43cb-b351-fe77b22730dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f79eaac2-65bc-4cc5-9c8f-74c78142ea6b', $q$openreplay$q$, $q$OpenReplay$q$, $q$https://openreplay.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f79eaac2-65bc-4cc5-9c8f-74c78142ea6b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f79eaac2-65bc-4cc5-9c8f-74c78142ea6b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('21c299f2-5f17-4888-a6ff-d3d047043f79', $q$fullstory$q$, $q$FullStory$q$, $q$https://www.fullstory.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '21c299f2-5f17-4888-a6ff-d3d047043f79', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21c299f2-5f17-4888-a6ff-d3d047043f79')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e44be36-57f9-4e4f-b5f8-22e6508f69b4', $q$mouseflow$q$, $q$Mouseflow$q$, $q$https://mouseflow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e44be36-57f9-4e4f-b5f8-22e6508f69b4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e44be36-57f9-4e4f-b5f8-22e6508f69b4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c3f373eb-198a-458a-b85b-10b325d6c454', $q$smartlook$q$, $q$Smartlook$q$, $q$https://www.smartlook.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c3f373eb-198a-458a-b85b-10b325d6c454', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3f373eb-198a-458a-b85b-10b325d6c454')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11db7b95-8347-45df-a13b-c3e8b6ea53f7', $q$fly-io$q$, $q$Fly.io$q$, $q$https://fly.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11db7b95-8347-45df-a13b-c3e8b6ea53f7', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11db7b95-8347-45df-a13b-c3e8b6ea53f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1c0b6aed-6aed-4600-980d-b05aa2cf0ccb', $q$northflank$q$, $q$Northflank$q$, $q$https://northflank.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('46c7eebc-d6a3-4c06-b0fb-74483d16333d', $q$qovery$q$, $q$Qovery$q$, $q$https://www.qovery.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '46c7eebc-d6a3-4c06-b0fb-74483d16333d', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46c7eebc-d6a3-4c06-b0fb-74483d16333d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('196d4b7c-1987-4513-97d0-d974741e4db3', $q$platform-sh$q$, $q$Platform.sh$q$, $q$https://platform.sh$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '196d4b7c-1987-4513-97d0-d974741e4db3', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '196d4b7c-1987-4513-97d0-d974741e4db3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f36c751-0719-4122-8fe0-e1bd976404d2', $q$cloudways$q$, $q$Cloudways$q$, $q$https://www.cloudways.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f36c751-0719-4122-8fe0-e1bd976404d2', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f36c751-0719-4122-8fe0-e1bd976404d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0672926-1230-4fae-8c77-9a1304584c44', $q$kinsta$q$, $q$Kinsta$q$, $q$https://kinsta.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0672926-1230-4fae-8c77-9a1304584c44', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0672926-1230-4fae-8c77-9a1304584c44')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0ed951ec-77f0-4b46-b0d3-dc10cc9de347', $q$wp-engine$q$, $q$WP Engine$q$, $q$https://wpengine.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0ed951ec-77f0-4b46-b0d3-dc10cc9de347', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ed951ec-77f0-4b46-b0d3-dc10cc9de347')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8dd02588-9e72-460d-8c15-9f28eeaf959d', $q$pantheon$q$, $q$Pantheon$q$, $q$https://pantheon.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8dd02588-9e72-460d-8c15-9f28eeaf959d', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8dd02588-9e72-460d-8c15-9f28eeaf959d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ed72c61-cf6e-4bb5-818c-15ca4c39cc8b', $q$a2-hosting$q$, $q$A2 Hosting$q$, $q$https://www.a2hosting.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ed72c61-cf6e-4bb5-818c-15ca4c39cc8b', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ed72c61-cf6e-4bb5-818c-15ca4c39cc8b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c25e7433-44ad-439d-a4df-0347e6f2e9c2', $q$hostinger$q$, $q$Hostinger$q$, $q$https://www.hostinger.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c25e7433-44ad-439d-a4df-0347e6f2e9c2', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c25e7433-44ad-439d-a4df-0347e6f2e9c2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fca0329e-c98c-4d5a-847a-38aca9d3e0c4', $q$siteground$q$, $q$SiteGround$q$, $q$https://www.siteground.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fca0329e-c98c-4d5a-847a-38aca9d3e0c4', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fca0329e-c98c-4d5a-847a-38aca9d3e0c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4262ba7b-6a19-41ce-bc48-4ff58e432ce9', $q$namecheap$q$, $q$Namecheap$q$, $q$https://www.namecheap.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4262ba7b-6a19-41ce-bc48-4ff58e432ce9', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4262ba7b-6a19-41ce-bc48-4ff58e432ce9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0290e212-4db0-41b8-bc28-0411526ba848', $q$ovhcloud$q$, $q$OVHcloud$q$, $q$https://www.ovhcloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0290e212-4db0-41b8-bc28-0411526ba848', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0290e212-4db0-41b8-bc28-0411526ba848')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d97ca2f0-4073-4a93-a5de-d5b275efbb57', $q$vultr$q$, $q$Vultr$q$, $q$https://www.vultr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd97ca2f0-4073-4a93-a5de-d5b275efbb57', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd97ca2f0-4073-4a93-a5de-d5b275efbb57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('afcd955c-740d-4ea0-8ee5-e3052c431a5d', $q$linode$q$, $q$Linode$q$, $q$https://www.linode.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'afcd955c-740d-4ea0-8ee5-e3052c431a5d', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afcd955c-740d-4ea0-8ee5-e3052c431a5d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('651a0f94-72a0-43b1-b2b0-60746e97bceb', $q$hetzner$q$, $q$Hetzner$q$, $q$https://www.hetzner.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '651a0f94-72a0-43b1-b2b0-60746e97bceb', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '651a0f94-72a0-43b1-b2b0-60746e97bceb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('71f03e14-432c-435c-8c0e-ef2bed2b9907', $q$scaleway$q$, $q$Scaleway$q$, $q$https://www.scaleway.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '71f03e14-432c-435c-8c0e-ef2bed2b9907', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71f03e14-432c-435c-8c0e-ef2bed2b9907')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea8d8edf-19c1-4df7-a4d2-05c155784b1a', $q$upcloud$q$, $q$UpCloud$q$, $q$https://upcloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea8d8edf-19c1-4df7-a4d2-05c155784b1a', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea8d8edf-19c1-4df7-a4d2-05c155784b1a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('345f158e-d413-44fa-b795-28721d2c9389', $q$kamatera$q$, $q$Kamatera$q$, $q$https://www.kamatera.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '345f158e-d413-44fa-b795-28721d2c9389', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '345f158e-d413-44fa-b795-28721d2c9389')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('040862c3-0d04-4dd4-af23-2164939cfd29', $q$clever-cloud$q$, $q$Clever Cloud$q$, $q$https://www.clever-cloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '040862c3-0d04-4dd4-af23-2164939cfd29', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '040862c3-0d04-4dd4-af23-2164939cfd29')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8224f1c4-4b8e-465f-bf52-2dfa9e59e1ef', $q$porter$q$, $q$Porter$q$, $q$https://www.porter.run$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8224f1c4-4b8e-465f-bf52-2dfa9e59e1ef', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8224f1c4-4b8e-465f-bf52-2dfa9e59e1ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d4c2db9c-c418-40cf-8387-d72c25bbc544', $q$zeabur$q$, $q$Zeabur$q$, $q$https://zeabur.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd4c2db9c-c418-40cf-8387-d72c25bbc544', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4c2db9c-c418-40cf-8387-d72c25bbc544')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('32feccb0-a63d-4932-b0a2-8d2a9ed9dd66', $q$koyeb$q$, $q$Koyeb$q$, $q$https://www.koyeb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '32feccb0-a63d-4932-b0a2-8d2a9ed9dd66', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32feccb0-a63d-4932-b0a2-8d2a9ed9dd66')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b67fa90-7a4e-4cd5-aaaf-5828ca0f9a2a', $q$stormkit$q$, $q$Stormkit$q$, $q$https://www.stormkit.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b67fa90-7a4e-4cd5-aaaf-5828ca0f9a2a', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b67fa90-7a4e-4cd5-aaaf-5828ca0f9a2a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f4aa26bc-375b-4808-a448-465f4f778755', $q$adaptable$q$, $q$Adaptable$q$, $q$https://adaptable.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f4aa26bc-375b-4808-a448-465f4f778755', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4aa26bc-375b-4808-a448-465f4f778755')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0dfbc077-2e6f-43bd-beb1-5237a10ecdd5', $q$xata$q$, $q$Xata$q$, $q$https://xata.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0dfbc077-2e6f-43bd-beb1-5237a10ecdd5', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0dfbc077-2e6f-43bd-beb1-5237a10ecdd5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe42bb0d-0769-4be9-8240-7ea8c6d5d159', $q$convex$q$, $q$Convex$q$, $q$https://www.convex.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$appwrite$q$, $q$Appwrite$q$, $q$https://appwrite.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '29a999ee-1d55-4fa7-a5bf-265fba6c2681', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e6c72275-7cb5-4d25-b407-ad1b09e419ab', $q$pocketbase$q$, $q$PocketBase$q$, $q$https://pocketbase.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e6c72275-7cb5-4d25-b407-ad1b09e419ab', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e6c72275-7cb5-4d25-b407-ad1b09e419ab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea768a9c-a511-4333-8959-87593d0426a5', $q$nhost$q$, $q$Nhost$q$, $q$https://nhost.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea768a9c-a511-4333-8959-87593d0426a5', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea768a9c-a511-4333-8959-87593d0426a5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82ee8074-8c82-4567-87cf-e4ee7c5da225', $q$hasura$q$, $q$Hasura$q$, $q$https://hasura.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82ee8074-8c82-4567-87cf-e4ee7c5da225', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82ee8074-8c82-4567-87cf-e4ee7c5da225')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('47cf9d80-a2bb-43ef-9377-ea126fc69e75', $q$fauna$q$, $q$Fauna$q$, $q$https://fauna.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '47cf9d80-a2bb-43ef-9377-ea126fc69e75', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47cf9d80-a2bb-43ef-9377-ea126fc69e75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5979f62c-c68a-4875-ab66-878b6d196231', $q$timescale$q$, $q$Timescale$q$, $q$https://www.timescale.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5979f62c-c68a-4875-ab66-878b6d196231', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5979f62c-c68a-4875-ab66-878b6d196231')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8ef1e9c-3e2d-43bd-b790-a687f3d10cd5', $q$influxdb-cloud$q$, $q$InfluxDB Cloud$q$, $q$https://www.influxdata.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8ef1e9c-3e2d-43bd-b790-a687f3d10cd5', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8ef1e9c-3e2d-43bd-b790-a687f3d10cd5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a1651b2-fc5c-4661-9e06-7316b78cb420', $q$questdb$q$, $q$QuestDB$q$, $q$https://questdb.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a1651b2-fc5c-4661-9e06-7316b78cb420', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a1651b2-fc5c-4661-9e06-7316b78cb420')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('78eada95-da81-4cfa-9a33-f04a9d8c15e0', $q$yugabytedb$q$, $q$YugabyteDB$q$, $q$https://www.yugabyte.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '78eada95-da81-4cfa-9a33-f04a9d8c15e0', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78eada95-da81-4cfa-9a33-f04a9d8c15e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('992455d6-9786-48b9-a8ac-bca905448c06', $q$tidb-cloud$q$, $q$TiDB Cloud$q$, $q$https://www.pingcap.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '992455d6-9786-48b9-a8ac-bca905448c06', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '992455d6-9786-48b9-a8ac-bca905448c06')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed38eac2-96a6-4a42-b699-28e0cef88f69', $q$dgraph$q$, $q$Dgraph$q$, $q$https://dgraph.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed38eac2-96a6-4a42-b699-28e0cef88f69', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed38eac2-96a6-4a42-b699-28e0cef88f69')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$surrealdb$q$, $q$SurrealDB$q$, $q$https://surrealdb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6c12f04e-e703-497a-b9ff-e4bd73be6bd0', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a92dbe70-936c-4a03-aa4c-6b401ecbc127', $q$edgedb$q$, $q$EdgeDB$q$, $q$https://www.edgedb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a92dbe70-936c-4a03-aa4c-6b401ecbc127', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a92dbe70-936c-4a03-aa4c-6b401ecbc127')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0', $q$meilisearch$q$, $q$Meilisearch$q$, $q$https://www.meilisearch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$typesense$q$, $q$Typesense$q$, $q$https://typesense.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '09b08922-47a6-4af9-bab1-b845aa9a15c7', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09b08922-47a6-4af9-bab1-b845aa9a15c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$algolia$q$, $q$Algolia$q$, $q$https://www.algolia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1da597ed-cb15-440d-b621-139ce7ffa976', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1da597ed-cb15-440d-b621-139ce7ffa976')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d37dae4-b21a-4385-9295-c71506f8ef9c', $q$pinecone$q$, $q$Pinecone$q$, $q$https://www.pinecone.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d37dae4-b21a-4385-9295-c71506f8ef9c', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d37dae4-b21a-4385-9295-c71506f8ef9c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54fd0b15-5a7f-4cba-b221-60d8ab928a87', $q$weaviate$q$, $q$Weaviate$q$, $q$https://weaviate.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54fd0b15-5a7f-4cba-b221-60d8ab928a87', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54fd0b15-5a7f-4cba-b221-60d8ab928a87')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('276ddeaa-f3f4-4e0c-bba8-924413dbf6cd', $q$qdrant$q$, $q$Qdrant$q$, $q$https://qdrant.tech$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '276ddeaa-f3f4-4e0c-bba8-924413dbf6cd', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '276ddeaa-f3f4-4e0c-bba8-924413dbf6cd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f8173937-6906-403b-af26-bf7290c0ba12', $q$milvus$q$, $q$Milvus$q$, $q$https://milvus.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f8173937-6906-403b-af26-bf7290c0ba12', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8173937-6906-403b-af26-bf7290c0ba12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('72cd024d-3900-490c-976d-ace69724ddbb', $q$upstash$q$, $q$Upstash$q$, $q$https://upstash.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '72cd024d-3900-490c-976d-ace69724ddbb', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72cd024d-3900-490c-976d-ace69724ddbb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8f8c6456-68f6-4f02-bd51-cf48403d7a42', $q$turso$q$, $q$Turso$q$, $q$https://turso.tech$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8f8c6456-68f6-4f02-bd51-cf48403d7a42', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f8c6456-68f6-4f02-bd51-cf48403d7a42')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9e7e7d01-4172-4d85-90b4-cb0af1a7c91d', $q$pipedream$q$, $q$Pipedream$q$, $q$https://pipedream.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$albato$q$, $q$Albato$q$, $q$https://albato.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b94af22-0e27-4952-855a-be2baf62f997', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b94af22-0e27-4952-855a-be2baf62f997')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('816736fa-6a4c-405d-b001-715479da0a6e', $q$integrately$q$, $q$Integrately$q$, $q$https://integrately.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '816736fa-6a4c-405d-b001-715479da0a6e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '816736fa-6a4c-405d-b001-715479da0a6e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f5fa950-8b00-4a29-8729-57a4f49a3db7', $q$pabbly-connect$q$, $q$Pabbly Connect$q$, $q$https://www.pabbly.com/connect$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f5fa950-8b00-4a29-8729-57a4f49a3db7', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f5fa950-8b00-4a29-8729-57a4f49a3db7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b7dbfbf6-f142-4013-ba06-5ff42e255059', $q$workato$q$, $q$Workato$q$, $q$https://www.workato.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b7dbfbf6-f142-4013-ba06-5ff42e255059', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7dbfbf6-f142-4013-ba06-5ff42e255059')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5f2efd75-b393-44ab-a643-86bbadb40c49', $q$tray-io$q$, $q$Tray.io$q$, $q$https://tray.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5f2efd75-b393-44ab-a643-86bbadb40c49', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f2efd75-b393-44ab-a643-86bbadb40c49')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('812e6387-746a-402d-9db8-ecb8da116b61', $q$parabola$q$, $q$Parabola$q$, $q$https://parabola.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '812e6387-746a-402d-9db8-ecb8da116b61', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '812e6387-746a-402d-9db8-ecb8da116b61')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$bardeen$q$, $q$Bardeen$q$, $q$https://www.bardeen.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d3380d17-44f5-4778-a2b5-e01726b9b630', $q$relay-app$q$, $q$Relay.app$q$, $q$https://www.relay.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd3380d17-44f5-4778-a2b5-e01726b9b630', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3380d17-44f5-4778-a2b5-e01726b9b630')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('029723bb-0e7c-43dd-958e-73d6dbd7933b', $q$windmill$q$, $q$Windmill$q$, $q$https://www.windmill.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '029723bb-0e7c-43dd-958e-73d6dbd7933b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '029723bb-0e7c-43dd-958e-73d6dbd7933b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d51e95d-ce2a-4513-a287-44c9039f1a17', $q$prefect$q$, $q$Prefect$q$, $q$https://www.prefect.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d51e95d-ce2a-4513-a287-44c9039f1a17', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d51e95d-ce2a-4513-a287-44c9039f1a17')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aef224a1-fe25-4992-8146-62c270b751d5', $q$dagster$q$, $q$Dagster$q$, $q$https://dagster.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aef224a1-fe25-4992-8146-62c270b751d5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aef224a1-fe25-4992-8146-62c270b751d5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2efa5f1f-29da-4d6c-a300-8437c5445f15', $q$temporal$q$, $q$Temporal$q$, $q$https://temporal.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2efa5f1f-29da-4d6c-a300-8437c5445f15', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2efa5f1f-29da-4d6c-a300-8437c5445f15')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('14d1d9d1-5e67-4b61-a083-8bace97b6d67', $q$process-street$q$, $q$Process Street$q$, $q$https://www.process.st$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '14d1d9d1-5e67-4b61-a083-8bace97b6d67', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '14d1d9d1-5e67-4b61-a083-8bace97b6d67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20fb5336-a872-4aeb-a58f-5087fa3de0ba', $q$kissflow$q$, $q$Kissflow$q$, $q$https://kissflow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20fb5336-a872-4aeb-a58f-5087fa3de0ba', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20fb5336-a872-4aeb-a58f-5087fa3de0ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('67b19345-c927-42e2-946a-1bb82ab00b60', $q$pipefy$q$, $q$Pipefy$q$, $q$https://www.pipefy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '67b19345-c927-42e2-946a-1bb82ab00b60', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '67b19345-c927-42e2-946a-1bb82ab00b60')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('117a7e22-499f-462f-92ab-79295cfef946', $q$tallyfy$q$, $q$Tallyfy$q$, $q$https://tallyfy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '117a7e22-499f-462f-92ab-79295cfef946', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '117a7e22-499f-462f-92ab-79295cfef946')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b2929b76-2d2c-496e-a42b-392fc1b54699', $q$ninox$q$, $q$Ninox$q$, $q$https://ninox.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b2929b76-2d2c-496e-a42b-392fc1b54699', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2929b76-2d2c-496e-a42b-392fc1b54699')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$stacker$q$, $q$Stacker$q$, $q$https://stackerhq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '443eb7f9-9f62-4c2d-9263-264fcc76d4ee', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f9bc7649-dc5b-4824-b0b4-1f220d996bc3', $q$noloco$q$, $q$Noloco$q$, $q$https://noloco.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f9bc7649-dc5b-4824-b0b4-1f220d996bc3', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9bc7649-dc5b-4824-b0b4-1f220d996bc3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f43a5180-ad73-4b48-95ac-b2cd02106791', $q$weweb$q$, $q$WeWeb$q$, $q$https://www.weweb.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f43a5180-ad73-4b48-95ac-b2cd02106791', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f43a5180-ad73-4b48-95ac-b2cd02106791')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bae8c5eb-e420-46ea-ab07-e5a2d1b90319', $q$bildr$q$, $q$Bildr$q$, $q$https://www.bildr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bae8c5eb-e420-46ea-ab07-e5a2d1b90319', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bae8c5eb-e420-46ea-ab07-e5a2d1b90319')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a22cd72-a223-425f-872a-827407f67bb9', $q$bravo-studio$q$, $q$Bravo Studio$q$, $q$https://www.bravostudio.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a22cd72-a223-425f-872a-827407f67bb9', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a22cd72-a223-425f-872a-827407f67bb9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c98b6563-0ec6-441b-b5ed-0beb5d47e8f7', $q$typedream$q$, $q$Typedream$q$, $q$https://typedream.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c98b6563-0ec6-441b-b5ed-0beb5d47e8f7', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c98b6563-0ec6-441b-b5ed-0beb5d47e8f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('745e7d51-96b5-4e49-8391-846941129c95', $q$unicorn-platform$q$, $q$Unicorn Platform$q$, $q$https://unicornplatform.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '745e7d51-96b5-4e49-8391-846941129c95', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '745e7d51-96b5-4e49-8391-846941129c95')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca133bfb-1107-4109-8688-45beef7d4d03', $q$siter-io$q$, $q$Siter.io$q$, $q$https://siter.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca133bfb-1107-4109-8688-45beef7d4d03', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca133bfb-1107-4109-8688-45beef7d4d03')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4251d844-33b1-400c-bb7b-088d475cef82', $q$readymag$q$, $q$Readymag$q$, $q$https://readymag.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4251d844-33b1-400c-bb7b-088d475cef82', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4251d844-33b1-400c-bb7b-088d475cef82')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ad7c247-5d9a-4f7e-b32d-198c140b1f0b', $q$tilda$q$, $q$Tilda$q$, $q$https://tilda.cc$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ad7c247-5d9a-4f7e-b32d-198c140b1f0b', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ad7c247-5d9a-4f7e-b32d-198c140b1f0b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$ucraft$q$, $q$Ucraft$q$, $q$https://www.ucraft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eef4f17c-1c20-4cb2-9bf7-47a0e5632c8c', $q$pixpa$q$, $q$Pixpa$q$, $q$https://www.pixpa.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eef4f17c-1c20-4cb2-9bf7-47a0e5632c8c', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eef4f17c-1c20-4cb2-9bf7-47a0e5632c8c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('036ebb4f-fc22-4057-831e-b9e581009137', $q$format$q$, $q$Format$q$, $q$https://www.format.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '036ebb4f-fc22-4057-831e-b9e581009137', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '036ebb4f-fc22-4057-831e-b9e581009137')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('46a8e7ec-2b99-40e2-adca-8f81f3b71e57', $q$webnode$q$, $q$Webnode$q$, $q$https://www.webnode.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '46a8e7ec-2b99-40e2-adca-8f81f3b71e57', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46a8e7ec-2b99-40e2-adca-8f81f3b71e57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa13d6c0-d32a-426d-805b-8124f40390e4', $q$strikingly$q$, $q$Strikingly$q$, $q$https://www.strikingly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa13d6c0-d32a-426d-805b-8124f40390e4', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa13d6c0-d32a-426d-805b-8124f40390e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ab99a23-e2f0-4b0d-b603-9ded27a0f2c6', $q$site123$q$, $q$SITE123$q$, $q$https://www.site123.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ab99a23-e2f0-4b0d-b603-9ded27a0f2c6', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ab99a23-e2f0-4b0d-b603-9ded27a0f2c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a66d624-b348-4934-a255-2bc306fdcf7b', $q$jimdo$q$, $q$Jimdo$q$, $q$https://www.jimdo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a66d624-b348-4934-a255-2bc306fdcf7b', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a66d624-b348-4934-a255-2bc306fdcf7b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$substack$q$, $q$Substack$q$, $q$https://substack.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3d9c7050-c8fc-42d3-9a25-ef88330023f2', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9edefa30-90ff-46ea-8aa7-f8de6be4c79c', $q$letterdrop$q$, $q$Letterdrop$q$, $q$https://letterdrop.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9edefa30-90ff-46ea-8aa7-f8de6be4c79c', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9edefa30-90ff-46ea-8aa7-f8de6be4c79c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b333f512-f7fd-4bd3-a4a4-6210ddaae0a8', $q$buttercms$q$, $q$ButterCMS$q$, $q$https://buttercms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b333f512-f7fd-4bd3-a4a4-6210ddaae0a8', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b333f512-f7fd-4bd3-a4a4-6210ddaae0a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dca1fcb2-9238-4516-ba95-c8cb62820764', $q$contentful$q$, $q$Contentful$q$, $q$https://www.contentful.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dca1fcb2-9238-4516-ba95-c8cb62820764', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dca1fcb2-9238-4516-ba95-c8cb62820764')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6e2b87a4-c5be-4f23-acc9-dd611b9c5856', $q$storyblok$q$, $q$Storyblok$q$, $q$https://www.storyblok.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6e2b87a4-c5be-4f23-acc9-dd611b9c5856', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e2b87a4-c5be-4f23-acc9-dd611b9c5856')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9e4d2898-7923-44d2-a2aa-f2138ec31ce4', $q$prismic$q$, $q$Prismic$q$, $q$https://prismic.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9e4d2898-7923-44d2-a2aa-f2138ec31ce4', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9e4d2898-7923-44d2-a2aa-f2138ec31ce4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a7743d6-ac1d-4562-b878-cfc332ab5aeb', $q$datocms$q$, $q$DatoCMS$q$, $q$https://www.datocms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a7743d6-ac1d-4562-b878-cfc332ab5aeb', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a7743d6-ac1d-4562-b878-cfc332ab5aeb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9eb13448-c65d-4848-a1d8-3d2a010b723d', $q$strapi$q$, $q$Strapi$q$, $q$https://strapi.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9eb13448-c65d-4848-a1d8-3d2a010b723d', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9eb13448-c65d-4848-a1d8-3d2a010b723d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cfb2973b-621a-4e4a-b368-035048c957fd', $q$sanity$q$, $q$Sanity$q$, $q$https://www.sanity.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cfb2973b-621a-4e4a-b368-035048c957fd', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfb2973b-621a-4e4a-b368-035048c957fd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a106a741-e518-4de4-ace7-f5c84db01f4a', $q$directus$q$, $q$Directus$q$, $q$https://directus.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a106a741-e518-4de4-ace7-f5c84db01f4a', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a106a741-e518-4de4-ace7-f5c84db01f4a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('14aeb166-94c7-4343-ba72-b485b767c52b', $q$payload-cms$q$, $q$Payload CMS$q$, $q$https://payloadcms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '14aeb166-94c7-4343-ba72-b485b767c52b', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '14aeb166-94c7-4343-ba72-b485b767c52b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b211eaab-26f2-46f7-b63b-6470f8655fa2', $q$hygraph$q$, $q$Hygraph$q$, $q$https://hygraph.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b211eaab-26f2-46f7-b63b-6470f8655fa2', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b211eaab-26f2-46f7-b63b-6470f8655fa2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a056723-ee4b-46ab-988f-3d80d7a96c4e', $q$dixa$q$, $q$Dixa$q$, $q$https://www.dixa.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a056723-ee4b-46ab-988f-3d80d7a96c4e', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a056723-ee4b-46ab-988f-3d80d7a96c4e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d4ff1377-e0f5-4af0-9e80-71487c351c04', $q$gladly$q$, $q$Gladly$q$, $q$https://www.gladly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd4ff1377-e0f5-4af0-9e80-71487c351c04', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4ff1377-e0f5-4af0-9e80-71487c351c04')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f232ed0f-8c1a-4fee-9d5d-b7fe5094bbbb', $q$richpanel$q$, $q$Richpanel$q$, $q$https://www.richpanel.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f232ed0f-8c1a-4fee-9d5d-b7fe5094bbbb', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f232ed0f-8c1a-4fee-9d5d-b7fe5094bbbb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a3094cf-a8e5-4f7e-b9ed-7fe69416116b', $q$re-amaze$q$, $q$Re:amaze$q$, $q$https://www.reamaze.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a3094cf-a8e5-4f7e-b9ed-7fe69416116b', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a3094cf-a8e5-4f7e-b9ed-7fe69416116b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0f1da1ce-d152-40e9-b9f0-ad9c3adae164', $q$groove$q$, $q$Groove$q$, $q$https://www.groovehq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0f1da1ce-d152-40e9-b9f0-ad9c3adae164', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f1da1ce-d152-40e9-b9f0-ad9c3adae164')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$hiver$q$, $q$Hiver$q$, $q$https://hiverhq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'badfcb90-2ef7-4fee-a3ed-8a5021afbe5f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$trengo$q$, $q$Trengo$q$, $q$https://trengo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '463b249f-58f5-4f62-8f21-0f807fd8bd65', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '463b249f-58f5-4f62-8f21-0f807fd8bd65')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$respond-io$q$, $q$Respond.io$q$, $q$https://respond.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$sleekflow$q$, $q$SleekFlow$q$, $q$https://sleekflow.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$interakt$q$, $q$Interakt$q$, $q$https://www.interakt.shop$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '993a2b5b-ee72-498b-b5f1-82135cc21b11', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '993a2b5b-ee72-498b-b5f1-82135cc21b11')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$wati$q$, $q$WATI$q$, $q$https://www.wati.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6defa3eb-e961-45d0-b2f3-df7356237cfc', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6defa3eb-e961-45d0-b2f3-df7356237cfc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$delightchat$q$, $q$DelightChat$q$, $q$https://www.delightchat.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$kommunicate$q$, $q$Kommunicate$q$, $q$https://www.kommunicate.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11ab9318-aa3a-43fc-9832-012d933cd2d2', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11ab9318-aa3a-43fc-9832-012d933cd2d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$chatwoot$q$, $q$Chatwoot$q$, $q$https://www.chatwoot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d4fbeed-972a-4e00-a10d-3f6c2b06033c', $q$userlike$q$, $q$Userlike$q$, $q$https://www.userlike.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d4fbeed-972a-4e00-a10d-3f6c2b06033c', '5d96e755-2b5d-4e57-81f1-0b4793122d6a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d4fbeed-972a-4e00-a10d-3f6c2b06033c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$smartsupp$q$, $q$Smartsupp$q$, $q$https://www.smartsupp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f54afb02-05b6-4fdd-aaff-7d81680e4f4d', '5d96e755-2b5d-4e57-81f1-0b4793122d6a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f54afb02-05b6-4fdd-aaff-7d81680e4f4d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$chaport$q$, $q$Chaport$q$, $q$https://www.chaport.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '02537e9f-5e3e-4e2f-9b7e-a73669114bd6', '5d96e755-2b5d-4e57-81f1-0b4793122d6a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02537e9f-5e3e-4e2f-9b7e-a73669114bd6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f76f119f-94eb-416d-8b1a-53da64763684', $q$jivochat$q$, $q$JivoChat$q$, $q$https://www.jivochat.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f76f119f-94eb-416d-8b1a-53da64763684', '5d96e755-2b5d-4e57-81f1-0b4793122d6a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f76f119f-94eb-416d-8b1a-53da64763684')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$helpcrunch$q$, $q$HelpCrunch$q$, $q$https://helpcrunch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4cf4770-d131-451c-a3a1-895ba3bfb0da', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4cf4770-d131-451c-a3a1-895ba3bfb0da')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('56724599-1872-4e62-b903-ed19a3916f2f', $q$supportbee$q$, $q$SupportBee$q$, $q$https://supportbee.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '56724599-1872-4e62-b903-ed19a3916f2f', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56724599-1872-4e62-b903-ed19a3916f2f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$proprofs-help-desk$q$, $q$ProProfs Help Desk$q$, $q$https://www.proprofsdesk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20d62d48-b10a-49b7-a013-1df91c3f9d32', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20d62d48-b10a-49b7-a013-1df91c3f9d32')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$liveagent$q$, $q$LiveAgent$q$, $q$https://www.liveagent.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '861123b5-2ddd-4c46-aa4f-eb2c58a34c58', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '861123b5-2ddd-4c46-aa4f-eb2c58a34c58')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$teamsupport$q$, $q$TeamSupport$q$, $q$https://www.teamsupport.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3478a3af-daa1-4153-b114-3f47610904fd', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3478a3af-daa1-4153-b114-3f47610904fd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$deskpro$q$, $q$Deskpro$q$, $q$https://www.deskpro.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$humaans$q$, $q$Humaans$q$, $q$https://humaans.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '263780ad-dbb8-4862-b01a-e1ce95f8fa3a', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '263780ad-dbb8-4862-b01a-e1ce95f8fa3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28db2214-8104-44f7-8d16-5482ac920f21', $q$charliehr$q$, $q$CharlieHR$q$, $q$https://www.charliehr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28db2214-8104-44f7-8d16-5482ac920f21', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28db2214-8104-44f7-8d16-5482ac920f21')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$breathehr$q$, $q$BreatheHR$q$, $q$https://www.breathehr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae6561ef-62fe-443b-995a-a1d36df5ea91', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('59e37590-ebda-42a1-b306-93eb66b13b27', $q$zenefits$q$, $q$Zenefits$q$, $q$https://www.zenefits.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '59e37590-ebda-42a1-b306-93eb66b13b27', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59e37590-ebda-42a1-b306-93eb66b13b27')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('868cf043-41bd-45f4-8568-13b59cf7fb93', $q$namely$q$, $q$Namely$q$, $q$https://www.namely.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '868cf043-41bd-45f4-8568-13b59cf7fb93', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '868cf043-41bd-45f4-8568-13b59cf7fb93')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$justworks$q$, $q$Justworks$q$, $q$https://www.justworks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '938ab555-9fbc-47d8-a414-f6dbfadcc473', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '938ab555-9fbc-47d8-a414-f6dbfadcc473')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$papaya-global$q$, $q$Papaya Global$q$, $q$https://www.papayaglobal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ccd5534-faa4-40e5-8b15-5ca13db08e2e', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ccd5534-faa4-40e5-8b15-5ca13db08e2e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('44ab8232-5537-40f1-b180-862658c8fcf5', $q$oyster$q$, $q$Oyster$q$, $q$https://www.oysterhr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '44ab8232-5537-40f1-b180-862658c8fcf5', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44ab8232-5537-40f1-b180-862658c8fcf5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$multiplier$q$, $q$Multiplier$q$, $q$https://www.usemultiplier.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'da1eed86-f886-4ac0-9587-89ab0dce35f5', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da1eed86-f886-4ac0-9587-89ab0dce35f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb31e8ae-e570-4e3e-b865-b4f831c70398', $q$velocity-global$q$, $q$Velocity Global$q$, $q$https://velocityglobal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb31e8ae-e570-4e3e-b865-b4f831c70398', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb31e8ae-e570-4e3e-b865-b4f831c70398')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20fdae09-a17f-4c37-95f5-f6abf19c93b5', $q$omnipresent$q$, $q$Omnipresent$q$, $q$https://www.omnipresent.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20fdae09-a17f-4c37-95f5-f6abf19c93b5', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20fdae09-a17f-4c37-95f5-f6abf19c93b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41688164-bff2-4d0a-8c55-4d847c936f12', $q$plane$q$, $q$Plane$q$, $q$https://plane.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41688164-bff2-4d0a-8c55-4d847c936f12', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41688164-bff2-4d0a-8c55-4d847c936f12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ad918d40-0018-4143-a607-5a36dd55baf6', $q$remotepass$q$, $q$RemotePass$q$, $q$https://www.remotepass.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ad918d40-0018-4143-a607-5a36dd55baf6', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad918d40-0018-4143-a607-5a36dd55baf6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1a0ac46b-2692-406a-b868-73e8c7b627db', $q$workmotion$q$, $q$WorkMotion$q$, $q$https://workmotion.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1a0ac46b-2692-406a-b868-73e8c7b627db', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a0ac46b-2692-406a-b868-73e8c7b627db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1850649f-0915-4e09-87b7-b7aa588ddd00', $q$pinpoint$q$, $q$Pinpoint$q$, $q$https://www.pinpointhq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1850649f-0915-4e09-87b7-b7aa588ddd00', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1850649f-0915-4e09-87b7-b7aa588ddd00')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d4790e8a-5afa-40c4-9e80-1e6489a84434', $q$manatal$q$, $q$Manatal$q$, $q$https://www.manatal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd4790e8a-5afa-40c4-9e80-1e6489a84434', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4790e8a-5afa-40c4-9e80-1e6489a84434')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ecc248c8-d683-44ea-8e90-40d9194740c1', $q$comeet$q$, $q$Comeet$q$, $q$https://www.comeet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ecc248c8-d683-44ea-8e90-40d9194740c1', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ecc248c8-d683-44ea-8e90-40d9194740c1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$jobvite$q$, $q$Jobvite$q$, $q$https://www.jobvite.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06eb9255-8dff-49b4-92cb-b6dfc17d5493', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06eb9255-8dff-49b4-92cb-b6dfc17d5493')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7018fde8-f2e0-455a-ae95-59b95db2c107', $q$smartrecruiters$q$, $q$SmartRecruiters$q$, $q$https://www.smartrecruiters.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7018fde8-f2e0-455a-ae95-59b95db2c107', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7018fde8-f2e0-455a-ae95-59b95db2c107')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$icims$q$, $q$iCIMS$q$, $q$https://www.icims.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af2f837c-b8e2-4cf6-bb19-100a26c709af', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af2f837c-b8e2-4cf6-bb19-100a26c709af')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$bullhorn$q$, $q$Bullhorn$q$, $q$https://www.bullhorn.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c7efb47-f269-4e6f-aecc-cb8f27126ca9', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ade06e5-b645-47e5-8350-a2890ac101e4', $q$gem$q$, $q$Gem$q$, $q$https://www.gem.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ade06e5-b645-47e5-8350-a2890ac101e4', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ade06e5-b645-47e5-8350-a2890ac101e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$fetcher$q$, $q$Fetcher$q$, $q$https://fetcher.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c209af5-e769-4601-8b16-169d41b98725', $q$amazinghiring$q$, $q$AmazingHiring$q$, $q$https://amazinghiring.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c209af5-e769-4601-8b16-169d41b98725', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c209af5-e769-4601-8b16-169d41b98725')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('72083907-7b29-4e6e-80d3-6134cca542d6', $q$payhawk$q$, $q$Payhawk$q$, $q$https://payhawk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '72083907-7b29-4e6e-80d3-6134cca542d6', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72083907-7b29-4e6e-80d3-6134cca542d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3f26fe2f-0d14-4d94-8521-de088090412c', $q$airwallex$q$, $q$Airwallex$q$, $q$https://www.airwallex.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3f26fe2f-0d14-4d94-8521-de088090412c', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f26fe2f-0d14-4d94-8521-de088090412c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$mercury$q$, $q$Mercury$q$, $q$https://mercury.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '83233571-dfd1-4aa8-9b81-a9cb76f036cd', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83233571-dfd1-4aa8-9b81-a9cb76f036cd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$novo$q$, $q$Novo$q$, $q$https://www.novo.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '596a21e4-5cc6-4e45-bc09-c76587b5f3a1', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '596a21e4-5cc6-4e45-bc09-c76587b5f3a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$relay-financial$q$, $q$Relay Financial$q$, $q$https://relayfi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a668def-7d55-49ba-9faf-7c5b9537b7a6', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a668def-7d55-49ba-9faf-7c5b9537b7a6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11cc6093-d880-4046-9b74-e055ae089a8e', $q$moss$q$, $q$Moss$q$, $q$https://www.getmoss.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11cc6093-d880-4046-9b74-e055ae089a8e', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11cc6093-d880-4046-9b74-e055ae089a8e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$spendesk$q$, $q$Spendesk$q$, $q$https://www.spendesk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ba07fd5-6473-4fc4-82ad-f56d8e4becca', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f4a927a2-feba-4930-ad55-823b90a5c145', $q$pleo$q$, $q$Pleo$q$, $q$https://www.pleo.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f4a927a2-feba-4930-ad55-823b90a5c145', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4a927a2-feba-4930-ad55-823b90a5c145')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('639b380d-84c6-419b-a52a-8ad57b880d9c', $q$jeeves$q$, $q$Jeeves$q$, $q$https://www.tryjeeves.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '639b380d-84c6-419b-a52a-8ad57b880d9c', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '639b380d-84c6-419b-a52a-8ad57b880d9c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$mesh-payments$q$, $q$Mesh Payments$q$, $q$https://meshpayments.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13a40e93-2361-4019-8f00-7522e0ed8bb9', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13a40e93-2361-4019-8f00-7522e0ed8bb9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$float-financial$q$, $q$Float Financial$q$, $q$https://floatfinancial.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b97775a6-c87a-47b1-802f-7aa8a3280f6a', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b97775a6-c87a-47b1-802f-7aa8a3280f6a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('04370e5b-5bb7-44db-b5e6-2db98849560d', $q$rho$q$, $q$Rho$q$, $q$https://www.rho.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '04370e5b-5bb7-44db-b5e6-2db98849560d', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04370e5b-5bb7-44db-b5e6-2db98849560d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$tipalti$q$, $q$Tipalti$q$, $q$https://tipalti.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3cb98c1a-15c7-489f-9a78-52137ee7cc38', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cb98c1a-15c7-489f-9a78-52137ee7cc38')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5893a7aa-99e0-4440-9c42-21e023145c91', $q$avidxchange$q$, $q$AvidXchange$q$, $q$https://www.avidxchange.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5893a7aa-99e0-4440-9c42-21e023145c91', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5893a7aa-99e0-4440-9c42-21e023145c91')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('849e570b-901b-439e-b55b-ab7c7b657c2c', $q$melio$q$, $q$Melio$q$, $q$https://meliopayments.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '849e570b-901b-439e-b55b-ab7c7b657c2c', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '849e570b-901b-439e-b55b-ab7c7b657c2c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$payoneer$q$, $q$Payoneer$q$, $q$https://www.payoneer.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f63dc78f-9d0d-4816-9ca0-858dd2947329', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f63dc78f-9d0d-4816-9ca0-858dd2947329')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$gocardless$q$, $q$GoCardless$q$, $q$https://gocardless.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '44e76fa8-8fba-447b-a227-c3bb42e2b74f', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44e76fa8-8fba-447b-a227-c3bb42e2b74f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d50744af-e272-48a8-a0dc-044078b5dab2', $q$mollie$q$, $q$Mollie$q$, $q$https://www.mollie.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd50744af-e272-48a8-a0dc-044078b5dab2', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd50744af-e272-48a8-a0dc-044078b5dab2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23986f65-446a-4255-8e2d-e265951f2262', $q$checkout-com$q$, $q$Checkout.com$q$, $q$https://www.checkout.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23986f65-446a-4255-8e2d-e265951f2262', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23986f65-446a-4255-8e2d-e265951f2262')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('633df78b-c6d3-45d8-a067-207679f3055d', $q$braintree$q$, $q$Braintree$q$, $q$https://www.braintreepayments.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '633df78b-c6d3-45d8-a067-207679f3055d', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '633df78b-c6d3-45d8-a067-207679f3055d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$fastspring$q$, $q$FastSpring$q$, $q$https://fastspring.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', 'af5053c8-d7cb-418d-bc99-0d6c06e61dee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$lemon-squeezy$q$, $q$Lemon Squeezy$q$, $q$https://www.lemonsqueezy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', 'af5053c8-d7cb-418d-bc99-0d6c06e61dee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38ebcc23-ac70-4e3b-9657-c3d8f9ce03db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$orb$q$, $q$Orb$q$, $q$https://www.withorb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1062364-3f5b-45dc-b882-5a0283cbb0a9', 'af5053c8-d7cb-418d-bc99-0d6c06e61dee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1062364-3f5b-45dc-b882-5a0283cbb0a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3979638f-c194-4be0-8b95-c01a647146b8', $q$metronome$q$, $q$Metronome$q$, $q$https://metronome.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3979638f-c194-4be0-8b95-c01a647146b8', 'af5053c8-d7cb-418d-bc99-0d6c06e61dee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3979638f-c194-4be0-8b95-c01a647146b8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$billsby$q$, $q$Billsby$q$, $q$https://www.billsby.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf', 'af5053c8-d7cb-418d-bc99-0d6c06e61dee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$pendo$q$, $q$Pendo$q$, $q$https://www.pendo.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9a45dfc-a1c5-48e9-bcd3-8ece140c07de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$userpilot$q$, $q$Userpilot$q$, $q$https://userpilot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b3d60135-85d7-42ac-a6e3-1d9981eb7347', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$appcues$q$, $q$Appcues$q$, $q$https://www.appcues.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06c62a86-d703-4a91-808a-a0aece77e321', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06c62a86-d703-4a91-808a-a0aece77e321')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$chameleon$q$, $q$Chameleon$q$, $q$https://www.chameleon.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a6ea67e-e786-4158-b3c6-d8553bbb3f73', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a6ea67e-e786-4158-b3c6-d8553bbb3f73')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05d6fc4d-ceaf-43ae-acac-3c7f072c89f2', $q$userflow$q$, $q$Userflow$q$, $q$https://userflow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05d6fc4d-ceaf-43ae-acac-3c7f072c89f2', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05d6fc4d-ceaf-43ae-acac-3c7f072c89f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af388462-725e-429b-a572-58a70a2238c4', $q$product-fruits$q$, $q$Product Fruits$q$, $q$https://productfruits.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af388462-725e-429b-a572-58a70a2238c4', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af388462-725e-429b-a572-58a70a2238c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$userguiding$q$, $q$UserGuiding$q$, $q$https://userguiding.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b0d980b-c01e-40ef-a82b-19f1c57289fc', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b0d980b-c01e-40ef-a82b-19f1c57289fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('027cd382-5c16-4471-a3a4-67f985398adc', $q$usetiful$q$, $q$Usetiful$q$, $q$https://www.usetiful.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '027cd382-5c16-4471-a3a4-67f985398adc', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '027cd382-5c16-4471-a3a4-67f985398adc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76b93382-78f6-4307-a718-eb538f112980', $q$walkme$q$, $q$WalkMe$q$, $q$https://www.walkme.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76b93382-78f6-4307-a718-eb538f112980', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76b93382-78f6-4307-a718-eb538f112980')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$whatfix$q$, $q$Whatfix$q$, $q$https://whatfix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4fb71d52-71a3-4323-95eb-7716ce97e45c', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4fb71d52-71a3-4323-95eb-7716ce97e45c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', $q$apty$q$, $q$Apty$q$, $q$https://www.apty.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e097cf49-379b-418c-9290-d13e3cc829ec', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e097cf49-379b-418c-9290-d13e3cc829ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d1ae0c2a-8164-4d82-8db2-7660d9fe7b09', $q$june$q$, $q$June$q$, $q$https://www.june.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd1ae0c2a-8164-4d82-8db2-7660d9fe7b09', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1ae0c2a-8164-4d82-8db2-7660d9fe7b09')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('030586da-c7c2-4395-8a88-ab6c99d72278', $q$indicative$q$, $q$Indicative$q$, $q$https://www.indicative.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '030586da-c7c2-4395-8a88-ab6c99d72278', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '030586da-c7c2-4395-8a88-ab6c99d72278')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53917c26-0b07-4781-b634-418d24dbcef3', $q$logsnag$q$, $q$LogSnag$q$, $q$https://logsnag.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53917c26-0b07-4781-b634-418d24dbcef3', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53917c26-0b07-4781-b634-418d24dbcef3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$pirsch$q$, $q$Pirsch$q$, $q$https://pirsch.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c25d8ee5-3608-4fe0-8763-83ed5faa70fe', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c25d8ee5-3608-4fe0-8763-83ed5faa70fe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$fathom-analytics$q$, $q$Fathom Analytics$q$, $q$https://usefathom.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9974bf44-ff46-4392-bd8f-98b3ee10f69b', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9974bf44-ff46-4392-bd8f-98b3ee10f69b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('721b3a38-d061-4bfd-94f0-6785a52684c9', $q$simple-analytics$q$, $q$Simple Analytics$q$, $q$https://simpleanalytics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '721b3a38-d061-4bfd-94f0-6785a52684c9', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '721b3a38-d061-4bfd-94f0-6785a52684c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', $q$cabin$q$, $q$Cabin$q$, $q$https://withcabin.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0050715-8a0a-4437-8c80-e7d842301783', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0050715-8a0a-4437-8c80-e7d842301783')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$statsig$q$, $q$Statsig$q$, $q$https://www.statsig.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$growthbook$q$, $q$GrowthBook$q$, $q$https://www.growthbook.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$jumpcloud$q$, $q$JumpCloud$q$, $q$https://jumpcloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$duo-security$q$, $q$Duo Security$q$, $q$https://duo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '70bf6be7-f47b-4ba4-936b-47ece1be0301', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70bf6be7-f47b-4ba4-936b-47ece1be0301')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b790465f-8d9b-4776-8b1b-364273fb48a0', $q$twingate$q$, $q$Twingate$q$, $q$https://www.twingate.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b790465f-8d9b-4776-8b1b-364273fb48a0', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b790465f-8d9b-4776-8b1b-364273fb48a0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('621c1563-301c-4006-9dc0-beb9d7803b61', $q$teleport$q$, $q$Teleport$q$, $q$https://goteleport.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '621c1563-301c-4006-9dc0-beb9d7803b61', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '621c1563-301c-4006-9dc0-beb9d7803b61')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$strongdm$q$, $q$StrongDM$q$, $q$https://www.strongdm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a50e7f9-8dac-4f95-a6a8-044c2a5b961d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6af1626a-384b-452a-8ba7-fab48922dd57', $q$kolide$q$, $q$Kolide$q$, $q$https://www.kolide.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6af1626a-384b-452a-8ba7-fab48922dd57', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6af1626a-384b-452a-8ba7-fab48922dd57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0661eaf-0146-4993-862a-300b62279f7d', $q$drata$q$, $q$Drata$q$, $q$https://drata.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0661eaf-0146-4993-862a-300b62279f7d', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0661eaf-0146-4993-862a-300b62279f7d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0412c80c-5647-4376-b362-9ccece4ef8e5', $q$hyperproof$q$, $q$Hyperproof$q$, $q$https://hyperproof.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0412c80c-5647-4376-b362-9ccece4ef8e5', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0412c80c-5647-4376-b362-9ccece4ef8e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('39e085ba-918c-440b-8ad4-af576ba5ba03', $q$thoropass$q$, $q$Thoropass$q$, $q$https://thoropass.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '39e085ba-918c-440b-8ad4-af576ba5ba03', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39e085ba-918c-440b-8ad4-af576ba5ba03')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$sprinto$q$, $q$Sprinto$q$, $q$https://sprinto.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '01db3fa1-4544-4df3-b94a-c8779f0ed121', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01db3fa1-4544-4df3-b94a-c8779f0ed121')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('52bf5267-89af-4200-b109-d8ec448cc105', $q$scrut-automation$q$, $q$Scrut Automation$q$, $q$https://www.scrut.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '52bf5267-89af-4200-b109-d8ec448cc105', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52bf5267-89af-4200-b109-d8ec448cc105')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$astra-security$q$, $q$Astra Security$q$, $q$https://www.getastra.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$snyk$q$, $q$Snyk$q$, $q$https://snyk.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7fb17539-57c9-48ad-9999-e9c23b8b0ab8', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$semgrep$q$, $q$Semgrep$q$, $q$https://semgrep.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b87aa12-a696-4762-9cbd-1a738f0fd2c7', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b87aa12-a696-4762-9cbd-1a738f0fd2c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$sonarqube-cloud$q$, $q$SonarQube Cloud$q$, $q$https://www.sonarsource.com/products/sonarcloud$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '19756a8e-09b5-44fb-801b-926184dbba14', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19756a8e-09b5-44fb-801b-926184dbba14')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$gitguardian$q$, $q$GitGuardian$q$, $q$https://www.gitguardian.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f79bb617-e492-4f3f-b2e0-6a6ffd43dc71')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$socket$q$, $q$Socket$q$, $q$https://socket.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95b33c4f-2d04-4277-8964-3cefa7c43f5f', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$aikido-security$q$, $q$Aikido Security$q$, $q$https://www.aikido.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '500f337a-c890-4561-b62d-d9dfd247fbc6', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '500f337a-c890-4561-b62d-d9dfd247fbc6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$wiz$q$, $q$Wiz$q$, $q$https://www.wiz.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$orca-security$q$, $q$Orca Security$q$, $q$https://orca.security$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de412e9f-bb56-438d-8972-125d8b06d414', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de412e9f-bb56-438d-8972-125d8b06d414')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b02fce7-12a6-4798-9309-0b54f402ce7f', $q$lacework$q$, $q$Lacework$q$, $q$https://www.lacework.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b02fce7-12a6-4798-9309-0b54f402ce7f', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b02fce7-12a6-4798-9309-0b54f402ce7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$tenable$q$, $q$Tenable$q$, $q$https://www.tenable.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$rapid7$q$, $q$Rapid7$q$, $q$https://www.rapid7.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13b772a5-dcc4-4861-96b2-092a5abf26bb', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13b772a5-dcc4-4861-96b2-092a5abf26bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$huntress$q$, $q$Huntress$q$, $q$https://www.huntress.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6519e387-8e19-4973-8093-cbf36862242e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6519e387-8e19-4973-8093-cbf36862242e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$vanta$q$, $q$Vanta$q$, $q$https://www.vanta.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'afc32d91-8855-4308-bcef-20828d9e78e2', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afc32d91-8855-4308-bcef-20828d9e78e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$fillout$q$, $q$Fillout$q$, $q$https://www.fillout.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e77aef61-9ca8-4e8b-8c7c-e11365f41e17', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e77aef61-9ca8-4e8b-8c7c-e11365f41e17')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$feathery$q$, $q$Feathery$q$, $q$https://www.feathery.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'acaa6370-6b47-4ce4-a037-fe2c52fd137b', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'acaa6370-6b47-4ce4-a037-fe2c52fd137b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$formbricks$q$, $q$Formbricks$q$, $q$https://formbricks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6b896e4-5bf3-4a3c-9f83-469792152818', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6b896e4-5bf3-4a3c-9f83-469792152818')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$formsort$q$, $q$Formsort$q$, $q$https://formsort.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2118c9da-01b6-493f-b26d-224cc4de5ba8', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2118c9da-01b6-493f-b26d-224cc4de5ba8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$formcarry$q$, $q$Formcarry$q$, $q$https://formcarry.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76d62d00-398c-4138-b919-379a5ca37c2b', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76d62d00-398c-4138-b919-379a5ca37c2b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$formspark$q$, $q$Formspark$q$, $q$https://formspark.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '304e1389-15d6-4292-826c-3085c32d74e1', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '304e1389-15d6-4292-826c-3085c32d74e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$heyflow$q$, $q$Heyflow$q$, $q$https://heyflow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '69056d48-f2a0-4191-ac9b-4a5b7c1c0412', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69056d48-f2a0-4191-ac9b-4a5b7c1c0412')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$involve-me$q$, $q$involve.me$q$, $q$https://www.involve.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd865b7df-50df-49c9-97ab-b4f5ff75a05c', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd865b7df-50df-49c9-97ab-b4f5ff75a05c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$outgrow$q$, $q$Outgrow$q$, $q$https://outgrow.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba73b0fc-07ff-4d10-9bbb-1291ae579cf8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$scoreapp$q$, $q$ScoreApp$q$, $q$https://www.scoreapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e479f0c5-74e4-41f4-aa19-bfdcda30ccd9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$opinion-stage$q$, $q$Opinion Stage$q$, $q$https://www.opinionstage.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '448308da-5605-49bb-9624-815b9f255cf3', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '448308da-5605-49bb-9624-815b9f255cf3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$youform$q$, $q$Youform$q$, $q$https://youform.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'acb5fd7b-7099-4d41-a28a-be19f1114546', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'acb5fd7b-7099-4d41-a28a-be19f1114546')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$cal-com$q$, $q$Cal.com$q$, $q$https://cal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$savvycal$q$, $q$SavvyCal$q$, $q$https://savvycal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7bb0117d-0174-4a18-963f-a0a873a4b2b1', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bb0117d-0174-4a18-963f-a0a873a4b2b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$zencal$q$, $q$Zencal$q$, $q$https://zencal.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bef9e8d8-86d1-4254-b054-8fdc286672d5', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bef9e8d8-86d1-4254-b054-8fdc286672d5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$oncehub$q$, $q$OnceHub$q$, $q$https://www.oncehub.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bde29d40-4c62-40a8-861e-ba3a8862dedc', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bde29d40-4c62-40a8-861e-ba3a8862dedc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$youcanbookme$q$, $q$YouCanBookMe$q$, $q$https://youcanbook.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '523ab821-6dbc-4f0a-ad9c-477f20ab7e52', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '523ab821-6dbc-4f0a-ad9c-477f20ab7e52')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$setmore$q$, $q$Setmore$q$, $q$https://www.setmore.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd498e2a2-205f-436a-b281-0d60d3a97b18', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd498e2a2-205f-436a-b281-0d60d3a97b18')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$appointlet$q$, $q$Appointlet$q$, $q$https://www.appointlet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$calday$q$, $q$Calday$q$, $q$https://calday.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59765ae5-0390-4cfe-8c3d-77fc6b87aa0d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$doodle$q$, $q$Doodle$q$, $q$https://doodle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f952f07d-b3f7-4527-af58-4d07608f83cf', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f952f07d-b3f7-4527-af58-4d07608f83cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$lettucemeet$q$, $q$LettuceMeet$q$, $q$https://lettucemeet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '636ed515-67d3-49ef-bcc8-c781f89295ef', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '636ed515-67d3-49ef-bcc8-c781f89295ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$zeeg$q$, $q$Zeeg$q$, $q$https://zeeg.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3be42f56-bb10-429e-833e-4732e857fc3a', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3be42f56-bb10-429e-833e-4732e857fc3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$cronofy$q$, $q$Cronofy$q$, $q$https://www.cronofy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6e0d85c-8664-4863-9ef9-fd20448bffd6', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6e0d85c-8664-4863-9ef9-fd20448bffd6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$penpot$q$, $q$Penpot$q$, $q$https://penpot.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e79526e3-fc9f-4ec0-848a-0c70b7a3bd92')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$lunacy$q$, $q$Lunacy$q$, $q$https://icons8.com/lunacy$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$visme$q$, $q$Visme$q$, $q$https://www.visme.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$piktochart$q$, $q$Piktochart$q$, $q$https://piktochart.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd5db9612-39d7-4c31-8562-b26cbfaca743', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5db9612-39d7-4c31-8562-b26cbfaca743')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$venngage$q$, $q$Venngage$q$, $q$https://venngage.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ce3723e1-5b42-475e-a527-b5f4b7ad1088', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$snappa$q$, $q$Snappa$q$, $q$https://snappa.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$relaythat$q$, $q$RelayThat$q$, $q$https://relaythat.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2b39520f-ab30-4e58-8473-236949ec4dc5', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b39520f-ab30-4e58-8473-236949ec4dc5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$marq$q$, $q$Marq$q$, $q$https://www.marq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d954194-528b-4c02-af62-5032ccb9918a', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d954194-528b-4c02-af62-5032ccb9918a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$kittl$q$, $q$Kittl$q$, $q$https://www.kittl.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3823f80c-7e1b-4a40-b37f-ad8fde45d0d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$artboard-studio$q$, $q$Artboard Studio$q$, $q$https://artboard.studio$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$rotato$q$, $q$Rotato$q$, $q$https://rotato.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fa4a289c-deca-4f77-9a17-9124d83266ee', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa4a289c-deca-4f77-9a17-9124d83266ee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$shots$q$, $q$Shots$q$, $q$https://shots.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4ed46725-5825-4345-b71d-388bad6fdf91', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ed46725-5825-4345-b71d-388bad6fdf91')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$screen-studio$q$, $q$Screen Studio$q$, $q$https://www.screen.studio$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '79f83550-468f-4378-89d2-b95607e2f72e', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79f83550-468f-4378-89d2-b95607e2f72e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$tella$q$, $q$Tella$q$, $q$https://www.tella.tv$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b1850e50-e82f-45cf-a0c9-accb892735a7', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1850e50-e82f-45cf-a0c9-accb892735a7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$cleanshot-x$q$, $q$CleanShot X$q$, $q$https://cleanshot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e49a063e-cf60-43ca-ac4b-f2c2740a9b67', '29f51ada-e228-4df3-b7e2-da46b190ef89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e49a063e-cf60-43ca-ac4b-f2c2740a9b67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$xnapper$q$, $q$Xnapper$q$, $q$https://xnapper.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '75b7cec6-4a39-4456-8f5f-bb719bb42775', '29f51ada-e228-4df3-b7e2-da46b190ef89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75b7cec6-4a39-4456-8f5f-bb719bb42775')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$screenflow$q$, $q$ScreenFlow$q$, $q$https://www.telestream.net/screenflow$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '45e6cf2f-5a73-4152-bc7c-35947a2f985f', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45e6cf2f-5a73-4152-bc7c-35947a2f985f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$camtasia$q$, $q$Camtasia$q$, $q$https://www.techsmith.com/camtasia$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '217a3242-bd27-4f82-bf44-e768e2d249f8', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '217a3242-bd27-4f82-bf44-e768e2d249f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cdb2d9da-e798-41d0-8f9e-fc95973d9f1e', $q$zight$q$, $q$Zight$q$, $q$https://zight.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cdb2d9da-e798-41d0-8f9e-fc95973d9f1e', '29f51ada-e228-4df3-b7e2-da46b190ef89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdb2d9da-e798-41d0-8f9e-fc95973d9f1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$jitter$q$, $q$Jitter$q$, $q$https://jitter.video$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '78d1d55e-3d44-4509-a118-9b5206efa57a', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78d1d55e-3d44-4509-a118-9b5206efa57a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$rive$q$, $q$Rive$q$, $q$https://rive.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dcc42744-8093-4da4-b78b-0290e5d5def0', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dcc42744-8093-4da4-b78b-0290e5d5def0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$spline$q$, $q$Spline$q$, $q$https://spline.design$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fdd5fb34-6747-4479-81aa-8ae793ce0279', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdd5fb34-6747-4479-81aa-8ae793ce0279')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$protopie$q$, $q$ProtoPie$q$, $q$https://www.protopie.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bcaff713-bcb7-45e0-a2be-7c83c04fb5a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$principle$q$, $q$Principle$q$, $q$https://principleformac.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99ec53f2-7bec-4016-a54d-dea91440a5b5', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99ec53f2-7bec-4016-a54d-dea91440a5b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$sintra-ai$q$, $q$Sintra AI$q$, $q$https://sintra.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd417de39-f651-4a18-aaad-445fe17ab81b', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd417de39-f651-4a18-aaad-445fe17ab81b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$relevance-ai$q$, $q$Relevance AI$q$, $q$https://relevanceai.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13ab6855-36e8-4dcc-bfd6-c5394bdc3674', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13ab6855-36e8-4dcc-bfd6-c5394bdc3674')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$lindy$q$, $q$Lindy$q$, $q$https://www.lindy.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5420efbb-d040-4bba-98e1-eb3de9843667', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5420efbb-d040-4bba-98e1-eb3de9843667')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$dust$q$, $q$Dust$q$, $q$https://dust.tt$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '997e1c48-766a-4593-b774-3364383103c2', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '997e1c48-766a-4593-b774-3364383103c2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$stack-ai$q$, $q$Stack AI$q$, $q$https://www.stack-ai.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '24da33b5-7fec-4150-97a5-ac2d1c92593c', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24da33b5-7fec-4150-97a5-ac2d1c92593c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$svix$q$, $q$Svix$q$, $q$https://www.svix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$hookdeck$q$, $q$Hookdeck$q$, $q$https://hookdeck.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '36a47b1c-ff9a-44c4-8e50-572883c5348b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36a47b1c-ff9a-44c4-8e50-572883c5348b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$trigger-dev$q$, $q$Trigger.dev$q$, $q$https://trigger.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'caa46b4a-ddf7-473a-8793-845e45dd40b3', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'caa46b4a-ddf7-473a-8793-845e45dd40b3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$encore$q$, $q$Encore$q$, $q$https://encore.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d5d1f6f-0d6c-43a6-848d-b04582cb94c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$doppler$q$, $q$Doppler$q$, $q$https://www.doppler.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b899dd8e-5a92-4424-9a3d-1964775af19a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b899dd8e-5a92-4424-9a3d-1964775af19a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$infisical$q$, $q$Infisical$q$, $q$https://infisical.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '870d8f7e-4a30-42b3-8999-2b52c10af200', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '870d8f7e-4a30-42b3-8999-2b52c10af200')
ON CONFLICT DO NOTHING;


-- Strategic metadata — one row per list entry (new tool or matched existing).
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b17dc713-2772-438d-a1a1-bbb8b11b6afc', $q$AI & Agents$q$, 1, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b17dc713-2772-438d-a1a1-bbb8b11b6afc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d9bbada-62bd-4fae-b98c-356fa0441d5f', $q$AI & Agents$q$, 2, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d9bbada-62bd-4fae-b98c-356fa0441d5f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '96e6b159-e2df-47d3-a4b4-493bd926551e', $q$AI & Agents$q$, 3, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96e6b159-e2df-47d3-a4b4-493bd926551e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'edd89103-eecb-4cc8-a616-763b16cac7ba', $q$AI & Agents$q$, 4, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edd89103-eecb-4cc8-a616-763b16cac7ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bf2ad475-4159-470c-96a3-52be9e6eafbf', $q$AI & Agents$q$, 5, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf2ad475-4159-470c-96a3-52be9e6eafbf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6f8e138d-a5e5-4a77-8e06-6e2cb41eb180', $q$AI & Agents$q$, 6, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f8e138d-a5e5-4a77-8e06-6e2cb41eb180')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0bde3010-1ecd-4551-bb6f-bd6036268ef7', $q$AI & Agents$q$, 7, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0bde3010-1ecd-4551-bb6f-bd6036268ef7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cbb957cc-8de9-4968-928e-1b42cfb27349', $q$AI & Agents$q$, 8, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cbb957cc-8de9-4968-928e-1b42cfb27349')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f9a72ac4-b017-4bd7-b4fd-5cb3bd343b9e', $q$AI & Agents$q$, 9, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9a72ac4-b017-4bd7-b4fd-5cb3bd343b9e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6aee23c-70db-420b-83e9-7069be0216f1', $q$AI & Agents$q$, 10, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6aee23c-70db-420b-83e9-7069be0216f1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '71403b09-3361-45de-9911-89b692d11395', $q$AI & Agents$q$, 11, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71403b09-3361-45de-9911-89b692d11395')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6741ec68-b40f-4b14-9d8b-2af8c98c0e2f', $q$AI & Agents$q$, 12, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6741ec68-b40f-4b14-9d8b-2af8c98c0e2f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7b2d202f-7b55-42b3-92d2-b93413c40359', $q$AI & Agents$q$, 13, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b2d202f-7b55-42b3-92d2-b93413c40359')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1f2bcc6e-4367-4eee-be32-0ccfd23149e3', $q$AI & Agents$q$, 14, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f2bcc6e-4367-4eee-be32-0ccfd23149e3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76d57e8b-f525-42a1-a189-fcf48f10fecf', $q$AI & Agents$q$, 15, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76d57e8b-f525-42a1-a189-fcf48f10fecf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '50a14386-9f18-49e2-abdb-80c88d9cb7a2', $q$AI & Agents$q$, 16, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50a14386-9f18-49e2-abdb-80c88d9cb7a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ec42083-c5d1-42c4-9cd9-94afe6946788', $q$AI & Agents$q$, 17, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ec42083-c5d1-42c4-9cd9-94afe6946788')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '123b8401-6f03-436d-a3b8-572de129cfec', $q$AI & Agents$q$, 18, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '123b8401-6f03-436d-a3b8-572de129cfec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e162b95f-b9ff-4468-a12d-35d5c34b4108', $q$AI & Agents$q$, 19, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e162b95f-b9ff-4468-a12d-35d5c34b4108')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05200050-aef1-41d1-8a4c-687d3c1ab299', $q$AI & Agents$q$, 20, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05200050-aef1-41d1-8a4c-687d3c1ab299')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6538daa1-08cc-42e4-8b4c-aa9dc077271e', $q$AI & Agents$q$, 21, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6538daa1-08cc-42e4-8b4c-aa9dc077271e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6a57cb1c-0dcd-43da-80a0-d2bca18f6aa5', $q$AI & Agents$q$, 22, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a57cb1c-0dcd-43da-80a0-d2bca18f6aa5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '19599bd9-0e9f-44d9-89bc-3dc73d9018b8', $q$AI & Agents$q$, 23, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19599bd9-0e9f-44d9-89bc-3dc73d9018b8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '83e84bc7-624a-4103-b7df-a6cdfba35f21', $q$AI & Agents$q$, 24, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83e84bc7-624a-4103-b7df-a6cdfba35f21')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$AI & Agents$q$, 25, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20246395-4c99-4ebe-aa25-c4a917239735', $q$AI Video & Audio$q$, 26, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20246395-4c99-4ebe-aa25-c4a917239735')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e3f6fe0d-a0c1-42eb-8614-9f5fd7e21256', $q$AI Video & Audio$q$, 27, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3f6fe0d-a0c1-42eb-8614-9f5fd7e21256')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1e765d41-8506-4bbb-8502-4b6b293c5c29', $q$AI Video & Audio$q$, 28, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e765d41-8506-4bbb-8502-4b6b293c5c29')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ead4735-16b7-46e9-9aeb-8a5fca6b3715', $q$AI Video & Audio$q$, 29, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ead4735-16b7-46e9-9aeb-8a5fca6b3715')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd74871a2-7b61-4f74-8163-24f082fb6c1a', $q$AI Video & Audio$q$, 30, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd74871a2-7b61-4f74-8163-24f082fb6c1a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4e2e35d0-4b3f-44fd-9859-4de0cee91c3f', $q$AI Video & Audio$q$, 31, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e2e35d0-4b3f-44fd-9859-4de0cee91c3f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '280ff386-aa0f-4c47-904e-14db30865949', $q$AI Video & Audio$q$, 32, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '280ff386-aa0f-4c47-904e-14db30865949')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2be62c7d-8a72-47ca-92fc-54be568dbb61', $q$AI Video & Audio$q$, 33, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2be62c7d-8a72-47ca-92fc-54be568dbb61')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2dbc4826-ac2f-4e63-b546-bdd1459a0b34', $q$AI Video & Audio$q$, 34, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2dbc4826-ac2f-4e63-b546-bdd1459a0b34')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '847ca3ae-c901-4b57-8fe3-f9b3380035c8', $q$AI Video & Audio$q$, 35, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '847ca3ae-c901-4b57-8fe3-f9b3380035c8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4513bb43-aeb2-4840-9feb-1d13971e78ee', $q$AI Video & Audio$q$, 36, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4513bb43-aeb2-4840-9feb-1d13971e78ee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$AI Video & Audio$q$, 37, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a5863480-2bee-4075-812b-c253720b03cb', $q$AI Video & Audio$q$, 38, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5863480-2bee-4075-812b-c253720b03cb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '79b50fbc-218a-44ae-a060-2d87cb1dda56', $q$AI Video & Audio$q$, 39, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79b50fbc-218a-44ae-a060-2d87cb1dda56')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '38555de6-1fcf-4d7c-93ad-8c32a3e08da5', $q$AI Video & Audio$q$, 40, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38555de6-1fcf-4d7c-93ad-8c32a3e08da5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a9d84fa-11cb-4542-942a-2ec680e31383', $q$AI Video & Audio$q$, 41, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a9d84fa-11cb-4542-942a-2ec680e31383')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7e673235-0981-4c36-a2e4-4e051b04105c', $q$AI Video & Audio$q$, 42, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e673235-0981-4c36-a2e4-4e051b04105c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$AI Video & Audio$q$, 43, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '79f3d550-5ec1-491d-9aa7-919a574aa346', $q$AI Video & Audio$q$, 44, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79f3d550-5ec1-491d-9aa7-919a574aa346')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c573bcab-43f7-4674-9b3c-db4e5f59bd2c', $q$AI Video & Audio$q$, 45, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c573bcab-43f7-4674-9b3c-db4e5f59bd2c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '279a89e2-68a4-41dd-89a0-fc4c8b2a5cce', $q$AI Video & Audio$q$, 46, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '279a89e2-68a4-41dd-89a0-fc4c8b2a5cce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '219b186e-c25c-4fd3-b6af-3d5e32e6319e', $q$AI Video & Audio$q$, 47, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '219b186e-c25c-4fd3-b6af-3d5e32e6319e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7927ea27-2515-47df-a4f2-3f5c7bd4db63', $q$AI Video & Audio$q$, 48, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7927ea27-2515-47df-a4f2-3f5c7bd4db63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ae5f4c8-55ec-488c-9254-ee6bfcb40f73', $q$AI Video & Audio$q$, 49, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ae5f4c8-55ec-488c-9254-ee6bfcb40f73')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7edbb0f5-1514-498d-bc96-95c18bc2328b', $q$AI Video & Audio$q$, 50, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7edbb0f5-1514-498d-bc96-95c18bc2328b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '18089863-a0de-4693-8d26-13ead8c01a88', $q$Sales & Lead Gen$q$, 51, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18089863-a0de-4693-8d26-13ead8c01a88')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '83d74d9a-40c7-43db-b149-f6f2fdadf0e5', $q$Sales & Lead Gen$q$, 52, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83d74d9a-40c7-43db-b149-f6f2fdadf0e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '15ddf167-bf8b-4750-8dd7-0a160f126943', $q$Sales & Lead Gen$q$, 53, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15ddf167-bf8b-4750-8dd7-0a160f126943')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7593c957-95bc-41e2-b981-f617ce468030', $q$Sales & Lead Gen$q$, 54, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7593c957-95bc-41e2-b981-f617ce468030')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f427a9e9-0965-4ebd-b38b-a318d6e0017f', $q$Sales & Lead Gen$q$, 55, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f427a9e9-0965-4ebd-b38b-a318d6e0017f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9716dcf4-3238-4e9c-b8bc-c5a16aa3e250', $q$Sales & Lead Gen$q$, 56, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9716dcf4-3238-4e9c-b8bc-c5a16aa3e250')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76fff3bb-4eec-44a2-9bbd-0790b17495c7', $q$Sales & Lead Gen$q$, 57, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76fff3bb-4eec-44a2-9bbd-0790b17495c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a471ce8-ee50-4dac-866b-2e8ef45618fa', $q$Sales & Lead Gen$q$, 58, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a471ce8-ee50-4dac-866b-2e8ef45618fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ea439db-0c8a-4902-ad45-6e5684c0f9ee', $q$Sales & Lead Gen$q$, 59, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ea439db-0c8a-4902-ad45-6e5684c0f9ee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '909a6d6a-53a7-4fd9-8771-f0bad14e7055', $q$Sales & Lead Gen$q$, 60, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '909a6d6a-53a7-4fd9-8771-f0bad14e7055')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dd857f35-23df-41ff-8428-e550f0e3cf2a', $q$Sales & Lead Gen$q$, 61, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd857f35-23df-41ff-8428-e550f0e3cf2a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba720441-8cc7-4c09-b643-008d959f36c9', $q$Sales & Lead Gen$q$, 62, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba720441-8cc7-4c09-b643-008d959f36c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e257953a-6b46-421c-9a74-ccd15dc7c9a2', $q$Sales & Lead Gen$q$, 63, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e257953a-6b46-421c-9a74-ccd15dc7c9a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4acb5d47-918c-44a6-ad53-de5ddb07110f', $q$Sales & Lead Gen$q$, 64, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4acb5d47-918c-44a6-ad53-de5ddb07110f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c5a72856-c532-4882-bce1-c4c3664d929b', $q$Sales & Lead Gen$q$, 65, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5a72856-c532-4882-bce1-c4c3664d929b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5118dfca-71e6-4897-bbc7-33e7b849b457', $q$Sales & Lead Gen$q$, 66, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5118dfca-71e6-4897-bbc7-33e7b849b457')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5019ca62-2bfd-4c78-a7e8-0c678cbbaa68', $q$Sales & Lead Gen$q$, 67, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5019ca62-2bfd-4c78-a7e8-0c678cbbaa68')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '572625cb-f9cb-4961-b33c-f1f81f45c14d', $q$Sales & Lead Gen$q$, 68, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '572625cb-f9cb-4961-b33c-f1f81f45c14d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e8093051-703e-41a0-bd92-e48c69e925b9', $q$Sales & Lead Gen$q$, 69, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8093051-703e-41a0-bd92-e48c69e925b9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c19eea91-a5a0-45e9-a13c-1f2c45844387', $q$Sales & Lead Gen$q$, 70, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c19eea91-a5a0-45e9-a13c-1f2c45844387')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb38ef74-ed67-4950-a546-3ece2c203f18', $q$Sales & Lead Gen$q$, 71, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb38ef74-ed67-4950-a546-3ece2c203f18')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48c4e035-ee4a-4d7c-9e7a-7d9f3a3f6d4e', $q$Sales & Lead Gen$q$, 72, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48c4e035-ee4a-4d7c-9e7a-7d9f3a3f6d4e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '88b216db-d52e-49cb-b940-093f9a2044aa', $q$Sales & Lead Gen$q$, 73, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88b216db-d52e-49cb-b940-093f9a2044aa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ca7fc750-3534-46bb-99e5-aed53ba7b5c8', $q$Sales & Lead Gen$q$, 74, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca7fc750-3534-46bb-99e5-aed53ba7b5c8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c106a3ac-ef7c-4e45-a70c-a482ca2fea51', $q$Sales & Lead Gen$q$, 75, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c106a3ac-ef7c-4e45-a70c-a482ca2fea51')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$CRM & Revenue$q$, 76, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0cb20c33-a4d5-4832-b97f-e2284e29675a', $q$CRM & Revenue$q$, 77, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0cb20c33-a4d5-4832-b97f-e2284e29675a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ec5fff7f-2e72-4779-b7d5-769d8491fa4f', $q$CRM & Revenue$q$, 78, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ec5fff7f-2e72-4779-b7d5-769d8491fa4f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7f48b7ce-b6d6-4a03-9a89-b0fe089765f6', $q$CRM & Revenue$q$, 79, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f48b7ce-b6d6-4a03-9a89-b0fe089765f6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6ed054f-8434-4025-8ef7-01e474837fea', $q$CRM & Revenue$q$, 80, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6ed054f-8434-4025-8ef7-01e474837fea')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf', $q$CRM & Revenue$q$, 81, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc05431a-0ca5-4a94-92cd-7bc2316b6dcf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7986cf0f-17ab-4528-acea-8231ffbd3ebc', $q$CRM & Revenue$q$, 82, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7986cf0f-17ab-4528-acea-8231ffbd3ebc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd2ab1000-e26f-4d01-88d3-85475427db72', $q$CRM & Revenue$q$, 83, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2ab1000-e26f-4d01-88d3-85475427db72')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7effa4cf-f18e-4d12-bf52-83b570f6c948', $q$CRM & Revenue$q$, 84, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7effa4cf-f18e-4d12-bf52-83b570f6c948')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '61f5e19c-7e36-43c9-9e96-50d55146d278', $q$CRM & Revenue$q$, 85, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61f5e19c-7e36-43c9-9e96-50d55146d278')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$CRM & Revenue$q$, 86, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '298926b4-3ab4-4ee9-ae5b-9ee1b3900150', $q$CRM & Revenue$q$, 87, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '298926b4-3ab4-4ee9-ae5b-9ee1b3900150')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c5e37344-4c0e-4962-b411-76bbbd950cbd', $q$CRM & Revenue$q$, 88, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5e37344-4c0e-4962-b411-76bbbd950cbd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aade9c0c-6fb6-412a-9dc0-66e5e626d8a8', $q$CRM & Revenue$q$, 89, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aade9c0c-6fb6-412a-9dc0-66e5e626d8a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$CRM & Revenue$q$, 90, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '90966f6f-0569-4df9-9b4b-7d8285e5e30f', $q$CRM & Revenue$q$, 91, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90966f6f-0569-4df9-9b4b-7d8285e5e30f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6001dba5-087f-4eac-ba48-438b4efa098d', $q$CRM & Revenue$q$, 92, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6001dba5-087f-4eac-ba48-438b4efa098d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '27104aee-384b-47e0-8d77-8ae9c9dbfe01', $q$CRM & Revenue$q$, 93, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27104aee-384b-47e0-8d77-8ae9c9dbfe01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '75d9ec55-139d-48db-86d9-199f725ad9e3', $q$CRM & Revenue$q$, 94, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75d9ec55-139d-48db-86d9-199f725ad9e3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd89ed73f-80e0-4221-8c89-5c539a41247e', $q$CRM & Revenue$q$, 95, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd89ed73f-80e0-4221-8c89-5c539a41247e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1434441b-2134-4477-a5b0-4cc5bca3bb34', $q$CRM & Revenue$q$, 96, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1434441b-2134-4477-a5b0-4cc5bca3bb34')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28f21e6a-228f-419e-9602-09cb10f941a9', $q$CRM & Revenue$q$, 97, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28f21e6a-228f-419e-9602-09cb10f941a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c580a7ae-24fa-4cd2-a2fb-ffc0619a71c0', $q$CRM & Revenue$q$, 98, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c580a7ae-24fa-4cd2-a2fb-ffc0619a71c0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6216dfaa-05dd-4223-a596-dbb3ee514d3c', $q$Marketing & Growth$q$, 99, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6216dfaa-05dd-4223-a596-dbb3ee514d3c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6af548d4-ec3e-4639-a001-7473d57669b6', $q$Marketing & Growth$q$, 100, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6af548d4-ec3e-4639-a001-7473d57669b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95a1cd47-8a75-47d2-b10b-b9d86a58c71c', $q$Marketing & Growth$q$, 101, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95a1cd47-8a75-47d2-b10b-b9d86a58c71c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6a0e0878-222a-49ef-85d7-6e633b7c96fc', $q$Marketing & Growth$q$, 102, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a0e0878-222a-49ef-85d7-6e633b7c96fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c', $q$Marketing & Growth$q$, 103, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd64e1be3-9d5e-44d1-8dab-25f1fd7f0d4c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3180928a-7b88-4db5-a439-ca674656c46e', $q$Marketing & Growth$q$, 104, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3180928a-7b88-4db5-a439-ca674656c46e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e42b88f9-4910-4f3d-aacc-b784e0b8f957', $q$Marketing & Growth$q$, 105, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e42b88f9-4910-4f3d-aacc-b784e0b8f957')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d6c91d2-4c18-4368-83f2-7ea2115662de', $q$Marketing & Growth$q$, 106, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d6c91d2-4c18-4368-83f2-7ea2115662de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0884da11-18e8-4de8-bdba-1469c9e43607', $q$Marketing & Growth$q$, 107, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0884da11-18e8-4de8-bdba-1469c9e43607')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eb61be61-826d-402e-93f5-17aed2eb85a3', $q$Marketing & Growth$q$, 108, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb61be61-826d-402e-93f5-17aed2eb85a3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2f6cc627-c241-4361-a9fa-09e2b287d75b', $q$Marketing & Growth$q$, 109, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f6cc627-c241-4361-a9fa-09e2b287d75b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a', $q$Marketing & Growth$q$, 110, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4c7ca28-1c1f-471e-853e-5380df6a6f0a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '12459a1a-3818-4e4e-89a8-720e89fe4675', $q$Marketing & Growth$q$, 111, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '12459a1a-3818-4e4e-89a8-720e89fe4675')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3d598c49-9a29-4abb-82c3-8560ce7dd623', $q$Marketing & Growth$q$, 112, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d598c49-9a29-4abb-82c3-8560ce7dd623')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ae57dc6-eaf6-4dcb-af35-03f42db55697', $q$Marketing & Growth$q$, 113, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ae57dc6-eaf6-4dcb-af35-03f42db55697')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a7e05556-33fe-45dc-becd-a33082027c3f', $q$Marketing & Growth$q$, 114, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a7e05556-33fe-45dc-becd-a33082027c3f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb', $q$Marketing & Growth$q$, 115, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '707ba9cc-b9cc-4702-a3bc-db7861d4e8eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f7085ee3-8eca-48ce-b699-465aca0fb0ee', $q$Marketing & Growth$q$, 116, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7085ee3-8eca-48ce-b699-465aca0fb0ee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8fe2e620-1117-42fb-88de-78ba0088f595', $q$Marketing & Growth$q$, 117, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8fe2e620-1117-42fb-88de-78ba0088f595')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be4ad86d-af43-4e18-94b3-70bb1cb7d4f1', $q$Marketing & Growth$q$, 118, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be4ad86d-af43-4e18-94b3-70bb1cb7d4f1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99f73517-cbd3-40ff-94a7-89a7c44a0b54', $q$Marketing & Growth$q$, 119, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99f73517-cbd3-40ff-94a7-89a7c44a0b54')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '493fc80e-5729-4ff6-8605-b8b43debc054', $q$Marketing & Growth$q$, 120, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '493fc80e-5729-4ff6-8605-b8b43debc054')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e8e2b2b1-e626-4b69-b056-d2cfa9a442ef', $q$Marketing & Growth$q$, 121, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8e2b2b1-e626-4b69-b056-d2cfa9a442ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ce91b27c-4bec-4c15-be87-ad67051e784e', $q$Marketing & Growth$q$, 122, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce91b27c-4bec-4c15-be87-ad67051e784e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '56718531-ed0e-4776-9bde-25e1988eb432', $q$SEO & Content$q$, 123, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56718531-ed0e-4776-9bde-25e1988eb432')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '017afd53-6702-45ee-8be8-f9561ba970a4', $q$SEO & Content$q$, 124, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '017afd53-6702-45ee-8be8-f9561ba970a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aa5300c4-25eb-4332-a853-62f0a9c59d1a', $q$SEO & Content$q$, 125, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa5300c4-25eb-4332-a853-62f0a9c59d1a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6902e4ce-4e99-4913-bcb5-bbb569db7b67', $q$SEO & Content$q$, 126, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6902e4ce-4e99-4913-bcb5-bbb569db7b67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '324f0aed-4d17-4a2b-951a-1b9488398905', $q$SEO & Content$q$, 127, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '324f0aed-4d17-4a2b-951a-1b9488398905')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '758cebc7-97dc-4ae8-9b04-1a2c822140e0', $q$SEO & Content$q$, 128, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '758cebc7-97dc-4ae8-9b04-1a2c822140e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f0a86c30-0218-4428-94b5-d143c569c1a2', $q$SEO & Content$q$, 129, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0a86c30-0218-4428-94b5-d143c569c1a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f3b79627-754a-459e-a5e6-8dd73f648ba7', $q$SEO & Content$q$, 130, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3b79627-754a-459e-a5e6-8dd73f648ba7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b2cf1cf0-7ea7-4346-a42e-7a3f6c6998cf', $q$SEO & Content$q$, 131, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2cf1cf0-7ea7-4346-a42e-7a3f6c6998cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a1a8a972-7236-4fd3-b7d5-579291a22d46', $q$SEO & Content$q$, 132, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1a8a972-7236-4fd3-b7d5-579291a22d46')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '578e0b1c-942b-4b1c-95fa-56e1bee56a20', $q$SEO & Content$q$, 133, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '578e0b1c-942b-4b1c-95fa-56e1bee56a20')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8d187108-39b3-4079-8b9b-01b74263686b', $q$SEO & Content$q$, 134, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d187108-39b3-4079-8b9b-01b74263686b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bb746904-348f-44b6-aca5-49626cad1b9a', $q$SEO & Content$q$, 135, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb746904-348f-44b6-aca5-49626cad1b9a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c4629fa6-78c7-459c-a10b-102467a283fa', $q$SEO & Content$q$, 136, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4629fa6-78c7-459c-a10b-102467a283fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76b116d0-5bc2-4a6a-93eb-906109fc7d61', $q$SEO & Content$q$, 137, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76b116d0-5bc2-4a6a-93eb-906109fc7d61')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2cab4d47-cd2e-4600-ae0e-4f3f03317244', $q$SEO & Content$q$, 138, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2cab4d47-cd2e-4600-ae0e-4f3f03317244')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '72ffb4a5-e2e0-4903-8155-e17e23b71215', $q$SEO & Content$q$, 139, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72ffb4a5-e2e0-4903-8155-e17e23b71215')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c0b93c88-b6a7-4966-a55f-54c933658952', $q$SEO & Content$q$, 140, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0b93c88-b6a7-4966-a55f-54c933658952')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2490007c-e3b7-41a2-a1fb-ad0b93df009d', $q$SEO & Content$q$, 141, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2490007c-e3b7-41a2-a1fb-ad0b93df009d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '945d46de-1541-423b-ad90-a8381853daad', $q$SEO & Content$q$, 142, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '945d46de-1541-423b-ad90-a8381853daad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9f9df18c-f8de-4006-956e-f16fecbef694', $q$SEO & Content$q$, 143, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f9df18c-f8de-4006-956e-f16fecbef694')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2bc1080d-a815-4f4e-a679-844e458a7639', $q$SEO & Content$q$, 144, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2bc1080d-a815-4f4e-a679-844e458a7639')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d0ecf12-94ea-40bf-8961-2c520ff5df26', $q$SEO & Content$q$, 145, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d0ecf12-94ea-40bf-8961-2c520ff5df26')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a45dcfee-2733-4780-ad36-f10f7ad29f41', $q$SEO & Content$q$, 146, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a45dcfee-2733-4780-ad36-f10f7ad29f41')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f', $q$SEO & Content$q$, 147, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7ffaae8-d151-4f81-9afa-a3539c05ff4f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9fbb459a-6fd6-4391-b245-3ff74a1dfdb4', $q$Social & Creator$q$, 148, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9fbb459a-6fd6-4391-b245-3ff74a1dfdb4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3d7e53a2-7024-463c-8941-1eaf38f894b8', $q$Social & Creator$q$, 149, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d7e53a2-7024-463c-8941-1eaf38f894b8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05a53179-48a2-447f-a61a-608232327b8e', $q$Social & Creator$q$, 150, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05a53179-48a2-447f-a61a-608232327b8e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54c7cb92-5f47-43ad-bdf6-8b7349f90a2d', $q$Social & Creator$q$, 151, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54c7cb92-5f47-43ad-bdf6-8b7349f90a2d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '554ba712-0d17-49af-a355-1b54add650cf', $q$Social & Creator$q$, 152, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '554ba712-0d17-49af-a355-1b54add650cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0e6192b5-0793-49cb-96c6-12757f88b772', $q$Social & Creator$q$, 153, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0e6192b5-0793-49cb-96c6-12757f88b772')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '781eb9ec-2374-430e-a835-e05378d167bf', $q$Social & Creator$q$, 154, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '781eb9ec-2374-430e-a835-e05378d167bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '79992a38-a613-4b56-91d4-2a13d7ad2204', $q$Social & Creator$q$, 155, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79992a38-a613-4b56-91d4-2a13d7ad2204')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f83b75c9-db10-4c41-b43c-62b6ac32e76e', $q$Social & Creator$q$, 156, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f83b75c9-db10-4c41-b43c-62b6ac32e76e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fa6c1b1f-237c-41bd-973b-da2acee05d7b', $q$Social & Creator$q$, 157, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa6c1b1f-237c-41bd-973b-da2acee05d7b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '410b0dd0-b940-4829-8aac-3c86129e1d0d', $q$Social & Creator$q$, 158, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '410b0dd0-b940-4829-8aac-3c86129e1d0d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b464dfda-017c-4855-b431-a807ed2c1ace', $q$Social & Creator$q$, 159, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b464dfda-017c-4855-b431-a807ed2c1ace')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c4fbcf36-e8f5-467e-bd97-d644a834805e', $q$Social & Creator$q$, 160, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4fbcf36-e8f5-467e-bd97-d644a834805e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a51d912-95c6-4dbd-990d-21e5074290dc', $q$Social & Creator$q$, 161, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a51d912-95c6-4dbd-990d-21e5074290dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '83b2c83b-806d-4059-8675-877f2b95353d', $q$Social & Creator$q$, 162, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83b2c83b-806d-4059-8675-877f2b95353d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f4d365b4-e7ab-418b-af7c-34a65c4165e9', $q$Social & Creator$q$, 163, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4d365b4-e7ab-418b-af7c-34a65c4165e9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '70a19bf7-581a-4046-9e3d-4778823d9374', $q$Social & Creator$q$, 164, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70a19bf7-581a-4046-9e3d-4778823d9374')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5c850061-a601-4133-8e98-e91d2b6054af', $q$Social & Creator$q$, 165, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c850061-a601-4133-8e98-e91d2b6054af')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d8efa14-311b-446b-ab6c-e61a88e216f0', $q$Social & Creator$q$, 166, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d8efa14-311b-446b-ab6c-e61a88e216f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '87329a02-5754-42b3-a8d2-700263b8cdd5', $q$Social & Creator$q$, 167, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87329a02-5754-42b3-a8d2-700263b8cdd5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99b92e04-95eb-419b-a055-2ebe15ca7b5e', $q$Social & Creator$q$, 168, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99b92e04-95eb-419b-a055-2ebe15ca7b5e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '23610ab0-1a86-4d06-82b8-503bd3931d89', $q$Social & Creator$q$, 169, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23610ab0-1a86-4d06-82b8-503bd3931d89')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bac1828c-1e04-4f20-976c-9a0ea0ed8e67', $q$Social & Creator$q$, 170, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bac1828c-1e04-4f20-976c-9a0ea0ed8e67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Social & Creator$q$, 171, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20893471-10cd-4caf-9754-dcf19b7c21a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f07f9c22-d47c-4952-97ad-64f962870184', $q$Social & Creator$q$, 172, 8, 8, 9, $q$Tier A — Build + outreach$q$, 8.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f07f9c22-d47c-4952-97ad-64f962870184')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bf92d64e-0be1-4ba9-986c-37463bbdbdeb', $q$Productivity & PM$q$, 173, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf92d64e-0be1-4ba9-986c-37463bbdbdeb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$Productivity & PM$q$, 174, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '366134f6-a5b9-48d8-883a-e54211d7dd34', $q$Productivity & PM$q$, 175, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '366134f6-a5b9-48d8-883a-e54211d7dd34')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '00e620ce-3d58-4944-af9e-bc0f5e8779e6', $q$Productivity & PM$q$, 176, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00e620ce-3d58-4944-af9e-bc0f5e8779e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f44a5433-17b4-408d-9f04-3a38418faa5d', $q$Productivity & PM$q$, 177, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f44a5433-17b4-408d-9f04-3a38418faa5d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$Productivity & PM$q$, 178, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '812088ef-3fdd-41e2-b15a-3a9f36f05e57', $q$Productivity & PM$q$, 179, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '812088ef-3fdd-41e2-b15a-3a9f36f05e57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Productivity & PM$q$, 180, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Productivity & PM$q$, 181, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2e0ce45d-dae1-4d7d-8c4b-eae668045f9e', $q$Productivity & PM$q$, 182, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2e0ce45d-dae1-4d7d-8c4b-eae668045f9e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Productivity & PM$q$, 183, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7803795-ad28-4f0d-b4c7-34871b2be738', $q$Productivity & PM$q$, 184, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7803795-ad28-4f0d-b4c7-34871b2be738')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b1f3b00-6e09-441c-a0b6-e202cea7f985', $q$Productivity & PM$q$, 185, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b1f3b00-6e09-441c-a0b6-e202cea7f985')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5c2ab174-aec9-445e-96e3-c908a6741904', $q$Productivity & PM$q$, 186, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c2ab174-aec9-445e-96e3-c908a6741904')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7ea5abe-ea46-4e4c-b5e4-246810a1c777', $q$Productivity & PM$q$, 187, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7ea5abe-ea46-4e4c-b5e4-246810a1c777')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e4de8a34-adf7-4d4e-8978-1426321c23f0', $q$Productivity & PM$q$, 188, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4de8a34-adf7-4d4e-8978-1426321c23f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '31891521-7412-481e-8809-b74fa059bcf3', $q$Productivity & PM$q$, 189, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31891521-7412-481e-8809-b74fa059bcf3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Productivity & PM$q$, 190, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '79fe800c-3b4a-461b-be9d-1206811b507d', $q$Productivity & PM$q$, 191, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79fe800c-3b4a-461b-be9d-1206811b507d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7727b97-e9ad-4f83-862e-ffc1b256280f', $q$Productivity & PM$q$, 192, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7727b97-e9ad-4f83-862e-ffc1b256280f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2632cf96-67cf-472b-ba2a-9e7b8ce56e16', $q$Productivity & PM$q$, 193, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2632cf96-67cf-472b-ba2a-9e7b8ce56e16')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0eab6628-ac5f-4215-9f5b-92be748bae51', $q$Productivity & PM$q$, 194, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0eab6628-ac5f-4215-9f5b-92be748bae51')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f0712a2a-3c5e-47ea-8501-6e6e45003e44', $q$Productivity & PM$q$, 195, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0712a2a-3c5e-47ea-8501-6e6e45003e44')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7421519-f70d-433d-a80c-ccd25012d50b', $q$Productivity & PM$q$, 196, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7421519-f70d-433d-a80c-ccd25012d50b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3', $q$Productivity & PM$q$, 197, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28c0a1b2-9008-4c7f-a6b9-e522bb6fafb3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '462722d4-4165-434a-8b0c-980f54d3e95b', $q$Developer Tools$q$, 199, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '462722d4-4165-434a-8b0c-980f54d3e95b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '66c6f447-c37a-4d38-b8f4-1f3f354d23b1', $q$Developer Tools$q$, 200, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '66c6f447-c37a-4d38-b8f4-1f3f354d23b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c7fb478-76a0-467c-ace5-e21d349568e4', $q$Developer Tools$q$, 201, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c7fb478-76a0-467c-ace5-e21d349568e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7af487a9-50b6-47ff-94cd-63ca690c3618', $q$Developer Tools$q$, 202, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7af487a9-50b6-47ff-94cd-63ca690c3618')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ff22411-f622-417d-9bda-6ec2bdfd971c', $q$Developer Tools$q$, 203, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ff22411-f622-417d-9bda-6ec2bdfd971c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '40705dad-5bab-4f5b-a448-d25aaa9e4cbc', $q$Developer Tools$q$, 204, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40705dad-5bab-4f5b-a448-d25aaa9e4cbc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0f7793fe-24f6-455d-942f-7c400a00d262', $q$Developer Tools$q$, 205, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f7793fe-24f6-455d-942f-7c400a00d262')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f65f0d8b-0765-4d7b-b21b-657a547c6e7f', $q$Developer Tools$q$, 206, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f65f0d8b-0765-4d7b-b21b-657a547c6e7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9bfeb77a-1467-4d17-be6d-b78ad5d914b1', $q$Developer Tools$q$, 207, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9bfeb77a-1467-4d17-be6d-b78ad5d914b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '87089195-3dd1-46cf-905d-b16e26fbbd31', $q$Developer Tools$q$, 208, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87089195-3dd1-46cf-905d-b16e26fbbd31')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f2373499-d34a-47fe-8420-a3176c8cceb3', $q$Developer Tools$q$, 209, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f2373499-d34a-47fe-8420-a3176c8cceb3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5ffdb2ec-9868-4c01-a2ab-458f8bba752a', $q$Developer Tools$q$, 210, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ffdb2ec-9868-4c01-a2ab-458f8bba752a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '64fcba47-1f37-4b44-92d6-1d4880760b16', $q$Developer Tools$q$, 211, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64fcba47-1f37-4b44-92d6-1d4880760b16')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a088bca4-e021-4feb-af5d-c1d5769b5a38', $q$Developer Tools$q$, 212, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a088bca4-e021-4feb-af5d-c1d5769b5a38')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '66aef3e8-fdf4-4871-a16f-ccd3d0ecfe6d', $q$Developer Tools$q$, 213, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '66aef3e8-fdf4-4871-a16f-ccd3d0ecfe6d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c326978a-2a64-44b7-a572-f9fb892fc271', $q$Developer Tools$q$, 214, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c326978a-2a64-44b7-a572-f9fb892fc271')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Developer Tools$q$, 215, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61ccc648-9278-4f3b-87f3-026966a4a47f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f6d6eb38-8f44-43cb-b351-fe77b22730dd', $q$Developer Tools$q$, 216, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6d6eb38-8f44-43cb-b351-fe77b22730dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f79eaac2-65bc-4cc5-9c8f-74c78142ea6b', $q$Developer Tools$q$, 217, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f79eaac2-65bc-4cc5-9c8f-74c78142ea6b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '21c299f2-5f17-4888-a6ff-d3d047043f79', $q$Developer Tools$q$, 218, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21c299f2-5f17-4888-a6ff-d3d047043f79')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e44be36-57f9-4e4f-b5f8-22e6508f69b4', $q$Developer Tools$q$, 219, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e44be36-57f9-4e4f-b5f8-22e6508f69b4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c3f373eb-198a-458a-b85b-10b325d6c454', $q$Developer Tools$q$, 220, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3f373eb-198a-458a-b85b-10b325d6c454')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11db7b95-8347-45df-a13b-c3e8b6ea53f7', $q$Cloud & Infrastructure$q$, 221, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11db7b95-8347-45df-a13b-c3e8b6ea53f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb', $q$Cloud & Infrastructure$q$, 222, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c0b6aed-6aed-4600-980d-b05aa2cf0ccb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '46c7eebc-d6a3-4c06-b0fb-74483d16333d', $q$Cloud & Infrastructure$q$, 223, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46c7eebc-d6a3-4c06-b0fb-74483d16333d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '196d4b7c-1987-4513-97d0-d974741e4db3', $q$Cloud & Infrastructure$q$, 224, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '196d4b7c-1987-4513-97d0-d974741e4db3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f36c751-0719-4122-8fe0-e1bd976404d2', $q$Cloud & Infrastructure$q$, 225, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f36c751-0719-4122-8fe0-e1bd976404d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a0672926-1230-4fae-8c77-9a1304584c44', $q$Cloud & Infrastructure$q$, 226, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0672926-1230-4fae-8c77-9a1304584c44')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0ed951ec-77f0-4b46-b0d3-dc10cc9de347', $q$Cloud & Infrastructure$q$, 227, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ed951ec-77f0-4b46-b0d3-dc10cc9de347')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8dd02588-9e72-460d-8c15-9f28eeaf959d', $q$Cloud & Infrastructure$q$, 228, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8dd02588-9e72-460d-8c15-9f28eeaf959d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ed72c61-cf6e-4bb5-818c-15ca4c39cc8b', $q$Cloud & Infrastructure$q$, 229, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ed72c61-cf6e-4bb5-818c-15ca4c39cc8b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c25e7433-44ad-439d-a4df-0347e6f2e9c2', $q$Cloud & Infrastructure$q$, 230, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c25e7433-44ad-439d-a4df-0347e6f2e9c2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fca0329e-c98c-4d5a-847a-38aca9d3e0c4', $q$Cloud & Infrastructure$q$, 231, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fca0329e-c98c-4d5a-847a-38aca9d3e0c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4262ba7b-6a19-41ce-bc48-4ff58e432ce9', $q$Cloud & Infrastructure$q$, 232, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4262ba7b-6a19-41ce-bc48-4ff58e432ce9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0290e212-4db0-41b8-bc28-0411526ba848', $q$Cloud & Infrastructure$q$, 233, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0290e212-4db0-41b8-bc28-0411526ba848')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd97ca2f0-4073-4a93-a5de-d5b275efbb57', $q$Cloud & Infrastructure$q$, 234, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd97ca2f0-4073-4a93-a5de-d5b275efbb57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'afcd955c-740d-4ea0-8ee5-e3052c431a5d', $q$Cloud & Infrastructure$q$, 235, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afcd955c-740d-4ea0-8ee5-e3052c431a5d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '651a0f94-72a0-43b1-b2b0-60746e97bceb', $q$Cloud & Infrastructure$q$, 236, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '651a0f94-72a0-43b1-b2b0-60746e97bceb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '71f03e14-432c-435c-8c0e-ef2bed2b9907', $q$Cloud & Infrastructure$q$, 237, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71f03e14-432c-435c-8c0e-ef2bed2b9907')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea8d8edf-19c1-4df7-a4d2-05c155784b1a', $q$Cloud & Infrastructure$q$, 238, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea8d8edf-19c1-4df7-a4d2-05c155784b1a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '345f158e-d413-44fa-b795-28721d2c9389', $q$Cloud & Infrastructure$q$, 239, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '345f158e-d413-44fa-b795-28721d2c9389')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '040862c3-0d04-4dd4-af23-2164939cfd29', $q$Cloud & Infrastructure$q$, 240, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '040862c3-0d04-4dd4-af23-2164939cfd29')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8224f1c4-4b8e-465f-bf52-2dfa9e59e1ef', $q$Cloud & Infrastructure$q$, 241, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8224f1c4-4b8e-465f-bf52-2dfa9e59e1ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd4c2db9c-c418-40cf-8387-d72c25bbc544', $q$Cloud & Infrastructure$q$, 242, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4c2db9c-c418-40cf-8387-d72c25bbc544')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '32feccb0-a63d-4932-b0a2-8d2a9ed9dd66', $q$Cloud & Infrastructure$q$, 243, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32feccb0-a63d-4932-b0a2-8d2a9ed9dd66')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8b67fa90-7a4e-4cd5-aaaf-5828ca0f9a2a', $q$Cloud & Infrastructure$q$, 244, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b67fa90-7a4e-4cd5-aaaf-5828ca0f9a2a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f4aa26bc-375b-4808-a448-465f4f778755', $q$Cloud & Infrastructure$q$, 245, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4aa26bc-375b-4808-a448-465f4f778755')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0dfbc077-2e6f-43bd-beb1-5237a10ecdd5', $q$Databases & Backend$q$, 246, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0dfbc077-2e6f-43bd-beb1-5237a10ecdd5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159', $q$Databases & Backend$q$, 247, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe42bb0d-0769-4be9-8240-7ea8c6d5d159')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '29a999ee-1d55-4fa7-a5bf-265fba6c2681', $q$Databases & Backend$q$, 248, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '29a999ee-1d55-4fa7-a5bf-265fba6c2681')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e6c72275-7cb5-4d25-b407-ad1b09e419ab', $q$Databases & Backend$q$, 249, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e6c72275-7cb5-4d25-b407-ad1b09e419ab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea768a9c-a511-4333-8959-87593d0426a5', $q$Databases & Backend$q$, 250, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea768a9c-a511-4333-8959-87593d0426a5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82ee8074-8c82-4567-87cf-e4ee7c5da225', $q$Databases & Backend$q$, 251, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82ee8074-8c82-4567-87cf-e4ee7c5da225')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '47cf9d80-a2bb-43ef-9377-ea126fc69e75', $q$Databases & Backend$q$, 252, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47cf9d80-a2bb-43ef-9377-ea126fc69e75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5979f62c-c68a-4875-ab66-878b6d196231', $q$Databases & Backend$q$, 253, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5979f62c-c68a-4875-ab66-878b6d196231')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8ef1e9c-3e2d-43bd-b790-a687f3d10cd5', $q$Databases & Backend$q$, 254, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8ef1e9c-3e2d-43bd-b790-a687f3d10cd5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a1651b2-fc5c-4661-9e06-7316b78cb420', $q$Databases & Backend$q$, 255, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a1651b2-fc5c-4661-9e06-7316b78cb420')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '78eada95-da81-4cfa-9a33-f04a9d8c15e0', $q$Databases & Backend$q$, 256, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78eada95-da81-4cfa-9a33-f04a9d8c15e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '992455d6-9786-48b9-a8ac-bca905448c06', $q$Databases & Backend$q$, 257, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '992455d6-9786-48b9-a8ac-bca905448c06')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed38eac2-96a6-4a42-b699-28e0cef88f69', $q$Databases & Backend$q$, 258, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed38eac2-96a6-4a42-b699-28e0cef88f69')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Databases & Backend$q$, 259, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a92dbe70-936c-4a03-aa4c-6b401ecbc127', $q$Databases & Backend$q$, 260, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a92dbe70-936c-4a03-aa4c-6b401ecbc127')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0', $q$Databases & Backend$q$, 261, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d00f455-f1c1-4f08-8b80-9aa4fcbc5ec0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Databases & Backend$q$, 262, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09b08922-47a6-4af9-bab1-b845aa9a15c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1da597ed-cb15-440d-b621-139ce7ffa976', $q$Databases & Backend$q$, 263, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1da597ed-cb15-440d-b621-139ce7ffa976')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8d37dae4-b21a-4385-9295-c71506f8ef9c', $q$Databases & Backend$q$, 264, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d37dae4-b21a-4385-9295-c71506f8ef9c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54fd0b15-5a7f-4cba-b221-60d8ab928a87', $q$Databases & Backend$q$, 265, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54fd0b15-5a7f-4cba-b221-60d8ab928a87')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '276ddeaa-f3f4-4e0c-bba8-924413dbf6cd', $q$Databases & Backend$q$, 266, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '276ddeaa-f3f4-4e0c-bba8-924413dbf6cd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f8173937-6906-403b-af26-bf7290c0ba12', $q$Databases & Backend$q$, 267, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8173937-6906-403b-af26-bf7290c0ba12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '72cd024d-3900-490c-976d-ace69724ddbb', $q$Databases & Backend$q$, 268, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72cd024d-3900-490c-976d-ace69724ddbb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8f8c6456-68f6-4f02-bd51-cf48403d7a42', $q$Databases & Backend$q$, 269, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f8c6456-68f6-4f02-bd51-cf48403d7a42')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d', $q$No-code & Automation$q$, 270, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3b94af22-0e27-4952-855a-be2baf62f997', $q$No-code & Automation$q$, 272, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b94af22-0e27-4952-855a-be2baf62f997')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '816736fa-6a4c-405d-b001-715479da0a6e', $q$No-code & Automation$q$, 273, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '816736fa-6a4c-405d-b001-715479da0a6e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f5fa950-8b00-4a29-8729-57a4f49a3db7', $q$No-code & Automation$q$, 274, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f5fa950-8b00-4a29-8729-57a4f49a3db7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b7dbfbf6-f142-4013-ba06-5ff42e255059', $q$No-code & Automation$q$, 275, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7dbfbf6-f142-4013-ba06-5ff42e255059')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5f2efd75-b393-44ab-a643-86bbadb40c49', $q$No-code & Automation$q$, 276, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f2efd75-b393-44ab-a643-86bbadb40c49')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '812e6387-746a-402d-9db8-ecb8da116b61', $q$No-code & Automation$q$, 277, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '812e6387-746a-402d-9db8-ecb8da116b61')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$No-code & Automation$q$, 278, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd3380d17-44f5-4778-a2b5-e01726b9b630', $q$No-code & Automation$q$, 279, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3380d17-44f5-4778-a2b5-e01726b9b630')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '029723bb-0e7c-43dd-958e-73d6dbd7933b', $q$No-code & Automation$q$, 280, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '029723bb-0e7c-43dd-958e-73d6dbd7933b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d51e95d-ce2a-4513-a287-44c9039f1a17', $q$No-code & Automation$q$, 282, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d51e95d-ce2a-4513-a287-44c9039f1a17')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aef224a1-fe25-4992-8146-62c270b751d5', $q$No-code & Automation$q$, 283, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aef224a1-fe25-4992-8146-62c270b751d5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2efa5f1f-29da-4d6c-a300-8437c5445f15', $q$No-code & Automation$q$, 284, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2efa5f1f-29da-4d6c-a300-8437c5445f15')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '14d1d9d1-5e67-4b61-a083-8bace97b6d67', $q$No-code & Automation$q$, 285, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '14d1d9d1-5e67-4b61-a083-8bace97b6d67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20fb5336-a872-4aeb-a58f-5087fa3de0ba', $q$No-code & Automation$q$, 286, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20fb5336-a872-4aeb-a58f-5087fa3de0ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '67b19345-c927-42e2-946a-1bb82ab00b60', $q$No-code & Automation$q$, 287, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '67b19345-c927-42e2-946a-1bb82ab00b60')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '117a7e22-499f-462f-92ab-79295cfef946', $q$No-code & Automation$q$, 288, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '117a7e22-499f-462f-92ab-79295cfef946')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b2929b76-2d2c-496e-a42b-392fc1b54699', $q$No-code & Automation$q$, 289, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2929b76-2d2c-496e-a42b-392fc1b54699')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$No-code & Automation$q$, 290, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f9bc7649-dc5b-4824-b0b4-1f220d996bc3', $q$No-code & Automation$q$, 291, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9bc7649-dc5b-4824-b0b4-1f220d996bc3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f43a5180-ad73-4b48-95ac-b2cd02106791', $q$No-code & Automation$q$, 292, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f43a5180-ad73-4b48-95ac-b2cd02106791')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bae8c5eb-e420-46ea-ab07-e5a2d1b90319', $q$No-code & Automation$q$, 293, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bae8c5eb-e420-46ea-ab07-e5a2d1b90319')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a22cd72-a223-425f-872a-827407f67bb9', $q$No-code & Automation$q$, 294, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a22cd72-a223-425f-872a-827407f67bb9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c98b6563-0ec6-441b-b5ed-0beb5d47e8f7', $q$Website & Commerce$q$, 295, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c98b6563-0ec6-441b-b5ed-0beb5d47e8f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '745e7d51-96b5-4e49-8391-846941129c95', $q$Website & Commerce$q$, 296, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '745e7d51-96b5-4e49-8391-846941129c95')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ca133bfb-1107-4109-8688-45beef7d4d03', $q$Website & Commerce$q$, 297, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca133bfb-1107-4109-8688-45beef7d4d03')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4251d844-33b1-400c-bb7b-088d475cef82', $q$Website & Commerce$q$, 298, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4251d844-33b1-400c-bb7b-088d475cef82')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ad7c247-5d9a-4f7e-b32d-198c140b1f0b', $q$Website & Commerce$q$, 299, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ad7c247-5d9a-4f7e-b32d-198c140b1f0b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Website & Commerce$q$, 300, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eef4f17c-1c20-4cb2-9bf7-47a0e5632c8c', $q$Website & Commerce$q$, 301, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eef4f17c-1c20-4cb2-9bf7-47a0e5632c8c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '036ebb4f-fc22-4057-831e-b9e581009137', $q$Website & Commerce$q$, 302, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '036ebb4f-fc22-4057-831e-b9e581009137')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '46a8e7ec-2b99-40e2-adca-8f81f3b71e57', $q$Website & Commerce$q$, 303, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46a8e7ec-2b99-40e2-adca-8f81f3b71e57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aa13d6c0-d32a-426d-805b-8124f40390e4', $q$Website & Commerce$q$, 304, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa13d6c0-d32a-426d-805b-8124f40390e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ab99a23-e2f0-4b0d-b603-9ded27a0f2c6', $q$Website & Commerce$q$, 305, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ab99a23-e2f0-4b0d-b603-9ded27a0f2c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4a66d624-b348-4934-a255-2bc306fdcf7b', $q$Website & Commerce$q$, 306, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a66d624-b348-4934-a255-2bc306fdcf7b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$Website & Commerce$q$, 308, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9edefa30-90ff-46ea-8aa7-f8de6be4c79c', $q$Website & Commerce$q$, 309, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9edefa30-90ff-46ea-8aa7-f8de6be4c79c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b333f512-f7fd-4bd3-a4a4-6210ddaae0a8', $q$Website & Commerce$q$, 310, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b333f512-f7fd-4bd3-a4a4-6210ddaae0a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dca1fcb2-9238-4516-ba95-c8cb62820764', $q$Website & Commerce$q$, 311, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dca1fcb2-9238-4516-ba95-c8cb62820764')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6e2b87a4-c5be-4f23-acc9-dd611b9c5856', $q$Website & Commerce$q$, 312, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e2b87a4-c5be-4f23-acc9-dd611b9c5856')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9e4d2898-7923-44d2-a2aa-f2138ec31ce4', $q$Website & Commerce$q$, 313, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9e4d2898-7923-44d2-a2aa-f2138ec31ce4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a7743d6-ac1d-4562-b878-cfc332ab5aeb', $q$Website & Commerce$q$, 314, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a7743d6-ac1d-4562-b878-cfc332ab5aeb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9eb13448-c65d-4848-a1d8-3d2a010b723d', $q$Website & Commerce$q$, 315, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9eb13448-c65d-4848-a1d8-3d2a010b723d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cfb2973b-621a-4e4a-b368-035048c957fd', $q$Website & Commerce$q$, 316, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfb2973b-621a-4e4a-b368-035048c957fd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a106a741-e518-4de4-ace7-f5c84db01f4a', $q$Website & Commerce$q$, 317, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a106a741-e518-4de4-ace7-f5c84db01f4a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '14aeb166-94c7-4343-ba72-b485b767c52b', $q$Website & Commerce$q$, 318, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '14aeb166-94c7-4343-ba72-b485b767c52b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b211eaab-26f2-46f7-b63b-6470f8655fa2', $q$Website & Commerce$q$, 319, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b211eaab-26f2-46f7-b63b-6470f8655fa2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a056723-ee4b-46ab-988f-3d80d7a96c4e', $q$Customer Support$q$, 320, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a056723-ee4b-46ab-988f-3d80d7a96c4e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd4ff1377-e0f5-4af0-9e80-71487c351c04', $q$Customer Support$q$, 321, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4ff1377-e0f5-4af0-9e80-71487c351c04')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f232ed0f-8c1a-4fee-9d5d-b7fe5094bbbb', $q$Customer Support$q$, 322, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f232ed0f-8c1a-4fee-9d5d-b7fe5094bbbb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a3094cf-a8e5-4f7e-b9ed-7fe69416116b', $q$Customer Support$q$, 323, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a3094cf-a8e5-4f7e-b9ed-7fe69416116b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0f1da1ce-d152-40e9-b9f0-ad9c3adae164', $q$Customer Support$q$, 324, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f1da1ce-d152-40e9-b9f0-ad9c3adae164')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$Customer Support$q$, 325, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'badfcb90-2ef7-4fee-a3ed-8a5021afbe5f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$Customer Support$q$, 326, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '463b249f-58f5-4f62-8f21-0f807fd8bd65')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$Customer Support$q$, 327, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$Customer Support$q$, 328, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$Customer Support$q$, 329, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '993a2b5b-ee72-498b-b5f1-82135cc21b11')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$Customer Support$q$, 330, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6defa3eb-e961-45d0-b2f3-df7356237cfc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$Customer Support$q$, 331, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11ab9318-aa3a-43fc-9832-012d933cd2d2', $q$Customer Support$q$, 332, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11ab9318-aa3a-43fc-9832-012d933cd2d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$Customer Support$q$, 333, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0d4fbeed-972a-4e00-a10d-3f6c2b06033c', $q$Customer Support$q$, 334, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d4fbeed-972a-4e00-a10d-3f6c2b06033c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f54afb02-05b6-4fdd-aaff-7d81680e4f4d', $q$Customer Support$q$, 335, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f54afb02-05b6-4fdd-aaff-7d81680e4f4d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '02537e9f-5e3e-4e2f-9b7e-a73669114bd6', $q$Customer Support$q$, 336, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02537e9f-5e3e-4e2f-9b7e-a73669114bd6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f76f119f-94eb-416d-8b1a-53da64763684', $q$Customer Support$q$, 337, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f76f119f-94eb-416d-8b1a-53da64763684')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b4cf4770-d131-451c-a3a1-895ba3bfb0da', $q$Customer Support$q$, 338, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4cf4770-d131-451c-a3a1-895ba3bfb0da')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '56724599-1872-4e62-b903-ed19a3916f2f', $q$Customer Support$q$, 339, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56724599-1872-4e62-b903-ed19a3916f2f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20d62d48-b10a-49b7-a013-1df91c3f9d32', $q$Customer Support$q$, 340, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20d62d48-b10a-49b7-a013-1df91c3f9d32')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '861123b5-2ddd-4c46-aa4f-eb2c58a34c58', $q$Customer Support$q$, 341, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '861123b5-2ddd-4c46-aa4f-eb2c58a34c58')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3478a3af-daa1-4153-b114-3f47610904fd', $q$Customer Support$q$, 342, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3478a3af-daa1-4153-b114-3f47610904fd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc', $q$Customer Support$q$, 343, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd90bf6d-4e0a-4e7e-ad8e-9a160bda7dbc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '263780ad-dbb8-4862-b01a-e1ce95f8fa3a', $q$HR & Recruiting$q$, 344, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '263780ad-dbb8-4862-b01a-e1ce95f8fa3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28db2214-8104-44f7-8d16-5482ac920f21', $q$HR & Recruiting$q$, 345, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28db2214-8104-44f7-8d16-5482ac920f21')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae6561ef-62fe-443b-995a-a1d36df5ea91', $q$HR & Recruiting$q$, 346, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae6561ef-62fe-443b-995a-a1d36df5ea91')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '59e37590-ebda-42a1-b306-93eb66b13b27', $q$HR & Recruiting$q$, 347, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59e37590-ebda-42a1-b306-93eb66b13b27')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '868cf043-41bd-45f4-8568-13b59cf7fb93', $q$HR & Recruiting$q$, 348, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '868cf043-41bd-45f4-8568-13b59cf7fb93')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '938ab555-9fbc-47d8-a414-f6dbfadcc473', $q$HR & Recruiting$q$, 349, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '938ab555-9fbc-47d8-a414-f6dbfadcc473')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ccd5534-faa4-40e5-8b15-5ca13db08e2e', $q$HR & Recruiting$q$, 350, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ccd5534-faa4-40e5-8b15-5ca13db08e2e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '44ab8232-5537-40f1-b180-862658c8fcf5', $q$HR & Recruiting$q$, 351, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44ab8232-5537-40f1-b180-862658c8fcf5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'da1eed86-f886-4ac0-9587-89ab0dce35f5', $q$HR & Recruiting$q$, 352, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da1eed86-f886-4ac0-9587-89ab0dce35f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fb31e8ae-e570-4e3e-b865-b4f831c70398', $q$HR & Recruiting$q$, 353, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb31e8ae-e570-4e3e-b865-b4f831c70398')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20fdae09-a17f-4c37-95f5-f6abf19c93b5', $q$HR & Recruiting$q$, 354, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20fdae09-a17f-4c37-95f5-f6abf19c93b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '41688164-bff2-4d0a-8c55-4d847c936f12', $q$HR & Recruiting$q$, 355, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41688164-bff2-4d0a-8c55-4d847c936f12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ad918d40-0018-4143-a607-5a36dd55baf6', $q$HR & Recruiting$q$, 356, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad918d40-0018-4143-a607-5a36dd55baf6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1a0ac46b-2692-406a-b868-73e8c7b627db', $q$HR & Recruiting$q$, 357, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a0ac46b-2692-406a-b868-73e8c7b627db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1850649f-0915-4e09-87b7-b7aa588ddd00', $q$HR & Recruiting$q$, 358, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1850649f-0915-4e09-87b7-b7aa588ddd00')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd4790e8a-5afa-40c4-9e80-1e6489a84434', $q$HR & Recruiting$q$, 359, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4790e8a-5afa-40c4-9e80-1e6489a84434')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ecc248c8-d683-44ea-8e90-40d9194740c1', $q$HR & Recruiting$q$, 360, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ecc248c8-d683-44ea-8e90-40d9194740c1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06eb9255-8dff-49b4-92cb-b6dfc17d5493', $q$HR & Recruiting$q$, 361, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06eb9255-8dff-49b4-92cb-b6dfc17d5493')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7018fde8-f2e0-455a-ae95-59b95db2c107', $q$HR & Recruiting$q$, 362, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7018fde8-f2e0-455a-ae95-59b95db2c107')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af2f837c-b8e2-4cf6-bb19-100a26c709af', $q$HR & Recruiting$q$, 363, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af2f837c-b8e2-4cf6-bb19-100a26c709af')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c7efb47-f269-4e6f-aecc-cb8f27126ca9', $q$HR & Recruiting$q$, 364, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c7efb47-f269-4e6f-aecc-cb8f27126ca9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ade06e5-b645-47e5-8350-a2890ac101e4', $q$HR & Recruiting$q$, 365, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ade06e5-b645-47e5-8350-a2890ac101e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2', $q$HR & Recruiting$q$, 366, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e78e0c41-5e00-4b97-a1b7-9fbee9c1faa2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c209af5-e769-4601-8b16-169d41b98725', $q$HR & Recruiting$q$, 367, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c209af5-e769-4601-8b16-169d41b98725')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '72083907-7b29-4e6e-80d3-6134cca542d6', $q$Finance & Billing$q$, 368, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72083907-7b29-4e6e-80d3-6134cca542d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3f26fe2f-0d14-4d94-8521-de088090412c', $q$Finance & Billing$q$, 369, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f26fe2f-0d14-4d94-8521-de088090412c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '83233571-dfd1-4aa8-9b81-a9cb76f036cd', $q$Finance & Billing$q$, 370, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83233571-dfd1-4aa8-9b81-a9cb76f036cd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '596a21e4-5cc6-4e45-bc09-c76587b5f3a1', $q$Finance & Billing$q$, 371, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '596a21e4-5cc6-4e45-bc09-c76587b5f3a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a668def-7d55-49ba-9faf-7c5b9537b7a6', $q$Finance & Billing$q$, 372, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a668def-7d55-49ba-9faf-7c5b9537b7a6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11cc6093-d880-4046-9b74-e055ae089a8e', $q$Finance & Billing$q$, 373, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11cc6093-d880-4046-9b74-e055ae089a8e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Finance & Billing$q$, 374, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f4a927a2-feba-4930-ad55-823b90a5c145', $q$Finance & Billing$q$, 375, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4a927a2-feba-4930-ad55-823b90a5c145')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '639b380d-84c6-419b-a52a-8ad57b880d9c', $q$Finance & Billing$q$, 376, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '639b380d-84c6-419b-a52a-8ad57b880d9c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13a40e93-2361-4019-8f00-7522e0ed8bb9', $q$Finance & Billing$q$, 377, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13a40e93-2361-4019-8f00-7522e0ed8bb9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b97775a6-c87a-47b1-802f-7aa8a3280f6a', $q$Finance & Billing$q$, 378, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b97775a6-c87a-47b1-802f-7aa8a3280f6a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '04370e5b-5bb7-44db-b5e6-2db98849560d', $q$Finance & Billing$q$, 379, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04370e5b-5bb7-44db-b5e6-2db98849560d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3cb98c1a-15c7-489f-9a78-52137ee7cc38', $q$Finance & Billing$q$, 380, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cb98c1a-15c7-489f-9a78-52137ee7cc38')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5893a7aa-99e0-4440-9c42-21e023145c91', $q$Finance & Billing$q$, 381, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5893a7aa-99e0-4440-9c42-21e023145c91')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '849e570b-901b-439e-b55b-ab7c7b657c2c', $q$Finance & Billing$q$, 382, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '849e570b-901b-439e-b55b-ab7c7b657c2c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f63dc78f-9d0d-4816-9ca0-858dd2947329', $q$Finance & Billing$q$, 383, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f63dc78f-9d0d-4816-9ca0-858dd2947329')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '44e76fa8-8fba-447b-a227-c3bb42e2b74f', $q$Finance & Billing$q$, 384, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44e76fa8-8fba-447b-a227-c3bb42e2b74f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd50744af-e272-48a8-a0dc-044078b5dab2', $q$Finance & Billing$q$, 385, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd50744af-e272-48a8-a0dc-044078b5dab2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '23986f65-446a-4255-8e2d-e265951f2262', $q$Finance & Billing$q$, 386, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23986f65-446a-4255-8e2d-e265951f2262')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '633df78b-c6d3-45d8-a067-207679f3055d', $q$Finance & Billing$q$, 387, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '633df78b-c6d3-45d8-a067-207679f3055d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e', $q$Finance & Billing$q$, 388, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5dc2b58-2c10-4b9c-809d-bd40b5ed746e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '38ebcc23-ac70-4e3b-9657-c3d8f9ce03db', $q$Finance & Billing$q$, 389, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38ebcc23-ac70-4e3b-9657-c3d8f9ce03db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a1062364-3f5b-45dc-b882-5a0283cbb0a9', $q$Finance & Billing$q$, 390, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1062364-3f5b-45dc-b882-5a0283cbb0a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3979638f-c194-4be0-8b95-c01a647146b8', $q$Finance & Billing$q$, 391, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3979638f-c194-4be0-8b95-c01a647146b8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf', $q$Finance & Billing$q$, 392, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abd1f2f3-8f2d-4fe4-a955-b465df5076cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$Product Analytics$q$, 394, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9a45dfc-a1c5-48e9-bcd3-8ece140c07de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Product Analytics$q$, 395, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06c62a86-d703-4a91-808a-a0aece77e321', $q$Product Analytics$q$, 396, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06c62a86-d703-4a91-808a-a0aece77e321')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$Product Analytics$q$, 397, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a6ea67e-e786-4158-b3c6-d8553bbb3f73')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05d6fc4d-ceaf-43ae-acac-3c7f072c89f2', $q$Product Analytics$q$, 398, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05d6fc4d-ceaf-43ae-acac-3c7f072c89f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af388462-725e-429b-a572-58a70a2238c4', $q$Product Analytics$q$, 399, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af388462-725e-429b-a572-58a70a2238c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$Product Analytics$q$, 400, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b0d980b-c01e-40ef-a82b-19f1c57289fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '027cd382-5c16-4471-a3a4-67f985398adc', $q$Product Analytics$q$, 401, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '027cd382-5c16-4471-a3a4-67f985398adc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76b93382-78f6-4307-a718-eb538f112980', $q$Product Analytics$q$, 402, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76b93382-78f6-4307-a718-eb538f112980')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$Product Analytics$q$, 403, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4fb71d52-71a3-4323-95eb-7716ce97e45c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e097cf49-379b-418c-9290-d13e3cc829ec', $q$Product Analytics$q$, 404, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e097cf49-379b-418c-9290-d13e3cc829ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd1ae0c2a-8164-4d82-8db2-7660d9fe7b09', $q$Product Analytics$q$, 405, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1ae0c2a-8164-4d82-8db2-7660d9fe7b09')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '030586da-c7c2-4395-8a88-ab6c99d72278', $q$Product Analytics$q$, 406, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '030586da-c7c2-4395-8a88-ab6c99d72278')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '53917c26-0b07-4781-b634-418d24dbcef3', $q$Product Analytics$q$, 408, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53917c26-0b07-4781-b634-418d24dbcef3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c25d8ee5-3608-4fe0-8763-83ed5faa70fe', $q$Product Analytics$q$, 409, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c25d8ee5-3608-4fe0-8763-83ed5faa70fe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$Product Analytics$q$, 410, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9974bf44-ff46-4392-bd8f-98b3ee10f69b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '721b3a38-d061-4bfd-94f0-6785a52684c9', $q$Product Analytics$q$, 411, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '721b3a38-d061-4bfd-94f0-6785a52684c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f0050715-8a0a-4437-8c80-e7d842301783', $q$Product Analytics$q$, 413, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0050715-8a0a-4437-8c80-e7d842301783')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$Product Analytics$q$, 414, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$Product Analytics$q$, 415, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb', $q$Security & IT$q$, 416, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e87fc9fe-9139-4e2a-b348-1b4b64fe9eeb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '70bf6be7-f47b-4ba4-936b-47ece1be0301', $q$Security & IT$q$, 417, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70bf6be7-f47b-4ba4-936b-47ece1be0301')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b790465f-8d9b-4776-8b1b-364273fb48a0', $q$Security & IT$q$, 418, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b790465f-8d9b-4776-8b1b-364273fb48a0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '621c1563-301c-4006-9dc0-beb9d7803b61', $q$Security & IT$q$, 419, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '621c1563-301c-4006-9dc0-beb9d7803b61')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a50e7f9-8dac-4f95-a6a8-044c2a5b961d', $q$Security & IT$q$, 420, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a50e7f9-8dac-4f95-a6a8-044c2a5b961d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6af1626a-384b-452a-8ba7-fab48922dd57', $q$Security & IT$q$, 421, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6af1626a-384b-452a-8ba7-fab48922dd57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0661eaf-0146-4993-862a-300b62279f7d', $q$Security & IT$q$, 422, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0661eaf-0146-4993-862a-300b62279f7d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0412c80c-5647-4376-b362-9ccece4ef8e5', $q$Security & IT$q$, 423, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0412c80c-5647-4376-b362-9ccece4ef8e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '39e085ba-918c-440b-8ad4-af576ba5ba03', $q$Security & IT$q$, 424, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39e085ba-918c-440b-8ad4-af576ba5ba03')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '01db3fa1-4544-4df3-b94a-c8779f0ed121', $q$Security & IT$q$, 425, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01db3fa1-4544-4df3-b94a-c8779f0ed121')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '52bf5267-89af-4200-b109-d8ec448cc105', $q$Security & IT$q$, 426, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52bf5267-89af-4200-b109-d8ec448cc105')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Security & IT$q$, 427, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Security & IT$q$, 428, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Security & IT$q$, 429, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b87aa12-a696-4762-9cbd-1a738f0fd2c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '19756a8e-09b5-44fb-801b-926184dbba14', $q$Security & IT$q$, 430, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19756a8e-09b5-44fb-801b-926184dbba14')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Security & IT$q$, 431, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f79bb617-e492-4f3f-b2e0-6a6ffd43dc71')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Security & IT$q$, 432, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Security & IT$q$, 433, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '500f337a-c890-4561-b62d-d9dfd247fbc6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Security & IT$q$, 434, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de412e9f-bb56-438d-8972-125d8b06d414', $q$Security & IT$q$, 435, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de412e9f-bb56-438d-8972-125d8b06d414')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b02fce7-12a6-4798-9309-0b54f402ce7f', $q$Security & IT$q$, 436, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b02fce7-12a6-4798-9309-0b54f402ce7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Security & IT$q$, 437, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Security & IT$q$, 438, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13b772a5-dcc4-4861-96b2-092a5abf26bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6519e387-8e19-4973-8093-cbf36862242e', $q$Security & IT$q$, 439, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6519e387-8e19-4973-8093-cbf36862242e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'afc32d91-8855-4308-bcef-20828d9e78e2', $q$Security & IT$q$, 440, 7, 7, 8, $q$Tier B — Strong expansion$q$, 7.4, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afc32d91-8855-4308-bcef-20828d9e78e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Forms & Scheduling$q$, 441, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e77aef61-9ca8-4e8b-8c7c-e11365f41e17')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Forms & Scheduling$q$, 442, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'acaa6370-6b47-4ce4-a037-fe2c52fd137b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Forms & Scheduling$q$, 443, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6b896e4-5bf3-4a3c-9f83-469792152818')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Forms & Scheduling$q$, 444, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2118c9da-01b6-493f-b26d-224cc4de5ba8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76d62d00-398c-4138-b919-379a5ca37c2b', $q$Forms & Scheduling$q$, 445, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76d62d00-398c-4138-b919-379a5ca37c2b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '304e1389-15d6-4292-826c-3085c32d74e1', $q$Forms & Scheduling$q$, 446, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '304e1389-15d6-4292-826c-3085c32d74e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Forms & Scheduling$q$, 447, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69056d48-f2a0-4191-ac9b-4a5b7c1c0412')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Forms & Scheduling$q$, 448, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd865b7df-50df-49c9-97ab-b4f5ff75a05c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Forms & Scheduling$q$, 449, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba73b0fc-07ff-4d10-9bbb-1291ae579cf8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Forms & Scheduling$q$, 450, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e479f0c5-74e4-41f4-aa19-bfdcda30ccd9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '448308da-5605-49bb-9624-815b9f255cf3', $q$Forms & Scheduling$q$, 451, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '448308da-5605-49bb-9624-815b9f255cf3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Forms & Scheduling$q$, 452, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'acb5fd7b-7099-4d41-a28a-be19f1114546')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Forms & Scheduling$q$, 453, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Forms & Scheduling$q$, 454, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bb0117d-0174-4a18-963f-a0a873a4b2b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Forms & Scheduling$q$, 455, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bef9e8d8-86d1-4254-b054-8fdc286672d5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Forms & Scheduling$q$, 456, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bde29d40-4c62-40a8-861e-ba3a8862dedc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Forms & Scheduling$q$, 457, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '523ab821-6dbc-4f0a-ad9c-477f20ab7e52')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd498e2a2-205f-436a-b281-0d60d3a97b18', $q$Forms & Scheduling$q$, 458, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd498e2a2-205f-436a-b281-0d60d3a97b18')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Forms & Scheduling$q$, 459, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Forms & Scheduling$q$, 460, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59765ae5-0390-4cfe-8c3d-77fc6b87aa0d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Forms & Scheduling$q$, 461, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f952f07d-b3f7-4527-af58-4d07608f83cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Forms & Scheduling$q$, 463, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '636ed515-67d3-49ef-bcc8-c781f89295ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3be42f56-bb10-429e-833e-4732e857fc3a', $q$Forms & Scheduling$q$, 464, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3be42f56-bb10-429e-833e-4732e857fc3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Forms & Scheduling$q$, 465, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6e0d85c-8664-4863-9ef9-fd20448bffd6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Design & Creative$q$, 466, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e79526e3-fc9f-4ec0-848a-0c70b7a3bd92')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Design & Creative$q$, 467, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Design & Creative$q$, 468, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd5db9612-39d7-4c31-8562-b26cbfaca743', $q$Design & Creative$q$, 469, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5db9612-39d7-4c31-8562-b26cbfaca743')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Design & Creative$q$, 470, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Design & Creative$q$, 471, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Design & Creative$q$, 472, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b39520f-ab30-4e58-8473-236949ec4dc5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7d954194-528b-4c02-af62-5032ccb9918a', $q$Design & Creative$q$, 473, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d954194-528b-4c02-af62-5032ccb9918a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Design & Creative$q$, 474, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3823f80c-7e1b-4a40-b37f-ad8fde45d0d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Design & Creative$q$, 475, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Design & Creative$q$, 476, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa4a289c-deca-4f77-9a17-9124d83266ee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4ed46725-5825-4345-b71d-388bad6fdf91', $q$Design & Creative$q$, 477, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ed46725-5825-4345-b71d-388bad6fdf91')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '79f83550-468f-4378-89d2-b95607e2f72e', $q$Design & Creative$q$, 478, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79f83550-468f-4378-89d2-b95607e2f72e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Design & Creative$q$, 479, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1850e50-e82f-45cf-a0c9-accb892735a7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Design & Creative$q$, 480, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e49a063e-cf60-43ca-ac4b-f2c2740a9b67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Design & Creative$q$, 481, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75b7cec6-4a39-4456-8f5f-bb719bb42775')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Design & Creative$q$, 482, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45e6cf2f-5a73-4152-bc7c-35947a2f985f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Design & Creative$q$, 483, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '217a3242-bd27-4f82-bf44-e768e2d249f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cdb2d9da-e798-41d0-8f9e-fc95973d9f1e', $q$Design & Creative$q$, 484, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdb2d9da-e798-41d0-8f9e-fc95973d9f1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Design & Creative$q$, 485, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78d1d55e-3d44-4509-a118-9b5206efa57a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Design & Creative$q$, 486, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dcc42744-8093-4da4-b78b-0290e5d5def0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Design & Creative$q$, 487, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdd5fb34-6747-4479-81aa-8ae793ce0279')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Design & Creative$q$, 488, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bcaff713-bcb7-45e0-a2be-7c83c04fb5a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Design & Creative$q$, 489, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99ec53f2-7bec-4016-a54d-dea91440a5b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd417de39-f651-4a18-aaad-445fe17ab81b', $q$AI & Agents$q$, 490, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd417de39-f651-4a18-aaad-445fe17ab81b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$AI & Agents$q$, 491, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13ab6855-36e8-4dcc-bfd6-c5394bdc3674')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5420efbb-d040-4bba-98e1-eb3de9843667', $q$AI & Agents$q$, 492, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5420efbb-d040-4bba-98e1-eb3de9843667')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '997e1c48-766a-4593-b774-3364383103c2', $q$AI & Agents$q$, 493, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '997e1c48-766a-4593-b774-3364383103c2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$AI & Agents$q$, 494, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24da33b5-7fec-4150-97a5-ac2d1c92593c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Developer Tools$q$, 495, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Developer Tools$q$, 496, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36a47b1c-ff9a-44c4-8e50-572883c5348b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Developer Tools$q$, 497, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'caa46b4a-ddf7-473a-8793-845e45dd40b3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Developer Tools$q$, 498, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d5d1f6f-0d6c-43a6-848d-b04582cb94c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Developer Tools$q$, 499, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b899dd8e-5a92-4424-9a3d-1964775af19a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Developer Tools$q$, 500, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '870d8f7e-4a30-42b3-8999-2b52c10af200')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('dcce3938-3a1a-4634-a545-31842a7651dc', $q$Developer Tools$q$, 198, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$No-code & Automation$q$, 271, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('4ba1dde9-3a3c-4472-af05-215a5ccd715d', $q$No-code & Automation$q$, 281, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('079eef6a-7551-42f9-8218-0e4c4e82dc10', $q$Website & Commerce$q$, 307, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d0c0a6d4-b565-4bc1-aaae-f64d2b455fe7', $q$Product Analytics$q$, 393, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e67947e6-4265-4afb-9c33-f8fdf7a52909', $q$Product Analytics$q$, 407, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2dc59fc4-cba5-4e5f-9d82-31860bce5d72', $q$Product Analytics$q$, 412, 7, 8, 8, $q$Tier B — Strong expansion$q$, 7.6, $q$gappsy-500-2026-07-17-v2$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('03916389-8c72-4b6c-ac5d-c652f169146c', $q$Forms & Scheduling$q$, 462, 7, 8, 9, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v2$q$)
ON CONFLICT (tool_id) DO NOTHING;

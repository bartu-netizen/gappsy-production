-- Comparison batch: jenni-ai-vs-wordhero, koala-ai-vs-writerzen, simplified-vs-taskade, lavender-vs-regie-ai, mem-vs-reflect, dust-vs-glean, compose-ai-vs-paragraphai, hypotenuse-ai-vs-typeface, relevance-ai-vs-sintra-ai, lindy-vs-stack-ai, colossyan-vs-d-id, elai-vs-yepic-ai, captions-vs-fliki, munch-vs-vizard, vidnoz-vs-wisecut, cleanvoice-vs-krisp, lovo-vs-resemble-ai, rask-ai-vs-wellsaid-labs, auphonic-vs-listnr, posthog-vs-statsig, appcues-vs-pendo, chameleon-vs-userpilot, walkme-vs-whatfix, baremetrics-vs-chartmogul, maxio-vs-revenuecat, fathom-analytics-vs-simple-analytics, cabin-vs-umami, growthbook-vs-statsig, product-fruits-vs-userguiding, apty-vs-whatfix, pipedream-vs-workato, albato-vs-integrately, integrately-vs-pabbly-connect, bardeen-vs-parabola, dagster-vs-temporal, dagster-vs-prefect, kissflow-vs-process-street, akiflow-vs-motion, amie-vs-sunsama, morgen-vs-routine, contentful-vs-sanity, directus-vs-strapi, prismic-vs-storyblok, datocms-vs-hygraph, buttercms-vs-contentful, ghost-vs-substack, missive-vs-superhuman, spark-mail-vs-spike, attio-vs-folk, nethunt-crm-vs-streak, capsule-crm-vs-onepagecrm, agile-crm-vs-engagebay, kommo-vs-vtiger, nocrm-io-vs-pipeline-crm, salesmate-vs-teamgate, attio-vs-twenty, chatwoot-vs-richpanel, dixa-vs-gladly, hiver-vs-re-amaze, respond-io-vs-trengo, sleekflow-vs-wati, delightchat-vs-interakt, pinecone-vs-weaviate, milvus-vs-qdrant
-- Publishes 64 comparison page(s) with editorial content.

-- ── Jenni AI vs WordHero (jenni-ai-vs-wordhero) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('71403b09-3361-45de-9911-89b692d11395', '6741ec68-b40f-4b14-9d8b-2af8c98c0e2f', $q$jenni-ai-vs-wordhero$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '71403b09-3361-45de-9911-89b692d11395', $q$vs WordHero$q$, $q$/compare/jenni-ai-vs-wordhero$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '71403b09-3361-45de-9911-89b692d11395'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '71403b09-3361-45de-9911-89b692d11395' AND href = $q$/compare/jenni-ai-vs-wordhero$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6741ec68-b40f-4b14-9d8b-2af8c98c0e2f', $q$vs Jenni AI$q$, $q$/compare/jenni-ai-vs-wordhero$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6741ec68-b40f-4b14-9d8b-2af8c98c0e2f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6741ec68-b40f-4b14-9d8b-2af8c98c0e2f' AND href = $q$/compare/jenni-ai-vs-wordhero$q$);

-- ── Koala AI vs WriterZen (koala-ai-vs-writerzen) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('96e6b159-e2df-47d3-a4b4-493bd926551e', '9d9bbada-62bd-4fae-b98c-356fa0441d5f', $q$koala-ai-vs-writerzen$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '96e6b159-e2df-47d3-a4b4-493bd926551e', $q$vs WriterZen$q$, $q$/compare/koala-ai-vs-writerzen$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '96e6b159-e2df-47d3-a4b4-493bd926551e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '96e6b159-e2df-47d3-a4b4-493bd926551e' AND href = $q$/compare/koala-ai-vs-writerzen$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9d9bbada-62bd-4fae-b98c-356fa0441d5f', $q$vs Koala AI$q$, $q$/compare/koala-ai-vs-writerzen$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9d9bbada-62bd-4fae-b98c-356fa0441d5f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9d9bbada-62bd-4fae-b98c-356fa0441d5f' AND href = $q$/compare/koala-ai-vs-writerzen$q$);

-- ── Simplified vs Taskade (simplified-vs-taskade) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c6aee23c-70db-420b-83e9-7069be0216f1', '83e84bc7-624a-4103-b7df-a6cdfba35f21', $q$simplified-vs-taskade$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6aee23c-70db-420b-83e9-7069be0216f1', $q$vs Taskade$q$, $q$/compare/simplified-vs-taskade$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6aee23c-70db-420b-83e9-7069be0216f1'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6aee23c-70db-420b-83e9-7069be0216f1' AND href = $q$/compare/simplified-vs-taskade$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '83e84bc7-624a-4103-b7df-a6cdfba35f21', $q$vs Simplified$q$, $q$/compare/simplified-vs-taskade$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '83e84bc7-624a-4103-b7df-a6cdfba35f21'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '83e84bc7-624a-4103-b7df-a6cdfba35f21' AND href = $q$/compare/simplified-vs-taskade$q$);

-- ── Lavender vs Regie.ai (lavender-vs-regie-ai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('76d57e8b-f525-42a1-a189-fcf48f10fecf', '50a14386-9f18-49e2-abdb-80c88d9cb7a2', $q$lavender-vs-regie-ai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '76d57e8b-f525-42a1-a189-fcf48f10fecf', $q$vs Regie.ai$q$, $q$/compare/lavender-vs-regie-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '76d57e8b-f525-42a1-a189-fcf48f10fecf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '76d57e8b-f525-42a1-a189-fcf48f10fecf' AND href = $q$/compare/lavender-vs-regie-ai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '50a14386-9f18-49e2-abdb-80c88d9cb7a2', $q$vs Lavender$q$, $q$/compare/lavender-vs-regie-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '50a14386-9f18-49e2-abdb-80c88d9cb7a2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '50a14386-9f18-49e2-abdb-80c88d9cb7a2' AND href = $q$/compare/lavender-vs-regie-ai$q$);

-- ── Mem vs Reflect (mem-vs-reflect) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6a57cb1c-0dcd-43da-80a0-d2bca18f6aa5', '19599bd9-0e9f-44d9-89bc-3dc73d9018b8', $q$mem-vs-reflect$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6a57cb1c-0dcd-43da-80a0-d2bca18f6aa5', $q$vs Reflect$q$, $q$/compare/mem-vs-reflect$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6a57cb1c-0dcd-43da-80a0-d2bca18f6aa5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6a57cb1c-0dcd-43da-80a0-d2bca18f6aa5' AND href = $q$/compare/mem-vs-reflect$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '19599bd9-0e9f-44d9-89bc-3dc73d9018b8', $q$vs Mem$q$, $q$/compare/mem-vs-reflect$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '19599bd9-0e9f-44d9-89bc-3dc73d9018b8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '19599bd9-0e9f-44d9-89bc-3dc73d9018b8' AND href = $q$/compare/mem-vs-reflect$q$);

-- ── Dust vs Glean (dust-vs-glean) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('997e1c48-766a-4593-b774-3364383103c2', 'b17dc713-2772-438d-a1a1-bbb8b11b6afc', $q$dust-vs-glean$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '997e1c48-766a-4593-b774-3364383103c2', $q$vs Glean$q$, $q$/compare/dust-vs-glean$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '997e1c48-766a-4593-b774-3364383103c2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '997e1c48-766a-4593-b774-3364383103c2' AND href = $q$/compare/dust-vs-glean$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b17dc713-2772-438d-a1a1-bbb8b11b6afc', $q$vs Dust$q$, $q$/compare/dust-vs-glean$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b17dc713-2772-438d-a1a1-bbb8b11b6afc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b17dc713-2772-438d-a1a1-bbb8b11b6afc' AND href = $q$/compare/dust-vs-glean$q$);

-- ── Compose AI vs ParagraphAI (compose-ai-vs-paragraphai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1f2bcc6e-4367-4eee-be32-0ccfd23149e3', 'f9a72ac4-b017-4bd7-b4fd-5cb3bd343b9e', $q$compose-ai-vs-paragraphai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1f2bcc6e-4367-4eee-be32-0ccfd23149e3', $q$vs ParagraphAI$q$, $q$/compare/compose-ai-vs-paragraphai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1f2bcc6e-4367-4eee-be32-0ccfd23149e3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1f2bcc6e-4367-4eee-be32-0ccfd23149e3' AND href = $q$/compare/compose-ai-vs-paragraphai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f9a72ac4-b017-4bd7-b4fd-5cb3bd343b9e', $q$vs Compose AI$q$, $q$/compare/compose-ai-vs-paragraphai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f9a72ac4-b017-4bd7-b4fd-5cb3bd343b9e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f9a72ac4-b017-4bd7-b4fd-5cb3bd343b9e' AND href = $q$/compare/compose-ai-vs-paragraphai$q$);

-- ── Hypotenuse AI vs Typeface (hypotenuse-ai-vs-typeface) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('cbb957cc-8de9-4968-928e-1b42cfb27349', '123b8401-6f03-436d-a3b8-572de129cfec', $q$hypotenuse-ai-vs-typeface$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cbb957cc-8de9-4968-928e-1b42cfb27349', $q$vs Typeface$q$, $q$/compare/hypotenuse-ai-vs-typeface$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cbb957cc-8de9-4968-928e-1b42cfb27349'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cbb957cc-8de9-4968-928e-1b42cfb27349' AND href = $q$/compare/hypotenuse-ai-vs-typeface$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '123b8401-6f03-436d-a3b8-572de129cfec', $q$vs Hypotenuse AI$q$, $q$/compare/hypotenuse-ai-vs-typeface$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '123b8401-6f03-436d-a3b8-572de129cfec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '123b8401-6f03-436d-a3b8-572de129cfec' AND href = $q$/compare/hypotenuse-ai-vs-typeface$q$);

-- ── Relevance AI vs Sintra AI (relevance-ai-vs-sintra-ai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', 'd417de39-f651-4a18-aaad-445fe17ab81b', $q$relevance-ai-vs-sintra-ai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$vs Sintra AI$q$, $q$/compare/relevance-ai-vs-sintra-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '13ab6855-36e8-4dcc-bfd6-c5394bdc3674'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '13ab6855-36e8-4dcc-bfd6-c5394bdc3674' AND href = $q$/compare/relevance-ai-vs-sintra-ai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd417de39-f651-4a18-aaad-445fe17ab81b', $q$vs Relevance AI$q$, $q$/compare/relevance-ai-vs-sintra-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd417de39-f651-4a18-aaad-445fe17ab81b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd417de39-f651-4a18-aaad-445fe17ab81b' AND href = $q$/compare/relevance-ai-vs-sintra-ai$q$);

-- ── Lindy vs Stack AI (lindy-vs-stack-ai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', '24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$lindy-vs-stack-ai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5420efbb-d040-4bba-98e1-eb3de9843667', $q$vs Stack AI$q$, $q$/compare/lindy-vs-stack-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5420efbb-d040-4bba-98e1-eb3de9843667'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5420efbb-d040-4bba-98e1-eb3de9843667' AND href = $q$/compare/lindy-vs-stack-ai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$vs Lindy$q$, $q$/compare/lindy-vs-stack-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c' AND href = $q$/compare/lindy-vs-stack-ai$q$);

-- ── Colossyan vs D-ID (colossyan-vs-d-id) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e3f6fe0d-a0c1-42eb-8614-9f5fd7e21256', '4e2e35d0-4b3f-44fd-9859-4de0cee91c3f', $q$colossyan-vs-d-id$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e3f6fe0d-a0c1-42eb-8614-9f5fd7e21256', $q$vs D-ID$q$, $q$/compare/colossyan-vs-d-id$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e3f6fe0d-a0c1-42eb-8614-9f5fd7e21256'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e3f6fe0d-a0c1-42eb-8614-9f5fd7e21256' AND href = $q$/compare/colossyan-vs-d-id$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4e2e35d0-4b3f-44fd-9859-4de0cee91c3f', $q$vs Colossyan$q$, $q$/compare/colossyan-vs-d-id$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4e2e35d0-4b3f-44fd-9859-4de0cee91c3f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4e2e35d0-4b3f-44fd-9859-4de0cee91c3f' AND href = $q$/compare/colossyan-vs-d-id$q$);

-- ── Elai vs Yepic AI (elai-vs-yepic-ai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1e765d41-8506-4bbb-8502-4b6b293c5c29', '280ff386-aa0f-4c47-904e-14db30865949', $q$elai-vs-yepic-ai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1e765d41-8506-4bbb-8502-4b6b293c5c29', $q$vs Yepic AI$q$, $q$/compare/elai-vs-yepic-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1e765d41-8506-4bbb-8502-4b6b293c5c29'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1e765d41-8506-4bbb-8502-4b6b293c5c29' AND href = $q$/compare/elai-vs-yepic-ai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '280ff386-aa0f-4c47-904e-14db30865949', $q$vs Elai$q$, $q$/compare/elai-vs-yepic-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '280ff386-aa0f-4c47-904e-14db30865949'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '280ff386-aa0f-4c47-904e-14db30865949' AND href = $q$/compare/elai-vs-yepic-ai$q$);

-- ── Captions vs Fliki (captions-vs-fliki) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('847ca3ae-c901-4b57-8fe3-f9b3380035c8', '20246395-4c99-4ebe-aa25-c4a917239735', $q$captions-vs-fliki$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '847ca3ae-c901-4b57-8fe3-f9b3380035c8', $q$vs Fliki$q$, $q$/compare/captions-vs-fliki$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '847ca3ae-c901-4b57-8fe3-f9b3380035c8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '847ca3ae-c901-4b57-8fe3-f9b3380035c8' AND href = $q$/compare/captions-vs-fliki$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '20246395-4c99-4ebe-aa25-c4a917239735', $q$vs Captions$q$, $q$/compare/captions-vs-fliki$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '20246395-4c99-4ebe-aa25-c4a917239735'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '20246395-4c99-4ebe-aa25-c4a917239735' AND href = $q$/compare/captions-vs-fliki$q$);

-- ── Munch vs Vizard (munch-vs-vizard) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a5863480-2bee-4075-812b-c253720b03cb', '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$munch-vs-vizard$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a5863480-2bee-4075-812b-c253720b03cb', $q$vs Vizard$q$, $q$/compare/munch-vs-vizard$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a5863480-2bee-4075-812b-c253720b03cb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a5863480-2bee-4075-812b-c253720b03cb' AND href = $q$/compare/munch-vs-vizard$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$vs Munch$q$, $q$/compare/munch-vs-vizard$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10' AND href = $q$/compare/munch-vs-vizard$q$);

-- ── Vidnoz vs Wisecut (vidnoz-vs-wisecut) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2dbc4826-ac2f-4e63-b546-bdd1459a0b34', '4513bb43-aeb2-4840-9feb-1d13971e78ee', $q$vidnoz-vs-wisecut$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2dbc4826-ac2f-4e63-b546-bdd1459a0b34', $q$vs Wisecut$q$, $q$/compare/vidnoz-vs-wisecut$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2dbc4826-ac2f-4e63-b546-bdd1459a0b34'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2dbc4826-ac2f-4e63-b546-bdd1459a0b34' AND href = $q$/compare/vidnoz-vs-wisecut$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4513bb43-aeb2-4840-9feb-1d13971e78ee', $q$vs Vidnoz$q$, $q$/compare/vidnoz-vs-wisecut$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4513bb43-aeb2-4840-9feb-1d13971e78ee'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4513bb43-aeb2-4840-9feb-1d13971e78ee' AND href = $q$/compare/vidnoz-vs-wisecut$q$);

-- ── Cleanvoice vs Krisp (cleanvoice-vs-krisp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9a9d84fa-11cb-4542-942a-2ec680e31383', '7e673235-0981-4c36-a2e4-4e051b04105c', $q$cleanvoice-vs-krisp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9a9d84fa-11cb-4542-942a-2ec680e31383', $q$vs Krisp$q$, $q$/compare/cleanvoice-vs-krisp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9a9d84fa-11cb-4542-942a-2ec680e31383'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9a9d84fa-11cb-4542-942a-2ec680e31383' AND href = $q$/compare/cleanvoice-vs-krisp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7e673235-0981-4c36-a2e4-4e051b04105c', $q$vs Cleanvoice$q$, $q$/compare/cleanvoice-vs-krisp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7e673235-0981-4c36-a2e4-4e051b04105c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7e673235-0981-4c36-a2e4-4e051b04105c' AND href = $q$/compare/cleanvoice-vs-krisp$q$);

-- ── LOVO vs Resemble AI (lovo-vs-resemble-ai) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('279a89e2-68a4-41dd-89a0-fc4c8b2a5cce', '79f3d550-5ec1-491d-9aa7-919a574aa346', $q$lovo-vs-resemble-ai$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '279a89e2-68a4-41dd-89a0-fc4c8b2a5cce', $q$vs Resemble AI$q$, $q$/compare/lovo-vs-resemble-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '279a89e2-68a4-41dd-89a0-fc4c8b2a5cce'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '279a89e2-68a4-41dd-89a0-fc4c8b2a5cce' AND href = $q$/compare/lovo-vs-resemble-ai$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '79f3d550-5ec1-491d-9aa7-919a574aa346', $q$vs LOVO$q$, $q$/compare/lovo-vs-resemble-ai$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '79f3d550-5ec1-491d-9aa7-919a574aa346'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '79f3d550-5ec1-491d-9aa7-919a574aa346' AND href = $q$/compare/lovo-vs-resemble-ai$q$);

-- ── Rask AI vs WellSaid Labs (rask-ai-vs-wellsaid-labs) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7edbb0f5-1514-498d-bc96-95c18bc2328b', '219b186e-c25c-4fd3-b6af-3d5e32e6319e', $q$rask-ai-vs-wellsaid-labs$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7edbb0f5-1514-498d-bc96-95c18bc2328b', $q$vs WellSaid Labs$q$, $q$/compare/rask-ai-vs-wellsaid-labs$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7edbb0f5-1514-498d-bc96-95c18bc2328b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7edbb0f5-1514-498d-bc96-95c18bc2328b' AND href = $q$/compare/rask-ai-vs-wellsaid-labs$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '219b186e-c25c-4fd3-b6af-3d5e32e6319e', $q$vs Rask AI$q$, $q$/compare/rask-ai-vs-wellsaid-labs$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '219b186e-c25c-4fd3-b6af-3d5e32e6319e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '219b186e-c25c-4fd3-b6af-3d5e32e6319e' AND href = $q$/compare/rask-ai-vs-wellsaid-labs$q$);

-- ── Auphonic vs Listnr (auphonic-vs-listnr) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', '7927ea27-2515-47df-a4f2-3f5c7bd4db63', $q$auphonic-vs-listnr$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$vs Listnr$q$, $q$/compare/auphonic-vs-listnr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6' AND href = $q$/compare/auphonic-vs-listnr$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7927ea27-2515-47df-a4f2-3f5c7bd4db63', $q$vs Auphonic$q$, $q$/compare/auphonic-vs-listnr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7927ea27-2515-47df-a4f2-3f5c7bd4db63'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7927ea27-2515-47df-a4f2-3f5c7bd4db63' AND href = $q$/compare/auphonic-vs-listnr$q$);

-- ── posthog vs Statsig (posthog-vs-statsig) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d0c0a6d4-b565-4bc1-aaae-f64d2b455fe7', 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$posthog-vs-statsig$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd0c0a6d4-b565-4bc1-aaae-f64d2b455fe7', $q$vs Statsig$q$, $q$/compare/posthog-vs-statsig$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd0c0a6d4-b565-4bc1-aaae-f64d2b455fe7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd0c0a6d4-b565-4bc1-aaae-f64d2b455fe7' AND href = $q$/compare/posthog-vs-statsig$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$vs posthog$q$, $q$/compare/posthog-vs-statsig$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6' AND href = $q$/compare/posthog-vs-statsig$q$);

-- ── Appcues vs Pendo (appcues-vs-pendo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', 'b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$appcues-vs-pendo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '06c62a86-d703-4a91-808a-a0aece77e321', $q$vs Pendo$q$, $q$/compare/appcues-vs-pendo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '06c62a86-d703-4a91-808a-a0aece77e321'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '06c62a86-d703-4a91-808a-a0aece77e321' AND href = $q$/compare/appcues-vs-pendo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b9a45dfc-a1c5-48e9-bcd3-8ece140c07de', $q$vs Appcues$q$, $q$/compare/appcues-vs-pendo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b9a45dfc-a1c5-48e9-bcd3-8ece140c07de'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b9a45dfc-a1c5-48e9-bcd3-8ece140c07de' AND href = $q$/compare/appcues-vs-pendo$q$);

-- ── Chameleon vs Userpilot (chameleon-vs-userpilot) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0a6ea67e-e786-4158-b3c6-d8553bbb3f73', 'b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$chameleon-vs-userpilot$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0a6ea67e-e786-4158-b3c6-d8553bbb3f73', $q$vs Userpilot$q$, $q$/compare/chameleon-vs-userpilot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0a6ea67e-e786-4158-b3c6-d8553bbb3f73'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0a6ea67e-e786-4158-b3c6-d8553bbb3f73' AND href = $q$/compare/chameleon-vs-userpilot$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$vs Chameleon$q$, $q$/compare/chameleon-vs-userpilot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347' AND href = $q$/compare/chameleon-vs-userpilot$q$);

-- ── WalkMe vs Whatfix (walkme-vs-whatfix) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('76b93382-78f6-4307-a718-eb538f112980', '4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$walkme-vs-whatfix$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '76b93382-78f6-4307-a718-eb538f112980', $q$vs Whatfix$q$, $q$/compare/walkme-vs-whatfix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '76b93382-78f6-4307-a718-eb538f112980'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '76b93382-78f6-4307-a718-eb538f112980' AND href = $q$/compare/walkme-vs-whatfix$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$vs WalkMe$q$, $q$/compare/walkme-vs-whatfix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4fb71d52-71a3-4323-95eb-7716ce97e45c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4fb71d52-71a3-4323-95eb-7716ce97e45c' AND href = $q$/compare/walkme-vs-whatfix$q$);

-- ── Baremetrics vs ChartMogul (baremetrics-vs-chartmogul) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('28f21e6a-228f-419e-9602-09cb10f941a9', '1434441b-2134-4477-a5b0-4cc5bca3bb34', $q$baremetrics-vs-chartmogul$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28f21e6a-228f-419e-9602-09cb10f941a9', $q$vs ChartMogul$q$, $q$/compare/baremetrics-vs-chartmogul$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28f21e6a-228f-419e-9602-09cb10f941a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28f21e6a-228f-419e-9602-09cb10f941a9' AND href = $q$/compare/baremetrics-vs-chartmogul$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1434441b-2134-4477-a5b0-4cc5bca3bb34', $q$vs Baremetrics$q$, $q$/compare/baremetrics-vs-chartmogul$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1434441b-2134-4477-a5b0-4cc5bca3bb34'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1434441b-2134-4477-a5b0-4cc5bca3bb34' AND href = $q$/compare/baremetrics-vs-chartmogul$q$);

-- ── Maxio vs RevenueCat (maxio-vs-revenuecat) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c580a7ae-24fa-4cd2-a2fb-ffc0619a71c0', 'd89ed73f-80e0-4221-8c89-5c539a41247e', $q$maxio-vs-revenuecat$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c580a7ae-24fa-4cd2-a2fb-ffc0619a71c0', $q$vs RevenueCat$q$, $q$/compare/maxio-vs-revenuecat$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c580a7ae-24fa-4cd2-a2fb-ffc0619a71c0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c580a7ae-24fa-4cd2-a2fb-ffc0619a71c0' AND href = $q$/compare/maxio-vs-revenuecat$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd89ed73f-80e0-4221-8c89-5c539a41247e', $q$vs Maxio$q$, $q$/compare/maxio-vs-revenuecat$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd89ed73f-80e0-4221-8c89-5c539a41247e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd89ed73f-80e0-4221-8c89-5c539a41247e' AND href = $q$/compare/maxio-vs-revenuecat$q$);

-- ── Fathom Analytics vs Simple Analytics (fathom-analytics-vs-simple-analytics) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9974bf44-ff46-4392-bd8f-98b3ee10f69b', '721b3a38-d061-4bfd-94f0-6785a52684c9', $q$fathom-analytics-vs-simple-analytics$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9974bf44-ff46-4392-bd8f-98b3ee10f69b', $q$vs Simple Analytics$q$, $q$/compare/fathom-analytics-vs-simple-analytics$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9974bf44-ff46-4392-bd8f-98b3ee10f69b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9974bf44-ff46-4392-bd8f-98b3ee10f69b' AND href = $q$/compare/fathom-analytics-vs-simple-analytics$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '721b3a38-d061-4bfd-94f0-6785a52684c9', $q$vs Fathom Analytics$q$, $q$/compare/fathom-analytics-vs-simple-analytics$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '721b3a38-d061-4bfd-94f0-6785a52684c9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '721b3a38-d061-4bfd-94f0-6785a52684c9' AND href = $q$/compare/fathom-analytics-vs-simple-analytics$q$);

-- ── Cabin vs umami (cabin-vs-umami) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f0050715-8a0a-4437-8c80-e7d842301783', '2dc59fc4-cba5-4e5f-9d82-31860bce5d72', $q$cabin-vs-umami$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f0050715-8a0a-4437-8c80-e7d842301783', $q$vs umami$q$, $q$/compare/cabin-vs-umami$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f0050715-8a0a-4437-8c80-e7d842301783'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f0050715-8a0a-4437-8c80-e7d842301783' AND href = $q$/compare/cabin-vs-umami$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2dc59fc4-cba5-4e5f-9d82-31860bce5d72', $q$vs Cabin$q$, $q$/compare/cabin-vs-umami$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2dc59fc4-cba5-4e5f-9d82-31860bce5d72'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2dc59fc4-cba5-4e5f-9d82-31860bce5d72' AND href = $q$/compare/cabin-vs-umami$q$);

-- ── GrowthBook vs Statsig (growthbook-vs-statsig) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$growthbook-vs-statsig$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0', $q$vs Statsig$q$, $q$/compare/growthbook-vs-statsig$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '97fb4c3c-be2d-434f-9e6a-cd5f7f600da0' AND href = $q$/compare/growthbook-vs-statsig$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6', $q$vs GrowthBook$q$, $q$/compare/growthbook-vs-statsig$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cd05bd69-56cc-4c9d-ab2c-9a1a41c43fe6' AND href = $q$/compare/growthbook-vs-statsig$q$);

-- ── Product Fruits vs UserGuiding (product-fruits-vs-userguiding) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('af388462-725e-429b-a572-58a70a2238c4', '9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$product-fruits-vs-userguiding$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'af388462-725e-429b-a572-58a70a2238c4', $q$vs UserGuiding$q$, $q$/compare/product-fruits-vs-userguiding$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'af388462-725e-429b-a572-58a70a2238c4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'af388462-725e-429b-a572-58a70a2238c4' AND href = $q$/compare/product-fruits-vs-userguiding$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9b0d980b-c01e-40ef-a82b-19f1c57289fc', $q$vs Product Fruits$q$, $q$/compare/product-fruits-vs-userguiding$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9b0d980b-c01e-40ef-a82b-19f1c57289fc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9b0d980b-c01e-40ef-a82b-19f1c57289fc' AND href = $q$/compare/product-fruits-vs-userguiding$q$);

-- ── Apty vs Whatfix (apty-vs-whatfix) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e097cf49-379b-418c-9290-d13e3cc829ec', '4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$apty-vs-whatfix$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e097cf49-379b-418c-9290-d13e3cc829ec', $q$vs Whatfix$q$, $q$/compare/apty-vs-whatfix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e097cf49-379b-418c-9290-d13e3cc829ec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e097cf49-379b-418c-9290-d13e3cc829ec' AND href = $q$/compare/apty-vs-whatfix$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4fb71d52-71a3-4323-95eb-7716ce97e45c', $q$vs Apty$q$, $q$/compare/apty-vs-whatfix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4fb71d52-71a3-4323-95eb-7716ce97e45c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4fb71d52-71a3-4323-95eb-7716ce97e45c' AND href = $q$/compare/apty-vs-whatfix$q$);

-- ── Pipedream vs Workato (pipedream-vs-workato) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9e7e7d01-4172-4d85-90b4-cb0af1a7c91d', 'b7dbfbf6-f142-4013-ba06-5ff42e255059', $q$pipedream-vs-workato$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d', $q$vs Workato$q$, $q$/compare/pipedream-vs-workato$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9e7e7d01-4172-4d85-90b4-cb0af1a7c91d' AND href = $q$/compare/pipedream-vs-workato$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b7dbfbf6-f142-4013-ba06-5ff42e255059', $q$vs Pipedream$q$, $q$/compare/pipedream-vs-workato$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b7dbfbf6-f142-4013-ba06-5ff42e255059'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b7dbfbf6-f142-4013-ba06-5ff42e255059' AND href = $q$/compare/pipedream-vs-workato$q$);

-- ── Albato vs Integrately (albato-vs-integrately) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', '816736fa-6a4c-405d-b001-715479da0a6e', $q$albato-vs-integrately$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3b94af22-0e27-4952-855a-be2baf62f997', $q$vs Integrately$q$, $q$/compare/albato-vs-integrately$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3b94af22-0e27-4952-855a-be2baf62f997'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3b94af22-0e27-4952-855a-be2baf62f997' AND href = $q$/compare/albato-vs-integrately$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '816736fa-6a4c-405d-b001-715479da0a6e', $q$vs Albato$q$, $q$/compare/albato-vs-integrately$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '816736fa-6a4c-405d-b001-715479da0a6e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '816736fa-6a4c-405d-b001-715479da0a6e' AND href = $q$/compare/albato-vs-integrately$q$);

-- ── Integrately vs Pabbly Connect (integrately-vs-pabbly-connect) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('816736fa-6a4c-405d-b001-715479da0a6e', '4f5fa950-8b00-4a29-8729-57a4f49a3db7', $q$integrately-vs-pabbly-connect$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '816736fa-6a4c-405d-b001-715479da0a6e', $q$vs Pabbly Connect$q$, $q$/compare/integrately-vs-pabbly-connect$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '816736fa-6a4c-405d-b001-715479da0a6e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '816736fa-6a4c-405d-b001-715479da0a6e' AND href = $q$/compare/integrately-vs-pabbly-connect$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4f5fa950-8b00-4a29-8729-57a4f49a3db7', $q$vs Integrately$q$, $q$/compare/integrately-vs-pabbly-connect$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4f5fa950-8b00-4a29-8729-57a4f49a3db7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4f5fa950-8b00-4a29-8729-57a4f49a3db7' AND href = $q$/compare/integrately-vs-pabbly-connect$q$);

-- ── Bardeen vs Parabola (bardeen-vs-parabola) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ca3ed58b-ad38-4b99-ac69-c8732ec128a9', '812e6387-746a-402d-9db8-ecb8da116b61', $q$bardeen-vs-parabola$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9', $q$vs Parabola$q$, $q$/compare/bardeen-vs-parabola$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ca3ed58b-ad38-4b99-ac69-c8732ec128a9' AND href = $q$/compare/bardeen-vs-parabola$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '812e6387-746a-402d-9db8-ecb8da116b61', $q$vs Bardeen$q$, $q$/compare/bardeen-vs-parabola$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '812e6387-746a-402d-9db8-ecb8da116b61'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '812e6387-746a-402d-9db8-ecb8da116b61' AND href = $q$/compare/bardeen-vs-parabola$q$);

-- ── Dagster vs Temporal (dagster-vs-temporal) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('aef224a1-fe25-4992-8146-62c270b751d5', '2efa5f1f-29da-4d6c-a300-8437c5445f15', $q$dagster-vs-temporal$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aef224a1-fe25-4992-8146-62c270b751d5', $q$vs Temporal$q$, $q$/compare/dagster-vs-temporal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aef224a1-fe25-4992-8146-62c270b751d5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aef224a1-fe25-4992-8146-62c270b751d5' AND href = $q$/compare/dagster-vs-temporal$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2efa5f1f-29da-4d6c-a300-8437c5445f15', $q$vs Dagster$q$, $q$/compare/dagster-vs-temporal$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2efa5f1f-29da-4d6c-a300-8437c5445f15'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2efa5f1f-29da-4d6c-a300-8437c5445f15' AND href = $q$/compare/dagster-vs-temporal$q$);

-- ── Dagster vs Prefect (dagster-vs-prefect) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('aef224a1-fe25-4992-8146-62c270b751d5', '2d51e95d-ce2a-4513-a287-44c9039f1a17', $q$dagster-vs-prefect$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aef224a1-fe25-4992-8146-62c270b751d5', $q$vs Prefect$q$, $q$/compare/dagster-vs-prefect$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aef224a1-fe25-4992-8146-62c270b751d5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aef224a1-fe25-4992-8146-62c270b751d5' AND href = $q$/compare/dagster-vs-prefect$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2d51e95d-ce2a-4513-a287-44c9039f1a17', $q$vs Dagster$q$, $q$/compare/dagster-vs-prefect$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2d51e95d-ce2a-4513-a287-44c9039f1a17'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2d51e95d-ce2a-4513-a287-44c9039f1a17' AND href = $q$/compare/dagster-vs-prefect$q$);

-- ── Kissflow vs Process Street (kissflow-vs-process-street) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('20fb5336-a872-4aeb-a58f-5087fa3de0ba', '14d1d9d1-5e67-4b61-a083-8bace97b6d67', $q$kissflow-vs-process-street$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '20fb5336-a872-4aeb-a58f-5087fa3de0ba', $q$vs Process Street$q$, $q$/compare/kissflow-vs-process-street$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '20fb5336-a872-4aeb-a58f-5087fa3de0ba'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '20fb5336-a872-4aeb-a58f-5087fa3de0ba' AND href = $q$/compare/kissflow-vs-process-street$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '14d1d9d1-5e67-4b61-a083-8bace97b6d67', $q$vs Kissflow$q$, $q$/compare/kissflow-vs-process-street$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '14d1d9d1-5e67-4b61-a083-8bace97b6d67'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '14d1d9d1-5e67-4b61-a083-8bace97b6d67' AND href = $q$/compare/kissflow-vs-process-street$q$);

-- ── Akiflow vs Motion (akiflow-vs-motion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('6a4f04ff-7cde-4b44-8fe3-2960a4980493', 'bf92d64e-0be1-4ba9-986c-37463bbdbdeb', $q$akiflow-vs-motion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6a4f04ff-7cde-4b44-8fe3-2960a4980493', $q$vs Motion$q$, $q$/compare/akiflow-vs-motion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6a4f04ff-7cde-4b44-8fe3-2960a4980493' AND href = $q$/compare/akiflow-vs-motion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bf92d64e-0be1-4ba9-986c-37463bbdbdeb', $q$vs Akiflow$q$, $q$/compare/akiflow-vs-motion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bf92d64e-0be1-4ba9-986c-37463bbdbdeb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bf92d64e-0be1-4ba9-986c-37463bbdbdeb' AND href = $q$/compare/akiflow-vs-motion$q$);

-- ── Amie vs Sunsama (amie-vs-sunsama) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7c847d46-b23f-437e-8dd9-7f034b7c3c9f', '366134f6-a5b9-48d8-883a-e54211d7dd34', $q$amie-vs-sunsama$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7c847d46-b23f-437e-8dd9-7f034b7c3c9f', $q$vs Sunsama$q$, $q$/compare/amie-vs-sunsama$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7c847d46-b23f-437e-8dd9-7f034b7c3c9f' AND href = $q$/compare/amie-vs-sunsama$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '366134f6-a5b9-48d8-883a-e54211d7dd34', $q$vs Amie$q$, $q$/compare/amie-vs-sunsama$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '366134f6-a5b9-48d8-883a-e54211d7dd34'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '366134f6-a5b9-48d8-883a-e54211d7dd34' AND href = $q$/compare/amie-vs-sunsama$q$);

-- ── Morgen vs Routine (morgen-vs-routine) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f44a5433-17b4-408d-9f04-3a38418faa5d', '00e620ce-3d58-4944-af9e-bc0f5e8779e6', $q$morgen-vs-routine$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f44a5433-17b4-408d-9f04-3a38418faa5d', $q$vs Routine$q$, $q$/compare/morgen-vs-routine$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f44a5433-17b4-408d-9f04-3a38418faa5d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f44a5433-17b4-408d-9f04-3a38418faa5d' AND href = $q$/compare/morgen-vs-routine$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '00e620ce-3d58-4944-af9e-bc0f5e8779e6', $q$vs Morgen$q$, $q$/compare/morgen-vs-routine$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '00e620ce-3d58-4944-af9e-bc0f5e8779e6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '00e620ce-3d58-4944-af9e-bc0f5e8779e6' AND href = $q$/compare/morgen-vs-routine$q$);

-- ── Contentful vs Sanity (contentful-vs-sanity) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dca1fcb2-9238-4516-ba95-c8cb62820764', 'cfb2973b-621a-4e4a-b368-035048c957fd', $q$contentful-vs-sanity$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dca1fcb2-9238-4516-ba95-c8cb62820764', $q$vs Sanity$q$, $q$/compare/contentful-vs-sanity$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dca1fcb2-9238-4516-ba95-c8cb62820764'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dca1fcb2-9238-4516-ba95-c8cb62820764' AND href = $q$/compare/contentful-vs-sanity$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cfb2973b-621a-4e4a-b368-035048c957fd', $q$vs Contentful$q$, $q$/compare/contentful-vs-sanity$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cfb2973b-621a-4e4a-b368-035048c957fd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cfb2973b-621a-4e4a-b368-035048c957fd' AND href = $q$/compare/contentful-vs-sanity$q$);

-- ── Directus vs Strapi (directus-vs-strapi) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a106a741-e518-4de4-ace7-f5c84db01f4a', '9eb13448-c65d-4848-a1d8-3d2a010b723d', $q$directus-vs-strapi$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a106a741-e518-4de4-ace7-f5c84db01f4a', $q$vs Strapi$q$, $q$/compare/directus-vs-strapi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a106a741-e518-4de4-ace7-f5c84db01f4a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a106a741-e518-4de4-ace7-f5c84db01f4a' AND href = $q$/compare/directus-vs-strapi$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9eb13448-c65d-4848-a1d8-3d2a010b723d', $q$vs Directus$q$, $q$/compare/directus-vs-strapi$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9eb13448-c65d-4848-a1d8-3d2a010b723d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9eb13448-c65d-4848-a1d8-3d2a010b723d' AND href = $q$/compare/directus-vs-strapi$q$);

-- ── Prismic vs Storyblok (prismic-vs-storyblok) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9e4d2898-7923-44d2-a2aa-f2138ec31ce4', '6e2b87a4-c5be-4f23-acc9-dd611b9c5856', $q$prismic-vs-storyblok$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9e4d2898-7923-44d2-a2aa-f2138ec31ce4', $q$vs Storyblok$q$, $q$/compare/prismic-vs-storyblok$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9e4d2898-7923-44d2-a2aa-f2138ec31ce4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9e4d2898-7923-44d2-a2aa-f2138ec31ce4' AND href = $q$/compare/prismic-vs-storyblok$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6e2b87a4-c5be-4f23-acc9-dd611b9c5856', $q$vs Prismic$q$, $q$/compare/prismic-vs-storyblok$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6e2b87a4-c5be-4f23-acc9-dd611b9c5856'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6e2b87a4-c5be-4f23-acc9-dd611b9c5856' AND href = $q$/compare/prismic-vs-storyblok$q$);

-- ── DatoCMS vs Hygraph (datocms-vs-hygraph) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7a7743d6-ac1d-4562-b878-cfc332ab5aeb', 'b211eaab-26f2-46f7-b63b-6470f8655fa2', $q$datocms-vs-hygraph$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7a7743d6-ac1d-4562-b878-cfc332ab5aeb', $q$vs Hygraph$q$, $q$/compare/datocms-vs-hygraph$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7a7743d6-ac1d-4562-b878-cfc332ab5aeb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7a7743d6-ac1d-4562-b878-cfc332ab5aeb' AND href = $q$/compare/datocms-vs-hygraph$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b211eaab-26f2-46f7-b63b-6470f8655fa2', $q$vs DatoCMS$q$, $q$/compare/datocms-vs-hygraph$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b211eaab-26f2-46f7-b63b-6470f8655fa2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b211eaab-26f2-46f7-b63b-6470f8655fa2' AND href = $q$/compare/datocms-vs-hygraph$q$);

-- ── ButterCMS vs Contentful (buttercms-vs-contentful) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b333f512-f7fd-4bd3-a4a4-6210ddaae0a8', 'dca1fcb2-9238-4516-ba95-c8cb62820764', $q$buttercms-vs-contentful$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b333f512-f7fd-4bd3-a4a4-6210ddaae0a8', $q$vs Contentful$q$, $q$/compare/buttercms-vs-contentful$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b333f512-f7fd-4bd3-a4a4-6210ddaae0a8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b333f512-f7fd-4bd3-a4a4-6210ddaae0a8' AND href = $q$/compare/buttercms-vs-contentful$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dca1fcb2-9238-4516-ba95-c8cb62820764', $q$vs ButterCMS$q$, $q$/compare/buttercms-vs-contentful$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dca1fcb2-9238-4516-ba95-c8cb62820764'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dca1fcb2-9238-4516-ba95-c8cb62820764' AND href = $q$/compare/buttercms-vs-contentful$q$);

-- ── ghost vs Substack (ghost-vs-substack) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('079eef6a-7551-42f9-8218-0e4c4e82dc10', '3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$ghost-vs-substack$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '079eef6a-7551-42f9-8218-0e4c4e82dc10', $q$vs Substack$q$, $q$/compare/ghost-vs-substack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '079eef6a-7551-42f9-8218-0e4c4e82dc10'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '079eef6a-7551-42f9-8218-0e4c4e82dc10' AND href = $q$/compare/ghost-vs-substack$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3d9c7050-c8fc-42d3-9a25-ef88330023f2', $q$vs ghost$q$, $q$/compare/ghost-vs-substack$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3d9c7050-c8fc-42d3-9a25-ef88330023f2' AND href = $q$/compare/ghost-vs-substack$q$);

-- ── Missive vs Superhuman (missive-vs-superhuman) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2e0ce45d-dae1-4d7d-8c4b-eae668045f9e', '331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$missive-vs-superhuman$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2e0ce45d-dae1-4d7d-8c4b-eae668045f9e', $q$vs Superhuman$q$, $q$/compare/missive-vs-superhuman$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2e0ce45d-dae1-4d7d-8c4b-eae668045f9e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2e0ce45d-dae1-4d7d-8c4b-eae668045f9e' AND href = $q$/compare/missive-vs-superhuman$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$vs Missive$q$, $q$/compare/missive-vs-superhuman$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad' AND href = $q$/compare/missive-vs-superhuman$q$);

-- ── Spark Mail vs Spike (spark-mail-vs-spike) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$spark-mail-vs-spike$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$vs Spike$q$, $q$/compare/spark-mail-vs-spike$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656' AND href = $q$/compare/spark-mail-vs-spike$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$vs Spark Mail$q$, $q$/compare/spark-mail-vs-spike$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79' AND href = $q$/compare/spark-mail-vs-spike$q$);

-- ── Attio vs Folk (attio-vs-folk) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', '7f48b7ce-b6d6-4a03-9a89-b0fe089765f6', $q$attio-vs-folk$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$vs Folk$q$, $q$/compare/attio-vs-folk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad' AND href = $q$/compare/attio-vs-folk$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7f48b7ce-b6d6-4a03-9a89-b0fe089765f6', $q$vs Attio$q$, $q$/compare/attio-vs-folk$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7f48b7ce-b6d6-4a03-9a89-b0fe089765f6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7f48b7ce-b6d6-4a03-9a89-b0fe089765f6' AND href = $q$/compare/attio-vs-folk$q$);

-- ── NetHunt CRM vs Streak (nethunt-crm-vs-streak) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('aade9c0c-6fb6-412a-9dc0-66e5e626d8a8', 'ec5fff7f-2e72-4779-b7d5-769d8491fa4f', $q$nethunt-crm-vs-streak$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'aade9c0c-6fb6-412a-9dc0-66e5e626d8a8', $q$vs Streak$q$, $q$/compare/nethunt-crm-vs-streak$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'aade9c0c-6fb6-412a-9dc0-66e5e626d8a8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'aade9c0c-6fb6-412a-9dc0-66e5e626d8a8' AND href = $q$/compare/nethunt-crm-vs-streak$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ec5fff7f-2e72-4779-b7d5-769d8491fa4f', $q$vs NetHunt CRM$q$, $q$/compare/nethunt-crm-vs-streak$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ec5fff7f-2e72-4779-b7d5-769d8491fa4f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ec5fff7f-2e72-4779-b7d5-769d8491fa4f' AND href = $q$/compare/nethunt-crm-vs-streak$q$);

-- ── Capsule CRM vs OnePageCRM (capsule-crm-vs-onepagecrm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0cb20c33-a4d5-4832-b97f-e2284e29675a', '7effa4cf-f18e-4d12-bf52-83b570f6c948', $q$capsule-crm-vs-onepagecrm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0cb20c33-a4d5-4832-b97f-e2284e29675a', $q$vs OnePageCRM$q$, $q$/compare/capsule-crm-vs-onepagecrm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0cb20c33-a4d5-4832-b97f-e2284e29675a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0cb20c33-a4d5-4832-b97f-e2284e29675a' AND href = $q$/compare/capsule-crm-vs-onepagecrm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7effa4cf-f18e-4d12-bf52-83b570f6c948', $q$vs Capsule CRM$q$, $q$/compare/capsule-crm-vs-onepagecrm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7effa4cf-f18e-4d12-bf52-83b570f6c948'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7effa4cf-f18e-4d12-bf52-83b570f6c948' AND href = $q$/compare/capsule-crm-vs-onepagecrm$q$);

-- ── Agile CRM vs EngageBay (agile-crm-vs-engagebay) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', '61f5e19c-7e36-43c9-9e96-50d55146d278', $q$agile-crm-vs-engagebay$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$vs EngageBay$q$, $q$/compare/agile-crm-vs-engagebay$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b' AND href = $q$/compare/agile-crm-vs-engagebay$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '61f5e19c-7e36-43c9-9e96-50d55146d278', $q$vs Agile CRM$q$, $q$/compare/agile-crm-vs-engagebay$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '61f5e19c-7e36-43c9-9e96-50d55146d278'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '61f5e19c-7e36-43c9-9e96-50d55146d278' AND href = $q$/compare/agile-crm-vs-engagebay$q$);

-- ── Kommo vs Vtiger (kommo-vs-vtiger) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c5e37344-4c0e-4962-b411-76bbbd950cbd', '298926b4-3ab4-4ee9-ae5b-9ee1b3900150', $q$kommo-vs-vtiger$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c5e37344-4c0e-4962-b411-76bbbd950cbd', $q$vs Vtiger$q$, $q$/compare/kommo-vs-vtiger$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c5e37344-4c0e-4962-b411-76bbbd950cbd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c5e37344-4c0e-4962-b411-76bbbd950cbd' AND href = $q$/compare/kommo-vs-vtiger$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '298926b4-3ab4-4ee9-ae5b-9ee1b3900150', $q$vs Kommo$q$, $q$/compare/kommo-vs-vtiger$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '298926b4-3ab4-4ee9-ae5b-9ee1b3900150'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '298926b4-3ab4-4ee9-ae5b-9ee1b3900150' AND href = $q$/compare/kommo-vs-vtiger$q$);

-- ── noCRM.io vs Pipeline CRM (nocrm-io-vs-pipeline-crm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('90966f6f-0569-4df9-9b4b-7d8285e5e30f', 'd2ab1000-e26f-4d01-88d3-85475427db72', $q$nocrm-io-vs-pipeline-crm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '90966f6f-0569-4df9-9b4b-7d8285e5e30f', $q$vs Pipeline CRM$q$, $q$/compare/nocrm-io-vs-pipeline-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '90966f6f-0569-4df9-9b4b-7d8285e5e30f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '90966f6f-0569-4df9-9b4b-7d8285e5e30f' AND href = $q$/compare/nocrm-io-vs-pipeline-crm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd2ab1000-e26f-4d01-88d3-85475427db72', $q$vs noCRM.io$q$, $q$/compare/nocrm-io-vs-pipeline-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd2ab1000-e26f-4d01-88d3-85475427db72'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd2ab1000-e26f-4d01-88d3-85475427db72' AND href = $q$/compare/nocrm-io-vs-pipeline-crm$q$);

-- ── Salesmate vs Teamgate (salesmate-vs-teamgate) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7986cf0f-17ab-4528-acea-8231ffbd3ebc', '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$salesmate-vs-teamgate$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7986cf0f-17ab-4528-acea-8231ffbd3ebc', $q$vs Teamgate$q$, $q$/compare/salesmate-vs-teamgate$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7986cf0f-17ab-4528-acea-8231ffbd3ebc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7986cf0f-17ab-4528-acea-8231ffbd3ebc' AND href = $q$/compare/salesmate-vs-teamgate$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$vs Salesmate$q$, $q$/compare/salesmate-vs-teamgate$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed' AND href = $q$/compare/salesmate-vs-teamgate$q$);

-- ── Attio vs Twenty (attio-vs-twenty) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', 'c6ed054f-8434-4025-8ef7-01e474837fea', $q$attio-vs-twenty$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$vs Twenty$q$, $q$/compare/attio-vs-twenty$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad' AND href = $q$/compare/attio-vs-twenty$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6ed054f-8434-4025-8ef7-01e474837fea', $q$vs Attio$q$, $q$/compare/attio-vs-twenty$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6ed054f-8434-4025-8ef7-01e474837fea'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6ed054f-8434-4025-8ef7-01e474837fea' AND href = $q$/compare/attio-vs-twenty$q$);

-- ── Chatwoot vs Richpanel (chatwoot-vs-richpanel) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', 'f232ed0f-8c1a-4fee-9d5d-b7fe5094bbbb', $q$chatwoot-vs-richpanel$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5', $q$vs Richpanel$q$, $q$/compare/chatwoot-vs-richpanel$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9ad8bc1c-c10b-4211-beda-5bbb3cbedea5' AND href = $q$/compare/chatwoot-vs-richpanel$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f232ed0f-8c1a-4fee-9d5d-b7fe5094bbbb', $q$vs Chatwoot$q$, $q$/compare/chatwoot-vs-richpanel$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f232ed0f-8c1a-4fee-9d5d-b7fe5094bbbb'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f232ed0f-8c1a-4fee-9d5d-b7fe5094bbbb' AND href = $q$/compare/chatwoot-vs-richpanel$q$);

-- ── Dixa vs Gladly (dixa-vs-gladly) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8a056723-ee4b-46ab-988f-3d80d7a96c4e', 'd4ff1377-e0f5-4af0-9e80-71487c351c04', $q$dixa-vs-gladly$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8a056723-ee4b-46ab-988f-3d80d7a96c4e', $q$vs Gladly$q$, $q$/compare/dixa-vs-gladly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8a056723-ee4b-46ab-988f-3d80d7a96c4e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8a056723-ee4b-46ab-988f-3d80d7a96c4e' AND href = $q$/compare/dixa-vs-gladly$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd4ff1377-e0f5-4af0-9e80-71487c351c04', $q$vs Dixa$q$, $q$/compare/dixa-vs-gladly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd4ff1377-e0f5-4af0-9e80-71487c351c04'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd4ff1377-e0f5-4af0-9e80-71487c351c04' AND href = $q$/compare/dixa-vs-gladly$q$);

-- ── Hiver vs Re:amaze (hiver-vs-re-amaze) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', '7a3094cf-a8e5-4f7e-b9ed-7fe69416116b', $q$hiver-vs-re-amaze$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'badfcb90-2ef7-4fee-a3ed-8a5021afbe5f', $q$vs Re:amaze$q$, $q$/compare/hiver-vs-re-amaze$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'badfcb90-2ef7-4fee-a3ed-8a5021afbe5f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'badfcb90-2ef7-4fee-a3ed-8a5021afbe5f' AND href = $q$/compare/hiver-vs-re-amaze$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7a3094cf-a8e5-4f7e-b9ed-7fe69416116b', $q$vs Hiver$q$, $q$/compare/hiver-vs-re-amaze$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7a3094cf-a8e5-4f7e-b9ed-7fe69416116b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7a3094cf-a8e5-4f7e-b9ed-7fe69416116b' AND href = $q$/compare/hiver-vs-re-amaze$q$);

-- ── Respond.io vs Trengo (respond-io-vs-trengo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', '463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$respond-io-vs-trengo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae', $q$vs Trengo$q$, $q$/compare/respond-io-vs-trengo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5ba6eb3b-9e95-46c8-907b-8f15ea5b72ae' AND href = $q$/compare/respond-io-vs-trengo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '463b249f-58f5-4f62-8f21-0f807fd8bd65', $q$vs Respond.io$q$, $q$/compare/respond-io-vs-trengo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '463b249f-58f5-4f62-8f21-0f807fd8bd65'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '463b249f-58f5-4f62-8f21-0f807fd8bd65' AND href = $q$/compare/respond-io-vs-trengo$q$);

-- ── SleekFlow vs WATI (sleekflow-vs-wati) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', '6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$sleekflow-vs-wati$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7', $q$vs WATI$q$, $q$/compare/sleekflow-vs-wati$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7cc297d5-05a0-4d0f-ac57-cc8a0fcf00f7' AND href = $q$/compare/sleekflow-vs-wati$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '6defa3eb-e961-45d0-b2f3-df7356237cfc', $q$vs SleekFlow$q$, $q$/compare/sleekflow-vs-wati$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '6defa3eb-e961-45d0-b2f3-df7356237cfc'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '6defa3eb-e961-45d0-b2f3-df7356237cfc' AND href = $q$/compare/sleekflow-vs-wati$q$);

-- ── DelightChat vs Interakt (delightchat-vs-interakt) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', '993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$delightchat-vs-interakt$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0', $q$vs Interakt$q$, $q$/compare/delightchat-vs-interakt$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c3f9f0e9-8131-4e11-ac4b-7ce69fe029a0' AND href = $q$/compare/delightchat-vs-interakt$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '993a2b5b-ee72-498b-b5f1-82135cc21b11', $q$vs DelightChat$q$, $q$/compare/delightchat-vs-interakt$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '993a2b5b-ee72-498b-b5f1-82135cc21b11'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '993a2b5b-ee72-498b-b5f1-82135cc21b11' AND href = $q$/compare/delightchat-vs-interakt$q$);

-- ── Pinecone vs Weaviate (pinecone-vs-weaviate) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8d37dae4-b21a-4385-9295-c71506f8ef9c', '54fd0b15-5a7f-4cba-b221-60d8ab928a87', $q$pinecone-vs-weaviate$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8d37dae4-b21a-4385-9295-c71506f8ef9c', $q$vs Weaviate$q$, $q$/compare/pinecone-vs-weaviate$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8d37dae4-b21a-4385-9295-c71506f8ef9c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8d37dae4-b21a-4385-9295-c71506f8ef9c' AND href = $q$/compare/pinecone-vs-weaviate$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '54fd0b15-5a7f-4cba-b221-60d8ab928a87', $q$vs Pinecone$q$, $q$/compare/pinecone-vs-weaviate$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '54fd0b15-5a7f-4cba-b221-60d8ab928a87'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '54fd0b15-5a7f-4cba-b221-60d8ab928a87' AND href = $q$/compare/pinecone-vs-weaviate$q$);

-- ── Milvus vs Qdrant (milvus-vs-qdrant) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f8173937-6906-403b-af26-bf7290c0ba12', '276ddeaa-f3f4-4e0c-bba8-924413dbf6cd', $q$milvus-vs-qdrant$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f8173937-6906-403b-af26-bf7290c0ba12', $q$vs Qdrant$q$, $q$/compare/milvus-vs-qdrant$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f8173937-6906-403b-af26-bf7290c0ba12'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f8173937-6906-403b-af26-bf7290c0ba12' AND href = $q$/compare/milvus-vs-qdrant$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '276ddeaa-f3f4-4e0c-bba8-924413dbf6cd', $q$vs Milvus$q$, $q$/compare/milvus-vs-qdrant$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '276ddeaa-f3f4-4e0c-bba8-924413dbf6cd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '276ddeaa-f3f4-4e0c-bba8-924413dbf6cd' AND href = $q$/compare/milvus-vs-qdrant$q$);


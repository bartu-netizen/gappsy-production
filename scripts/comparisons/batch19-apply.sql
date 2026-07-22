-- Comparison batch: qualtrics-vs-questionpro, usertesting-vs-userzoom, maze-vs-usertesting, goto-meeting-vs-zoom, whereby-vs-zoom, goto-meeting-vs-ringcentral-video, framer-vs-webflow, squarespace-vs-wix
-- Publishes 8 comparison page(s) with editorial content.

-- ── Qualtrics vs QuestionPro (qualtrics-vs-questionpro) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3b111844-9cfa-4a96-813d-555779600f9d', '8654c2ee-c1a5-4a9e-82aa-9243994e337c', $q$qualtrics-vs-questionpro$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3b111844-9cfa-4a96-813d-555779600f9d', $q$vs QuestionPro$q$, $q$/compare/qualtrics-vs-questionpro$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3b111844-9cfa-4a96-813d-555779600f9d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3b111844-9cfa-4a96-813d-555779600f9d' AND href = $q$/compare/qualtrics-vs-questionpro$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8654c2ee-c1a5-4a9e-82aa-9243994e337c', $q$vs Qualtrics$q$, $q$/compare/qualtrics-vs-questionpro$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8654c2ee-c1a5-4a9e-82aa-9243994e337c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8654c2ee-c1a5-4a9e-82aa-9243994e337c' AND href = $q$/compare/qualtrics-vs-questionpro$q$);

-- ── UserTesting vs UserZoom (usertesting-vs-userzoom) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', 'c692a937-f3e2-45ab-ad20-28a30d805a63', $q$usertesting-vs-userzoom$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0be53b91-2c15-470e-a5f9-076a0d58497b', $q$vs UserZoom$q$, $q$/compare/usertesting-vs-userzoom$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b' AND href = $q$/compare/usertesting-vs-userzoom$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c692a937-f3e2-45ab-ad20-28a30d805a63', $q$vs UserTesting$q$, $q$/compare/usertesting-vs-userzoom$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63' AND href = $q$/compare/usertesting-vs-userzoom$q$);

-- ── Maze vs UserTesting (maze-vs-usertesting) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f57787ac-8e11-4769-9b64-15fa4453a73c', '0be53b91-2c15-470e-a5f9-076a0d58497b', $q$maze-vs-usertesting$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f57787ac-8e11-4769-9b64-15fa4453a73c', $q$vs UserTesting$q$, $q$/compare/maze-vs-usertesting$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f57787ac-8e11-4769-9b64-15fa4453a73c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f57787ac-8e11-4769-9b64-15fa4453a73c' AND href = $q$/compare/maze-vs-usertesting$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0be53b91-2c15-470e-a5f9-076a0d58497b', $q$vs Maze$q$, $q$/compare/maze-vs-usertesting$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b' AND href = $q$/compare/maze-vs-usertesting$q$);

-- ── GoTo Meeting vs Zoom (goto-meeting-vs-zoom) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c6868389-8d0e-4fab-b74c-b58f1badba46', 'f4a6f61d-c3a3-4ca6-b4af-abc327e0f762', $q$goto-meeting-vs-zoom$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6868389-8d0e-4fab-b74c-b58f1badba46', $q$vs Zoom$q$, $q$/compare/goto-meeting-vs-zoom$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6868389-8d0e-4fab-b74c-b58f1badba46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6868389-8d0e-4fab-b74c-b58f1badba46' AND href = $q$/compare/goto-meeting-vs-zoom$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f4a6f61d-c3a3-4ca6-b4af-abc327e0f762', $q$vs GoTo Meeting$q$, $q$/compare/goto-meeting-vs-zoom$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f4a6f61d-c3a3-4ca6-b4af-abc327e0f762'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f4a6f61d-c3a3-4ca6-b4af-abc327e0f762' AND href = $q$/compare/goto-meeting-vs-zoom$q$);

-- ── Whereby vs Zoom (whereby-vs-zoom) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5a9eace0-9ae6-46ca-a41f-e970f5f11aea', 'f4a6f61d-c3a3-4ca6-b4af-abc327e0f762', $q$whereby-vs-zoom$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5a9eace0-9ae6-46ca-a41f-e970f5f11aea', $q$vs Zoom$q$, $q$/compare/whereby-vs-zoom$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5a9eace0-9ae6-46ca-a41f-e970f5f11aea'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5a9eace0-9ae6-46ca-a41f-e970f5f11aea' AND href = $q$/compare/whereby-vs-zoom$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f4a6f61d-c3a3-4ca6-b4af-abc327e0f762', $q$vs Whereby$q$, $q$/compare/whereby-vs-zoom$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f4a6f61d-c3a3-4ca6-b4af-abc327e0f762'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f4a6f61d-c3a3-4ca6-b4af-abc327e0f762' AND href = $q$/compare/whereby-vs-zoom$q$);

-- ── GoTo Meeting vs RingCentral Video (goto-meeting-vs-ringcentral-video) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c6868389-8d0e-4fab-b74c-b58f1badba46', '88db22aa-79b8-45ed-b2f4-437c05395830', $q$goto-meeting-vs-ringcentral-video$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c6868389-8d0e-4fab-b74c-b58f1badba46', $q$vs RingCentral Video$q$, $q$/compare/goto-meeting-vs-ringcentral-video$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c6868389-8d0e-4fab-b74c-b58f1badba46'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c6868389-8d0e-4fab-b74c-b58f1badba46' AND href = $q$/compare/goto-meeting-vs-ringcentral-video$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '88db22aa-79b8-45ed-b2f4-437c05395830', $q$vs GoTo Meeting$q$, $q$/compare/goto-meeting-vs-ringcentral-video$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '88db22aa-79b8-45ed-b2f4-437c05395830'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '88db22aa-79b8-45ed-b2f4-437c05395830' AND href = $q$/compare/goto-meeting-vs-ringcentral-video$q$);

-- ── Framer vs Webflow (framer-vs-webflow) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('0eb2413c-7ff7-4575-ac2b-3bd288d5a1e3', '33552c2c-cd73-4391-9fd5-c7a4f0df8e9e', $q$framer-vs-webflow$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '0eb2413c-7ff7-4575-ac2b-3bd288d5a1e3', $q$vs Webflow$q$, $q$/compare/framer-vs-webflow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '0eb2413c-7ff7-4575-ac2b-3bd288d5a1e3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '0eb2413c-7ff7-4575-ac2b-3bd288d5a1e3' AND href = $q$/compare/framer-vs-webflow$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '33552c2c-cd73-4391-9fd5-c7a4f0df8e9e', $q$vs Framer$q$, $q$/compare/framer-vs-webflow$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '33552c2c-cd73-4391-9fd5-c7a4f0df8e9e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '33552c2c-cd73-4391-9fd5-c7a4f0df8e9e' AND href = $q$/compare/framer-vs-webflow$q$);

-- ── Squarespace vs Wix (squarespace-vs-wix) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', '2a6940b9-4b57-4612-8541-84535793b340', $q$squarespace-vs-wix$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$vs Wix$q$, $q$/compare/squarespace-vs-wix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0' AND href = $q$/compare/squarespace-vs-wix$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2a6940b9-4b57-4612-8541-84535793b340', $q$vs Squarespace$q$, $q$/compare/squarespace-vs-wix$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2a6940b9-4b57-4612-8541-84535793b340'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2a6940b9-4b57-4612-8541-84535793b340' AND href = $q$/compare/squarespace-vs-wix$q$);


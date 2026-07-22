-- Comparison batch: ukg-pro-vs-workday, clio-vs-mycase, clio-vs-practicepanther, clio-vs-smokeball, adalo-vs-bubble, appsmith-vs-retool, bubble-vs-softr, blackboard-learn-vs-canvas-lms
-- Publishes 8 comparison page(s) with editorial content.

-- ── UKG Pro vs Workday (ukg-pro-vs-workday) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('263195a9-55ed-4e99-acf2-d53db84ad056', '8b71f7fc-c26a-419f-a1fe-0de98471da7f', $q$ukg-pro-vs-workday$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '263195a9-55ed-4e99-acf2-d53db84ad056', $q$vs Workday$q$, $q$/compare/ukg-pro-vs-workday$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '263195a9-55ed-4e99-acf2-d53db84ad056'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '263195a9-55ed-4e99-acf2-d53db84ad056' AND href = $q$/compare/ukg-pro-vs-workday$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8b71f7fc-c26a-419f-a1fe-0de98471da7f', $q$vs UKG Pro$q$, $q$/compare/ukg-pro-vs-workday$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8b71f7fc-c26a-419f-a1fe-0de98471da7f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8b71f7fc-c26a-419f-a1fe-0de98471da7f' AND href = $q$/compare/ukg-pro-vs-workday$q$);

-- ── Clio vs MyCase (clio-vs-mycase) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4a9597db-c7eb-4543-a969-70c7a5b25c4e', 'b4459135-cfd3-4027-bdc1-046357985283', $q$clio-vs-mycase$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4a9597db-c7eb-4543-a969-70c7a5b25c4e', $q$vs MyCase$q$, $q$/compare/clio-vs-mycase$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e' AND href = $q$/compare/clio-vs-mycase$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b4459135-cfd3-4027-bdc1-046357985283', $q$vs Clio$q$, $q$/compare/clio-vs-mycase$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b4459135-cfd3-4027-bdc1-046357985283'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b4459135-cfd3-4027-bdc1-046357985283' AND href = $q$/compare/clio-vs-mycase$q$);

-- ── Clio vs PracticePanther (clio-vs-practicepanther) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4a9597db-c7eb-4543-a969-70c7a5b25c4e', '278217f3-1beb-4f01-8213-5430c71d5245', $q$clio-vs-practicepanther$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4a9597db-c7eb-4543-a969-70c7a5b25c4e', $q$vs PracticePanther$q$, $q$/compare/clio-vs-practicepanther$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e' AND href = $q$/compare/clio-vs-practicepanther$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '278217f3-1beb-4f01-8213-5430c71d5245', $q$vs Clio$q$, $q$/compare/clio-vs-practicepanther$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '278217f3-1beb-4f01-8213-5430c71d5245'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '278217f3-1beb-4f01-8213-5430c71d5245' AND href = $q$/compare/clio-vs-practicepanther$q$);

-- ── Clio vs Smokeball (clio-vs-smokeball) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4a9597db-c7eb-4543-a969-70c7a5b25c4e', '41637f09-c19d-4491-9683-03950483e648', $q$clio-vs-smokeball$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4a9597db-c7eb-4543-a969-70c7a5b25c4e', $q$vs Smokeball$q$, $q$/compare/clio-vs-smokeball$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e' AND href = $q$/compare/clio-vs-smokeball$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '41637f09-c19d-4491-9683-03950483e648', $q$vs Clio$q$, $q$/compare/clio-vs-smokeball$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '41637f09-c19d-4491-9683-03950483e648'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '41637f09-c19d-4491-9683-03950483e648' AND href = $q$/compare/clio-vs-smokeball$q$);

-- ── Adalo vs Bubble (adalo-vs-bubble) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', 'cdbd18ff-a281-4cb1-87dc-90ab666683fe', $q$adalo-vs-bubble$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$vs Bubble$q$, $q$/compare/adalo-vs-bubble$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91' AND href = $q$/compare/adalo-vs-bubble$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cdbd18ff-a281-4cb1-87dc-90ab666683fe', $q$vs Adalo$q$, $q$/compare/adalo-vs-bubble$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cdbd18ff-a281-4cb1-87dc-90ab666683fe'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cdbd18ff-a281-4cb1-87dc-90ab666683fe' AND href = $q$/compare/adalo-vs-bubble$q$);

-- ── Appsmith vs Retool (appsmith-vs-retool) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', '395c608c-5d39-431e-9dd4-670981dd1352', $q$appsmith-vs-retool$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$vs Retool$q$, $q$/compare/appsmith-vs-retool$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a' AND href = $q$/compare/appsmith-vs-retool$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '395c608c-5d39-431e-9dd4-670981dd1352', $q$vs Appsmith$q$, $q$/compare/appsmith-vs-retool$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '395c608c-5d39-431e-9dd4-670981dd1352'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '395c608c-5d39-431e-9dd4-670981dd1352' AND href = $q$/compare/appsmith-vs-retool$q$);

-- ── Bubble vs Softr (bubble-vs-softr) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('cdbd18ff-a281-4cb1-87dc-90ab666683fe', '3c1c11fd-4faf-4d6c-8f2f-a21304ececf9', $q$bubble-vs-softr$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'cdbd18ff-a281-4cb1-87dc-90ab666683fe', $q$vs Softr$q$, $q$/compare/bubble-vs-softr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'cdbd18ff-a281-4cb1-87dc-90ab666683fe'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'cdbd18ff-a281-4cb1-87dc-90ab666683fe' AND href = $q$/compare/bubble-vs-softr$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c1c11fd-4faf-4d6c-8f2f-a21304ececf9', $q$vs Bubble$q$, $q$/compare/bubble-vs-softr$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c1c11fd-4faf-4d6c-8f2f-a21304ececf9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c1c11fd-4faf-4d6c-8f2f-a21304ececf9' AND href = $q$/compare/bubble-vs-softr$q$);

-- ── Blackboard Learn vs Canvas LMS (blackboard-learn-vs-canvas-lms) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5f612c37-64e2-4aeb-a2a0-9b6d63df09b4', '2db842ea-f8cf-4398-9294-2de09ec16c62', $q$blackboard-learn-vs-canvas-lms$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5f612c37-64e2-4aeb-a2a0-9b6d63df09b4', $q$vs Canvas LMS$q$, $q$/compare/blackboard-learn-vs-canvas-lms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5f612c37-64e2-4aeb-a2a0-9b6d63df09b4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5f612c37-64e2-4aeb-a2a0-9b6d63df09b4' AND href = $q$/compare/blackboard-learn-vs-canvas-lms$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2db842ea-f8cf-4398-9294-2de09ec16c62', $q$vs Blackboard Learn$q$, $q$/compare/blackboard-learn-vs-canvas-lms$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2db842ea-f8cf-4398-9294-2de09ec16c62'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2db842ea-f8cf-4398-9294-2de09ec16c62' AND href = $q$/compare/blackboard-learn-vs-canvas-lms$q$);


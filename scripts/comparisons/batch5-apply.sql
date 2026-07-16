-- Comparison batch: aircall-vs-openphone, hubspot-crm-vs-salesforce, hubspot-crm-vs-pipedrive, salesforce-vs-zoho-crm, pipedrive-vs-zoho-crm, surveymonkey-vs-typeform, instapage-vs-unbounce, clickfunnels-vs-unbounce
-- Publishes 8 comparison page(s) with editorial content.

-- ── Aircall vs OpenPhone (aircall-vs-openphone) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', '552f84ed-11c6-440a-83d9-7d6762dc0517', $q$aircall-vs-openphone$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$vs OpenPhone$q$, $q$/compare/aircall-vs-openphone$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193' AND href = $q$/compare/aircall-vs-openphone$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '552f84ed-11c6-440a-83d9-7d6762dc0517', $q$vs Aircall$q$, $q$/compare/aircall-vs-openphone$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '552f84ed-11c6-440a-83d9-7d6762dc0517'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '552f84ed-11c6-440a-83d9-7d6762dc0517' AND href = $q$/compare/aircall-vs-openphone$q$);

-- ── HubSpot CRM vs Salesforce (hubspot-crm-vs-salesforce) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ef29f747-f15c-4d08-991c-1e5c8ee38641', 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3', $q$hubspot-crm-vs-salesforce$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ef29f747-f15c-4d08-991c-1e5c8ee38641', $q$vs Salesforce$q$, $q$/compare/hubspot-crm-vs-salesforce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ef29f747-f15c-4d08-991c-1e5c8ee38641'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ef29f747-f15c-4d08-991c-1e5c8ee38641' AND href = $q$/compare/hubspot-crm-vs-salesforce$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3', $q$vs HubSpot CRM$q$, $q$/compare/hubspot-crm-vs-salesforce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3' AND href = $q$/compare/hubspot-crm-vs-salesforce$q$);

-- ── HubSpot CRM vs Pipedrive (hubspot-crm-vs-pipedrive) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ef29f747-f15c-4d08-991c-1e5c8ee38641', 'e9f9ecc1-a538-4c7f-b987-67a12f749876', $q$hubspot-crm-vs-pipedrive$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ef29f747-f15c-4d08-991c-1e5c8ee38641', $q$vs Pipedrive$q$, $q$/compare/hubspot-crm-vs-pipedrive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ef29f747-f15c-4d08-991c-1e5c8ee38641'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ef29f747-f15c-4d08-991c-1e5c8ee38641' AND href = $q$/compare/hubspot-crm-vs-pipedrive$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e9f9ecc1-a538-4c7f-b987-67a12f749876', $q$vs HubSpot CRM$q$, $q$/compare/hubspot-crm-vs-pipedrive$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e9f9ecc1-a538-4c7f-b987-67a12f749876'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e9f9ecc1-a538-4c7f-b987-67a12f749876' AND href = $q$/compare/hubspot-crm-vs-pipedrive$q$);

-- ── Salesforce vs Zoho CRM (salesforce-vs-zoho-crm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d43ee8f4-1247-4fdd-8035-fef66e1db0b3', 'ca9138f2-35fd-49cf-8af2-819fa2691854', $q$salesforce-vs-zoho-crm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3', $q$vs Zoho CRM$q$, $q$/compare/salesforce-vs-zoho-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd43ee8f4-1247-4fdd-8035-fef66e1db0b3' AND href = $q$/compare/salesforce-vs-zoho-crm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ca9138f2-35fd-49cf-8af2-819fa2691854', $q$vs Salesforce$q$, $q$/compare/salesforce-vs-zoho-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ca9138f2-35fd-49cf-8af2-819fa2691854'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ca9138f2-35fd-49cf-8af2-819fa2691854' AND href = $q$/compare/salesforce-vs-zoho-crm$q$);

-- ── Pipedrive vs Zoho CRM (pipedrive-vs-zoho-crm) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e9f9ecc1-a538-4c7f-b987-67a12f749876', 'ca9138f2-35fd-49cf-8af2-819fa2691854', $q$pipedrive-vs-zoho-crm$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e9f9ecc1-a538-4c7f-b987-67a12f749876', $q$vs Zoho CRM$q$, $q$/compare/pipedrive-vs-zoho-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e9f9ecc1-a538-4c7f-b987-67a12f749876'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e9f9ecc1-a538-4c7f-b987-67a12f749876' AND href = $q$/compare/pipedrive-vs-zoho-crm$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ca9138f2-35fd-49cf-8af2-819fa2691854', $q$vs Pipedrive$q$, $q$/compare/pipedrive-vs-zoho-crm$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ca9138f2-35fd-49cf-8af2-819fa2691854'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ca9138f2-35fd-49cf-8af2-819fa2691854' AND href = $q$/compare/pipedrive-vs-zoho-crm$q$);

-- ── SurveyMonkey vs Typeform (surveymonkey-vs-typeform) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', 'bb9a5203-561f-405b-883a-bf1a1d13b0fd', $q$surveymonkey-vs-typeform$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$vs Typeform$q$, $q$/compare/surveymonkey-vs-typeform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '72810eb6-a04e-4d9e-be96-c79ff510a26e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '72810eb6-a04e-4d9e-be96-c79ff510a26e' AND href = $q$/compare/surveymonkey-vs-typeform$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bb9a5203-561f-405b-883a-bf1a1d13b0fd', $q$vs SurveyMonkey$q$, $q$/compare/surveymonkey-vs-typeform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bb9a5203-561f-405b-883a-bf1a1d13b0fd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bb9a5203-561f-405b-883a-bf1a1d13b0fd' AND href = $q$/compare/surveymonkey-vs-typeform$q$);

-- ── Instapage vs Unbounce (instapage-vs-unbounce) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('45bcdd12-fc73-4e69-a6ec-4961fd076322', 'a3310151-7d88-4c23-b959-1faaa5132f8d', $q$instapage-vs-unbounce$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '45bcdd12-fc73-4e69-a6ec-4961fd076322', $q$vs Unbounce$q$, $q$/compare/instapage-vs-unbounce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '45bcdd12-fc73-4e69-a6ec-4961fd076322'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '45bcdd12-fc73-4e69-a6ec-4961fd076322' AND href = $q$/compare/instapage-vs-unbounce$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a3310151-7d88-4c23-b959-1faaa5132f8d', $q$vs Instapage$q$, $q$/compare/instapage-vs-unbounce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a3310151-7d88-4c23-b959-1faaa5132f8d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a3310151-7d88-4c23-b959-1faaa5132f8d' AND href = $q$/compare/instapage-vs-unbounce$q$);

-- ── ClickFunnels vs Unbounce (clickfunnels-vs-unbounce) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('844e3580-b2a6-44af-ab86-815377448e1a', 'a3310151-7d88-4c23-b959-1faaa5132f8d', $q$clickfunnels-vs-unbounce$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '844e3580-b2a6-44af-ab86-815377448e1a', $q$vs Unbounce$q$, $q$/compare/clickfunnels-vs-unbounce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '844e3580-b2a6-44af-ab86-815377448e1a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '844e3580-b2a6-44af-ab86-815377448e1a' AND href = $q$/compare/clickfunnels-vs-unbounce$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a3310151-7d88-4c23-b959-1faaa5132f8d', $q$vs ClickFunnels$q$, $q$/compare/clickfunnels-vs-unbounce$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a3310151-7d88-4c23-b959-1faaa5132f8d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a3310151-7d88-4c23-b959-1faaa5132f8d' AND href = $q$/compare/clickfunnels-vs-unbounce$q$);


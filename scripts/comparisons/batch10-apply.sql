-- Comparison batch: activecampaign-vs-mailchimp, constant-contact-vs-mailchimp, google-forms-vs-jotform, tally-vs-typeform, jotform-vs-wufoo, deel-vs-remote, bamboohr-vs-rippling, adp-workforce-now-vs-paychex-flex
-- Publishes 8 comparison page(s) with editorial content.

-- ── ActiveCampaign vs Mailchimp (activecampaign-vs-mailchimp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', '453ae436-57ca-4b8a-8abd-3f36dcefa927', $q$activecampaign-vs-mailchimp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$vs Mailchimp$q$, $q$/compare/activecampaign-vs-mailchimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b268513b-5d42-4fff-badc-9c4bb25ce66b' AND href = $q$/compare/activecampaign-vs-mailchimp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '453ae436-57ca-4b8a-8abd-3f36dcefa927', $q$vs ActiveCampaign$q$, $q$/compare/activecampaign-vs-mailchimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '453ae436-57ca-4b8a-8abd-3f36dcefa927'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '453ae436-57ca-4b8a-8abd-3f36dcefa927' AND href = $q$/compare/activecampaign-vs-mailchimp$q$);

-- ── Constant Contact vs Mailchimp (constant-contact-vs-mailchimp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d46e98c7-b182-4988-9c3a-b509b0e2beff', '453ae436-57ca-4b8a-8abd-3f36dcefa927', $q$constant-contact-vs-mailchimp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd46e98c7-b182-4988-9c3a-b509b0e2beff', $q$vs Mailchimp$q$, $q$/compare/constant-contact-vs-mailchimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd46e98c7-b182-4988-9c3a-b509b0e2beff'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd46e98c7-b182-4988-9c3a-b509b0e2beff' AND href = $q$/compare/constant-contact-vs-mailchimp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '453ae436-57ca-4b8a-8abd-3f36dcefa927', $q$vs Constant Contact$q$, $q$/compare/constant-contact-vs-mailchimp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '453ae436-57ca-4b8a-8abd-3f36dcefa927'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '453ae436-57ca-4b8a-8abd-3f36dcefa927' AND href = $q$/compare/constant-contact-vs-mailchimp$q$);

-- ── Google Forms vs Jotform (google-forms-vs-jotform) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('db6b7ee1-78f4-46e7-8173-0f395de936ba', 'bd5a4743-03ea-4f41-9507-17a3a9f17894', $q$google-forms-vs-jotform$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db6b7ee1-78f4-46e7-8173-0f395de936ba', $q$vs Jotform$q$, $q$/compare/google-forms-vs-jotform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db6b7ee1-78f4-46e7-8173-0f395de936ba'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db6b7ee1-78f4-46e7-8173-0f395de936ba' AND href = $q$/compare/google-forms-vs-jotform$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bd5a4743-03ea-4f41-9507-17a3a9f17894', $q$vs Google Forms$q$, $q$/compare/google-forms-vs-jotform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bd5a4743-03ea-4f41-9507-17a3a9f17894'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bd5a4743-03ea-4f41-9507-17a3a9f17894' AND href = $q$/compare/google-forms-vs-jotform$q$);

-- ── Tally vs Typeform (tally-vs-typeform) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('65992870-15b8-4319-a2e6-b0c8037a92bf', 'bb9a5203-561f-405b-883a-bf1a1d13b0fd', $q$tally-vs-typeform$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '65992870-15b8-4319-a2e6-b0c8037a92bf', $q$vs Typeform$q$, $q$/compare/tally-vs-typeform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '65992870-15b8-4319-a2e6-b0c8037a92bf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '65992870-15b8-4319-a2e6-b0c8037a92bf' AND href = $q$/compare/tally-vs-typeform$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bb9a5203-561f-405b-883a-bf1a1d13b0fd', $q$vs Tally$q$, $q$/compare/tally-vs-typeform$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bb9a5203-561f-405b-883a-bf1a1d13b0fd'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bb9a5203-561f-405b-883a-bf1a1d13b0fd' AND href = $q$/compare/tally-vs-typeform$q$);

-- ── Jotform vs Wufoo (jotform-vs-wufoo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('bd5a4743-03ea-4f41-9507-17a3a9f17894', '106def15-bc26-47dd-b9c7-dbb691ff1a8c', $q$jotform-vs-wufoo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bd5a4743-03ea-4f41-9507-17a3a9f17894', $q$vs Wufoo$q$, $q$/compare/jotform-vs-wufoo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bd5a4743-03ea-4f41-9507-17a3a9f17894'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bd5a4743-03ea-4f41-9507-17a3a9f17894' AND href = $q$/compare/jotform-vs-wufoo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '106def15-bc26-47dd-b9c7-dbb691ff1a8c', $q$vs Jotform$q$, $q$/compare/jotform-vs-wufoo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '106def15-bc26-47dd-b9c7-dbb691ff1a8c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '106def15-bc26-47dd-b9c7-dbb691ff1a8c' AND href = $q$/compare/jotform-vs-wufoo$q$);

-- ── Deel vs Remote (deel-vs-remote) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('8ba3ae79-2d46-4049-881a-4cf6417f0f42', 'ad16437d-1117-4ccd-976f-2e70d7ae268c', $q$deel-vs-remote$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '8ba3ae79-2d46-4049-881a-4cf6417f0f42', $q$vs Remote$q$, $q$/compare/deel-vs-remote$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '8ba3ae79-2d46-4049-881a-4cf6417f0f42'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '8ba3ae79-2d46-4049-881a-4cf6417f0f42' AND href = $q$/compare/deel-vs-remote$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ad16437d-1117-4ccd-976f-2e70d7ae268c', $q$vs Deel$q$, $q$/compare/deel-vs-remote$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ad16437d-1117-4ccd-976f-2e70d7ae268c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ad16437d-1117-4ccd-976f-2e70d7ae268c' AND href = $q$/compare/deel-vs-remote$q$);

-- ── BambooHR vs Rippling (bamboohr-vs-rippling) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', '7f58ae22-1c44-4f9a-9b61-75861272aaaa', $q$bamboohr-vs-rippling$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'adb39746-99f6-497c-bc76-0bb5b5de259e', $q$vs Rippling$q$, $q$/compare/bamboohr-vs-rippling$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'adb39746-99f6-497c-bc76-0bb5b5de259e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'adb39746-99f6-497c-bc76-0bb5b5de259e' AND href = $q$/compare/bamboohr-vs-rippling$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7f58ae22-1c44-4f9a-9b61-75861272aaaa', $q$vs BambooHR$q$, $q$/compare/bamboohr-vs-rippling$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7f58ae22-1c44-4f9a-9b61-75861272aaaa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7f58ae22-1c44-4f9a-9b61-75861272aaaa' AND href = $q$/compare/bamboohr-vs-rippling$q$);

-- ── ADP Workforce Now vs Paychex Flex (adp-workforce-now-vs-paychex-flex) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', '2f5ec638-3b36-43dd-9893-d9d2465f2931', $q$adp-workforce-now-vs-paychex-flex$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$vs Paychex Flex$q$, $q$/compare/adp-workforce-now-vs-paychex-flex$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531' AND href = $q$/compare/adp-workforce-now-vs-paychex-flex$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2f5ec638-3b36-43dd-9893-d9d2465f2931', $q$vs ADP Workforce Now$q$, $q$/compare/adp-workforce-now-vs-paychex-flex$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2f5ec638-3b36-43dd-9893-d9d2465f2931'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2f5ec638-3b36-43dd-9893-d9d2465f2931' AND href = $q$/compare/adp-workforce-now-vs-paychex-flex$q$);


-- Comparison batch: canvas-lms-vs-moodle, coursera-vs-udemy, skillshare-vs-udemy, paypal-vs-stripe, square-vs-stripe, brex-vs-ramp, chargebee-vs-recurly, revolut-business-vs-wise-business
-- Publishes 8 comparison page(s) with editorial content.

-- ── Canvas LMS vs Moodle (canvas-lms-vs-moodle) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('2db842ea-f8cf-4398-9294-2de09ec16c62', 'da3ec484-b729-46bf-a035-975b4975e2d9', $q$canvas-lms-vs-moodle$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2db842ea-f8cf-4398-9294-2de09ec16c62', $q$vs Moodle$q$, $q$/compare/canvas-lms-vs-moodle$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2db842ea-f8cf-4398-9294-2de09ec16c62'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2db842ea-f8cf-4398-9294-2de09ec16c62' AND href = $q$/compare/canvas-lms-vs-moodle$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'da3ec484-b729-46bf-a035-975b4975e2d9', $q$vs Canvas LMS$q$, $q$/compare/canvas-lms-vs-moodle$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'da3ec484-b729-46bf-a035-975b4975e2d9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'da3ec484-b729-46bf-a035-975b4975e2d9' AND href = $q$/compare/canvas-lms-vs-moodle$q$);

-- ── Coursera vs Udemy (coursera-vs-udemy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7ac9ab5c-4a63-4bad-ba6c-e9edf649f3f5', '9475419b-62e2-4143-a99d-40ca73927ae3', $q$coursera-vs-udemy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7ac9ab5c-4a63-4bad-ba6c-e9edf649f3f5', $q$vs Udemy$q$, $q$/compare/coursera-vs-udemy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7ac9ab5c-4a63-4bad-ba6c-e9edf649f3f5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7ac9ab5c-4a63-4bad-ba6c-e9edf649f3f5' AND href = $q$/compare/coursera-vs-udemy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9475419b-62e2-4143-a99d-40ca73927ae3', $q$vs Coursera$q$, $q$/compare/coursera-vs-udemy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3' AND href = $q$/compare/coursera-vs-udemy$q$);

-- ── Skillshare vs Udemy (skillshare-vs-udemy) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f40d2d28-fdc6-4f97-93db-e7e3e49b3d87', '9475419b-62e2-4143-a99d-40ca73927ae3', $q$skillshare-vs-udemy$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f40d2d28-fdc6-4f97-93db-e7e3e49b3d87', $q$vs Udemy$q$, $q$/compare/skillshare-vs-udemy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f40d2d28-fdc6-4f97-93db-e7e3e49b3d87'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f40d2d28-fdc6-4f97-93db-e7e3e49b3d87' AND href = $q$/compare/skillshare-vs-udemy$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9475419b-62e2-4143-a99d-40ca73927ae3', $q$vs Skillshare$q$, $q$/compare/skillshare-vs-udemy$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3' AND href = $q$/compare/skillshare-vs-udemy$q$);

-- ── PayPal vs Stripe (paypal-vs-stripe) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('309c46ca-1066-4ecc-be4d-d5984e2cd67e', 'a42a7c3c-6971-460f-b902-9c4f09a2e764', $q$paypal-vs-stripe$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '309c46ca-1066-4ecc-be4d-d5984e2cd67e', $q$vs Stripe$q$, $q$/compare/paypal-vs-stripe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '309c46ca-1066-4ecc-be4d-d5984e2cd67e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '309c46ca-1066-4ecc-be4d-d5984e2cd67e' AND href = $q$/compare/paypal-vs-stripe$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a42a7c3c-6971-460f-b902-9c4f09a2e764', $q$vs PayPal$q$, $q$/compare/paypal-vs-stripe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a42a7c3c-6971-460f-b902-9c4f09a2e764'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a42a7c3c-6971-460f-b902-9c4f09a2e764' AND href = $q$/compare/paypal-vs-stripe$q$);

-- ── Square vs Stripe (square-vs-stripe) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', 'a42a7c3c-6971-460f-b902-9c4f09a2e764', $q$square-vs-stripe$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$vs Stripe$q$, $q$/compare/square-vs-stripe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84' AND href = $q$/compare/square-vs-stripe$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a42a7c3c-6971-460f-b902-9c4f09a2e764', $q$vs Square$q$, $q$/compare/square-vs-stripe$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a42a7c3c-6971-460f-b902-9c4f09a2e764'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a42a7c3c-6971-460f-b902-9c4f09a2e764' AND href = $q$/compare/square-vs-stripe$q$);

-- ── Brex vs Ramp (brex-vs-ramp) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', '73bfc873-4265-4959-93b9-df520ad9fcd5', $q$brex-vs-ramp$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '90a5952e-cd43-4cf5-bc88-317304be7a50', $q$vs Ramp$q$, $q$/compare/brex-vs-ramp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '90a5952e-cd43-4cf5-bc88-317304be7a50'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '90a5952e-cd43-4cf5-bc88-317304be7a50' AND href = $q$/compare/brex-vs-ramp$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '73bfc873-4265-4959-93b9-df520ad9fcd5', $q$vs Brex$q$, $q$/compare/brex-vs-ramp$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '73bfc873-4265-4959-93b9-df520ad9fcd5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '73bfc873-4265-4959-93b9-df520ad9fcd5' AND href = $q$/compare/brex-vs-ramp$q$);

-- ── Chargebee vs Recurly (chargebee-vs-recurly) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('59e7c6f4-7f3f-4a9d-a078-a2b7d95263db', '2899eedd-31f8-47bb-91c7-6b9e3cb0215b', $q$chargebee-vs-recurly$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '59e7c6f4-7f3f-4a9d-a078-a2b7d95263db', $q$vs Recurly$q$, $q$/compare/chargebee-vs-recurly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '59e7c6f4-7f3f-4a9d-a078-a2b7d95263db'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '59e7c6f4-7f3f-4a9d-a078-a2b7d95263db' AND href = $q$/compare/chargebee-vs-recurly$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2899eedd-31f8-47bb-91c7-6b9e3cb0215b', $q$vs Chargebee$q$, $q$/compare/chargebee-vs-recurly$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2899eedd-31f8-47bb-91c7-6b9e3cb0215b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2899eedd-31f8-47bb-91c7-6b9e3cb0215b' AND href = $q$/compare/chargebee-vs-recurly$q$);

-- ── Revolut Business vs Wise Business (revolut-business-vs-wise-business) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a1159d03-001f-4c6e-ae84-122c6665f96f', '3eb87668-42e1-459d-9212-aea403d70de9', $q$revolut-business-vs-wise-business$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a1159d03-001f-4c6e-ae84-122c6665f96f', $q$vs Wise Business$q$, $q$/compare/revolut-business-vs-wise-business$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a1159d03-001f-4c6e-ae84-122c6665f96f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a1159d03-001f-4c6e-ae84-122c6665f96f' AND href = $q$/compare/revolut-business-vs-wise-business$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3eb87668-42e1-459d-9212-aea403d70de9', $q$vs Revolut Business$q$, $q$/compare/revolut-business-vs-wise-business$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3eb87668-42e1-459d-9212-aea403d70de9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3eb87668-42e1-459d-9212-aea403d70de9' AND href = $q$/compare/revolut-business-vs-wise-business$q$);


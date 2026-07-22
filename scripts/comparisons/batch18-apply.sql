-- Comparison batch: moz-pro-vs-semrush, semrush-vs-ubersuggest, buffer-vs-hootsuite, buffer-vs-later, hootsuite-vs-sprout-social, buffer-vs-sprout-social, socialbee-vs-socialpilot, agorapulse-vs-hootsuite
-- Publishes 8 comparison page(s) with editorial content.

-- ── Moz Pro vs Semrush (moz-pro-vs-semrush) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2', '3564d834-f51a-4718-9030-849e68652d1f', $q$moz-pro-vs-semrush$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2', $q$vs Semrush$q$, $q$/compare/moz-pro-vs-semrush$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2' AND href = $q$/compare/moz-pro-vs-semrush$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3564d834-f51a-4718-9030-849e68652d1f', $q$vs Moz Pro$q$, $q$/compare/moz-pro-vs-semrush$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3564d834-f51a-4718-9030-849e68652d1f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3564d834-f51a-4718-9030-849e68652d1f' AND href = $q$/compare/moz-pro-vs-semrush$q$);

-- ── Semrush vs Ubersuggest (semrush-vs-ubersuggest) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3564d834-f51a-4718-9030-849e68652d1f', 'bea45054-992b-496b-b59e-dba14e8219b6', $q$semrush-vs-ubersuggest$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3564d834-f51a-4718-9030-849e68652d1f', $q$vs Ubersuggest$q$, $q$/compare/semrush-vs-ubersuggest$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3564d834-f51a-4718-9030-849e68652d1f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3564d834-f51a-4718-9030-849e68652d1f' AND href = $q$/compare/semrush-vs-ubersuggest$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'bea45054-992b-496b-b59e-dba14e8219b6', $q$vs Semrush$q$, $q$/compare/semrush-vs-ubersuggest$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'bea45054-992b-496b-b59e-dba14e8219b6'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'bea45054-992b-496b-b59e-dba14e8219b6' AND href = $q$/compare/semrush-vs-ubersuggest$q$);

-- ── Buffer vs Hootsuite (buffer-vs-hootsuite) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0', $q$buffer-vs-hootsuite$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a6203d78-992e-46dd-84e0-13212a7b5a75', $q$vs Hootsuite$q$, $q$/compare/buffer-vs-hootsuite$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75' AND href = $q$/compare/buffer-vs-hootsuite$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0', $q$vs Buffer$q$, $q$/compare/buffer-vs-hootsuite$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0' AND href = $q$/compare/buffer-vs-hootsuite$q$);

-- ── Buffer vs Later (buffer-vs-later) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', '34b4f794-ce37-4598-b6e9-fe9e9269a4c8', $q$buffer-vs-later$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a6203d78-992e-46dd-84e0-13212a7b5a75', $q$vs Later$q$, $q$/compare/buffer-vs-later$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75' AND href = $q$/compare/buffer-vs-later$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '34b4f794-ce37-4598-b6e9-fe9e9269a4c8', $q$vs Buffer$q$, $q$/compare/buffer-vs-later$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '34b4f794-ce37-4598-b6e9-fe9e9269a4c8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '34b4f794-ce37-4598-b6e9-fe9e9269a4c8' AND href = $q$/compare/buffer-vs-later$q$);

-- ── Hootsuite vs Sprout Social (hootsuite-vs-sprout-social) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('db35ba3a-f84e-424f-82ef-b3154b5d2ca0', 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$hootsuite-vs-sprout-social$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0', $q$vs Sprout Social$q$, $q$/compare/hootsuite-vs-sprout-social$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0' AND href = $q$/compare/hootsuite-vs-sprout-social$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$vs Hootsuite$q$, $q$/compare/hootsuite-vs-sprout-social$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a' AND href = $q$/compare/hootsuite-vs-sprout-social$q$);

-- ── Buffer vs Sprout Social (buffer-vs-sprout-social) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$buffer-vs-sprout-social$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a6203d78-992e-46dd-84e0-13212a7b5a75', $q$vs Sprout Social$q$, $q$/compare/buffer-vs-sprout-social$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a6203d78-992e-46dd-84e0-13212a7b5a75' AND href = $q$/compare/buffer-vs-sprout-social$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$vs Buffer$q$, $q$/compare/buffer-vs-sprout-social$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a' AND href = $q$/compare/buffer-vs-sprout-social$q$);

-- ── SocialBee vs SocialPilot (socialbee-vs-socialpilot) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', 'b0973005-06cc-44c0-81b7-f55d44c44d48', $q$socialbee-vs-socialpilot$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '57763ac9-8244-4ff8-8a06-376f30693d6f', $q$vs SocialPilot$q$, $q$/compare/socialbee-vs-socialpilot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '57763ac9-8244-4ff8-8a06-376f30693d6f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '57763ac9-8244-4ff8-8a06-376f30693d6f' AND href = $q$/compare/socialbee-vs-socialpilot$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b0973005-06cc-44c0-81b7-f55d44c44d48', $q$vs SocialBee$q$, $q$/compare/socialbee-vs-socialpilot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b0973005-06cc-44c0-81b7-f55d44c44d48'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b0973005-06cc-44c0-81b7-f55d44c44d48' AND href = $q$/compare/socialbee-vs-socialpilot$q$);

-- ── Agorapulse vs Hootsuite (agorapulse-vs-hootsuite) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0', $q$agorapulse-vs-hootsuite$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$vs Hootsuite$q$, $q$/compare/agorapulse-vs-hootsuite$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e' AND href = $q$/compare/agorapulse-vs-hootsuite$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0', $q$vs Agorapulse$q$, $q$/compare/agorapulse-vs-hootsuite$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'db35ba3a-f84e-424f-82ef-b3154b5d2ca0' AND href = $q$/compare/agorapulse-vs-hootsuite$q$);


-- Comparison batch: lovable-vs-replit, dall-e-vs-midjourney, midjourney-vs-stable-diffusion, dall-e-vs-stable-diffusion, heygen-vs-synthesia, pika-vs-runway, descript-vs-veed, kling-ai-vs-runway
-- Publishes 8 comparison page(s) with editorial content.

-- ── Lovable vs Replit (lovable-vs-replit) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('5759ef4a-9adb-4775-9ea3-ae93aa85a490', 'c628f71b-c0ff-42aa-87ea-a09dfbd28490', $q$lovable-vs-replit$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5759ef4a-9adb-4775-9ea3-ae93aa85a490', $q$vs Replit$q$, $q$/compare/lovable-vs-replit$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5759ef4a-9adb-4775-9ea3-ae93aa85a490'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5759ef4a-9adb-4775-9ea3-ae93aa85a490' AND href = $q$/compare/lovable-vs-replit$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c628f71b-c0ff-42aa-87ea-a09dfbd28490', $q$vs Lovable$q$, $q$/compare/lovable-vs-replit$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c628f71b-c0ff-42aa-87ea-a09dfbd28490'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c628f71b-c0ff-42aa-87ea-a09dfbd28490' AND href = $q$/compare/lovable-vs-replit$q$);

-- ── DALL-E vs Midjourney (dall-e-vs-midjourney) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c4134253-62ea-44f0-8d58-12d26946aac4', '99710d40-9738-45f6-85cf-44868ba8a012', $q$dall-e-vs-midjourney$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c4134253-62ea-44f0-8d58-12d26946aac4', $q$vs Midjourney$q$, $q$/compare/dall-e-vs-midjourney$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c4134253-62ea-44f0-8d58-12d26946aac4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c4134253-62ea-44f0-8d58-12d26946aac4' AND href = $q$/compare/dall-e-vs-midjourney$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '99710d40-9738-45f6-85cf-44868ba8a012', $q$vs DALL-E$q$, $q$/compare/dall-e-vs-midjourney$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '99710d40-9738-45f6-85cf-44868ba8a012'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '99710d40-9738-45f6-85cf-44868ba8a012' AND href = $q$/compare/dall-e-vs-midjourney$q$);

-- ── Midjourney vs Stable Diffusion (midjourney-vs-stable-diffusion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('99710d40-9738-45f6-85cf-44868ba8a012', '5355600e-7720-44d4-a9be-5558cbddc251', $q$midjourney-vs-stable-diffusion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '99710d40-9738-45f6-85cf-44868ba8a012', $q$vs Stable Diffusion$q$, $q$/compare/midjourney-vs-stable-diffusion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '99710d40-9738-45f6-85cf-44868ba8a012'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '99710d40-9738-45f6-85cf-44868ba8a012' AND href = $q$/compare/midjourney-vs-stable-diffusion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5355600e-7720-44d4-a9be-5558cbddc251', $q$vs Midjourney$q$, $q$/compare/midjourney-vs-stable-diffusion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251' AND href = $q$/compare/midjourney-vs-stable-diffusion$q$);

-- ── DALL-E vs Stable Diffusion (dall-e-vs-stable-diffusion) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('c4134253-62ea-44f0-8d58-12d26946aac4', '5355600e-7720-44d4-a9be-5558cbddc251', $q$dall-e-vs-stable-diffusion$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'c4134253-62ea-44f0-8d58-12d26946aac4', $q$vs Stable Diffusion$q$, $q$/compare/dall-e-vs-stable-diffusion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'c4134253-62ea-44f0-8d58-12d26946aac4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'c4134253-62ea-44f0-8d58-12d26946aac4' AND href = $q$/compare/dall-e-vs-stable-diffusion$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5355600e-7720-44d4-a9be-5558cbddc251', $q$vs DALL-E$q$, $q$/compare/dall-e-vs-stable-diffusion$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251' AND href = $q$/compare/dall-e-vs-stable-diffusion$q$);

-- ── HeyGen vs Synthesia (heygen-vs-synthesia) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('b433c3e5-1372-4d99-8fbd-7702d9586534', '5ac53984-b400-454f-baed-b707bfdb12ec', $q$heygen-vs-synthesia$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b433c3e5-1372-4d99-8fbd-7702d9586534', $q$vs Synthesia$q$, $q$/compare/heygen-vs-synthesia$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b433c3e5-1372-4d99-8fbd-7702d9586534'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b433c3e5-1372-4d99-8fbd-7702d9586534' AND href = $q$/compare/heygen-vs-synthesia$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '5ac53984-b400-454f-baed-b707bfdb12ec', $q$vs HeyGen$q$, $q$/compare/heygen-vs-synthesia$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '5ac53984-b400-454f-baed-b707bfdb12ec'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '5ac53984-b400-454f-baed-b707bfdb12ec' AND href = $q$/compare/heygen-vs-synthesia$q$);

-- ── Pika vs Runway (pika-vs-runway) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d3afb8a6-1eeb-4106-9923-58f01f27af75', '82e23514-860e-4179-aa6e-cc95f88d7372', $q$pika-vs-runway$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd3afb8a6-1eeb-4106-9923-58f01f27af75', $q$vs Runway$q$, $q$/compare/pika-vs-runway$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd3afb8a6-1eeb-4106-9923-58f01f27af75'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd3afb8a6-1eeb-4106-9923-58f01f27af75' AND href = $q$/compare/pika-vs-runway$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '82e23514-860e-4179-aa6e-cc95f88d7372', $q$vs Pika$q$, $q$/compare/pika-vs-runway$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '82e23514-860e-4179-aa6e-cc95f88d7372'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '82e23514-860e-4179-aa6e-cc95f88d7372' AND href = $q$/compare/pika-vs-runway$q$);

-- ── Descript vs VEED (descript-vs-veed) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('38565ec2-30ed-445f-b1d3-7ebd8fe67504', '409ea4dc-896f-4857-8834-ef3e42d8555a', $q$descript-vs-veed$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '38565ec2-30ed-445f-b1d3-7ebd8fe67504', $q$vs VEED$q$, $q$/compare/descript-vs-veed$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '38565ec2-30ed-445f-b1d3-7ebd8fe67504'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '38565ec2-30ed-445f-b1d3-7ebd8fe67504' AND href = $q$/compare/descript-vs-veed$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '409ea4dc-896f-4857-8834-ef3e42d8555a', $q$vs Descript$q$, $q$/compare/descript-vs-veed$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '409ea4dc-896f-4857-8834-ef3e42d8555a'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '409ea4dc-896f-4857-8834-ef3e42d8555a' AND href = $q$/compare/descript-vs-veed$q$);

-- ── Kling AI vs Runway (kling-ai-vs-runway) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('d2a1121c-315f-4076-816c-d10e98925f90', '82e23514-860e-4179-aa6e-cc95f88d7372', $q$kling-ai-vs-runway$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd2a1121c-315f-4076-816c-d10e98925f90', $q$vs Runway$q$, $q$/compare/kling-ai-vs-runway$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd2a1121c-315f-4076-816c-d10e98925f90'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd2a1121c-315f-4076-816c-d10e98925f90' AND href = $q$/compare/kling-ai-vs-runway$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '82e23514-860e-4179-aa6e-cc95f88d7372', $q$vs Kling AI$q$, $q$/compare/kling-ai-vs-runway$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '82e23514-860e-4179-aa6e-cc95f88d7372'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '82e23514-860e-4179-aa6e-cc95f88d7372' AND href = $q$/compare/kling-ai-vs-runway$q$);


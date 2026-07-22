-- Comparison batch: chatgpt-vs-claude, chatgpt-vs-google-gemini, claude-vs-google-gemini, chatgpt-vs-perplexity, cursor-vs-github-copilot, cursor-vs-windsurf, github-copilot-vs-windsurf, bolt-new-vs-v0
-- Publishes 8 comparison page(s) with editorial content.

-- ── ChatGPT vs Claude (chatgpt-vs-claude) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dd2f89ec-7433-42f0-b381-627ffd6ed01f', '4648f65b-d55e-4ed8-ad0d-c40b3343b03c', $q$chatgpt-vs-claude$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dd2f89ec-7433-42f0-b381-627ffd6ed01f', $q$vs Claude$q$, $q$/compare/chatgpt-vs-claude$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dd2f89ec-7433-42f0-b381-627ffd6ed01f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dd2f89ec-7433-42f0-b381-627ffd6ed01f' AND href = $q$/compare/chatgpt-vs-claude$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4648f65b-d55e-4ed8-ad0d-c40b3343b03c', $q$vs ChatGPT$q$, $q$/compare/chatgpt-vs-claude$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4648f65b-d55e-4ed8-ad0d-c40b3343b03c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4648f65b-d55e-4ed8-ad0d-c40b3343b03c' AND href = $q$/compare/chatgpt-vs-claude$q$);

-- ── ChatGPT vs Google Gemini (chatgpt-vs-google-gemini) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dd2f89ec-7433-42f0-b381-627ffd6ed01f', '1769cc92-bed0-46a8-9354-2d81fdae9ad4', $q$chatgpt-vs-google-gemini$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dd2f89ec-7433-42f0-b381-627ffd6ed01f', $q$vs Google Gemini$q$, $q$/compare/chatgpt-vs-google-gemini$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dd2f89ec-7433-42f0-b381-627ffd6ed01f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dd2f89ec-7433-42f0-b381-627ffd6ed01f' AND href = $q$/compare/chatgpt-vs-google-gemini$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1769cc92-bed0-46a8-9354-2d81fdae9ad4', $q$vs ChatGPT$q$, $q$/compare/chatgpt-vs-google-gemini$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1769cc92-bed0-46a8-9354-2d81fdae9ad4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1769cc92-bed0-46a8-9354-2d81fdae9ad4' AND href = $q$/compare/chatgpt-vs-google-gemini$q$);

-- ── Claude vs Google Gemini (claude-vs-google-gemini) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4648f65b-d55e-4ed8-ad0d-c40b3343b03c', '1769cc92-bed0-46a8-9354-2d81fdae9ad4', $q$claude-vs-google-gemini$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4648f65b-d55e-4ed8-ad0d-c40b3343b03c', $q$vs Google Gemini$q$, $q$/compare/claude-vs-google-gemini$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4648f65b-d55e-4ed8-ad0d-c40b3343b03c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4648f65b-d55e-4ed8-ad0d-c40b3343b03c' AND href = $q$/compare/claude-vs-google-gemini$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '1769cc92-bed0-46a8-9354-2d81fdae9ad4', $q$vs Claude$q$, $q$/compare/claude-vs-google-gemini$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '1769cc92-bed0-46a8-9354-2d81fdae9ad4'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '1769cc92-bed0-46a8-9354-2d81fdae9ad4' AND href = $q$/compare/claude-vs-google-gemini$q$);

-- ── ChatGPT vs Perplexity (chatgpt-vs-perplexity) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('dd2f89ec-7433-42f0-b381-627ffd6ed01f', 'fca1586c-759c-47c3-b289-f752d876f509', $q$chatgpt-vs-perplexity$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'dd2f89ec-7433-42f0-b381-627ffd6ed01f', $q$vs Perplexity$q$, $q$/compare/chatgpt-vs-perplexity$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'dd2f89ec-7433-42f0-b381-627ffd6ed01f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'dd2f89ec-7433-42f0-b381-627ffd6ed01f' AND href = $q$/compare/chatgpt-vs-perplexity$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'fca1586c-759c-47c3-b289-f752d876f509', $q$vs ChatGPT$q$, $q$/compare/chatgpt-vs-perplexity$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'fca1586c-759c-47c3-b289-f752d876f509'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'fca1586c-759c-47c3-b289-f752d876f509' AND href = $q$/compare/chatgpt-vs-perplexity$q$);

-- ── Cursor vs GitHub Copilot (cursor-vs-github-copilot) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('693230a0-d462-46dc-9108-9752df61caba', 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e', $q$cursor-vs-github-copilot$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '693230a0-d462-46dc-9108-9752df61caba', $q$vs GitHub Copilot$q$, $q$/compare/cursor-vs-github-copilot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '693230a0-d462-46dc-9108-9752df61caba'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '693230a0-d462-46dc-9108-9752df61caba' AND href = $q$/compare/cursor-vs-github-copilot$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e', $q$vs Cursor$q$, $q$/compare/cursor-vs-github-copilot$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e' AND href = $q$/compare/cursor-vs-github-copilot$q$);

-- ── Cursor vs Windsurf (cursor-vs-windsurf) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('693230a0-d462-46dc-9108-9752df61caba', '758d739b-574e-4253-96df-178cefd5f067', $q$cursor-vs-windsurf$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '693230a0-d462-46dc-9108-9752df61caba', $q$vs Windsurf$q$, $q$/compare/cursor-vs-windsurf$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '693230a0-d462-46dc-9108-9752df61caba'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '693230a0-d462-46dc-9108-9752df61caba' AND href = $q$/compare/cursor-vs-windsurf$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '758d739b-574e-4253-96df-178cefd5f067', $q$vs Cursor$q$, $q$/compare/cursor-vs-windsurf$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '758d739b-574e-4253-96df-178cefd5f067'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '758d739b-574e-4253-96df-178cefd5f067' AND href = $q$/compare/cursor-vs-windsurf$q$);

-- ── GitHub Copilot vs Windsurf (github-copilot-vs-windsurf) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e6d92dc8-7c30-4adc-b031-5d6acb8bc41e', '758d739b-574e-4253-96df-178cefd5f067', $q$github-copilot-vs-windsurf$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e', $q$vs Windsurf$q$, $q$/compare/github-copilot-vs-windsurf$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e' AND href = $q$/compare/github-copilot-vs-windsurf$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '758d739b-574e-4253-96df-178cefd5f067', $q$vs GitHub Copilot$q$, $q$/compare/github-copilot-vs-windsurf$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '758d739b-574e-4253-96df-178cefd5f067'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '758d739b-574e-4253-96df-178cefd5f067' AND href = $q$/compare/github-copilot-vs-windsurf$q$);

-- ── Bolt.new vs v0 (bolt-new-vs-v0) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('e82c60dd-a99b-47e5-b59b-e27db707e04e', '7e511518-9008-4caa-98b5-24f31611a25c', $q$bolt-new-vs-v0$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'e82c60dd-a99b-47e5-b59b-e27db707e04e', $q$vs v0$q$, $q$/compare/bolt-new-vs-v0$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'e82c60dd-a99b-47e5-b59b-e27db707e04e'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'e82c60dd-a99b-47e5-b59b-e27db707e04e' AND href = $q$/compare/bolt-new-vs-v0$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7e511518-9008-4caa-98b5-24f31611a25c', $q$vs Bolt.new$q$, $q$/compare/bolt-new-vs-v0$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7e511518-9008-4caa-98b5-24f31611a25c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7e511518-9008-4caa-98b5-24f31611a25c' AND href = $q$/compare/bolt-new-vs-v0$q$);


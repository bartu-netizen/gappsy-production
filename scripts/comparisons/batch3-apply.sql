-- Comparison batch: copy-ai-vs-writesonic, quillbot-vs-wordtune, clearscope-vs-surfer-seo, copy-ai-vs-jasper, google-analytics-vs-plausible, google-analytics-vs-posthog, hotjar-vs-microsoft-clarity, plausible-vs-umami
-- Publishes 8 comparison page(s) with editorial content.

-- ── Copy.ai vs Writesonic (copy-ai-vs-writesonic) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3c515695-9a2f-4479-901f-6ca785a0e07c', 'f31dc073-4cc3-41a0-aee3-8701aed38b64', $q$copy-ai-vs-writesonic$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c515695-9a2f-4479-901f-6ca785a0e07c', $q$vs Writesonic$q$, $q$/compare/copy-ai-vs-writesonic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c515695-9a2f-4479-901f-6ca785a0e07c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c515695-9a2f-4479-901f-6ca785a0e07c' AND href = $q$/compare/copy-ai-vs-writesonic$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f31dc073-4cc3-41a0-aee3-8701aed38b64', $q$vs Copy.ai$q$, $q$/compare/copy-ai-vs-writesonic$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f31dc073-4cc3-41a0-aee3-8701aed38b64'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f31dc073-4cc3-41a0-aee3-8701aed38b64' AND href = $q$/compare/copy-ai-vs-writesonic$q$);

-- ── QuillBot vs Wordtune (quillbot-vs-wordtune) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('f18cd757-37d4-43bb-966d-11c389f63bb7', 'a5fa585a-6104-495a-a452-912fb307c35f', $q$quillbot-vs-wordtune$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f18cd757-37d4-43bb-966d-11c389f63bb7', $q$vs Wordtune$q$, $q$/compare/quillbot-vs-wordtune$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f18cd757-37d4-43bb-966d-11c389f63bb7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f18cd757-37d4-43bb-966d-11c389f63bb7' AND href = $q$/compare/quillbot-vs-wordtune$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a5fa585a-6104-495a-a452-912fb307c35f', $q$vs QuillBot$q$, $q$/compare/quillbot-vs-wordtune$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a5fa585a-6104-495a-a452-912fb307c35f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a5fa585a-6104-495a-a452-912fb307c35f' AND href = $q$/compare/quillbot-vs-wordtune$q$);

-- ── Clearscope vs Surfer SEO (clearscope-vs-surfer-seo) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('7de794bf-b842-4128-82f7-b18545f5a992', 'a009a42b-b701-46b1-bc27-3bc5f232d1f9', $q$clearscope-vs-surfer-seo$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '7de794bf-b842-4128-82f7-b18545f5a992', $q$vs Surfer SEO$q$, $q$/compare/clearscope-vs-surfer-seo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '7de794bf-b842-4128-82f7-b18545f5a992'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '7de794bf-b842-4128-82f7-b18545f5a992' AND href = $q$/compare/clearscope-vs-surfer-seo$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a009a42b-b701-46b1-bc27-3bc5f232d1f9', $q$vs Clearscope$q$, $q$/compare/clearscope-vs-surfer-seo$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a009a42b-b701-46b1-bc27-3bc5f232d1f9'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a009a42b-b701-46b1-bc27-3bc5f232d1f9' AND href = $q$/compare/clearscope-vs-surfer-seo$q$);

-- ── Copy.ai vs Jasper (copy-ai-vs-jasper) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3c515695-9a2f-4479-901f-6ca785a0e07c', 'd87ead8b-8c90-424b-ae07-9b4003510b45', $q$copy-ai-vs-jasper$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3c515695-9a2f-4479-901f-6ca785a0e07c', $q$vs Jasper$q$, $q$/compare/copy-ai-vs-jasper$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3c515695-9a2f-4479-901f-6ca785a0e07c'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3c515695-9a2f-4479-901f-6ca785a0e07c' AND href = $q$/compare/copy-ai-vs-jasper$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd87ead8b-8c90-424b-ae07-9b4003510b45', $q$vs Copy.ai$q$, $q$/compare/copy-ai-vs-jasper$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd87ead8b-8c90-424b-ae07-9b4003510b45'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd87ead8b-8c90-424b-ae07-9b4003510b45' AND href = $q$/compare/copy-ai-vs-jasper$q$);

-- ── Google Analytics vs plausible (google-analytics-vs-plausible) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('504c1944-1d50-48a6-8bbd-c32da5230932', '4ad6bb35-29e1-42bd-9183-39a59570aee8', $q$google-analytics-vs-plausible$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '504c1944-1d50-48a6-8bbd-c32da5230932', $q$vs plausible$q$, $q$/compare/google-analytics-vs-plausible$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '504c1944-1d50-48a6-8bbd-c32da5230932'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '504c1944-1d50-48a6-8bbd-c32da5230932' AND href = $q$/compare/google-analytics-vs-plausible$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4ad6bb35-29e1-42bd-9183-39a59570aee8', $q$vs Google Analytics$q$, $q$/compare/google-analytics-vs-plausible$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4ad6bb35-29e1-42bd-9183-39a59570aee8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4ad6bb35-29e1-42bd-9183-39a59570aee8' AND href = $q$/compare/google-analytics-vs-plausible$q$);

-- ── Google Analytics vs posthog (google-analytics-vs-posthog) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('504c1944-1d50-48a6-8bbd-c32da5230932', 'd0c0a6d4-b565-4bc1-aaae-f64d2b455fe7', $q$google-analytics-vs-posthog$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '504c1944-1d50-48a6-8bbd-c32da5230932', $q$vs posthog$q$, $q$/compare/google-analytics-vs-posthog$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '504c1944-1d50-48a6-8bbd-c32da5230932'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '504c1944-1d50-48a6-8bbd-c32da5230932' AND href = $q$/compare/google-analytics-vs-posthog$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd0c0a6d4-b565-4bc1-aaae-f64d2b455fe7', $q$vs Google Analytics$q$, $q$/compare/google-analytics-vs-posthog$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd0c0a6d4-b565-4bc1-aaae-f64d2b455fe7'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd0c0a6d4-b565-4bc1-aaae-f64d2b455fe7' AND href = $q$/compare/google-analytics-vs-posthog$q$);

-- ── Hotjar vs Microsoft Clarity (hotjar-vs-microsoft-clarity) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('65ed3bfb-065e-4391-8e0f-5ffc7b205daa', 'b89d9029-ae3f-4881-beeb-41c427d2ace5', $q$hotjar-vs-microsoft-clarity$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '65ed3bfb-065e-4391-8e0f-5ffc7b205daa', $q$vs Microsoft Clarity$q$, $q$/compare/hotjar-vs-microsoft-clarity$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '65ed3bfb-065e-4391-8e0f-5ffc7b205daa'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '65ed3bfb-065e-4391-8e0f-5ffc7b205daa' AND href = $q$/compare/hotjar-vs-microsoft-clarity$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'b89d9029-ae3f-4881-beeb-41c427d2ace5', $q$vs Hotjar$q$, $q$/compare/hotjar-vs-microsoft-clarity$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'b89d9029-ae3f-4881-beeb-41c427d2ace5'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'b89d9029-ae3f-4881-beeb-41c427d2ace5' AND href = $q$/compare/hotjar-vs-microsoft-clarity$q$);

-- ── plausible vs umami (plausible-vs-umami) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('4ad6bb35-29e1-42bd-9183-39a59570aee8', '2dc59fc4-cba5-4e5f-9d82-31860bce5d72', $q$plausible-vs-umami$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '4ad6bb35-29e1-42bd-9183-39a59570aee8', $q$vs umami$q$, $q$/compare/plausible-vs-umami$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '4ad6bb35-29e1-42bd-9183-39a59570aee8'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '4ad6bb35-29e1-42bd-9183-39a59570aee8' AND href = $q$/compare/plausible-vs-umami$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '2dc59fc4-cba5-4e5f-9d82-31860bce5d72', $q$vs plausible$q$, $q$/compare/plausible-vs-umami$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '2dc59fc4-cba5-4e5f-9d82-31860bce5d72'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '2dc59fc4-cba5-4e5f-9d82-31860bce5d72' AND href = $q$/compare/plausible-vs-umami$q$);


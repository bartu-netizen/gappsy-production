-- Comparison batch: airbyte-vs-fivetran, aws-vs-microsoft-azure, aws-vs-google-cloud, netlify-vs-vercel, heroku-vs-render, firebase-vs-supabase, hoppscotch-vs-postman, jetbrains-intellij-idea-vs-visual-studio-code
-- Publishes 8 comparison page(s) with editorial content.

-- ── Airbyte vs Fivetran (airbyte-vs-fivetran) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', '77bcbe4d-ff51-41f9-a9da-963c98821e89', $q$airbyte-vs-fivetran$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$vs Fivetran$q$, $q$/compare/airbyte-vs-fivetran$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b' AND href = $q$/compare/airbyte-vs-fivetran$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '77bcbe4d-ff51-41f9-a9da-963c98821e89', $q$vs Airbyte$q$, $q$/compare/airbyte-vs-fivetran$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '77bcbe4d-ff51-41f9-a9da-963c98821e89'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '77bcbe4d-ff51-41f9-a9da-963c98821e89' AND href = $q$/compare/airbyte-vs-fivetran$q$);

-- ── AWS vs Microsoft Azure (aws-vs-microsoft-azure) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', 'f7ec4de0-b2b8-428c-8872-3470c3040b95', $q$aws-vs-microsoft-azure$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$vs Microsoft Azure$q$, $q$/compare/aws-vs-microsoft-azure$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '37230cac-8680-4f59-8fa6-d34a5321ea4d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '37230cac-8680-4f59-8fa6-d34a5321ea4d' AND href = $q$/compare/aws-vs-microsoft-azure$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'f7ec4de0-b2b8-428c-8872-3470c3040b95', $q$vs AWS$q$, $q$/compare/aws-vs-microsoft-azure$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'f7ec4de0-b2b8-428c-8872-3470c3040b95'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'f7ec4de0-b2b8-428c-8872-3470c3040b95' AND href = $q$/compare/aws-vs-microsoft-azure$q$);

-- ── AWS vs Google Cloud (aws-vs-google-cloud) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', 'd05ce7d8-d828-41bd-aa04-c81764640a9f', $q$aws-vs-google-cloud$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$vs Google Cloud$q$, $q$/compare/aws-vs-google-cloud$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '37230cac-8680-4f59-8fa6-d34a5321ea4d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '37230cac-8680-4f59-8fa6-d34a5321ea4d' AND href = $q$/compare/aws-vs-google-cloud$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'd05ce7d8-d828-41bd-aa04-c81764640a9f', $q$vs AWS$q$, $q$/compare/aws-vs-google-cloud$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'd05ce7d8-d828-41bd-aa04-c81764640a9f'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'd05ce7d8-d828-41bd-aa04-c81764640a9f' AND href = $q$/compare/aws-vs-google-cloud$q$);

-- ── Netlify vs Vercel (netlify-vs-vercel) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('26474910-f9a4-4767-aebb-d9caf5983498', '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$netlify-vs-vercel$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '26474910-f9a4-4767-aebb-d9caf5983498', $q$vs Vercel$q$, $q$/compare/netlify-vs-vercel$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '26474910-f9a4-4767-aebb-d9caf5983498'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '26474910-f9a4-4767-aebb-d9caf5983498' AND href = $q$/compare/netlify-vs-vercel$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$vs Netlify$q$, $q$/compare/netlify-vs-vercel$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3a3ebe73-ba0d-4cfd-884e-37df2cf4210d' AND href = $q$/compare/netlify-vs-vercel$q$);

-- ── Heroku vs Render (heroku-vs-render) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('34fac46a-38d6-4512-b24c-19e0f5439125', '87cb32a2-9663-4c3e-a003-f1735380ac01', $q$heroku-vs-render$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '34fac46a-38d6-4512-b24c-19e0f5439125', $q$vs Render$q$, $q$/compare/heroku-vs-render$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '34fac46a-38d6-4512-b24c-19e0f5439125'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '34fac46a-38d6-4512-b24c-19e0f5439125' AND href = $q$/compare/heroku-vs-render$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '87cb32a2-9663-4c3e-a003-f1735380ac01', $q$vs Heroku$q$, $q$/compare/heroku-vs-render$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '87cb32a2-9663-4c3e-a003-f1735380ac01'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '87cb32a2-9663-4c3e-a003-f1735380ac01' AND href = $q$/compare/heroku-vs-render$q$);

-- ── Firebase vs Supabase (firebase-vs-supabase) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('3190d2c9-97ab-4131-81ee-15a9bb5745a2', '84e314ac-4d36-41da-911b-9eb00173a757', $q$firebase-vs-supabase$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '3190d2c9-97ab-4131-81ee-15a9bb5745a2', $q$vs Supabase$q$, $q$/compare/firebase-vs-supabase$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '3190d2c9-97ab-4131-81ee-15a9bb5745a2'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '3190d2c9-97ab-4131-81ee-15a9bb5745a2' AND href = $q$/compare/firebase-vs-supabase$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '84e314ac-4d36-41da-911b-9eb00173a757', $q$vs Firebase$q$, $q$/compare/firebase-vs-supabase$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '84e314ac-4d36-41da-911b-9eb00173a757'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '84e314ac-4d36-41da-911b-9eb00173a757' AND href = $q$/compare/firebase-vs-supabase$q$);

-- ── Hoppscotch vs Postman (hoppscotch-vs-postman) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('9ad514b4-f42c-4a24-9984-a035b5cef0f3', 'ff342572-8c41-421f-88e9-ab4155b8dbbf', $q$hoppscotch-vs-postman$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT '9ad514b4-f42c-4a24-9984-a035b5cef0f3', $q$vs Postman$q$, $q$/compare/hoppscotch-vs-postman$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = '9ad514b4-f42c-4a24-9984-a035b5cef0f3'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = '9ad514b4-f42c-4a24-9984-a035b5cef0f3' AND href = $q$/compare/hoppscotch-vs-postman$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'ff342572-8c41-421f-88e9-ab4155b8dbbf', $q$vs Hoppscotch$q$, $q$/compare/hoppscotch-vs-postman$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'ff342572-8c41-421f-88e9-ab4155b8dbbf'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'ff342572-8c41-421f-88e9-ab4155b8dbbf' AND href = $q$/compare/hoppscotch-vs-postman$q$);

-- ── JetBrains IntelliJ IDEA vs Visual Studio Code (jetbrains-intellij-idea-vs-visual-studio-code) ──────────────────────────────────────────────
INSERT INTO tool_comparisons (tool_a_id, tool_b_id, slug, status)
VALUES ('a5a9d90c-49e0-401c-af66-b1fa6982ad32', 'a0d08d8f-1e51-4d00-986a-4e669f665333', $q$jetbrains-intellij-idea-vs-visual-studio-code$q$, 'published')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a5a9d90c-49e0-401c-af66-b1fa6982ad32', $q$vs Visual Studio Code$q$, $q$/compare/jetbrains-intellij-idea-vs-visual-studio-code$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a5a9d90c-49e0-401c-af66-b1fa6982ad32'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a5a9d90c-49e0-401c-af66-b1fa6982ad32' AND href = $q$/compare/jetbrains-intellij-idea-vs-visual-studio-code$q$);

INSERT INTO tool_comparison_links (tool_id, label, href, sort_order)
SELECT 'a0d08d8f-1e51-4d00-986a-4e669f665333', $q$vs JetBrains IntelliJ IDEA$q$, $q$/compare/jetbrains-intellij-idea-vs-visual-studio-code$q$, COALESCE((SELECT MAX(sort_order) + 1 FROM tool_comparison_links WHERE tool_id = 'a0d08d8f-1e51-4d00-986a-4e669f665333'), 0)
WHERE NOT EXISTS (SELECT 1 FROM tool_comparison_links WHERE tool_id = 'a0d08d8f-1e51-4d00-986a-4e669f665333' AND href = $q$/compare/jetbrains-intellij-idea-vs-visual-studio-code$q$);


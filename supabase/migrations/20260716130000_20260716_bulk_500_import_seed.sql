-- Data for the 500-target bulk import (see 20260716120000 for schema).
-- Idempotent: every INSERT below is ON CONFLICT DO NOTHING keyed on the
-- natural unique constraint (tools.slug, or tool_strategic_metadata.tool_id).
-- Re-running this file is always safe.

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dd2f89ec-7433-42f0-b381-627ffd6ed01f', $q$chatgpt$q$, $q$ChatGPT$q$, $q$https://chatgpt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dd2f89ec-7433-42f0-b381-627ffd6ed01f', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd2f89ec-7433-42f0-b381-627ffd6ed01f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4648f65b-d55e-4ed8-ad0d-c40b3343b03c', $q$claude$q$, $q$Claude$q$, $q$https://claude.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4648f65b-d55e-4ed8-ad0d-c40b3343b03c', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4648f65b-d55e-4ed8-ad0d-c40b3343b03c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fca1586c-759c-47c3-b289-f752d876f509', $q$perplexity$q$, $q$Perplexity$q$, $q$https://www.perplexity.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fca1586c-759c-47c3-b289-f752d876f509', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fca1586c-759c-47c3-b289-f752d876f509')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e6d92dc8-7c30-4adc-b031-5d6acb8bc41e', $q$github-copilot$q$, $q$GitHub Copilot$q$, $q$https://github.com/features/copilot$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99710d40-9738-45f6-85cf-44868ba8a012', $q$midjourney$q$, $q$Midjourney$q$, $q$https://www.midjourney.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99710d40-9738-45f6-85cf-44868ba8a012', '610d937c-3241-4cba-8f6e-b5015c8dc2f0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99710d40-9738-45f6-85cf-44868ba8a012')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$adobe-firefly$q$, $q$Adobe Firefly$q$, $q$https://firefly.adobe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '634ed19f-2d5a-4498-ac78-c41f58bbdf9a', '610d937c-3241-4cba-8f6e-b5015c8dc2f0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ef29f747-f15c-4d08-991c-1e5c8ee38641', $q$hubspot-crm$q$, $q$HubSpot CRM$q$, $q$https://www.hubspot.com/products/crm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ef29f747-f15c-4d08-991c-1e5c8ee38641', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef29f747-f15c-4d08-991c-1e5c8ee38641')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('504c1944-1d50-48a6-8bbd-c32da5230932', $q$google-analytics$q$, $q$Google Analytics$q$, $q$https://analytics.google.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '504c1944-1d50-48a6-8bbd-c32da5230932', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '504c1944-1d50-48a6-8bbd-c32da5230932')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('309c46ca-1066-4ecc-be4d-d5984e2cd67e', $q$paypal$q$, $q$PayPal$q$, $q$https://www.paypal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '309c46ca-1066-4ecc-be4d-d5984e2cd67e', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '309c46ca-1066-4ecc-be4d-d5984e2cd67e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9e200cb1-a048-4c0a-ac15-ece1a517f982', $q$quickbooks-online$q$, $q$QuickBooks Online$q$, $q$https://quickbooks.intuit.com/online/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9e200cb1-a048-4c0a-ac15-ece1a517f982', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9e200cb1-a048-4c0a-ac15-ece1a517f982')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bd2fce1d-50cd-44a2-927e-39cfe30406dd', $q$google-drive$q$, $q$Google Drive$q$, $q$https://drive.google.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bd2fce1d-50cd-44a2-927e-39cfe30406dd', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd2fce1d-50cd-44a2-927e-39cfe30406dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$microsoft-teams$q$, $q$Microsoft Teams$q$, $q$https://www.microsoft.com/microsoft-teams$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '38ae237b-78e7-4604-8a45-6bc26a5f678f', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38ae237b-78e7-4604-8a45-6bc26a5f678f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8741e733-7b13-489c-8696-9d50fbf35b42', $q$wordpress$q$, $q$WordPress$q$, $q$https://wordpress.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8741e733-7b13-489c-8696-9d50fbf35b42', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8741e733-7b13-489c-8696-9d50fbf35b42')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$aws$q$, $q$AWS$q$, $q$https://aws.amazon.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '37230cac-8680-4f59-8fa6-d34a5321ea4d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37230cac-8680-4f59-8fa6-d34a5321ea4d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d05ce7d8-d828-41bd-aa04-c81764640a9f', $q$google-cloud$q$, $q$Google Cloud$q$, $q$https://cloud.google.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd05ce7d8-d828-41bd-aa04-c81764640a9f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd05ce7d8-d828-41bd-aa04-c81764640a9f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f7ec4de0-b2b8-428c-8872-3470c3040b95', $q$microsoft-azure$q$, $q$Microsoft Azure$q$, $q$https://azure.microsoft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f7ec4de0-b2b8-428c-8872-3470c3040b95', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7ec4de0-b2b8-428c-8872-3470c3040b95')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$cloudflare$q$, $q$Cloudflare$q$, $q$https://www.cloudflare.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea6eaa06-f20d-4fac-bdce-f1792eeece95', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ae91efd-338e-4ef0-9f0b-3f2a51548062', $q$microsoft-power-bi$q$, $q$Microsoft Power BI$q$, $q$https://www.microsoft.com/power-platform/products/power-bi$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ae91efd-338e-4ef0-9f0b-3f2a51548062', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ae91efd-338e-4ef0-9f0b-3f2a51548062')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3420577a-4640-4828-a64b-5afe612e65be', $q$tableau$q$, $q$Tableau$q$, $q$https://www.tableau.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3420577a-4640-4828-a64b-5afe612e65be', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3420577a-4640-4828-a64b-5afe612e65be')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$square$q$, $q$Square$q$, $q$https://squareup.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9aaf51c9-b792-42f0-8f4d-c00a00023f84', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b71f7fc-c26a-419f-a1fe-0de98471da7f', $q$workday$q$, $q$Workday$q$, $q$https://www.workday.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b71f7fc-c26a-419f-a1fe-0de98471da7f', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b71f7fc-c26a-419f-a1fe-0de98471da7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dba954e7-42de-4597-adda-d2b1563a9303', $q$servicenow$q$, $q$ServiceNow$q$, $q$https://www.servicenow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dba954e7-42de-4597-adda-d2b1563a9303', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dba954e7-42de-4597-adda-d2b1563a9303')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8439de35-62ee-4d9e-bf6a-d659a4bed51b', $q$microsoft-copilot$q$, $q$Microsoft Copilot$q$, $q$https://copilot.microsoft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8439de35-62ee-4d9e-bf6a-d659a4bed51b', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8439de35-62ee-4d9e-bf6a-d659a4bed51b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1769cc92-bed0-46a8-9354-2d81fdae9ad4', $q$google-gemini$q$, $q$Google Gemini$q$, $q$https://gemini.google.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1769cc92-bed0-46a8-9354-2d81fdae9ad4', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1769cc92-bed0-46a8-9354-2d81fdae9ad4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c4134253-62ea-44f0-8d58-12d26946aac4', $q$dall-e$q$, $q$DALL-E$q$, $q$https://openai.com/index/dall-e-3/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c4134253-62ea-44f0-8d58-12d26946aac4', '610d937c-3241-4cba-8f6e-b5015c8dc2f0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4134253-62ea-44f0-8d58-12d26946aac4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53d8a955-0f74-4814-b877-caeb34bf0761', $q$adobe-illustrator$q$, $q$Adobe Illustrator$q$, $q$https://www.adobe.com/products/illustrator.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53d8a955-0f74-4814-b877-caeb34bf0761', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53d8a955-0f74-4814-b877-caeb34bf0761')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c515695-9a2f-4479-901f-6ca785a0e07c', $q$copy-ai$q$, $q$Copy.ai$q$, $q$https://www.copy.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c515695-9a2f-4479-901f-6ca785a0e07c', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c515695-9a2f-4479-901f-6ca785a0e07c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f31dc073-4cc3-41a0-aee3-8701aed38b64', $q$writesonic$q$, $q$Writesonic$q$, $q$https://writesonic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f31dc073-4cc3-41a0-aee3-8701aed38b64', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f31dc073-4cc3-41a0-aee3-8701aed38b64')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bf487e99-d6ce-4329-b02b-a9efe905e265', $q$make$q$, $q$Make$q$, $q$https://www.make.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bf487e99-d6ce-4329-b02b-a9efe905e265', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf487e99-d6ce-4329-b02b-a9efe905e265')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae913412-1cd7-414a-b291-f3e2c6aabc3b', $q$rytr$q$, $q$Rytr$q$, $q$https://rytr.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae913412-1cd7-414a-b291-f3e2c6aabc3b', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae913412-1cd7-414a-b291-f3e2c6aabc3b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b595e89a-3f11-4ebc-af37-5b2c490d5f49', $q$ifttt$q$, $q$IFTTT$q$, $q$https://ifttt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b595e89a-3f11-4ebc-af37-5b2c490d5f49', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b595e89a-3f11-4ebc-af37-5b2c490d5f49')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$stable-diffusion$q$, $q$Stable Diffusion$q$, $q$https://stability.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5355600e-7720-44d4-a9be-5558cbddc251', '610d937c-3241-4cba-8f6e-b5015c8dc2f0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5355600e-7720-44d4-a9be-5558cbddc251')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2345d0ed-4255-4773-9565-b0ced4967bcd', $q$n8n$q$, $q$n8n$q$, $q$https://n8n.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2345d0ed-4255-4773-9565-b0ced4967bcd', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2345d0ed-4255-4773-9565-b0ced4967bcd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('680a2bd4-9753-4f67-b86c-2cfe5c3b463e', $q$leonardo-ai$q$, $q$Leonardo AI$q$, $q$https://leonardo.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '680a2bd4-9753-4f67-b86c-2cfe5c3b463e', '610d937c-3241-4cba-8f6e-b5015c8dc2f0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '680a2bd4-9753-4f67-b86c-2cfe5c3b463e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f18cd757-37d4-43bb-966d-11c389f63bb7', $q$quillbot$q$, $q$QuillBot$q$, $q$https://quillbot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f18cd757-37d4-43bb-966d-11c389f63bb7', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f18cd757-37d4-43bb-966d-11c389f63bb7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11ea99d1-4f63-4f6b-9533-0e1448c3d8f5', $q$microsoft-power-automate$q$, $q$Microsoft Power Automate$q$, $q$https://www.microsoft.com/power-platform/products/power-automate$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11ea99d1-4f63-4f6b-9533-0e1448c3d8f5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11ea99d1-4f63-4f6b-9533-0e1448c3d8f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a25dd23-914b-48e4-8554-6252f6edb666', $q$ideogram$q$, $q$Ideogram$q$, $q$https://ideogram.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a25dd23-914b-48e4-8554-6252f6edb666', '610d937c-3241-4cba-8f6e-b5015c8dc2f0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a25dd23-914b-48e4-8554-6252f6edb666')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a5fa585a-6104-495a-a452-912fb307c35f', $q$wordtune$q$, $q$Wordtune$q$, $q$https://www.wordtune.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a5fa585a-6104-495a-a452-912fb307c35f', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5fa585a-6104-495a-a452-912fb307c35f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cdbd18ff-a281-4cb1-87dc-90ab666683fe', $q$bubble$q$, $q$Bubble$q$, $q$https://bubble.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cdbd18ff-a281-4cb1-87dc-90ab666683fe', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdbd18ff-a281-4cb1-87dc-90ab666683fe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82e23514-860e-4179-aa6e-cc95f88d7372', $q$runway$q$, $q$Runway$q$, $q$https://runwayml.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82e23514-860e-4179-aa6e-cc95f88d7372', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82e23514-860e-4179-aa6e-cc95f88d7372')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$sudowrite$q$, $q$Sudowrite$q$, $q$https://www.sudowrite.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '279c7ff2-d20a-4f79-bdc5-e15f28fdc531', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd77df40-1f67-4666-a14d-e6d3b6245dbf', $q$glide$q$, $q$Glide$q$, $q$https://www.glideapps.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd77df40-1f67-4666-a14d-e6d3b6245dbf', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd77df40-1f67-4666-a14d-e6d3b6245dbf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d3afb8a6-1eeb-4106-9923-58f01f27af75', $q$pika$q$, $q$Pika$q$, $q$https://pika.art$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd3afb8a6-1eeb-4106-9923-58f01f27af75', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3afb8a6-1eeb-4106-9923-58f01f27af75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$anyword$q$, $q$Anyword$q$, $q$https://anyword.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a8d65a51-2247-4b35-9d96-8e7e59545b78', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c1c11fd-4faf-4d6c-8f2f-a21304ececf9', $q$softr$q$, $q$Softr$q$, $q$https://www.softr.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c1c11fd-4faf-4d6c-8f2f-a21304ececf9', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c1c11fd-4faf-4d6c-8f2f-a21304ececf9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('35ea48fd-76db-4106-94b4-24dc1d80bfc9', $q$luma-ai$q$, $q$Luma AI$q$, $q$https://lumalabs.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '35ea48fd-76db-4106-94b4-24dc1d80bfc9', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35ea48fd-76db-4106-94b4-24dc1d80bfc9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab7b3699-804e-44f2-83c1-0814b44d388b', $q$frase$q$, $q$Frase$q$, $q$https://www.frase.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab7b3699-804e-44f2-83c1-0814b44d388b', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab7b3699-804e-44f2-83c1-0814b44d388b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$adalo$q$, $q$Adalo$q$, $q$https://www.adalo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2a1121c-315f-4076-816c-d10e98925f90', $q$kling-ai$q$, $q$Kling AI$q$, $q$https://klingai.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2a1121c-315f-4076-816c-d10e98925f90', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2a1121c-315f-4076-816c-d10e98925f90')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a009a42b-b701-46b1-bc27-3bc5f232d1f9', $q$surfer-seo$q$, $q$Surfer SEO$q$, $q$https://surferseo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a009a42b-b701-46b1-bc27-3bc5f232d1f9', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a009a42b-b701-46b1-bc27-3bc5f232d1f9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('395c608c-5d39-431e-9dd4-670981dd1352', $q$retool$q$, $q$Retool$q$, $q$https://retool.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '395c608c-5d39-431e-9dd4-670981dd1352', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '395c608c-5d39-431e-9dd4-670981dd1352')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe08bff8-895b-4ba9-9fcd-09e3e773bb57', $q$woocommerce$q$, $q$WooCommerce$q$, $q$https://woocommerce.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe08bff8-895b-4ba9-9fcd-09e3e773bb57', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe08bff8-895b-4ba9-9fcd-09e3e773bb57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b433c3e5-1372-4d99-8fbd-7702d9586534', $q$heygen$q$, $q$HeyGen$q$, $q$https://www.heygen.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b433c3e5-1372-4d99-8fbd-7702d9586534', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b433c3e5-1372-4d99-8fbd-7702d9586534')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7de794bf-b842-4128-82f7-b18545f5a992', $q$clearscope$q$, $q$Clearscope$q$, $q$https://www.clearscope.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7de794bf-b842-4128-82f7-b18545f5a992', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7de794bf-b842-4128-82f7-b18545f5a992')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$appsheet$q$, $q$AppSheet$q$, $q$https://about.appsheet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca9138f2-35fd-49cf-8af2-819fa2691854', $q$zoho-crm$q$, $q$Zoho CRM$q$, $q$https://www.zoho.com/crm/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca9138f2-35fd-49cf-8af2-819fa2691854', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca9138f2-35fd-49cf-8af2-819fa2691854')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c3103af2-b89a-4cb2-ac57-83030df19efa', $q$bigcommerce$q$, $q$BigCommerce$q$, $q$https://www.bigcommerce.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c3103af2-b89a-4cb2-ac57-83030df19efa', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3103af2-b89a-4cb2-ac57-83030df19efa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d46e98c7-b182-4988-9c3a-b509b0e2beff', $q$constant-contact$q$, $q$Constant Contact$q$, $q$https://www.constantcontact.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd46e98c7-b182-4988-9c3a-b509b0e2beff', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd46e98c7-b182-4988-9c3a-b509b0e2beff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5ac53984-b400-454f-baed-b707bfdb12ec', $q$synthesia$q$, $q$Synthesia$q$, $q$https://www.synthesia.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5ac53984-b400-454f-baed-b707bfdb12ec', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ac53984-b400-454f-baed-b707bfdb12ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b77c4b21-5cd3-47b0-a144-34c9f0369acb', $q$marketmuse$q$, $q$MarketMuse$q$, $q$https://www.marketmuse.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b77c4b21-5cd3-47b0-a144-34c9f0369acb', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b77c4b21-5cd3-47b0-a144-34c9f0369acb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f60ec8fa-b75a-462e-84f1-bc0d2d866e63', $q$microsoft-power-apps$q$, $q$Microsoft Power Apps$q$, $q$https://www.microsoft.com/power-platform/products/power-apps$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f60ec8fa-b75a-462e-84f1-bc0d2d866e63', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f60ec8fa-b75a-462e-84f1-bc0d2d866e63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e9f9ecc1-a538-4c7f-b987-67a12f749876', $q$pipedrive$q$, $q$Pipedrive$q$, $q$https://www.pipedrive.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e9f9ecc1-a538-4c7f-b987-67a12f749876', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9f9ecc1-a538-4c7f-b987-67a12f749876')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$visual-studio-code$q$, $q$Visual Studio Code$q$, $q$https://code.visualstudio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0d08d8f-1e51-4d00-986a-4e669f665333', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0d08d8f-1e51-4d00-986a-4e669f665333')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$brevo$q$, $q$Brevo$q$, $q$https://www.brevo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd2949bf-02b3-4401-a031-61e56f53b753', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd2949bf-02b3-4401-a031-61e56f53b753')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('38565ec2-30ed-445f-b1d3-7ebd8fe67504', $q$descript$q$, $q$Descript$q$, $q$https://www.descript.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '38565ec2-30ed-445f-b1d3-7ebd8fe67504', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38565ec2-30ed-445f-b1d3-7ebd8fe67504')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('55145ca3-38c5-472e-91e5-8e0f54c3f703', $q$neuronwriter$q$, $q$NeuronWriter$q$, $q$https://neuronwriter.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '55145ca3-38c5-472e-91e5-8e0f54c3f703', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '55145ca3-38c5-472e-91e5-8e0f54c3f703')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$appsmith$q$, $q$Appsmith$q$, $q$https://www.appsmith.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '769d68c4-6d5c-4d50-b613-c3ab3a76591a', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3791efda-beab-41cb-b03c-14070ac10a70', $q$freshsales$q$, $q$Freshsales$q$, $q$https://www.freshworks.com/crm/sales/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3791efda-beab-41cb-b03c-14070ac10a70', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3791efda-beab-41cb-b03c-14070ac10a70')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('421bda78-e5b8-4973-86a7-1481632d297e', $q$gorgias$q$, $q$Gorgias$q$, $q$https://www.gorgias.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '421bda78-e5b8-4973-86a7-1481632d297e', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '421bda78-e5b8-4973-86a7-1481632d297e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a5a9d90c-49e0-401c-af66-b1fa6982ad32', $q$jetbrains-intellij-idea$q$, $q$JetBrains IntelliJ IDEA$q$, $q$https://www.jetbrains.com/idea/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a5a9d90c-49e0-401c-af66-b1fa6982ad32', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5a9d90c-49e0-401c-af66-b1fa6982ad32')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2', $q$moz-pro$q$, $q$Moz Pro$q$, $q$https://moz.com/products/pro$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('800f1735-5876-4cb4-b6d8-d7bee24e7a9f', $q$elevenlabs$q$, $q$ElevenLabs$q$, $q$https://elevenlabs.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '800f1735-5876-4cb4-b6d8-d7bee24e7a9f', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '800f1735-5876-4cb4-b6d8-d7bee24e7a9f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d43520c9-b82b-4496-a05c-754885af835f', $q$scalenut$q$, $q$Scalenut$q$, $q$https://www.scalenut.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd43520c9-b82b-4496-a05c-754885af835f', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd43520c9-b82b-4496-a05c-754885af835f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('693230a0-d462-46dc-9108-9752df61caba', $q$cursor$q$, $q$Cursor$q$, $q$https://www.cursor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '693230a0-d462-46dc-9108-9752df61caba', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '693230a0-d462-46dc-9108-9752df61caba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('45cee20f-f1da-4f5d-86e5-485b9a0b34b6', $q$kustomer$q$, $q$Kustomer$q$, $q$https://www.kustomer.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '45cee20f-f1da-4f5d-86e5-485b9a0b34b6', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45cee20f-f1da-4f5d-86e5-485b9a0b34b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff342572-8c41-421f-88e9-ab4155b8dbbf', $q$postman$q$, $q$Postman$q$, $q$https://www.postman.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff342572-8c41-421f-88e9-ab4155b8dbbf', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff342572-8c41-421f-88e9-ab4155b8dbbf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('83a31e14-8b81-4e6f-bd44-bf1082ccd21f', $q$getresponse$q$, $q$GetResponse$q$, $q$https://www.getresponse.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '83a31e14-8b81-4e6f-bd44-bf1082ccd21f', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83a31e14-8b81-4e6f-bd44-bf1082ccd21f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d3a5907-52ea-4312-8ed3-6325f131fbef', $q$screaming-frog$q$, $q$Screaming Frog$q$, $q$https://www.screamingfrog.co.uk/seo-spider/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d3a5907-52ea-4312-8ed3-6325f131fbef', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d3a5907-52ea-4312-8ed3-6325f131fbef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e08399eb-07db-4b71-82b5-43cef3fcf199', $q$murf$q$, $q$Murf$q$, $q$https://murf.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e08399eb-07db-4b71-82b5-43cef3fcf199', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e08399eb-07db-4b71-82b5-43cef3fcf199')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca1d9da3-5f04-44f4-a493-8de2c1275125', $q$writer$q$, $q$Writer$q$, $q$https://writer.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca1d9da3-5f04-44f4-a493-8de2c1275125', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca1d9da3-5f04-44f4-a493-8de2c1275125')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('639091c6-3897-46d2-b20e-6a7dfd423bec', $q$monday-sales-crm$q$, $q$Monday Sales CRM$q$, $q$https://monday.com/crm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '639091c6-3897-46d2-b20e-6a7dfd423bec', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '639091c6-3897-46d2-b20e-6a7dfd423bec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$ubersuggest$q$, $q$Ubersuggest$q$, $q$https://neilpatel.com/ubersuggest/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bea45054-992b-496b-b59e-dba14e8219b6', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bea45054-992b-496b-b59e-dba14e8219b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$speechify$q$, $q$Speechify$q$, $q$https://speechify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ef381d0-f2eb-4c4f-bf13-583a63f2091b', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e0af591-0b3b-4416-988d-d1b31d3ab630', $q$hyperwrite$q$, $q$HyperWrite$q$, $q$https://www.hyperwriteai.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e0af591-0b3b-4416-988d-d1b31d3ab630', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e0af591-0b3b-4416-988d-d1b31d3ab630')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c628f71b-c0ff-42aa-87ea-a09dfbd28490', $q$replit$q$, $q$Replit$q$, $q$https://replit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c628f71b-c0ff-42aa-87ea-a09dfbd28490', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c628f71b-c0ff-42aa-87ea-a09dfbd28490')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca95321e-8259-4037-a292-11f90e6c3856', $q$copper$q$, $q$Copper$q$, $q$https://www.copper.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca95321e-8259-4037-a292-11f90e6c3856', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca95321e-8259-4037-a292-11f90e6c3856')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('74c8afcd-fff1-4116-8c21-aa7ea3ed5869', $q$zoho-desk$q$, $q$Zoho Desk$q$, $q$https://www.zoho.com/desk/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '74c8afcd-fff1-4116-8c21-aa7ea3ed5869', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74c8afcd-fff1-4116-8c21-aa7ea3ed5869')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0eb2413c-7ff7-4575-ac2b-3bd288d5a1e3', $q$framer$q$, $q$Framer$q$, $q$https://www.framer.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0eb2413c-7ff7-4575-ac2b-3bd288d5a1e3', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0eb2413c-7ff7-4575-ac2b-3bd288d5a1e3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$aweber$q$, $q$AWeber$q$, $q$https://www.aweber.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd5e3d2c-6ddc-4750-8bd5-ba653068f181', $q$se-ranking$q$, $q$SE Ranking$q$, $q$https://seranking.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd5e3d2c-6ddc-4750-8bd5-ba653068f181', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd5e3d2c-6ddc-4750-8bd5-ba653068f181')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$close$q$, $q$Close$q$, $q$https://www.close.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '63a64c42-cc4a-45fb-b461-783e43ab44aa', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63a64c42-cc4a-45fb-b461-783e43ab44aa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('00ba7518-5599-46d0-b82c-32563e1bac39', $q$livechat$q$, $q$LiveChat$q$, $q$https://www.livechat.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '00ba7518-5599-46d0-b82c-32563e1bac39', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00ba7518-5599-46d0-b82c-32563e1bac39')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0091d0a1-3952-450b-b212-e0a36e137352', $q$weebly$q$, $q$Weebly$q$, $q$https://www.weebly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0091d0a1-3952-450b-b212-e0a36e137352', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0091d0a1-3952-450b-b212-e0a36e137352')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('381765dd-2a06-4f6d-87c2-9252da262faf', $q$drip$q$, $q$Drip$q$, $q$https://www.drip.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '381765dd-2a06-4f6d-87c2-9252da262faf', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '381765dd-2a06-4f6d-87c2-9252da262faf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1677b9b7-dd62-421f-95ae-ac5647c1cc29', $q$mangools$q$, $q$Mangools$q$, $q$https://mangools.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1677b9b7-dd62-421f-95ae-ac5647c1cc29', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1677b9b7-dd62-421f-95ae-ac5647c1cc29')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e511c2d2-ceea-48e2-bbc6-ea875df08668', $q$insightly$q$, $q$Insightly$q$, $q$https://www.insightly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e511c2d2-ceea-48e2-bbc6-ea875df08668', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e511c2d2-ceea-48e2-bbc6-ea875df08668')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6e610684-65a5-4699-9418-e1149b45dc11', $q$tidio$q$, $q$Tidio$q$, $q$https://www.tidio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6e610684-65a5-4699-9418-e1149b45dc11', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e610684-65a5-4699-9418-e1149b45dc11')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26474910-f9a4-4767-aebb-d9caf5983498', $q$netlify$q$, $q$Netlify$q$, $q$https://www.netlify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26474910-f9a4-4767-aebb-d9caf5983498', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26474910-f9a4-4767-aebb-d9caf5983498')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d3da374-bd31-46df-a1d1-306837c8aaf8', $q$godaddy-website-builder$q$, $q$GoDaddy Website Builder$q$, $q$https://www.godaddy.com/websites/website-builder$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d3da374-bd31-46df-a1d1-306837c8aaf8', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d3da374-bd31-46df-a1d1-306837c8aaf8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb14d50a-e3a5-457e-8b21-c45cdda89d54', $q$mailerlite$q$, $q$MailerLite$q$, $q$https://www.mailerlite.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb14d50a-e3a5-457e-8b21-c45cdda89d54', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb14d50a-e3a5-457e-8b21-c45cdda89d54')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f4b7a227-b58a-4c5d-b4e2-c8b940afb795', $q$serpstat$q$, $q$Serpstat$q$, $q$https://serpstat.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f4b7a227-b58a-4c5d-b4e2-c8b940afb795', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4b7a227-b58a-4c5d-b4e2-c8b940afb795')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e36dac6a-4141-4189-8ee8-eb6f2ed8f21f', $q$keap$q$, $q$Keap$q$, $q$https://keap.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e36dac6a-4141-4189-8ee8-eb6f2ed8f21f', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e36dac6a-4141-4189-8ee8-eb6f2ed8f21f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b1f76735-5538-4701-8d39-11c92919d1d4', $q$crisp$q$, $q$Crisp$q$, $q$https://crisp.chat$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b1f76735-5538-4701-8d39-11c92919d1d4', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1f76735-5538-4701-8d39-11c92919d1d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1a2fc4b5-8703-4434-a8f7-702d91a3ded6', $q$duda$q$, $q$Duda$q$, $q$https://www.duda.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1a2fc4b5-8703-4434-a8f7-702d91a3ded6', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a2fc4b5-8703-4434-a8f7-702d91a3ded6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f19864e7-5001-4ebd-84f9-5bb40f1b4b22', $q$campaign-monitor$q$, $q$Campaign Monitor$q$, $q$https://www.campaignmonitor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f19864e7-5001-4ebd-84f9-5bb40f1b4b22', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f19864e7-5001-4ebd-84f9-5bb40f1b4b22')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ec8c9fb-dc39-4341-8a0f-b8c3e18a508d', $q$similarweb$q$, $q$Similarweb$q$, $q$https://www.similarweb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ec8c9fb-dc39-4341-8a0f-b8c3e18a508d', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ec8c9fb-dc39-4341-8a0f-b8c3e18a508d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d81fd94a-547f-4b52-8585-6375a6414c6d', $q$dropbox-sign$q$, $q$Dropbox Sign$q$, $q$https://sign.dropbox.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd81fd94a-547f-4b52-8585-6375a6414c6d', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd81fd94a-547f-4b52-8585-6375a6414c6d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2713c5df-5f0a-4c25-8922-9c315b9b040b', $q$smartsheet$q$, $q$Smartsheet$q$, $q$https://www.smartsheet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2713c5df-5f0a-4c25-8922-9c315b9b040b', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2713c5df-5f0a-4c25-8922-9c315b9b040b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$sprout-social$q$, $q$Sprout Social$q$, $q$https://sproutsocial.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f3558245-b91d-4875-b0dc-3842ac4f3805', $q$nimble$q$, $q$Nimble$q$, $q$https://www.nimble.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f3558245-b91d-4875-b0dc-3842ac4f3805', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3558245-b91d-4875-b0dc-3842ac4f3805')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('96c3ecf0-fcaf-4131-91d0-08ec9da68acf', $q$olark$q$, $q$Olark$q$, $q$https://www.olark.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '96c3ecf0-fcaf-4131-91d0-08ec9da68acf', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96c3ecf0-fcaf-4131-91d0-08ec9da68acf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a4b8ce3e-bd25-4482-8847-63041b2784ea', $q$magento-open-source$q$, $q$Magento Open Source$q$, $q$https://business.adobe.com/products/magento/open-source.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a4b8ce3e-bd25-4482-8847-63041b2784ea', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4b8ce3e-bd25-4482-8847-63041b2784ea')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('902d8b1b-af39-4cdf-a2b7-db0c5672b059', $q$omnisend$q$, $q$Omnisend$q$, $q$https://www.omnisend.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '902d8b1b-af39-4cdf-a2b7-db0c5672b059', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '902d8b1b-af39-4cdf-a2b7-db0c5672b059')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65ed3bfb-065e-4391-8e0f-5ffc7b205daa', $q$hotjar$q$, $q$Hotjar$q$, $q$https://www.hotjar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65ed3bfb-065e-4391-8e0f-5ffc7b205daa', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65ed3bfb-065e-4391-8e0f-5ffc7b205daa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5e2d12b-a101-4a07-8262-007ffad934e6', $q$wave$q$, $q$Wave$q$, $q$https://www.waveapps.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5e2d12b-a101-4a07-8262-007ffad934e6', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5e2d12b-a101-4a07-8262-007ffad934e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d4a5fa48-12d7-422f-9252-b7bea83b9ff4', $q$wrike$q$, $q$Wrike$q$, $q$https://www.wrike.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd4a5fa48-12d7-422f-9252-b7bea83b9ff4', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4a5fa48-12d7-422f-9252-b7bea83b9ff4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('34b4f794-ce37-4598-b6e9-fe9e9269a4c8', $q$later$q$, $q$Later$q$, $q$https://later.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '34b4f794-ce37-4598-b6e9-fe9e9269a4c8', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34b4f794-ce37-4598-b6e9-fe9e9269a4c8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$sugarcrm$q$, $q$SugarCRM$q$, $q$https://www.sugarcrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1f2610a4-32aa-4b86-8154-68ef806123a9', $q$happyfox$q$, $q$HappyFox$q$, $q$https://www.happyfox.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1f2610a4-32aa-4b86-8154-68ef806123a9', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f2610a4-32aa-4b86-8154-68ef806123a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6807ab40-552b-4044-8610-c58acf04855d', $q$prestashop$q$, $q$PrestaShop$q$, $q$https://www.prestashop.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6807ab40-552b-4044-8610-c58acf04855d', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6807ab40-552b-4044-8610-c58acf04855d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5bf89844-295b-44a9-b875-c4f86ae4f19d', $q$moosend$q$, $q$Moosend$q$, $q$https://moosend.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5bf89844-295b-44a9-b875-c4f86ae4f19d', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5bf89844-295b-44a9-b875-c4f86ae4f19d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b89d9029-ae3f-4881-beeb-41c427d2ace5', $q$microsoft-clarity$q$, $q$Microsoft Clarity$q$, $q$https://clarity.microsoft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b89d9029-ae3f-4881-beeb-41c427d2ace5', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b89d9029-ae3f-4881-beeb-41c427d2ace5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$signnow$q$, $q$SignNow$q$, $q$https://www.signnow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('970dd292-16fa-475f-996d-e50070df18a1', $q$zoho-books$q$, $q$Zoho Books$q$, $q$https://www.zoho.com/books/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '970dd292-16fa-475f-996d-e50070df18a1', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '970dd292-16fa-475f-996d-e50070df18a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$socialbee$q$, $q$SocialBee$q$, $q$https://socialbee.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '57763ac9-8244-4ff8-8a06-376f30693d6f', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57763ac9-8244-4ff8-8a06-376f30693d6f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab650234-f963-4681-8c8b-6976b1473d49', $q$zendesk-sell$q$, $q$Zendesk Sell$q$, $q$https://www.zendesk.com/sell/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab650234-f963-4681-8c8b-6976b1473d49', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab650234-f963-4681-8c8b-6976b1473d49')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d6c043af-953c-4969-8e51-48311abc4eac', $q$kayako$q$, $q$Kayako$q$, $q$https://www.kayako.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd6c043af-953c-4969-8e51-48311abc4eac', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6c043af-953c-4969-8e51-48311abc4eac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('37d9ac64-b7a8-413c-8a11-4db621fc9e33', $q$ecwid$q$, $q$Ecwid$q$, $q$https://www.ecwid.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '37d9ac64-b7a8-413c-8a11-4db621fc9e33', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37d9ac64-b7a8-413c-8a11-4db621fc9e33')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('92d699c1-88c8-4560-8348-409710af3ec5', $q$foxit-pdf-editor$q$, $q$Foxit PDF Editor$q$, $q$https://www.foxit.com/pdf-editor/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '92d699c1-88c8-4560-8348-409710af3ec5', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '92d699c1-88c8-4560-8348-409710af3ec5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f4698c6b-f210-42dd-bcc1-bc0d8ae274f3', $q$sage-accounting$q$, $q$Sage Accounting$q$, $q$https://www.sage.com/en-us/products/sage-accounting/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f4698c6b-f210-42dd-bcc1-bc0d8ae274f3', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4698c6b-f210-42dd-bcc1-bc0d8ae274f3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff2a2bb2-265f-4fb2-8b9b-06a77db11584', $q$teamwork$q$, $q$Teamwork$q$, $q$https://www.teamwork.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff2a2bb2-265f-4fb2-8b9b-06a77db11584', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff2a2bb2-265f-4fb2-8b9b-06a77db11584')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$agorapulse$q$, $q$Agorapulse$q$, $q$https://www.agorapulse.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28b4fd37-f4bf-45ce-950f-1137fe952d9e', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$apptivo$q$, $q$Apptivo$q$, $q$https://www.apptivo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '943e842e-ea6b-423a-ad07-1657fff38f93', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '943e842e-ea6b-423a-ad07-1657fff38f93')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7e2a4455-43c7-4157-9b84-0b155a37c0a1', $q$jira-service-management$q$, $q$Jira Service Management$q$, $q$https://www.atlassian.com/software/jira/service-management$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7e2a4455-43c7-4157-9b84-0b155a37c0a1', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e2a4455-43c7-4157-9b84-0b155a37c0a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba98f35c-82a6-4687-8668-be82a6c21e8d', $q$digitalocean$q$, $q$DigitalOcean$q$, $q$https://www.digitalocean.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba98f35c-82a6-4687-8668-be82a6c21e8d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba98f35c-82a6-4687-8668-be82a6c21e8d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c936aee7-ae75-49ba-bdd8-c809f3dbe535', $q$sellfy$q$, $q$Sellfy$q$, $q$https://sellfy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c936aee7-ae75-49ba-bdd8-c809f3dbe535', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c936aee7-ae75-49ba-bdd8-c809f3dbe535')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd78a231-31fa-4eb1-8802-93fe59f582da', $q$marketo-engage$q$, $q$Marketo Engage$q$, $q$https://business.adobe.com/products/marketo/adobe-marketo.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd78a231-31fa-4eb1-8802-93fe59f582da', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd78a231-31fa-4eb1-8802-93fe59f582da')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b704ca00-ce10-434d-b1f3-abb303ffa4e4', $q$nitro-pdf-pro$q$, $q$Nitro PDF Pro$q$, $q$https://www.gonitro.com/pdf-pro$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b704ca00-ce10-434d-b1f3-abb303ffa4e4', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b704ca00-ce10-434d-b1f3-abb303ffa4e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('96b25c45-e39f-4efc-ab12-25f3b2c786c6', $q$zoho-projects$q$, $q$Zoho Projects$q$, $q$https://www.zoho.com/projects/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '96b25c45-e39f-4efc-ab12-25f3b2c786c6', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96b25c45-e39f-4efc-ab12-25f3b2c786c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('71aee4e7-d181-4086-ac46-c52b1a6ba51e', $q$sendible$q$, $q$Sendible$q$, $q$https://www.sendible.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '71aee4e7-d181-4086-ac46-c52b1a6ba51e', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71aee4e7-d181-4086-ac46-c52b1a6ba51e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('584e1528-a367-458c-a4fb-954e6f1d06c4', $q$salesflare$q$, $q$Salesflare$q$, $q$https://salesflare.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '584e1528-a367-458c-a4fb-954e6f1d06c4', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '584e1528-a367-458c-a4fb-954e6f1d06c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('34fac46a-38d6-4512-b24c-19e0f5439125', $q$heroku$q$, $q$Heroku$q$, $q$https://www.heroku.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '34fac46a-38d6-4512-b24c-19e0f5439125', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34fac46a-38d6-4512-b24c-19e0f5439125')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3755468e-f104-4abb-9bde-b2e658eb3053', $q$gumroad$q$, $q$Gumroad$q$, $q$https://gumroad.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3755468e-f104-4abb-9bde-b2e658eb3053', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3755468e-f104-4abb-9bde-b2e658eb3053')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2c65cc7-4f96-4e51-91e3-3da83872e2cd', $q$pardot$q$, $q$Pardot$q$, $q$https://www.salesforce.com/marketing/b2b-automation/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2c65cc7-4f96-4e51-91e3-3da83872e2cd', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2c65cc7-4f96-4e51-91e3-3da83872e2cd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cba47027-91c4-4aeb-adf8-67c52b50f458', $q$heap$q$, $q$Heap$q$, $q$https://heap.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cba47027-91c4-4aeb-adf8-67c52b50f458', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cba47027-91c4-4aeb-adf8-67c52b50f458')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba837227-8967-47be-bd65-e9a86eafe9e3', $q$smallpdf$q$, $q$Smallpdf$q$, $q$https://smallpdf.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba837227-8967-47be-bd65-e9a86eafe9e3', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba837227-8967-47be-bd65-e9a86eafe9e3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c0078b68-a3db-4bd7-a30e-97b858ae7f1e', $q$microsoft-project$q$, $q$Microsoft Project$q$, $q$https://www.microsoft.com/microsoft-365/project/project-management-software$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c0078b68-a3db-4bd7-a30e-97b858ae7f1e', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0078b68-a3db-4bd7-a30e-97b858ae7f1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0af4f822-0c8a-4a66-b0ae-4dcb5e2d9f6b', $q$metricool$q$, $q$Metricool$q$, $q$https://metricool.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0af4f822-0c8a-4a66-b0ae-4dcb5e2d9f6b', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0af4f822-0c8a-4a66-b0ae-4dcb5e2d9f6b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('40bbcaf4-84e3-47b8-9d27-074bedb96236', $q$ilovepdf$q$, $q$iLovePDF$q$, $q$https://www.ilovepdf.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '40bbcaf4-84e3-47b8-9d27-074bedb96236', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40bbcaf4-84e3-47b8-9d27-074bedb96236')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5b7732f8-9233-468e-8b6e-92b089440d94', $q$odoo-accounting$q$, $q$Odoo Accounting$q$, $q$https://www.odoo.com/app/accounting$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5b7732f8-9233-468e-8b6e-92b089440d94', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b7732f8-9233-468e-8b6e-92b089440d94')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e762d0b5-3f6a-4165-89d8-5d2a4889217d', $q$linear$q$, $q$Linear$q$, $q$https://linear.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e762d0b5-3f6a-4165-89d8-5d2a4889217d', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e762d0b5-3f6a-4165-89d8-5d2a4889217d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b8a0924-eba0-43ca-b6e5-f3c97392c07e', $q$loomly$q$, $q$Loomly$q$, $q$https://www.loomly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b8a0924-eba0-43ca-b6e5-f3c97392c07e', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b8a0924-eba0-43ca-b6e5-f3c97392c07e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('db6b7ee1-78f4-46e7-8173-0f395de936ba', $q$google-forms$q$, $q$Google Forms$q$, $q$https://forms.google.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'db6b7ee1-78f4-46e7-8173-0f395de936ba', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db6b7ee1-78f4-46e7-8173-0f395de936ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('727ce456-3ada-4396-a467-30164d11f40e', $q$clockify$q$, $q$Clockify$q$, $q$https://clockify.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '727ce456-3ada-4396-a467-30164d11f40e', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '727ce456-3ada-4396-a467-30164d11f40e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e66e1448-1366-4bae-8a4e-3bcd643199a5', $q$pdfescape$q$, $q$PDFescape$q$, $q$https://www.pdfescape.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e66e1448-1366-4bae-8a4e-3bcd643199a5', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e66e1448-1366-4bae-8a4e-3bcd643199a5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('711daa05-d514-411e-aebb-2efdcb754ed0', $q$height$q$, $q$Height$q$, $q$https://height.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '711daa05-d514-411e-aebb-2efdcb754ed0', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '711daa05-d514-411e-aebb-2efdcb754ed0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e279aac8-93be-4884-86b3-544687f01909', $q$publer$q$, $q$Publer$q$, $q$https://publer.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e279aac8-93be-4884-86b3-544687f01909', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e279aac8-93be-4884-86b3-544687f01909')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$bamboohr$q$, $q$BambooHR$q$, $q$https://www.bamboohr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'adb39746-99f6-497c-bc76-0bb5b5de259e', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'adb39746-99f6-497c-bc76-0bb5b5de259e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e533002d-957b-4a75-967f-c0c9aa3c3fc4', $q$sejda-pdf$q$, $q$Sejda PDF$q$, $q$https://www.sejda.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e533002d-957b-4a75-967f-c0c9aa3c3fc4', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e533002d-957b-4a75-967f-c0c9aa3c3fc4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$shortcut$q$, $q$Shortcut$q$, $q$https://shortcut.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b1c88fdc-36c0-46b6-b18f-74a4330788d4', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$vista-social$q$, $q$Vista Social$q$, $q$https://vistasocial.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '10056aba-b816-4765-8bc7-9b81336ea50d', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10056aba-b816-4765-8bc7-9b81336ea50d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f1fa4604-a254-46d0-ac89-4c0c21148bf3', $q$looker$q$, $q$Looker$q$, $q$https://cloud.google.com/looker$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f1fa4604-a254-46d0-ac89-4c0c21148bf3', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1fa4604-a254-46d0-ac89-4c0c21148bf3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7f58ae22-1c44-4f9a-9b61-75861272aaaa', $q$rippling$q$, $q$Rippling$q$, $q$https://www.rippling.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7f58ae22-1c44-4f9a-9b61-75861272aaaa', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f58ae22-1c44-4f9a-9b61-75861272aaaa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6e652351-8445-42ef-91dd-ddbf6f9320b4', $q$bitwarden$q$, $q$Bitwarden$q$, $q$https://bitwarden.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6e652351-8445-42ef-91dd-ddbf6f9320b4', 'b865921b-9127-4f50-9377-584609fe2f7f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e652351-8445-42ef-91dd-ddbf6f9320b4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1f11dc1a-4647-48d8-94d1-00190d730c59', $q$pdf-expert$q$, $q$PDF Expert$q$, $q$https://pdfexpert.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1f11dc1a-4647-48d8-94d1-00190d730c59', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f11dc1a-4647-48d8-94d1-00190d730c59')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2160b497-eee0-445d-8e03-8e017410723b', $q$proofhub$q$, $q$ProofHub$q$, $q$https://www.proofhub.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2160b497-eee0-445d-8e03-8e017410723b', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2160b497-eee0-445d-8e03-8e017410723b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d33a449d-fed5-4373-8185-a70d16979e8b', $q$planable$q$, $q$Planable$q$, $q$https://planable.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd33a449d-fed5-4373-8185-a70d16979e8b', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd33a449d-fed5-4373-8185-a70d16979e8b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('94b9a1ae-427d-49ec-bb26-75d68dd17562', $q$qlik-sense$q$, $q$Qlik Sense$q$, $q$https://www.qlik.com/us/products/qlik-sense$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '94b9a1ae-427d-49ec-bb26-75d68dd17562', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94b9a1ae-427d-49ec-bb26-75d68dd17562')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bd5a4743-03ea-4f41-9507-17a3a9f17894', $q$jotform$q$, $q$Jotform$q$, $q$https://www.jotform.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bd5a4743-03ea-4f41-9507-17a3a9f17894', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd5a4743-03ea-4f41-9507-17a3a9f17894')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ba3ae79-2d46-4049-881a-4cf6417f0f42', $q$deel$q$, $q$Deel$q$, $q$https://www.deel.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ba3ae79-2d46-4049-881a-4cf6417f0f42', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ba3ae79-2d46-4049-881a-4cf6417f0f42')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7ad17c3-2624-42dd-affe-a2105bd2af56', $q$time-doctor$q$, $q$Time Doctor$q$, $q$https://www.timedoctor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7ad17c3-2624-42dd-affe-a2105bd2af56', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7ad17c3-2624-42dd-affe-a2105bd2af56')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4504a9e9-0f49-455b-ad80-15afb8c4139d', $q$dashlane$q$, $q$Dashlane$q$, $q$https://www.dashlane.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4504a9e9-0f49-455b-ad80-15afb8c4139d', 'b865921b-9127-4f50-9377-584609fe2f7f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4504a9e9-0f49-455b-ad80-15afb8c4139d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$soda-pdf$q$, $q$Soda PDF$q$, $q$https://www.sodapdf.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d012baf-f581-41bc-84f4-cdf167ff2fba', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d012baf-f581-41bc-84f4-cdf167ff2fba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('336862e5-da77-44d8-bed2-981fb6c31cb8', $q$ntask$q$, $q$nTask$q$, $q$https://www.ntaskmanager.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '336862e5-da77-44d8-bed2-981fb6c31cb8', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '336862e5-da77-44d8-bed2-981fb6c31cb8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f42fa8e7-bc0e-4925-ad0e-d76d032684c0', $q$tailwind$q$, $q$Tailwind$q$, $q$https://www.tailwindapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f42fa8e7-bc0e-4925-ad0e-d76d032684c0', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f42fa8e7-bc0e-4925-ad0e-d76d032684c0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e2f3e916-a6c5-4d8f-9d3a-df43e916f33c', $q$domo$q$, $q$Domo$q$, $q$https://www.domo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e2f3e916-a6c5-4d8f-9d3a-df43e916f33c', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2f3e916-a6c5-4d8f-9d3a-df43e916f33c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f9b2788d-5b29-41aa-b1ae-b0abdc9d06ec', $q$microsoft-forms$q$, $q$Microsoft Forms$q$, $q$https://forms.microsoft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f9b2788d-5b29-41aa-b1ae-b0abdc9d06ec', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9b2788d-5b29-41aa-b1ae-b0abdc9d06ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ad16437d-1117-4ccd-976f-2e70d7ae268c', $q$remote$q$, $q$Remote$q$, $q$https://remote.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ad16437d-1117-4ccd-976f-2e70d7ae268c', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad16437d-1117-4ccd-976f-2e70d7ae268c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a1260e7-5c8c-4d8c-bcb5-ddf9865100d6', $q$hubstaff$q$, $q$Hubstaff$q$, $q$https://hubstaff.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a1260e7-5c8c-4d8c-bcb5-ddf9865100d6', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a1260e7-5c8c-4d8c-bcb5-ddf9865100d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a6135772-7dd2-43ef-9ed6-959bed72bcfd', $q$nordpass$q$, $q$NordPass$q$, $q$https://nordpass.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a6135772-7dd2-43ef-9ed6-959bed72bcfd', 'b865921b-9127-4f50-9377-584609fe2f7f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6135772-7dd2-43ef-9ed6-959bed72bcfd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d074be80-8a70-4e05-b0ba-7f4e75eb95d5', $q$dochub$q$, $q$DocHub$q$, $q$https://www.dochub.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd074be80-8a70-4e05-b0ba-7f4e75eb95d5', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd074be80-8a70-4e05-b0ba-7f4e75eb95d5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e05880b5-22df-4a10-a038-632711020632', $q$hive$q$, $q$Hive$q$, $q$https://hive.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e05880b5-22df-4a10-a038-632711020632', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e05880b5-22df-4a10-a038-632711020632')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0bab077d-6e0b-45aa-9bbf-e0c11e6547d8', $q$zoho-social$q$, $q$Zoho Social$q$, $q$https://www.zoho.com/social/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0bab077d-6e0b-45aa-9bbf-e0c11e6547d8', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0bab077d-6e0b-45aa-9bbf-e0c11e6547d8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aec91730-c8dd-4844-8f50-8eb053c6b5c4', $q$sisense$q$, $q$Sisense$q$, $q$https://www.sisense.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aec91730-c8dd-4844-8f50-8eb053c6b5c4', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aec91730-c8dd-4844-8f50-8eb053c6b5c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65992870-15b8-4319-a2e6-b0c8037a92bf', $q$tally$q$, $q$Tally$q$, $q$https://tally.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65992870-15b8-4319-a2e6-b0c8037a92bf', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65992870-15b8-4319-a2e6-b0c8037a92bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ed578b8-4db9-4fce-98af-7a24c8e0021c', $q$personio$q$, $q$Personio$q$, $q$https://www.personio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ed578b8-4db9-4fce-98af-7a24c8e0021c', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ed578b8-4db9-4fce-98af-7a24c8e0021c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('60589788-e511-45e9-b6b4-e65384870261', $q$rescuetime$q$, $q$RescueTime$q$, $q$https://www.rescuetime.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '60589788-e511-45e9-b6b4-e65384870261', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60589788-e511-45e9-b6b4-e65384870261')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb3933a8-b7e0-4fcb-a19a-28725cbedc5d', $q$keeper$q$, $q$Keeper$q$, $q$https://www.keepersecurity.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb3933a8-b7e0-4fcb-a19a-28725cbedc5d', 'b865921b-9127-4f50-9377-584609fe2f7f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb3933a8-b7e0-4fcb-a19a-28725cbedc5d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6897dd1f-98ec-4f63-aeb4-0b690c857608', $q$jotform-sign$q$, $q$Jotform Sign$q$, $q$https://www.jotform.com/products/sign/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6897dd1f-98ec-4f63-aeb4-0b690c857608', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6897dd1f-98ec-4f63-aeb4-0b690c857608')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b5ae9c91-1ca9-4659-9b00-8decefc6bfbb', $q$freedcamp$q$, $q$Freedcamp$q$, $q$https://freedcamp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b5ae9c91-1ca9-4659-9b00-8decefc6bfbb', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5ae9c91-1ca9-4659-9b00-8decefc6bfbb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76c85988-2b96-4585-b424-bd7aa44ecb82', $q$brandwatch$q$, $q$Brandwatch$q$, $q$https://www.brandwatch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76c85988-2b96-4585-b424-bd7aa44ecb82', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76c85988-2b96-4585-b424-bd7aa44ecb82')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b3f994ed-6c32-4065-b748-3f9cadf0652e', $q$paperform$q$, $q$Paperform$q$, $q$https://paperform.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b3f994ed-6c32-4065-b748-3f9cadf0652e', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3f994ed-6c32-4065-b748-3f9cadf0652e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('113b6907-6942-4e86-a060-16d7decf6a9f', $q$hibob$q$, $q$HiBob$q$, $q$https://www.hibob.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '113b6907-6942-4e86-a060-16d7decf6a9f', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '113b6907-6942-4e86-a060-16d7decf6a9f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ebc6d4d6-9473-4cc7-b9e8-18f595f9b246', $q$deputy$q$, $q$Deputy$q$, $q$https://www.deputy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3030433b-3418-43ac-aa59-beb69c92a481', $q$okta$q$, $q$Okta$q$, $q$https://www.okta.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3030433b-3418-43ac-aa59-beb69c92a481', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3030433b-3418-43ac-aa59-beb69c92a481')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95f3299d-181e-4436-824f-a995c9317a92', $q$proposify$q$, $q$Proposify$q$, $q$https://www.proposify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95f3299d-181e-4436-824f-a995c9317a92', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95f3299d-181e-4436-824f-a995c9317a92')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bec0d6fd-87d3-42f0-99a3-c8210c0e6b88', $q$workfront$q$, $q$Workfront$q$, $q$https://business.adobe.com/products/workfront/adobe-workfront.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bec0d6fd-87d3-42f0-99a3-c8210c0e6b88', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bec0d6fd-87d3-42f0-99a3-c8210c0e6b88')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('697e3318-d5de-4b30-adef-f66e599b0f6d', $q$mention$q$, $q$Mention$q$, $q$https://mention.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '697e3318-d5de-4b30-adef-f66e599b0f6d', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '697e3318-d5de-4b30-adef-f66e599b0f6d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1a437a0b-2569-49db-aa44-9626350f97d5', $q$grafana$q$, $q$Grafana$q$, $q$https://grafana.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1a437a0b-2569-49db-aa44-9626350f97d5', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a437a0b-2569-49db-aa44-9626350f97d5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('106def15-bc26-47dd-b9c7-dbb691ff1a8c', $q$wufoo$q$, $q$Wufoo$q$, $q$https://www.wufoo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '106def15-bc26-47dd-b9c7-dbb691ff1a8c', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '106def15-bc26-47dd-b9c7-dbb691ff1a8c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$adp-workforce-now$q$, $q$ADP Workforce Now$q$, $q$https://www.adp.com/what-we-offer/products/adp-workforce-now.aspx$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '21bdfa23-af5d-4b48-9a08-e0e8a30bd531', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e8b0c5f-bbcf-4d83-aace-f29444c38a5d', $q$when-i-work$q$, $q$When I Work$q$, $q$https://wheniwork.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$auth0$q$, $q$Auth0$q$, $q$https://auth0.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('548f9382-785a-42f4-972b-c64402b145c7', $q$snowflake$q$, $q$Snowflake$q$, $q$https://www.snowflake.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '548f9382-785a-42f4-972b-c64402b145c7', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '548f9382-785a-42f4-972b-c64402b145c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e0d19f35-3b93-4946-be3c-8f0848baac1e', $q$formstack$q$, $q$Formstack$q$, $q$https://www.formstack.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e0d19f35-3b93-4946-be3c-8f0848baac1e', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0d19f35-3b93-4946-be3c-8f0848baac1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2f5ec638-3b36-43dd-9893-d9d2465f2931', $q$paychex-flex$q$, $q$Paychex Flex$q$, $q$https://www.paychex.com/payroll/paychex-flex$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2f5ec638-3b36-43dd-9893-d9d2465f2931', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f5ec638-3b36-43dd-9893-d9d2465f2931')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('46a737e0-4328-492f-9496-68cfcc4a09f1', $q$homebase$q$, $q$Homebase$q$, $q$https://joinhomebase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '46a737e0-4328-492f-9496-68cfcc4a09f1', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46a737e0-4328-492f-9496-68cfcc4a09f1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('71439181-0154-4626-9efe-059864fd8420', $q$microsoft-entra-id$q$, $q$Microsoft Entra ID$q$, $q$https://www.microsoft.com/security/business/identity-access/microsoft-entra-id$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '71439181-0154-4626-9efe-059864fd8420', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71439181-0154-4626-9efe-059864fd8420')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('da3ec484-b729-46bf-a035-975b4975e2d9', $q$moodle$q$, $q$Moodle$q$, $q$https://moodle.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'da3ec484-b729-46bf-a035-975b4975e2d9', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da3ec484-b729-46bf-a035-975b4975e2d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de4e2a22-9bfb-45e0-b729-a24052dd6bfc', $q$wetransfer$q$, $q$WeTransfer$q$, $q$https://wetransfer.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c1f93663-fc76-4430-8326-61a4f8cb731a', $q$simplepractice$q$, $q$SimplePractice$q$, $q$https://www.simplepractice.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c1f93663-fc76-4430-8326-61a4f8cb731a', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1f93663-fc76-4430-8326-61a4f8cb731a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a9597db-c7eb-4543-a969-70c7a5b25c4e', $q$clio$q$, $q$Clio$q$, $q$https://www.clio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a9597db-c7eb-4543-a969-70c7a5b25c4e', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bc3b8540-7633-45e3-8bb9-3540341f319d', $q$procore$q$, $q$Procore$q$, $q$https://www.procore.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bc3b8540-7633-45e3-8bb9-3540341f319d', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bc3b8540-7633-45e3-8bb9-3540341f319d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6868389-8d0e-4fab-b74c-b58f1badba46', $q$goto-meeting$q$, $q$GoTo Meeting$q$, $q$https://www.goto.com/meeting$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6868389-8d0e-4fab-b74c-b58f1badba46', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6868389-8d0e-4fab-b74c-b58f1badba46')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2e3ae148-915e-4e17-8568-b7b871d77ebd', $q$databricks$q$, $q$Databricks$q$, $q$https://www.databricks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2e3ae148-915e-4e17-8568-b7b871d77ebd', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2e3ae148-915e-4e17-8568-b7b871d77ebd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d0cb449-bb08-4c54-9e30-c13e9e4fee0c', $q$cognito-forms$q$, $q$Cognito Forms$q$, $q$https://www.cognitoforms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d0cb449-bb08-4c54-9e30-c13e9e4fee0c', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d0cb449-bb08-4c54-9e30-c13e9e4fee0c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('732bd846-a2ef-4fbe-a773-dbbef676dd2d', $q$paylocity$q$, $q$Paylocity$q$, $q$https://www.paylocity.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '732bd846-a2ef-4fbe-a773-dbbef676dd2d', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '732bd846-a2ef-4fbe-a773-dbbef676dd2d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4e050c32-d03f-48b8-8e78-e896adddf250', $q$connecteam$q$, $q$Connecteam$q$, $q$https://connecteam.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4e050c32-d03f-48b8-8e78-e896adddf250', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e050c32-d03f-48b8-8e78-e896adddf250')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('44c37134-11ad-4612-bb00-c445b91881e5', $q$crowdstrike-falcon$q$, $q$CrowdStrike Falcon$q$, $q$https://www.crowdstrike.com/platform/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '44c37134-11ad-4612-bb00-c445b91881e5', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44c37134-11ad-4612-bb00-c445b91881e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('92a082b4-89b7-491c-a783-39088d0397e1', $q$ringcentral$q$, $q$RingCentral$q$, $q$https://www.ringcentral.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '92a082b4-89b7-491c-a783-39088d0397e1', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '92a082b4-89b7-491c-a783-39088d0397e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2db842ea-f8cf-4398-9294-2de09ec16c62', $q$canvas-lms$q$, $q$Canvas LMS$q$, $q$https://www.instructure.com/canvas$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2db842ea-f8cf-4398-9294-2de09ec16c62', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2db842ea-f8cf-4398-9294-2de09ec16c62')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d8614e8-6ffd-43b6-a2a4-26fe4217c0bd', $q$google-cloud-storage$q$, $q$Google Cloud Storage$q$, $q$https://cloud.google.com/storage$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d8614e8-6ffd-43b6-a2a4-26fe4217c0bd', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d8614e8-6ffd-43b6-a2a4-26fe4217c0bd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$athenaone$q$, $q$athenaOne$q$, $q$https://www.athenahealth.com/solutions/athenaone$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2debbb6c-85ad-4634-b256-8049d7c1bd11', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2debbb6c-85ad-4634-b256-8049d7c1bd11')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4459135-cfd3-4027-bdc1-046357985283', $q$mycase$q$, $q$MyCase$q$, $q$https://www.mycase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4459135-cfd3-4027-bdc1-046357985283', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4459135-cfd3-4027-bdc1-046357985283')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$buildertrend$q$, $q$Buildertrend$q$, $q$https://buildertrend.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb9ac50a-5d37-4f5c-a9c6-8693d7deb334', $q$bigquery$q$, $q$BigQuery$q$, $q$https://cloud.google.com/bigquery$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb9ac50a-5d37-4f5c-a9c6-8693d7deb334', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb9ac50a-5d37-4f5c-a9c6-8693d7deb334')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dd3c3df9-d594-426d-bdb3-8cf09852fd57', $q$zoho-forms$q$, $q$Zoho Forms$q$, $q$https://www.zoho.com/forms/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dd3c3df9-d594-426d-bdb3-8cf09852fd57', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd3c3df9-d594-426d-bdb3-8cf09852fd57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('263195a9-55ed-4e99-acf2-d53db84ad056', $q$ukg-pro$q$, $q$UKG Pro$q$, $q$https://www.ukg.com/products/ukg-pro$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '263195a9-55ed-4e99-acf2-d53db84ad056', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '263195a9-55ed-4e99-acf2-d53db84ad056')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7dee4a3-60ff-47bf-bc48-5261639203a3', $q$sling$q$, $q$Sling$q$, $q$https://getsling.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7dee4a3-60ff-47bf-bc48-5261639203a3', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7dee4a3-60ff-47bf-bc48-5261639203a3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f8f6d9c2-d0cd-4055-9836-236ee79834a7', $q$sentinelone$q$, $q$SentinelOne$q$, $q$https://www.sentinelone.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f8f6d9c2-d0cd-4055-9836-236ee79834a7', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8f6d9c2-d0cd-4055-9836-236ee79834a7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3d765235-7add-4917-a93e-2e11d8fe95a8', $q$dialpad$q$, $q$Dialpad$q$, $q$https://www.dialpad.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3d765235-7add-4917-a93e-2e11d8fe95a8', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d765235-7add-4917-a93e-2e11d8fe95a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5f612c37-64e2-4aeb-a2a0-9b6d63df09b4', $q$blackboard-learn$q$, $q$Blackboard Learn$q$, $q$https://www.blackboard.com/teaching-learning/learning-management$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5f612c37-64e2-4aeb-a2a0-9b6d63df09b4', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f612c37-64e2-4aeb-a2a0-9b6d63df09b4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$amazon-s3$q$, $q$Amazon S3$q$, $q$https://aws.amazon.com/s3/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b18dae3-f1c5-476e-a3e2-93902b6308a3', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('278217f3-1beb-4f01-8213-5430c71d5245', $q$practicepanther$q$, $q$PracticePanther$q$, $q$https://www.practicepanther.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '278217f3-1beb-4f01-8213-5430c71d5245', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '278217f3-1beb-4f01-8213-5430c71d5245')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb149729-5f83-425f-8d50-05c96971bdf3', $q$coconstruct$q$, $q$CoConstruct$q$, $q$https://www.coconstruct.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb149729-5f83-425f-8d50-05c96971bdf3', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb149729-5f83-425f-8d50-05c96971bdf3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd25a08d-37be-447e-ac4c-280238739e44', $q$toast$q$, $q$Toast$q$, $q$https://pos.toasttab.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd25a08d-37be-447e-ac4c-280238739e44', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd25a08d-37be-447e-ac4c-280238739e44')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('88db22aa-79b8-45ed-b2f4-437c05395830', $q$ringcentral-video$q$, $q$RingCentral Video$q$, $q$https://www.ringcentral.com/video.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '88db22aa-79b8-45ed-b2f4-437c05395830', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88db22aa-79b8-45ed-b2f4-437c05395830')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$amazon-redshift$q$, $q$Amazon Redshift$q$, $q$https://aws.amazon.com/redshift/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ac9546f0-77a3-4dc5-a042-5b38bd39499c', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b111844-9cfa-4a96-813d-555779600f9d', $q$qualtrics$q$, $q$Qualtrics$q$, $q$https://www.qualtrics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b111844-9cfa-4a96-813d-555779600f9d', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b111844-9cfa-4a96-813d-555779600f9d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$7shifts$q$, $q$7shifts$q$, $q$https://www.7shifts.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dab2599f-b02e-47f7-922b-5899a8b3d1c1', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ac91ecc3-0c24-4414-be5b-9971df7a568d', $q$malwarebytes$q$, $q$Malwarebytes$q$, $q$https://www.malwarebytes.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ac91ecc3-0c24-4414-be5b-9971df7a568d', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac91ecc3-0c24-4414-be5b-9971df7a568d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$aircall$q$, $q$Aircall$q$, $q$https://aircall.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b10c6b8a-40e2-4fc2-ad32-f46718541193', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('569c81e4-5756-4a43-b262-297772fa2a0c', $q$google-classroom$q$, $q$Google Classroom$q$, $q$https://classroom.google.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '569c81e4-5756-4a43-b262-297772fa2a0c', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '569c81e4-5756-4a43-b262-297772fa2a0c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$backblaze$q$, $q$Backblaze$q$, $q$https://www.backblaze.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '42d5590c-1f80-447c-a591-4709d5198a5d', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42d5590c-1f80-447c-a591-4709d5198a5d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41637f09-c19d-4491-9683-03950483e648', $q$smokeball$q$, $q$Smokeball$q$, $q$https://www.smokeball.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41637f09-c19d-4491-9683-03950483e648', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41637f09-c19d-4491-9683-03950483e648')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('332223c1-f22b-409b-9580-2d82c4edda08', $q$evernote$q$, $q$Evernote$q$, $q$https://evernote.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '332223c1-f22b-409b-9580-2d82c4edda08', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '332223c1-f22b-409b-9580-2d82c4edda08')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$autodesk-construction-cloud$q$, $q$Autodesk Construction Cloud$q$, $q$https://construction.autodesk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c9aff19f-2369-4d96-b80f-e33c932398f4', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9aff19f-2369-4d96-b80f-e33c932398f4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6395be6b-6a6a-42ae-a6f6-77c85ea825f2', $q$lightspeed-retail$q$, $q$Lightspeed Retail$q$, $q$https://www.lightspeedhq.com/pos/retail/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6395be6b-6a6a-42ae-a6f6-77c85ea825f2', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6395be6b-6a6a-42ae-a6f6-77c85ea825f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a9eace0-9ae6-46ca-a41f-e970f5f11aea', $q$whereby$q$, $q$Whereby$q$, $q$https://whereby.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a9eace0-9ae6-46ca-a41f-e970f5f11aea', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a9eace0-9ae6-46ca-a41f-e970f5f11aea')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$alchemer$q$, $q$Alchemer$q$, $q$https://www.alchemer.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '000dcbeb-599f-406b-9ce6-de68152c9f9a', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '000dcbeb-599f-406b-9ce6-de68152c9f9a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b5f7e26c-b483-4bd7-8ac4-22126346a402', $q$quickbooks-time$q$, $q$QuickBooks Time$q$, $q$https://quickbooks.intuit.com/time-tracking/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b5f7e26c-b483-4bd7-8ac4-22126346a402', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5f7e26c-b483-4bd7-8ac4-22126346a402')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('552f84ed-11c6-440a-83d9-7d6762dc0517', $q$openphone$q$, $q$OpenPhone$q$, $q$https://www.openphone.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '552f84ed-11c6-440a-83d9-7d6762dc0517', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '552f84ed-11c6-440a-83d9-7d6762dc0517')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3272c3b2-7b50-4f01-838c-a33fa1daae36', $q$khan-academy$q$, $q$Khan Academy$q$, $q$https://www.khanacademy.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3272c3b2-7b50-4f01-838c-a33fa1daae36', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3272c3b2-7b50-4f01-838c-a33fa1daae36')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd90d7f0-266d-4308-84e4-03884e03b80c', $q$idrive$q$, $q$IDrive$q$, $q$https://www.idrive.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd90d7f0-266d-4308-84e4-03884e03b80c', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd90d7f0-266d-4308-84e4-03884e03b80c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('abea60cc-5f26-45e3-9696-3dec899a6984', $q$eclinicalworks$q$, $q$eClinicalWorks$q$, $q$https://www.eclinicalworks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'abea60cc-5f26-45e3-9696-3dec899a6984', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abea60cc-5f26-45e3-9696-3dec899a6984')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('56d2b2f0-b7a4-448f-acba-955eb269b59c', $q$rocket-matter$q$, $q$Rocket Matter$q$, $q$https://www.rocketmatter.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '56d2b2f0-b7a4-448f-acba-955eb269b59c', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56d2b2f0-b7a4-448f-acba-955eb269b59c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('118f8753-a6ca-4e1e-90db-108a98a53646', $q$onenote$q$, $q$OneNote$q$, $q$https://www.onenote.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '118f8753-a6ca-4e1e-90db-108a98a53646', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '118f8753-a6ca-4e1e-90db-108a98a53646')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b3f0303-3e4e-44b8-b85b-8e246173d906', $q$plangrid$q$, $q$PlanGrid$q$, $q$https://construction.autodesk.com/products/plangrid/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b3f0303-3e4e-44b8-b85b-8e246173d906', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b3f0303-3e4e-44b8-b85b-8e246173d906')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e19def59-87a1-4c56-8c4c-42d792e37cfd', $q$clover$q$, $q$Clover$q$, $q$https://www.clover.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e19def59-87a1-4c56-8c4c-42d792e37cfd', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e19def59-87a1-4c56-8c4c-42d792e37cfd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('85b65232-2caf-4969-998f-22b6d54fd447', $q$jitsi-meet$q$, $q$Jitsi Meet$q$, $q$https://meet.jit.si$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '85b65232-2caf-4969-998f-22b6d54fd447', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85b65232-2caf-4969-998f-22b6d54fd447')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8654c2ee-c1a5-4a9e-82aa-9243994e337c', $q$questionpro$q$, $q$QuestionPro$q$, $q$https://www.questionpro.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8654c2ee-c1a5-4a9e-82aa-9243994e337c', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8654c2ee-c1a5-4a9e-82aa-9243994e337c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a14db145-0596-4250-b60b-dff6e306c021', $q$timely$q$, $q$Timely$q$, $q$https://timelyapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a14db145-0596-4250-b60b-dff6e306c021', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a14db145-0596-4250-b60b-dff6e306c021')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2db08197-cb69-436a-acb8-e03d763b0ab6', $q$deepseek$q$, $q$DeepSeek$q$, $q$https://www.deepseek.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2db08197-cb69-436a-acb8-e03d763b0ab6', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2db08197-cb69-436a-acb8-e03d763b0ab6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('96e91f43-5f01-4104-b90d-be66d79b5e88', $q$zoom-phone$q$, $q$Zoom Phone$q$, $q$https://www.zoom.com/en/products/voip-phone/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '96e91f43-5f01-4104-b90d-be66d79b5e88', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96e91f43-5f01-4104-b90d-be66d79b5e88')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ac9ab5c-4a63-4bad-ba6c-e9edf649f3f5', $q$coursera$q$, $q$Coursera$q$, $q$https://www.coursera.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ac9ab5c-4a63-4bad-ba6c-e9edf649f3f5', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ac9ab5c-4a63-4bad-ba6c-e9edf649f3f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26363614-3d73-4304-99d9-162b41b02814', $q$carbonite$q$, $q$Carbonite$q$, $q$https://www.carbonite.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26363614-3d73-4304-99d9-162b41b02814', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26363614-3d73-4304-99d9-162b41b02814')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('658c8cb8-ea59-4b89-bc57-b008fda4a4bd', $q$drchrono$q$, $q$DrChrono$q$, $q$https://www.drchrono.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '658c8cb8-ea59-4b89-bc57-b008fda4a4bd', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '658c8cb8-ea59-4b89-bc57-b008fda4a4bd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3d29e78e-8c66-4222-a921-bf433a98f869', $q$lawmatics$q$, $q$Lawmatics$q$, $q$https://www.lawmatics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3d29e78e-8c66-4222-a921-bf433a98f869', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d29e78e-8c66-4222-a921-bf433a98f869')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c23b8837-4a75-4e45-83cf-8a217ebf06ae', $q$jobber$q$, $q$Jobber$q$, $q$https://getjobber.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c23b8837-4a75-4e45-83cf-8a217ebf06ae', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c23b8837-4a75-4e45-83cf-8a217ebf06ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4fba1a19-3d7b-4619-b54f-30bc07736976', $q$touchbistro$q$, $q$TouchBistro$q$, $q$https://www.touchbistro.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4fba1a19-3d7b-4619-b54f-30bc07736976', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4fba1a19-3d7b-4619-b54f-30bc07736976')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb2d22a1-1ce3-4203-a28c-4dcd411456cf', $q$around$q$, $q$Around$q$, $q$https://www.around.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb2d22a1-1ce3-4203-a28c-4dcd411456cf', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb2d22a1-1ce3-4203-a28c-4dcd411456cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$usertesting$q$, $q$UserTesting$q$, $q$https://www.usertesting.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0be53b91-2c15-470e-a5f9-076a0d58497b', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0be53b91-2c15-470e-a5f9-076a0d58497b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fefc9c6e-aa17-4e1e-88f9-9f4d8925e494', $q$everhour$q$, $q$Everhour$q$, $q$https://everhour.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fefc9c6e-aa17-4e1e-88f9-9f4d8925e494', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fefc9c6e-aa17-4e1e-88f9-9f4d8925e494')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b23fc94-f6ee-4551-9707-24f01eb5e9e4', $q$grok$q$, $q$Grok$q$, $q$https://grok.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b23fc94-f6ee-4551-9707-24f01eb5e9e4', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b23fc94-f6ee-4551-9707-24f01eb5e9e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$8x8$q$, $q$8x8$q$, $q$https://www.8x8.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd833b94c-8537-403d-b648-3070a9fce206', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd833b94c-8537-403d-b648-3070a9fce206')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$udemy$q$, $q$Udemy$q$, $q$https://www.udemy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9475419b-62e2-4143-a99d-40ca73927ae3', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9475419b-62e2-4143-a99d-40ca73927ae3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e09c036b-bf39-4a03-9832-b843bd6525c7', $q$acronis-cyber-protect$q$, $q$Acronis Cyber Protect$q$, $q$https://www.acronis.com/products/cyber-protect/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e09c036b-bf39-4a03-9832-b843bd6525c7', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e09c036b-bf39-4a03-9832-b843bd6525c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0554d78a-3a2f-4827-899f-980ac632cee9', $q$practice-fusion$q$, $q$Practice Fusion$q$, $q$https://www.practicefusion.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0554d78a-3a2f-4827-899f-980ac632cee9', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0554d78a-3a2f-4827-899f-980ac632cee9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c0335fd7-e7db-4c6c-8ece-4a1bf5b78c12', $q$ironclad$q$, $q$Ironclad$q$, $q$https://ironcladapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c0335fd7-e7db-4c6c-8ece-4a1bf5b78c12', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0335fd7-e7db-4c6c-8ece-4a1bf5b78c12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bbbaf42a-877b-4574-bbcf-56a9d704be00', $q$housecall-pro$q$, $q$Housecall Pro$q$, $q$https://www.housecallpro.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bbbaf42a-877b-4574-bbcf-56a9d704be00', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bbbaf42a-877b-4574-bbcf-56a9d704be00')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('67824c5f-fc78-40c9-a0e2-86281d436d4e', $q$revel-systems$q$, $q$Revel Systems$q$, $q$https://revelsystems.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '67824c5f-fc78-40c9-a0e2-86281d436d4e', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '67824c5f-fc78-40c9-a0e2-86281d436d4e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4414714c-18c2-421d-a443-5f73b6e567de', $q$demio$q$, $q$Demio$q$, $q$https://www.demio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4414714c-18c2-421d-a443-5f73b6e567de', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4414714c-18c2-421d-a443-5f73b6e567de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f57787ac-8e11-4769-9b64-15fa4453a73c', $q$maze$q$, $q$Maze$q$, $q$https://maze.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f57787ac-8e11-4769-9b64-15fa4453a73c', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f57787ac-8e11-4769-9b64-15fa4453a73c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('93f04fea-8e89-4442-8f71-31d6ca1b31e0', $q$float$q$, $q$Float$q$, $q$https://www.float.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '93f04fea-8e89-4442-8f71-31d6ca1b31e0', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '93f04fea-8e89-4442-8f71-31d6ca1b31e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d5fbbbd-7977-4815-ba85-695bdb1a2626', $q$poe$q$, $q$Poe$q$, $q$https://poe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d5fbbbd-7977-4815-ba85-695bdb1a2626', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d5fbbbd-7977-4815-ba85-695bdb1a2626')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0630601-9e1f-4c1c-928d-85768c104c56', $q$vonage$q$, $q$Vonage$q$, $q$https://www.vonage.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0630601-9e1f-4c1c-928d-85768c104c56', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0630601-9e1f-4c1c-928d-85768c104c56')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1c10185e-f762-462e-9a99-b6b50263b7cf', $q$sketch$q$, $q$Sketch$q$, $q$https://www.sketch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1c10185e-f762-462e-9a99-b6b50263b7cf', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c10185e-f762-462e-9a99-b6b50263b7cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f40d2d28-fdc6-4f97-93db-e7e3e49b3d87', $q$skillshare$q$, $q$Skillshare$q$, $q$https://www.skillshare.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f40d2d28-fdc6-4f97-93db-e7e3e49b3d87', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f40d2d28-fdc6-4f97-93db-e7e3e49b3d87')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0b7cc54-ec23-41b8-8746-9590d13dde47', $q$pcloud$q$, $q$pCloud$q$, $q$https://www.pcloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0b7cc54-ec23-41b8-8746-9590d13dde47', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0b7cc54-ec23-41b8-8746-9590d13dde47')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fdb22c7e-5eac-4888-bd83-48ca29adb96d', $q$tebra$q$, $q$Tebra$q$, $q$https://www.tebra.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fdb22c7e-5eac-4888-bd83-48ca29adb96d', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdb22c7e-5eac-4888-bd83-48ca29adb96d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('19ec34e7-46e8-4c4e-851d-20bbb23e224e', $q$contractworks$q$, $q$ContractWorks$q$, $q$https://www.contractworks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '19ec34e7-46e8-4c4e-851d-20bbb23e224e', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19ec34e7-46e8-4c4e-851d-20bbb23e224e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6fc3837d-ade3-437f-ac16-1a4ee783c3f8', $q$servicetitan$q$, $q$ServiceTitan$q$, $q$https://www.servicetitan.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6fc3837d-ade3-437f-ac16-1a4ee783c3f8', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fc3837d-ade3-437f-ac16-1a4ee783c3f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('17484540-c7ef-4a3f-b23f-5866c0cdd5ac', $q$spoton$q$, $q$SpotOn$q$, $q$https://www.spoton.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '17484540-c7ef-4a3f-b23f-5866c0cdd5ac', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17484540-c7ef-4a3f-b23f-5866c0cdd5ac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dce09c20-9cc8-49b7-8cbd-f9cc75440903', $q$livestorm$q$, $q$Livestorm$q$, $q$https://livestorm.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dce09c20-9cc8-49b7-8cbd-f9cc75440903', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dce09c20-9cc8-49b7-8cbd-f9cc75440903')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea1262a4-d760-4eec-88e1-896425d5ac44', $q$you-com$q$, $q$You.com$q$, $q$https://you.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea1262a4-d760-4eec-88e1-896425d5ac44', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea1262a4-d760-4eec-88e1-896425d5ac44')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eda726b9-eb10-4c2d-8347-89dbb3f5ee51', $q$nextiva$q$, $q$Nextiva$q$, $q$https://www.nextiva.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eda726b9-eb10-4c2d-8347-89dbb3f5ee51', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eda726b9-eb10-4c2d-8347-89dbb3f5ee51')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8fd33ff2-2e47-4614-b590-5278d86d8871', $q$topaz-labs$q$, $q$Topaz Labs$q$, $q$https://www.topazlabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8fd33ff2-2e47-4614-b590-5278d86d8871', '610d937c-3241-4cba-8f6e-b5015c8dc2f0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8fd33ff2-2e47-4614-b590-5278d86d8871')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1da348da-ba26-4700-9ed2-47edb28b71cd', $q$devin$q$, $q$Devin$q$, $q$https://devin.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1da348da-ba26-4700-9ed2-47edb28b71cd', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1da348da-ba26-4700-9ed2-47edb28b71cd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9ee6e97e-879a-408e-b289-62614630623b', $q$clipdrop$q$, $q$Clipdrop$q$, $q$https://clipdrop.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9ee6e97e-879a-408e-b289-62614630623b', '610d937c-3241-4cba-8f6e-b5015c8dc2f0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ee6e97e-879a-408e-b289-62614630623b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$sourcegraph-cody$q$, $q$Sourcegraph Cody$q$, $q$https://sourcegraph.com/cody$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0a80f4d-54d7-42de-ad76-cecc618d9b90', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('833f1acd-efc7-412a-b738-65bc35b6ddb1', $q$remove-bg$q$, $q$Remove.bg$q$, $q$https://www.remove.bg$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '833f1acd-efc7-412a-b738-65bc35b6ddb1', '610d937c-3241-4cba-8f6e-b5015c8dc2f0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '833f1acd-efc7-412a-b738-65bc35b6ddb1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$amazon-q-developer$q$, $q$Amazon Q Developer$q$, $q$https://aws.amazon.com/q/developer/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a22c6c2-59c3-4413-a1b0-00a743efb872', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a22c6c2-59c3-4413-a1b0-00a743efb872')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8551a49c-f983-4a46-ad50-c9e06a796573', $q$opusclip$q$, $q$OpusClip$q$, $q$https://www.opus.pro$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8551a49c-f983-4a46-ad50-c9e06a796573', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8551a49c-f983-4a46-ad50-c9e06a796573')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa297366-5cbc-4dc6-bc99-46ced5726132', $q$codeium$q$, $q$Codeium$q$, $q$https://codeium.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa297366-5cbc-4dc6-bc99-46ced5726132', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa297366-5cbc-4dc6-bc99-46ced5726132')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27a0d263-d000-4bfb-ac14-1b67221d0428', $q$kapwing$q$, $q$Kapwing$q$, $q$https://www.kapwing.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27a0d263-d000-4bfb-ac14-1b67221d0428', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27a0d263-d000-4bfb-ac14-1b67221d0428')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2aef943-d551-456d-b2f7-bd530c268780', $q$tabnine$q$, $q$Tabnine$q$, $q$https://www.tabnine.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2aef943-d551-456d-b2f7-bd530c268780', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2aef943-d551-456d-b2f7-bd530c268780')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('409ea4dc-896f-4857-8834-ef3e42d8555a', $q$veed$q$, $q$VEED$q$, $q$https://www.veed.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '409ea4dc-896f-4857-8834-ef3e42d8555a', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '409ea4dc-896f-4857-8834-ef3e42d8555a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('88b09d10-a6f8-417d-b1b5-3f44cf179e0c', $q$gptzero$q$, $q$GPTZero$q$, $q$https://gptzero.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '88b09d10-a6f8-417d-b1b5-3f44cf179e0c', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88b09d10-a6f8-417d-b1b5-3f44cf179e0c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('758d739b-574e-4253-96df-178cefd5f067', $q$windsurf$q$, $q$Windsurf$q$, $q$https://windsurf.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '758d739b-574e-4253-96df-178cefd5f067', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '758d739b-574e-4253-96df-178cefd5f067')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('15dd21fe-ee11-4215-995a-79327176360a', $q$invideo$q$, $q$InVideo$q$, $q$https://invideo.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '15dd21fe-ee11-4215-995a-79327176360a', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15dd21fe-ee11-4215-995a-79327176360a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53bb6923-d4d1-4ead-bd6a-7aa8450e41ee', $q$originality-ai$q$, $q$Originality.ai$q$, $q$https://originality.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53bb6923-d4d1-4ead-bd6a-7aa8450e41ee', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53bb6923-d4d1-4ead-bd6a-7aa8450e41ee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$v0$q$, $q$v0$q$, $q$https://v0.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7e511518-9008-4caa-98b5-24f31611a25c', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e511518-9008-4caa-98b5-24f31611a25c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c49ab894-eebb-41d9-be22-6e48697bc8a4', $q$udio$q$, $q$Udio$q$, $q$https://www.udio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c49ab894-eebb-41d9-be22-6e48697bc8a4', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c49ab894-eebb-41d9-be22-6e48697bc8a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('272fac60-438a-4487-9d22-a04e72fbaf3e', $q$prowritingaid$q$, $q$ProWritingAid$q$, $q$https://prowritingaid.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '272fac60-438a-4487-9d22-a04e72fbaf3e', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '272fac60-438a-4487-9d22-a04e72fbaf3e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5759ef4a-9adb-4775-9ea3-ae93aa85a490', $q$lovable$q$, $q$Lovable$q$, $q$https://lovable.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5759ef4a-9adb-4775-9ea3-ae93aa85a490', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5759ef4a-9adb-4775-9ea3-ae93aa85a490')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$suno$q$, $q$Suno$q$, $q$https://suno.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', '99f9b42e-fe47-475b-a595-56295cbbcf72', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$textcortex$q$, $q$TextCortex$q$, $q$https://textcortex.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d4bf973-60bc-4423-b9e1-f29a29ba365a', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e82c60dd-a99b-47e5-b59b-e27db707e04e', $q$bolt-new$q$, $q$Bolt.new$q$, $q$https://bolt.new$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e82c60dd-a99b-47e5-b59b-e27db707e04e', '79fabb14-8a5e-4049-895a-b8ca55789810', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e82c60dd-a99b-47e5-b59b-e27db707e04e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4cf9cd65-f41d-4829-821a-01a2e4394707', $q$dorik$q$, $q$Dorik$q$, $q$https://dorik.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4cf9cd65-f41d-4829-821a-01a2e4394707', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cf9cd65-f41d-4829-821a-01a2e4394707')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb838640-ef5a-4d9a-92b1-14717d41944f', $q$majestic$q$, $q$Majestic$q$, $q$https://majestic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb838640-ef5a-4d9a-92b1-14717d41944f', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb838640-ef5a-4d9a-92b1-14717d41944f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5799f1ce-5e51-44c3-9992-d68250deeb71', $q$carrd$q$, $q$Carrd$q$, $q$https://carrd.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5799f1ce-5e51-44c3-9992-d68250deeb71', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5799f1ce-5e51-44c3-9992-d68250deeb71')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$spyfu$q$, $q$SpyFu$q$, $q$https://www.spyfu.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bb2fc581-be51-4423-a4e1-a32e3a5ab109', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cf2565ff-7160-42e9-8d6c-efdb9830004d', $q$neon$q$, $q$Neon$q$, $q$https://neon.tech$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cf2565ff-7160-42e9-8d6c-efdb9830004d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf2565ff-7160-42e9-8d6c-efdb9830004d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$adespresso$q$, $q$AdEspresso$q$, $q$https://adespresso.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '951b342f-ef42-4fc5-afdd-6e5a7df3ad94', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('424ed87f-e0ac-4a99-869c-2cecd795e4b1', $q$planetscale$q$, $q$PlanetScale$q$, $q$https://planetscale.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '424ed87f-e0ac-4a99-869c-2cecd795e4b1', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '424ed87f-e0ac-4a99-869c-2cecd795e4b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d9e98516-f585-417e-b8e1-aa7ccf705fd5', $q$leadpages$q$, $q$Leadpages$q$, $q$https://www.leadpages.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd9e98516-f585-417e-b8e1-aa7ccf705fd5', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd9e98516-f585-417e-b8e1-aa7ccf705fd5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('665123b3-d769-4ea1-851b-2dfd42fa8509', $q$mongodb-atlas$q$, $q$MongoDB Atlas$q$, $q$https://www.mongodb.com/atlas$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '665123b3-d769-4ea1-851b-2dfd42fa8509', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '665123b3-d769-4ea1-851b-2dfd42fa8509')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dd5fd21d-0322-4d4a-b2d6-d37c26aaa320', $q$odoo-crm$q$, $q$Odoo CRM$q$, $q$https://www.odoo.com/app/crm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dd5fd21d-0322-4d4a-b2d6-d37c26aaa320', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd5fd21d-0322-4d4a-b2d6-d37c26aaa320')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('79eab7a4-e62b-49e1-b4c9-ba1e46383aec', $q$churnzero$q$, $q$ChurnZero$q$, $q$https://churnzero.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '79eab7a4-e62b-49e1-b4c9-ba1e46383aec', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79eab7a4-e62b-49e1-b4c9-ba1e46383aec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3190d2c9-97ab-4131-81ee-15a9bb5745a2', $q$firebase$q$, $q$Firebase$q$, $q$https://firebase.google.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3190d2c9-97ab-4131-81ee-15a9bb5745a2', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3190d2c9-97ab-4131-81ee-15a9bb5745a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6f813de0-d2a3-471f-a9eb-5435220544a4', $q$thinkific$q$, $q$Thinkific$q$, $q$https://www.thinkific.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6f813de0-d2a3-471f-a9eb-5435220544a4', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f813de0-d2a3-471f-a9eb-5435220544a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$beehiiv$q$, $q$Beehiiv$q$, $q$https://www.beehiiv.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff227d86-ddbd-4dae-a781-076d3958c64f', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff227d86-ddbd-4dae-a781-076d3958c64f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a2099be2-0fe5-4bea-8970-af25479c0e1a', $q$supermetrics$q$, $q$Supermetrics$q$, $q$https://supermetrics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a2099be2-0fe5-4bea-8970-af25479c0e1a', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a2099be2-0fe5-4bea-8970-af25479c0e1a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f75ddaa-758b-4b98-b9a1-7abb4b581a78', $q$creatio$q$, $q$Creatio$q$, $q$https://www.creatio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f75ddaa-758b-4b98-b9a1-7abb4b581a78', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f75ddaa-758b-4b98-b9a1-7abb4b581a78')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca7516a2-730d-48ae-b2cd-54a3da886bac', $q$gainsight$q$, $q$Gainsight$q$, $q$https://www.gainsight.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca7516a2-730d-48ae-b2cd-54a3da886bac', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca7516a2-730d-48ae-b2cd-54a3da886bac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$supabase$q$, $q$Supabase$q$, $q$https://supabase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '84e314ac-4d36-41da-911b-9eb00173a757', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84e314ac-4d36-41da-911b-9eb00173a757')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$teachable$q$, $q$Teachable$q$, $q$https://teachable.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '331c1d71-2a89-499a-9b96-e38d4d4f0feb', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ddd1302-f04e-4a3a-8111-e7b0aaeadc87', $q$looker-studio$q$, $q$Looker Studio$q$, $q$https://lookerstudio.google.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ddd1302-f04e-4a3a-8111-e7b0aaeadc87', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ddd1302-f04e-4a3a-8111-e7b0aaeadc87')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('25b50035-747c-462e-a2db-a4e3b14e8c02', $q$less-annoying-crm$q$, $q$Less Annoying CRM$q$, $q$https://www.lessannoyingcrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '25b50035-747c-462e-a2db-a4e3b14e8c02', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25b50035-747c-462e-a2db-a4e3b14e8c02')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('42178daa-c8ed-41d0-b8b7-d8e53057a2ce', $q$totango$q$, $q$Totango$q$, $q$https://www.totango.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '42178daa-c8ed-41d0-b8b7-d8e53057a2ce', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42178daa-c8ed-41d0-b8b7-d8e53057a2ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b696da65-5315-4c8c-b34f-3a2fe6617f10', $q$railway$q$, $q$Railway$q$, $q$https://railway.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b696da65-5315-4c8c-b34f-3a2fe6617f10', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b696da65-5315-4c8c-b34f-3a2fe6617f10')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c36767cb-32ab-4d26-8f68-e5a87e160f08', $q$kajabi$q$, $q$Kajabi$q$, $q$https://kajabi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c36767cb-32ab-4d26-8f68-e5a87e160f08', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c36767cb-32ab-4d26-8f68-e5a87e160f08')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de6eb85c-e884-4464-97df-4e4c4479c1d0', $q$nutshell$q$, $q$Nutshell$q$, $q$https://www.nutshell.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de6eb85c-e884-4464-97df-4e4c4479c1d0', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de6eb85c-e884-4464-97df-4e4c4479c1d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ad6b4961-5c42-461f-8aa7-a80fba6f7c50', $q$salesforce-service-cloud$q$, $q$Salesforce Service Cloud$q$, $q$https://www.salesforce.com/service/cloud/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ad6b4961-5c42-461f-8aa7-a80fba6f7c50', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad6b4961-5c42-461f-8aa7-a80fba6f7c50')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87cb32a2-9663-4c3e-a003-f1735380ac01', $q$render$q$, $q$Render$q$, $q$https://render.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87cb32a2-9663-4c3e-a003-f1735380ac01', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87cb32a2-9663-4c3e-a003-f1735380ac01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11aeaa6f-ca3a-4980-80c9-07d68c56564a', $q$podia$q$, $q$Podia$q$, $q$https://www.podia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11aeaa6f-ca3a-4980-80c9-07d68c56564a', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11aeaa6f-ca3a-4980-80c9-07d68c56564a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('88c573c2-bcec-44cf-a9cb-80c691b977d7', $q$customer-io$q$, $q$Customer.io$q$, $q$https://customer.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '88c573c2-bcec-44cf-a9cb-80c691b977d7', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88c573c2-bcec-44cf-a9cb-80c691b977d7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d6fe9497-6864-400b-8879-65cfc6655084', $q$zuora$q$, $q$Zuora$q$, $q$https://www.zuora.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd6fe9497-6864-400b-8879-65cfc6655084', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6fe9497-6864-400b-8879-65cfc6655084')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2899eedd-31f8-47bb-91c7-6b9e3cb0215b', $q$recurly$q$, $q$Recurly$q$, $q$https://recurly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2899eedd-31f8-47bb-91c7-6b9e3cb0215b', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2899eedd-31f8-47bb-91c7-6b9e3cb0215b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e2b1c07-9d70-4dd3-a9e0-b4a7473ba11f', $q$paddle$q$, $q$Paddle$q$, $q$https://www.paddle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e2b1c07-9d70-4dd3-a9e0-b4a7473ba11f', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e2b1c07-9d70-4dd3-a9e0-b4a7473ba11f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('59e7c6f4-7f3f-4a9d-a078-a2b7d95263db', $q$chargebee$q$, $q$Chargebee$q$, $q$https://www.chargebee.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '59e7c6f4-7f3f-4a9d-a078-a2b7d95263db', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59e7c6f4-7f3f-4a9d-a078-a2b7d95263db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fbffcaa4-b264-4a87-bd4b-d1c6cc1e9c14', $q$gusto$q$, $q$Gusto$q$, $q$https://gusto.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fbffcaa4-b264-4a87-bd4b-d1c6cc1e9c14', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbffcaa4-b264-4a87-bd4b-d1c6cc1e9c14')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4cb9b0b4-da99-4023-b92a-3bceb73f3e37', $q$formstack-documents$q$, $q$Formstack Documents$q$, $q$https://www.formstack.com/products/documents$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4cb9b0b4-da99-4023-b92a-3bceb73f3e37', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cb9b0b4-da99-4023-b92a-3bceb73f3e37')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6e9e3b9-7b4b-4224-9ce1-e8b76bd4f3c6', $q$dext$q$, $q$Dext$q$, $q$https://dext.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6e9e3b9-7b4b-4224-9ce1-e8b76bd4f3c6', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6e9e3b9-7b4b-4224-9ce1-e8b76bd4f3c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6a07317c-b1f1-40dd-a137-ed66a88f82a7', $q$paymo$q$, $q$Paymo$q$, $q$https://www.paymoapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6a07317c-b1f1-40dd-a137-ed66a88f82a7', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a07317c-b1f1-40dd-a137-ed66a88f82a7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$socialpilot$q$, $q$SocialPilot$q$, $q$https://www.socialpilot.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0973005-06cc-44c0-81b7-f55d44c44d48', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0973005-06cc-44c0-81b7-f55d44c44d48')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('edbc5167-46cb-4d31-8eb3-4c9d8b6f911a', $q$docsend$q$, $q$DocSend$q$, $q$https://www.docsend.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'edbc5167-46cb-4d31-8eb3-4c9d8b6f911a', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edbc5167-46cb-4d31-8eb3-4c9d8b6f911a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('22ab0c21-f5e6-4e9a-919f-4e80fdc79abb', $q$expensify$q$, $q$Expensify$q$, $q$https://www.expensify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '22ab0c21-f5e6-4e9a-919f-4e80fdc79abb', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22ab0c21-f5e6-4e9a-919f-4e80fdc79abb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('534a63de-bd62-4e46-81b3-354224a9fcb1', $q$scoro$q$, $q$Scoro$q$, $q$https://www.scoro.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '534a63de-bd62-4e46-81b3-354224a9fcb1', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '534a63de-bd62-4e46-81b3-354224a9fcb1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('055370e8-fd15-4fdf-9dad-531fc3b6a3c9', $q$iconosquare$q$, $q$Iconosquare$q$, $q$https://www.iconosquare.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '055370e8-fd15-4fdf-9dad-531fc3b6a3c9', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '055370e8-fd15-4fdf-9dad-531fc3b6a3c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95c9d0a5-64da-46ca-b8b7-a7245a366020', $q$better-proposals$q$, $q$Better Proposals$q$, $q$https://betterproposals.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95c9d0a5-64da-46ca-b8b7-a7245a366020', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95c9d0a5-64da-46ca-b8b7-a7245a366020')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('73bfc873-4265-4959-93b9-df520ad9fcd5', $q$ramp$q$, $q$Ramp$q$, $q$https://ramp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '73bfc873-4265-4959-93b9-df520ad9fcd5', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '73bfc873-4265-4959-93b9-df520ad9fcd5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8c59b3c9-1d5c-41aa-8b9d-d87093081798', $q$celoxis$q$, $q$Celoxis$q$, $q$https://www.celoxis.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8c59b3c9-1d5c-41aa-8b9d-d87093081798', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c59b3c9-1d5c-41aa-8b9d-d87093081798')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e87fe27-ae20-4a92-8b43-5f6016f6f4fa', $q$emplifi$q$, $q$Emplifi$q$, $q$https://emplifi.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e87fe27-ae20-4a92-8b43-5f6016f6f4fa', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e87fe27-ae20-4a92-8b43-5f6016f6f4fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23dde3d1-1c69-4fd8-bdea-41ceb5449c9a', $q$qwilr$q$, $q$Qwilr$q$, $q$https://qwilr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23dde3d1-1c69-4fd8-bdea-41ceb5449c9a', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23dde3d1-1c69-4fd8-bdea-41ceb5449c9a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$brex$q$, $q$Brex$q$, $q$https://www.brex.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '90a5952e-cd43-4cf5-bc88-317304be7a50', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90a5952e-cd43-4cf5-bc88-317304be7a50')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8c9f13c9-cf6c-446e-bb2f-8847796544ec', $q$planview$q$, $q$Planview$q$, $q$https://www.planview.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8c9f13c9-cf6c-446e-bb2f-8847796544ec', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c9f13c9-cf6c-446e-bb2f-8847796544ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0e66535-3ff0-4403-abac-5c27a5f34b18', $q$meltwater$q$, $q$Meltwater$q$, $q$https://www.meltwater.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0e66535-3ff0-4403-abac-5c27a5f34b18', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0e66535-3ff0-4403-abac-5c27a5f34b18')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('19af63b9-f422-4e73-aa95-41f50d50e098', $q$bill-com$q$, $q$Bill.com$q$, $q$https://www.bill.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '19af63b9-f422-4e73-aa95-41f50d50e098', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19af63b9-f422-4e73-aa95-41f50d50e098')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1159d03-001f-4c6e-ae84-122c6665f96f', $q$revolut-business$q$, $q$Revolut Business$q$, $q$https://www.revolut.com/business/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1159d03-001f-4c6e-ae84-122c6665f96f', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1159d03-001f-4c6e-ae84-122c6665f96f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3eb87668-42e1-459d-9212-aea403d70de9', $q$wise-business$q$, $q$Wise Business$q$, $q$https://wise.com/business/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3eb87668-42e1-459d-9212-aea403d70de9', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3eb87668-42e1-459d-9212-aea403d70de9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$adyen$q$, $q$Adyen$q$, $q$https://www.adyen.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e899f32-2125-4293-9067-e8fb5b563734', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e899f32-2125-4293-9067-e8fb5b563734')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('09b41cb4-0b11-4480-ad3f-317c597ce7a4', $q$singlestore$q$, $q$SingleStore$q$, $q$https://www.singlestore.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '09b41cb4-0b11-4480-ad3f-317c597ce7a4', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09b41cb4-0b11-4480-ad3f-317c597ce7a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('347340e4-2920-47db-a757-9978b6eb89a7', $q$lattice$q$, $q$Lattice$q$, $q$https://lattice.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '347340e4-2920-47db-a757-9978b6eb89a7', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '347340e4-2920-47db-a757-9978b6eb89a7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cad47068-0db8-4866-8882-42d54432595e', $q$ninjaone$q$, $q$NinjaOne$q$, $q$https://www.ninjaone.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cad47068-0db8-4866-8882-42d54432595e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cad47068-0db8-4866-8882-42d54432595e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b91ae4a4-138d-4d64-ad9d-e248ca4f5aaa', $q$cockroachdb$q$, $q$CockroachDB$q$, $q$https://www.cockroachlabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b91ae4a4-138d-4d64-ad9d-e248ca4f5aaa', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b91ae4a4-138d-4d64-ad9d-e248ca4f5aaa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0f3743e6-4384-4d1d-8b20-c6c59c84ed3d', $q$factorial$q$, $q$Factorial$q$, $q$https://factorialhr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0f3743e6-4384-4d1d-8b20-c6c59c84ed3d', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f3743e6-4384-4d1d-8b20-c6c59c84ed3d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9de5de2c-21ac-48ff-89e4-3f7bf4c1ceb6', $q$kandji$q$, $q$Kandji$q$, $q$https://www.kandji.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9de5de2c-21ac-48ff-89e4-3f7bf4c1ceb6', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9de5de2c-21ac-48ff-89e4-3f7bf4c1ceb6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$aiven$q$, $q$Aiven$q$, $q$https://aiven.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1cae6850-050f-46cb-a2e7-0f9b43529d66', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1cae6850-050f-46cb-a2e7-0f9b43529d66')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b1fba57-cd15-424e-804c-46b51d8f4396', $q$recruitee$q$, $q$Recruitee$q$, $q$https://recruitee.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b1fba57-cd15-424e-804c-46b51d8f4396', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b1fba57-cd15-424e-804c-46b51d8f4396')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('924c5694-cfb7-4b06-9d9d-b00e1afadb31', $q$jamf$q$, $q$Jamf$q$, $q$https://www.jamf.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '924c5694-cfb7-4b06-9d9d-b00e1afadb31', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '924c5694-cfb7-4b06-9d9d-b00e1afadb31')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f64e5322-805e-4448-852f-2b182baf140a', $q$elasticsearch$q$, $q$Elasticsearch$q$, $q$https://www.elastic.co/elasticsearch$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f64e5322-805e-4448-852f-2b182baf140a', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f64e5322-805e-4448-852f-2b182baf140a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$teamtailor$q$, $q$Teamtailor$q$, $q$https://www.teamtailor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '18a08b34-9438-45e5-b3b9-9e7969c6add2', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18a08b34-9438-45e5-b3b9-9e7969c6add2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$cloudflare-zero-trust$q$, $q$Cloudflare Zero Trust$q$, $q$https://www.cloudflare.com/zero-trust/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('edd1bac6-16dc-4bda-b79f-aadb3cc602d0', $q$redis$q$, $q$Redis$q$, $q$https://redis.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'edd1bac6-16dc-4bda-b79f-aadb3cc602d0', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edd1bac6-16dc-4bda-b79f-aadb3cc602d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$ashby$q$, $q$Ashby$q$, $q$https://www.ashbyhq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ad6a6164-cd5b-4456-afd7-cd85def0c06a', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c69ab424-480e-464f-8a10-266de3ca5887', $q$tailscale$q$, $q$Tailscale$q$, $q$https://tailscale.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c69ab424-480e-464f-8a10-266de3ca5887', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c69ab424-480e-464f-8a10-266de3ca5887')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76f0c5ad-2a6b-4da7-9d21-98785efc0c74', $q$mysql$q$, $q$MySQL$q$, $q$https://www.mysql.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76f0c5ad-2a6b-4da7-9d21-98785efc0c74', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76f0c5ad-2a6b-4da7-9d21-98785efc0c74')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('742217b9-34b3-4a6b-ba4a-7592b4fc8b20', $q$lookback$q$, $q$Lookback$q$, $q$https://www.lookback.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '742217b9-34b3-4a6b-ba4a-7592b4fc8b20', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '742217b9-34b3-4a6b-ba4a-7592b4fc8b20')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5edf3623-fbe7-4031-ae06-d836d7bc2e06', $q$linkedin-recruiter$q$, $q$LinkedIn Recruiter$q$, $q$https://business.linkedin.com/talent-solutions/recruiter$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5edf3623-fbe7-4031-ae06-d836d7bc2e06', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5edf3623-fbe7-4031-ae06-d836d7bc2e06')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('46f3d2a9-02b8-43f2-a139-956dd022d4b6', $q$simplybook-me$q$, $q$SimplyBook.me$q$, $q$https://simplybook.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '46f3d2a9-02b8-43f2-a139-956dd022d4b6', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46f3d2a9-02b8-43f2-a139-956dd022d4b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fafccbf6-913e-4289-9274-59a455a3737b', $q$proton-vpn$q$, $q$Proton VPN$q$, $q$https://protonvpn.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fafccbf6-913e-4289-9274-59a455a3737b', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fafccbf6-913e-4289-9274-59a455a3737b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4b6eb99-0c87-4eaa-8305-aff383ed3c8f', $q$postgresql$q$, $q$PostgreSQL$q$, $q$https://www.postgresql.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4b6eb99-0c87-4eaa-8305-aff383ed3c8f', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4b6eb99-0c87-4eaa-8305-aff383ed3c8f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c7ffe5d-03a8-4aa8-aa1e-04f31e023da0', $q$dovetail$q$, $q$Dovetail$q$, $q$https://dovetail.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c7ffe5d-03a8-4aa8-aa1e-04f31e023da0', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c7ffe5d-03a8-4aa8-aa1e-04f31e023da0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26be16cd-25ce-4578-8910-70ede05cb0ab', $q$zoho-recruit$q$, $q$Zoho Recruit$q$, $q$https://www.zoho.com/recruit/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26be16cd-25ce-4578-8910-70ede05cb0ab', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26be16cd-25ce-4578-8910-70ede05cb0ab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$acuity-scheduling$q$, $q$Acuity Scheduling$q$, $q$https://acuityscheduling.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb973a74-57dc-44bc-837f-58dfac85e6ce', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99717d1e-0342-4761-94f2-a883ec1305b3', $q$surfshark$q$, $q$Surfshark$q$, $q$https://surfshark.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99717d1e-0342-4761-94f2-a883ec1305b3', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99717d1e-0342-4761-94f2-a883ec1305b3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('503e1e80-efff-4b6e-b3f4-9321fcb8e174', $q$talend$q$, $q$Talend$q$, $q$https://www.talend.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '503e1e80-efff-4b6e-b3f4-9321fcb8e174', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '503e1e80-efff-4b6e-b3f4-9321fcb8e174')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('00ea990a-f3f1-4733-b437-22705a46609d', $q$hotjar-surveys$q$, $q$Hotjar Surveys$q$, $q$https://www.hotjar.com/surveys/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '00ea990a-f3f1-4733-b437-22705a46609d', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00ea990a-f3f1-4733-b437-22705a46609d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$breezy-hr$q$, $q$Breezy HR$q$, $q$https://breezy.hr$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bf5ccccf-0e75-4299-a56e-49f4447411f2', $q$runn$q$, $q$Runn$q$, $q$https://www.runn.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bf5ccccf-0e75-4299-a56e-49f4447411f2', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf5ccccf-0e75-4299-a56e-49f4447411f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b040c903-f544-4cf7-9de2-2af9f1ecddaa', $q$expressvpn$q$, $q$ExpressVPN$q$, $q$https://www.expressvpn.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b040c903-f544-4cf7-9de2-2af9f1ecddaa', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b040c903-f544-4cf7-9de2-2af9f1ecddaa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9219abcb-3647-48e3-8c71-39e48254dcdb', $q$knime$q$, $q$KNIME$q$, $q$https://www.knime.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9219abcb-3647-48e3-8c71-39e48254dcdb', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9219abcb-3647-48e3-8c71-39e48254dcdb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$userzoom$q$, $q$UserZoom$q$, $q$https://www.userzoom.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c692a937-f3e2-45ab-ad20-28a30d805a63', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c692a937-f3e2-45ab-ad20-28a30d805a63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8edc4560-4c87-4f48-9ba0-8af1a559a2e7', $q$jazzhr$q$, $q$JazzHR$q$, $q$https://www.jazzhr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8edc4560-4c87-4f48-9ba0-8af1a559a2e7', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8edc4560-4c87-4f48-9ba0-8af1a559a2e7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('10489d53-8568-4993-9c9f-4e97a69b327b', $q$resource-guru$q$, $q$Resource Guru$q$, $q$https://resourceguruapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '10489d53-8568-4993-9c9f-4e97a69b327b', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10489d53-8568-4993-9c9f-4e97a69b327b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b5e7fc6-540c-4a46-90c4-6e863ad1c70c', $q$nordvpn$q$, $q$NordVPN$q$, $q$https://nordvpn.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$alteryx$q$, $q$Alteryx$q$, $q$https://www.alteryx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab77b503-2fbc-48d6-b95b-85468a3d2b09', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('63552ca4-8785-47c6-9aaf-f0643adf97b5', $q$workable$q$, $q$Workable$q$, $q$https://www.workable.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '63552ca4-8785-47c6-9aaf-f0643adf97b5', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63552ca4-8785-47c6-9aaf-f0643adf97b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e4677d7e-e466-487b-b39f-1841d9797908', $q$avast$q$, $q$Avast$q$, $q$https://www.avast.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e4677d7e-e466-487b-b39f-1841d9797908', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4677d7e-e466-487b-b39f-1841d9797908')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('50be4027-11b3-43fe-b1ca-c6caad422481', $q$dbt-cloud$q$, $q$dbt Cloud$q$, $q$https://www.getdbt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '50be4027-11b3-43fe-b1ca-c6caad422481', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50be4027-11b3-43fe-b1ca-c6caad422481')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e059a784-d8bc-45d5-ab94-fea4f0338c4e', $q$lever$q$, $q$Lever$q$, $q$https://www.lever.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e059a784-d8bc-45d5-ab94-fea4f0338c4e', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e059a784-d8bc-45d5-ab94-fea4f0338c4e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('71dcd814-d7ea-4382-b7e3-3238f93f3360', $q$bitdefender$q$, $q$Bitdefender$q$, $q$https://www.bitdefender.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '71dcd814-d7ea-4382-b7e3-3238f93f3360', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71dcd814-d7ea-4382-b7e3-3238f93f3360')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$airbyte$q$, $q$Airbyte$q$, $q$https://airbyte.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '80b10260-3b64-43a4-af8d-f79e3fab1f2b', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('69afcc2a-09a4-49b5-a478-dc5c7b9d0240', $q$greenhouse$q$, $q$Greenhouse$q$, $q$https://www.greenhouse.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '69afcc2a-09a4-49b5-a478-dc5c7b9d0240', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69afcc2a-09a4-49b5-a478-dc5c7b9d0240')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('620140b0-3b84-4d9d-8196-7bb9344c797c', $q$mcafee$q$, $q$McAfee$q$, $q$https://www.mcafee.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '620140b0-3b84-4d9d-8196-7bb9344c797c', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '620140b0-3b84-4d9d-8196-7bb9344c797c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('77bcbe4d-ff51-41f9-a9da-963c98821e89', $q$fivetran$q$, $q$Fivetran$q$, $q$https://www.fivetran.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '77bcbe4d-ff51-41f9-a9da-963c98821e89', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '77bcbe4d-ff51-41f9-a9da-963c98821e89')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0ef73c08-fc86-4679-b6fc-4e32b1333482', $q$norton-360$q$, $q$Norton 360$q$, $q$https://us.norton.com/products/norton-360$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0ef73c08-fc86-4679-b6fc-4e32b1333482', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ef73c08-fc86-4679-b6fc-4e32b1333482')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('031d68c5-af3a-4399-8fac-121f0a02a529', $q$todoist$q$, $q$Todoist$q$, $q$https://todoist.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '031d68c5-af3a-4399-8fac-121f0a02a529', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '031d68c5-af3a-4399-8fac-121f0a02a529')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d87ead8b-8c90-424b-ae07-9b4003510b45', $q$jasper$q$, $q$Jasper$q$, $q$https://www.jasper.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd87ead8b-8c90-424b-ae07-9b4003510b45', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd87ead8b-8c90-424b-ae07-9b4003510b45')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('63f1ca5a-4d50-4646-ab82-bd9bd346c967', $q$flock$q$, $q$Flock$q$, $q$https://www.flock.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '63f1ca5a-4d50-4646-ab82-bd9bd346c967', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63f1ca5a-4d50-4646-ab82-bd9bd346c967')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c90dc5e6-33dc-4dc9-a0be-2c6675db08aa', $q$final-cut-pro$q$, $q$Final Cut Pro$q$, $q$https://www.apple.com/final-cut-pro/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f765cfa6-721a-409a-a821-11862b637dcc', $q$learndash$q$, $q$LearnDash$q$, $q$https://www.learndash.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f765cfa6-721a-409a-a821-11862b637dcc', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f765cfa6-721a-409a-a821-11862b637dcc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('daabce27-4231-4e1d-a8a8-f7d8451bc385', $q$internxt$q$, $q$Internxt$q$, $q$https://internxt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'daabce27-4231-4e1d-a8a8-f7d8451bc385', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'daabce27-4231-4e1d-a8a8-f7d8451bc385')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('98f9f304-96e1-4abd-9d15-b4cb9d09fcfc', $q$nexhealth$q$, $q$NexHealth$q$, $q$https://www.nexhealth.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '98f9f304-96e1-4abd-9d15-b4cb9d09fcfc', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '98f9f304-96e1-4abd-9d15-b4cb9d09fcfc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3ee3433-997d-4462-9aa7-1e921d116666', $q$logicgate$q$, $q$LogicGate$q$, $q$https://www.logicgate.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3ee3433-997d-4462-9aa7-1e921d116666', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3ee3433-997d-4462-9aa7-1e921d116666')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('37206632-9f9a-460f-8492-df6a397cf34f', $q$propertybase$q$, $q$Propertybase$q$, $q$https://www.propertybase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '37206632-9f9a-460f-8492-df6a397cf34f', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37206632-9f9a-460f-8492-df6a397cf34f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('35eab88b-4ba3-4039-82ea-b4ff8bda85b1', $q$odoo-point-of-sale$q$, $q$Odoo Point of Sale$q$, $q$https://www.odoo.com/app/point-of-sale-shop$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '35eab88b-4ba3-4039-82ea-b4ff8bda85b1', '287e93c4-ff45-4015-a442-e900e992f070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35eab88b-4ba3-4039-82ea-b4ff8bda85b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('24fcbb9a-223c-4b44-b8fd-07484fe7b8e4', $q$restream$q$, $q$Restream$q$, $q$https://restream.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '24fcbb9a-223c-4b44-b8fd-07484fe7b8e4', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24fcbb9a-223c-4b44-b8fd-07484fe7b8e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a148f101-9c66-4591-aec9-b3207ca40a0e', $q$chatsonic$q$, $q$Chatsonic$q$, $q$https://writesonic.com/chat$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a148f101-9c66-4591-aec9-b3207ca40a0e', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a148f101-9c66-4591-aec9-b3207ca40a0e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d9e0aeb4-501a-4642-a40a-1a439d823b46', $q$chanty$q$, $q$Chanty$q$, $q$https://www.chanty.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd9e0aeb4-501a-4642-a40a-1a439d823b46', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd9e0aeb4-501a-4642-a40a-1a439d823b46')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3122bcbc-f848-4a5b-bdd0-2fdc1ab47f3e', $q$davinci-resolve$q$, $q$DaVinci Resolve$q$, $q$https://www.blackmagicdesign.com/products/davinciresolve$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3122bcbc-f848-4a5b-bdd0-2fdc1ab47f3e', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3122bcbc-f848-4a5b-bdd0-2fdc1ab47f3e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87506dfb-5657-49d7-8e5e-045ff26172f8', $q$thinkific-plus$q$, $q$Thinkific Plus$q$, $q$https://www.thinkific.com/plus/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87506dfb-5657-49d7-8e5e-045ff26172f8', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87506dfb-5657-49d7-8e5e-045ff26172f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2708453f-26c2-4ab0-9cc3-e26e1734570d', $q$sharefile$q$, $q$ShareFile$q$, $q$https://www.sharefile.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2708453f-26c2-4ab0-9cc3-e26e1734570d', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2708453f-26c2-4ab0-9cc3-e26e1734570d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('57bca61a-8bf5-445a-b275-cddca078e066', $q$advancedmd$q$, $q$AdvancedMD$q$, $q$https://www.advancedmd.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '57bca61a-8bf5-445a-b275-cddca078e066', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57bca61a-8bf5-445a-b275-cddca078e066')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a7a119c-cb78-4261-9173-2f602bd0dde1', $q$trustarc$q$, $q$TrustArc$q$, $q$https://trustarc.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a7a119c-cb78-4261-9173-2f602bd0dde1', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a7a119c-cb78-4261-9173-2f602bd0dde1')
ON CONFLICT DO NOTHING;


-- Strategic metadata — one row per list entry, whether it became a new
-- tool above or matched an existing one (see the duplicate report).
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'dd2f89ec-7433-42f0-b381-627ffd6ed01f', $q$traffic_anchor$q$, 10, 5, 2, $q$AI Assistants & Search$q$, 1 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd2f89ec-7433-42f0-b381-627ffd6ed01f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4648f65b-d55e-4ed8-ad0d-c40b3343b03c', $q$traffic_anchor$q$, 10, 5, 2, $q$AI Assistants & Search$q$, 2 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4648f65b-d55e-4ed8-ad0d-c40b3343b03c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fca1586c-759c-47c3-b289-f752d876f509', $q$traffic_anchor$q$, 10, 5, 2, $q$AI Assistants & Search$q$, 3 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fca1586c-759c-47c3-b289-f752d876f509')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e', $q$traffic_anchor$q$, 10, 5, 2, $q$No-Code, Automation & AI Coding$q$, 8 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e6d92dc8-7c30-4adc-b031-5d6acb8bc41e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '99710d40-9738-45f6-85cf-44868ba8a012', $q$traffic_anchor$q$, 10, 5, 2, $q$AI Image, Video & Audio$q$, 9 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99710d40-9738-45f6-85cf-44868ba8a012')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '634ed19f-2d5a-4498-ac78-c41f58bbdf9a', $q$traffic_anchor$q$, 10, 5, 2, $q$AI Image, Video & Audio$q$, 10 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '634ed19f-2d5a-4498-ac78-c41f58bbdf9a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ef29f747-f15c-4d08-991c-1e5c8ee38641', $q$traffic_anchor$q$, 10, 5, 2, $q$CRM & Sales$q$, 13 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef29f747-f15c-4d08-991c-1e5c8ee38641')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '504c1944-1d50-48a6-8bbd-c32da5230932', $q$traffic_anchor$q$, 10, 5, 2, $q$SEO, Analytics & Advertising$q$, 18 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '504c1944-1d50-48a6-8bbd-c32da5230932')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '309c46ca-1066-4ecc-be4d-d5984e2cd67e', $q$traffic_anchor$q$, 10, 5, 2, $q$Finance, Accounting & Payments$q$, 25 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '309c46ca-1066-4ecc-be4d-d5984e2cd67e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '9e200cb1-a048-4c0a-ac15-ece1a517f982', $q$traffic_anchor$q$, 10, 5, 2, $q$Finance, Accounting & Payments$q$, 26 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9e200cb1-a048-4c0a-ac15-ece1a517f982')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'bd2fce1d-50cd-44a2-927e-39cfe30406dd', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 29 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd2fce1d-50cd-44a2-927e-39cfe30406dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 30 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38ae237b-78e7-4604-8a45-6bc26a5f678f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8741e733-7b13-489c-8696-9d50fbf35b42', $q$traffic_anchor$q$, 10, 5, 2, $q$Ecommerce & Website Builders$q$, 32 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8741e733-7b13-489c-8696-9d50fbf35b42')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$traffic_anchor$q$, 10, 5, 2, $q$Developer Tools & Cloud$q$, 33 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37230cac-8680-4f59-8fa6-d34a5321ea4d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd05ce7d8-d828-41bd-aa04-c81764640a9f', $q$traffic_anchor$q$, 10, 5, 2, $q$Developer Tools & Cloud$q$, 34 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd05ce7d8-d828-41bd-aa04-c81764640a9f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f7ec4de0-b2b8-428c-8872-3470c3040b95', $q$traffic_anchor$q$, 10, 5, 2, $q$Developer Tools & Cloud$q$, 35 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7ec4de0-b2b8-428c-8872-3470c3040b95')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ea6eaa06-f20d-4fac-bdce-f1792eeece95', $q$traffic_anchor$q$, 10, 5, 2, $q$Developer Tools & Cloud$q$, 36 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea6eaa06-f20d-4fac-bdce-f1792eeece95')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1ae91efd-338e-4ef0-9f0b-3f2a51548062', $q$traffic_anchor$q$, 10, 5, 2, $q$Data, BI & Databases$q$, 38 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ae91efd-338e-4ef0-9f0b-3f2a51548062')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3420577a-4640-4828-a64b-5afe612e65be', $q$traffic_anchor$q$, 10, 5, 2, $q$Data, BI & Databases$q$, 39 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3420577a-4640-4828-a64b-5afe612e65be')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$traffic_anchor$q$, 10, 5, 2, $q$Finance, Accounting & Payments$q$, 41 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8b71f7fc-c26a-419f-a1fe-0de98471da7f', $q$traffic_anchor$q$, 10, 5, 2, $q$HR, Recruiting & Payroll$q$, 42 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b71f7fc-c26a-419f-a1fe-0de98471da7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'dba954e7-42de-4597-adda-d2b1563a9303', $q$traffic_anchor$q$, 10, 5, 2, $q$Customer Support & Success$q$, 43 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dba954e7-42de-4597-adda-d2b1563a9303')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8439de35-62ee-4d9e-bf6a-d659a4bed51b', $q$traffic_anchor$q$, 10, 5, 2, $q$AI Assistants & Search$q$, 47 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8439de35-62ee-4d9e-bf6a-d659a4bed51b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1769cc92-bed0-46a8-9354-2d81fdae9ad4', $q$traffic_anchor$q$, 10, 5, 2, $q$AI Assistants & Search$q$, 48 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1769cc92-bed0-46a8-9354-2d81fdae9ad4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c4134253-62ea-44f0-8d58-12d26946aac4', $q$traffic_anchor$q$, 10, 5, 2, $q$AI Image, Video & Audio$q$, 49 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4134253-62ea-44f0-8d58-12d26946aac4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '53d8a955-0f74-4814-b877-caeb34bf0761', $q$traffic_anchor$q$, 10, 5, 2, $q$Design & Creative$q$, 50 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53d8a955-0f74-4814-b877-caeb34bf0761')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3c515695-9a2f-4479-901f-6ca785a0e07c', $q$monetization_target$q$, 9, 9, 10, $q$AI Writing & Content$q$, 51 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c515695-9a2f-4479-901f-6ca785a0e07c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f31dc073-4cc3-41a0-aee3-8701aed38b64', $q$monetization_target$q$, 9, 9, 10, $q$AI Writing & Content$q$, 53 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f31dc073-4cc3-41a0-aee3-8701aed38b64')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'bf487e99-d6ce-4329-b02b-a9efe905e265', $q$monetization_target$q$, 9, 9, 10, $q$No-Code, Automation & AI Coding$q$, 54 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf487e99-d6ce-4329-b02b-a9efe905e265')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ae913412-1cd7-414a-b291-f3e2c6aabc3b', $q$monetization_target$q$, 9, 9, 10, $q$AI Writing & Content$q$, 55 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae913412-1cd7-414a-b291-f3e2c6aabc3b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b595e89a-3f11-4ebc-af37-5b2c490d5f49', $q$monetization_target$q$, 9, 9, 10, $q$No-Code, Automation & AI Coding$q$, 56 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b595e89a-3f11-4ebc-af37-5b2c490d5f49')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5355600e-7720-44d4-a9be-5558cbddc251', $q$monetization_target$q$, 9, 9, 10, $q$AI Image, Video & Audio$q$, 57 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5355600e-7720-44d4-a9be-5558cbddc251')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2345d0ed-4255-4773-9565-b0ced4967bcd', $q$monetization_target$q$, 9, 9, 10, $q$No-Code, Automation & AI Coding$q$, 59 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2345d0ed-4255-4773-9565-b0ced4967bcd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '680a2bd4-9753-4f67-b86c-2cfe5c3b463e', $q$monetization_target$q$, 9, 9, 10, $q$AI Image, Video & Audio$q$, 60 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '680a2bd4-9753-4f67-b86c-2cfe5c3b463e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f18cd757-37d4-43bb-966d-11c389f63bb7', $q$monetization_target$q$, 9, 9, 10, $q$AI Writing & Content$q$, 61 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f18cd757-37d4-43bb-966d-11c389f63bb7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '11ea99d1-4f63-4f6b-9533-0e1448c3d8f5', $q$monetization_target$q$, 9, 9, 10, $q$No-Code, Automation & AI Coding$q$, 62 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11ea99d1-4f63-4f6b-9533-0e1448c3d8f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0a25dd23-914b-48e4-8554-6252f6edb666', $q$monetization_target$q$, 9, 9, 10, $q$AI Image, Video & Audio$q$, 63 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a25dd23-914b-48e4-8554-6252f6edb666')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a5fa585a-6104-495a-a452-912fb307c35f', $q$monetization_target$q$, 9, 9, 10, $q$AI Writing & Content$q$, 64 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5fa585a-6104-495a-a452-912fb307c35f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'cdbd18ff-a281-4cb1-87dc-90ab666683fe', $q$monetization_target$q$, 9, 9, 10, $q$No-Code, Automation & AI Coding$q$, 65 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdbd18ff-a281-4cb1-87dc-90ab666683fe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '82e23514-860e-4179-aa6e-cc95f88d7372', $q$monetization_target$q$, 9, 9, 10, $q$AI Image, Video & Audio$q$, 66 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82e23514-860e-4179-aa6e-cc95f88d7372')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$monetization_target$q$, 9, 9, 10, $q$AI Writing & Content$q$, 67 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '279c7ff2-d20a-4f79-bdc5-e15f28fdc531')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'cd77df40-1f67-4666-a14d-e6d3b6245dbf', $q$monetization_target$q$, 9, 9, 10, $q$No-Code, Automation & AI Coding$q$, 68 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd77df40-1f67-4666-a14d-e6d3b6245dbf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd3afb8a6-1eeb-4106-9923-58f01f27af75', $q$monetization_target$q$, 9, 9, 9, $q$AI Image, Video & Audio$q$, 69 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3afb8a6-1eeb-4106-9923-58f01f27af75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$monetization_target$q$, 9, 9, 9, $q$AI Writing & Content$q$, 70 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3c1c11fd-4faf-4d6c-8f2f-a21304ececf9', $q$monetization_target$q$, 9, 9, 9, $q$No-Code, Automation & AI Coding$q$, 71 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c1c11fd-4faf-4d6c-8f2f-a21304ececf9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '35ea48fd-76db-4106-94b4-24dc1d80bfc9', $q$monetization_target$q$, 9, 9, 9, $q$AI Image, Video & Audio$q$, 72 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35ea48fd-76db-4106-94b4-24dc1d80bfc9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ab7b3699-804e-44f2-83c1-0814b44d388b', $q$monetization_target$q$, 9, 9, 9, $q$AI Writing & Content$q$, 73 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab7b3699-804e-44f2-83c1-0814b44d388b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$monetization_target$q$, 9, 9, 9, $q$No-Code, Automation & AI Coding$q$, 74 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd2a1121c-315f-4076-816c-d10e98925f90', $q$monetization_target$q$, 8, 8, 9, $q$AI Image, Video & Audio$q$, 76 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2a1121c-315f-4076-816c-d10e98925f90')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a009a42b-b701-46b1-bc27-3bc5f232d1f9', $q$monetization_target$q$, 8, 8, 9, $q$AI Writing & Content$q$, 77 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a009a42b-b701-46b1-bc27-3bc5f232d1f9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '395c608c-5d39-431e-9dd4-670981dd1352', $q$monetization_target$q$, 8, 8, 9, $q$No-Code, Automation & AI Coding$q$, 78 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '395c608c-5d39-431e-9dd4-670981dd1352')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fe08bff8-895b-4ba9-9fcd-09e3e773bb57', $q$monetization_target$q$, 9, 9, 10, $q$Ecommerce & Website Builders$q$, 80 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe08bff8-895b-4ba9-9fcd-09e3e773bb57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b433c3e5-1372-4d99-8fbd-7702d9586534', $q$monetization_target$q$, 8, 8, 9, $q$AI Image, Video & Audio$q$, 82 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b433c3e5-1372-4d99-8fbd-7702d9586534')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '7de794bf-b842-4128-82f7-b18545f5a992', $q$monetization_target$q$, 8, 8, 9, $q$AI Writing & Content$q$, 83 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7de794bf-b842-4128-82f7-b18545f5a992')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63', $q$monetization_target$q$, 8, 8, 9, $q$No-Code, Automation & AI Coding$q$, 84 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c9d7b29-e8d4-4a7e-a8c3-4a68e0b54d63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ca9138f2-35fd-49cf-8af2-819fa2691854', $q$monetization_target$q$, 9, 9, 10, $q$CRM & Sales$q$, 85 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca9138f2-35fd-49cf-8af2-819fa2691854')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c3103af2-b89a-4cb2-ac57-83030df19efa', $q$monetization_target$q$, 9, 9, 10, $q$Ecommerce & Website Builders$q$, 87 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3103af2-b89a-4cb2-ac57-83030df19efa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd46e98c7-b182-4988-9c3a-b509b0e2beff', $q$monetization_target$q$, 9, 9, 10, $q$Marketing Automation & Email$q$, 88 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd46e98c7-b182-4988-9c3a-b509b0e2beff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5ac53984-b400-454f-baed-b707bfdb12ec', $q$monetization_target$q$, 8, 8, 9, $q$AI Image, Video & Audio$q$, 89 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ac53984-b400-454f-baed-b707bfdb12ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b77c4b21-5cd3-47b0-a144-34c9f0369acb', $q$monetization_target$q$, 8, 8, 9, $q$AI Writing & Content$q$, 90 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b77c4b21-5cd3-47b0-a144-34c9f0369acb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f60ec8fa-b75a-462e-84f1-bc0d2d866e63', $q$monetization_target$q$, 8, 8, 9, $q$No-Code, Automation & AI Coding$q$, 91 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f60ec8fa-b75a-462e-84f1-bc0d2d866e63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e9f9ecc1-a538-4c7f-b987-67a12f749876', $q$monetization_target$q$, 9, 9, 10, $q$CRM & Sales$q$, 92 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9f9ecc1-a538-4c7f-b987-67a12f749876')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a0d08d8f-1e51-4d00-986a-4e669f665333', $q$monetization_target$q$, 9, 9, 10, $q$Developer Tools & Cloud$q$, 94 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0d08d8f-1e51-4d00-986a-4e669f665333')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fd2949bf-02b3-4401-a031-61e56f53b753', $q$monetization_target$q$, 9, 9, 10, $q$Marketing Automation & Email$q$, 96 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd2949bf-02b3-4401-a031-61e56f53b753')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '38565ec2-30ed-445f-b1d3-7ebd8fe67504', $q$monetization_target$q$, 8, 8, 9, $q$AI Image, Video & Audio$q$, 97 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38565ec2-30ed-445f-b1d3-7ebd8fe67504')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '55145ca3-38c5-472e-91e5-8e0f54c3f703', $q$monetization_target$q$, 8, 8, 9, $q$AI Writing & Content$q$, 98 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '55145ca3-38c5-472e-91e5-8e0f54c3f703')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '769d68c4-6d5c-4d50-b613-c3ab3a76591a', $q$monetization_target$q$, 8, 8, 9, $q$No-Code, Automation & AI Coding$q$, 99 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '769d68c4-6d5c-4d50-b613-c3ab3a76591a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3791efda-beab-41cb-b03c-14070ac10a70', $q$monetization_target$q$, 9, 9, 10, $q$CRM & Sales$q$, 100 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3791efda-beab-41cb-b03c-14070ac10a70')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '421bda78-e5b8-4973-86a7-1481632d297e', $q$monetization_target$q$, 9, 9, 10, $q$Customer Support & Success$q$, 101 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '421bda78-e5b8-4973-86a7-1481632d297e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a5a9d90c-49e0-401c-af66-b1fa6982ad32', $q$monetization_target$q$, 9, 9, 10, $q$Developer Tools & Cloud$q$, 102 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5a9d90c-49e0-401c-af66-b1fa6982ad32')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2', $q$monetization_target$q$, 9, 9, 10, $q$SEO, Analytics & Advertising$q$, 105 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '800f1735-5876-4cb4-b6d8-d7bee24e7a9f', $q$monetization_target$q$, 8, 8, 9, $q$AI Image, Video & Audio$q$, 106 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '800f1735-5876-4cb4-b6d8-d7bee24e7a9f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd43520c9-b82b-4496-a05c-754885af835f', $q$monetization_target$q$, 8, 8, 9, $q$AI Writing & Content$q$, 107 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd43520c9-b82b-4496-a05c-754885af835f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '693230a0-d462-46dc-9108-9752df61caba', $q$monetization_target$q$, 8, 8, 9, $q$No-Code, Automation & AI Coding$q$, 108 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '693230a0-d462-46dc-9108-9752df61caba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '45cee20f-f1da-4f5d-86e5-485b9a0b34b6', $q$monetization_target$q$, 9, 9, 10, $q$Customer Support & Success$q$, 109 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45cee20f-f1da-4f5d-86e5-485b9a0b34b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ff342572-8c41-421f-88e9-ab4155b8dbbf', $q$monetization_target$q$, 9, 9, 10, $q$Developer Tools & Cloud$q$, 110 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff342572-8c41-421f-88e9-ab4155b8dbbf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '83a31e14-8b81-4e6f-bd44-bf1082ccd21f', $q$monetization_target$q$, 9, 9, 10, $q$Marketing Automation & Email$q$, 112 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83a31e14-8b81-4e6f-bd44-bf1082ccd21f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0d3a5907-52ea-4312-8ed3-6325f131fbef', $q$monetization_target$q$, 9, 9, 10, $q$SEO, Analytics & Advertising$q$, 113 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d3a5907-52ea-4312-8ed3-6325f131fbef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e08399eb-07db-4b71-82b5-43cef3fcf199', $q$monetization_target$q$, 7, 8, 9, $q$AI Image, Video & Audio$q$, 114 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e08399eb-07db-4b71-82b5-43cef3fcf199')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ca1d9da3-5f04-44f4-a493-8de2c1275125', $q$monetization_target$q$, 7, 8, 9, $q$AI Writing & Content$q$, 115 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca1d9da3-5f04-44f4-a493-8de2c1275125')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '639091c6-3897-46d2-b20e-6a7dfd423bec', $q$monetization_target$q$, 9, 9, 10, $q$CRM & Sales$q$, 116 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '639091c6-3897-46d2-b20e-6a7dfd423bec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'bea45054-992b-496b-b59e-dba14e8219b6', $q$monetization_target$q$, 9, 9, 10, $q$SEO, Analytics & Advertising$q$, 119 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bea45054-992b-496b-b59e-dba14e8219b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$monetization_target$q$, 7, 8, 8, $q$AI Image, Video & Audio$q$, 120 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1e0af591-0b3b-4416-988d-d1b31d3ab630', $q$monetization_target$q$, 7, 8, 8, $q$AI Writing & Content$q$, 121 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e0af591-0b3b-4416-988d-d1b31d3ab630')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c628f71b-c0ff-42aa-87ea-a09dfbd28490', $q$monetization_target$q$, 7, 8, 8, $q$No-Code, Automation & AI Coding$q$, 122 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c628f71b-c0ff-42aa-87ea-a09dfbd28490')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ca95321e-8259-4037-a292-11f90e6c3856', $q$monetization_target$q$, 9, 9, 9, $q$CRM & Sales$q$, 123 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca95321e-8259-4037-a292-11f90e6c3856')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '74c8afcd-fff1-4116-8c21-aa7ea3ed5869', $q$monetization_target$q$, 9, 9, 9, $q$Customer Support & Success$q$, 124 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74c8afcd-fff1-4116-8c21-aa7ea3ed5869')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0eb2413c-7ff7-4575-ac2b-3bd288d5a1e3', $q$monetization_target$q$, 9, 9, 9, $q$Ecommerce & Website Builders$q$, 125 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0eb2413c-7ff7-4575-ac2b-3bd288d5a1e3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$monetization_target$q$, 9, 9, 9, $q$Marketing Automation & Email$q$, 126 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fd5e3d2c-6ddc-4750-8bd5-ba653068f181', $q$monetization_target$q$, 9, 9, 9, $q$SEO, Analytics & Advertising$q$, 127 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd5e3d2c-6ddc-4750-8bd5-ba653068f181')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$monetization_target$q$, 9, 9, 9, $q$CRM & Sales$q$, 128 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63a64c42-cc4a-45fb-b461-783e43ab44aa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '00ba7518-5599-46d0-b82c-32563e1bac39', $q$monetization_target$q$, 9, 9, 9, $q$Customer Support & Success$q$, 129 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00ba7518-5599-46d0-b82c-32563e1bac39')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0091d0a1-3952-450b-b212-e0a36e137352', $q$monetization_target$q$, 9, 9, 9, $q$Ecommerce & Website Builders$q$, 131 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0091d0a1-3952-450b-b212-e0a36e137352')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '381765dd-2a06-4f6d-87c2-9252da262faf', $q$monetization_target$q$, 9, 9, 9, $q$Marketing Automation & Email$q$, 132 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '381765dd-2a06-4f6d-87c2-9252da262faf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1677b9b7-dd62-421f-95ae-ac5647c1cc29', $q$monetization_target$q$, 9, 9, 9, $q$SEO, Analytics & Advertising$q$, 133 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1677b9b7-dd62-421f-95ae-ac5647c1cc29')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e511c2d2-ceea-48e2-bbc6-ea875df08668', $q$monetization_target$q$, 8, 8, 9, $q$CRM & Sales$q$, 136 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e511c2d2-ceea-48e2-bbc6-ea875df08668')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6e610684-65a5-4699-9418-e1149b45dc11', $q$monetization_target$q$, 8, 8, 9, $q$Customer Support & Success$q$, 137 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e610684-65a5-4699-9418-e1149b45dc11')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '26474910-f9a4-4767-aebb-d9caf5983498', $q$monetization_target$q$, 8, 8, 9, $q$Developer Tools & Cloud$q$, 138 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26474910-f9a4-4767-aebb-d9caf5983498')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '7d3da374-bd31-46df-a1d1-306837c8aaf8', $q$monetization_target$q$, 8, 8, 9, $q$Ecommerce & Website Builders$q$, 139 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d3da374-bd31-46df-a1d1-306837c8aaf8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'eb14d50a-e3a5-457e-8b21-c45cdda89d54', $q$monetization_target$q$, 8, 8, 9, $q$Marketing Automation & Email$q$, 140 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb14d50a-e3a5-457e-8b21-c45cdda89d54')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f4b7a227-b58a-4c5d-b4e2-c8b940afb795', $q$monetization_target$q$, 8, 8, 9, $q$SEO, Analytics & Advertising$q$, 141 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4b7a227-b58a-4c5d-b4e2-c8b940afb795')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e36dac6a-4141-4189-8ee8-eb6f2ed8f21f', $q$monetization_target$q$, 8, 8, 9, $q$CRM & Sales$q$, 143 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e36dac6a-4141-4189-8ee8-eb6f2ed8f21f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b1f76735-5538-4701-8d39-11c92919d1d4', $q$monetization_target$q$, 8, 8, 9, $q$Customer Support & Success$q$, 144 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1f76735-5538-4701-8d39-11c92919d1d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1a2fc4b5-8703-4434-a8f7-702d91a3ded6', $q$monetization_target$q$, 8, 8, 9, $q$Ecommerce & Website Builders$q$, 145 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a2fc4b5-8703-4434-a8f7-702d91a3ded6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f19864e7-5001-4ebd-84f9-5bb40f1b4b22', $q$monetization_target$q$, 8, 8, 9, $q$Marketing Automation & Email$q$, 146 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f19864e7-5001-4ebd-84f9-5bb40f1b4b22')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6ec8c9fb-dc39-4341-8a0f-b8c3e18a508d', $q$monetization_target$q$, 8, 8, 9, $q$SEO, Analytics & Advertising$q$, 147 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ec8c9fb-dc39-4341-8a0f-b8c3e18a508d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd81fd94a-547f-4b52-8585-6375a6414c6d', $q$monetization_target$q$, 9, 9, 10, $q$Documents, PDF & E-signature$q$, 148 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd81fd94a-547f-4b52-8585-6375a6414c6d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2713c5df-5f0a-4c25-8922-9c315b9b040b', $q$monetization_target$q$, 9, 9, 10, $q$Project & Work Management$q$, 150 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2713c5df-5f0a-4c25-8922-9c315b9b040b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$monetization_target$q$, 9, 9, 10, $q$Social Media Management$q$, 151 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f3558245-b91d-4875-b0dc-3842ac4f3805', $q$monetization_target$q$, 8, 8, 9, $q$CRM & Sales$q$, 152 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3558245-b91d-4875-b0dc-3842ac4f3805')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '96c3ecf0-fcaf-4131-91d0-08ec9da68acf', $q$monetization_target$q$, 8, 8, 9, $q$Customer Support & Success$q$, 153 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96c3ecf0-fcaf-4131-91d0-08ec9da68acf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a4b8ce3e-bd25-4482-8847-63041b2784ea', $q$monetization_target$q$, 8, 8, 9, $q$Ecommerce & Website Builders$q$, 154 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4b8ce3e-bd25-4482-8847-63041b2784ea')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '902d8b1b-af39-4cdf-a2b7-db0c5672b059', $q$monetization_target$q$, 8, 8, 9, $q$Marketing Automation & Email$q$, 155 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '902d8b1b-af39-4cdf-a2b7-db0c5672b059')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '65ed3bfb-065e-4391-8e0f-5ffc7b205daa', $q$monetization_target$q$, 8, 8, 9, $q$SEO, Analytics & Advertising$q$, 156 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65ed3bfb-065e-4391-8e0f-5ffc7b205daa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e5e2d12b-a101-4a07-8262-007ffad934e6', $q$monetization_target$q$, 9, 9, 10, $q$Finance, Accounting & Payments$q$, 158 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5e2d12b-a101-4a07-8262-007ffad934e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd4a5fa48-12d7-422f-9252-b7bea83b9ff4', $q$monetization_target$q$, 9, 9, 10, $q$Project & Work Management$q$, 159 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4a5fa48-12d7-422f-9252-b7bea83b9ff4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '34b4f794-ce37-4598-b6e9-fe9e9269a4c8', $q$monetization_target$q$, 9, 9, 10, $q$Social Media Management$q$, 160 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34b4f794-ce37-4598-b6e9-fe9e9269a4c8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$monetization_target$q$, 8, 8, 9, $q$CRM & Sales$q$, 161 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1f2610a4-32aa-4b86-8154-68ef806123a9', $q$monetization_target$q$, 8, 8, 9, $q$Customer Support & Success$q$, 162 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f2610a4-32aa-4b86-8154-68ef806123a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6807ab40-552b-4044-8610-c58acf04855d', $q$monetization_target$q$, 8, 8, 9, $q$Ecommerce & Website Builders$q$, 163 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6807ab40-552b-4044-8610-c58acf04855d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5bf89844-295b-44a9-b875-c4f86ae4f19d', $q$monetization_target$q$, 8, 8, 9, $q$Marketing Automation & Email$q$, 164 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5bf89844-295b-44a9-b875-c4f86ae4f19d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b89d9029-ae3f-4881-beeb-41c427d2ace5', $q$monetization_target$q$, 8, 8, 9, $q$SEO, Analytics & Advertising$q$, 165 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b89d9029-ae3f-4881-beeb-41c427d2ace5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$monetization_target$q$, 9, 9, 10, $q$Documents, PDF & E-signature$q$, 166 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '970dd292-16fa-475f-996d-e50070df18a1', $q$monetization_target$q$, 9, 9, 10, $q$Finance, Accounting & Payments$q$, 167 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '970dd292-16fa-475f-996d-e50070df18a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '57763ac9-8244-4ff8-8a06-376f30693d6f', $q$monetization_target$q$, 9, 9, 10, $q$Social Media Management$q$, 169 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57763ac9-8244-4ff8-8a06-376f30693d6f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ab650234-f963-4681-8c8b-6976b1473d49', $q$monetization_target$q$, 8, 8, 9, $q$CRM & Sales$q$, 170 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab650234-f963-4681-8c8b-6976b1473d49')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd6c043af-953c-4969-8e51-48311abc4eac', $q$monetization_target$q$, 8, 8, 9, $q$Customer Support & Success$q$, 171 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6c043af-953c-4969-8e51-48311abc4eac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '37d9ac64-b7a8-413c-8a11-4db621fc9e33', $q$monetization_target$q$, 8, 8, 9, $q$Ecommerce & Website Builders$q$, 172 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37d9ac64-b7a8-413c-8a11-4db621fc9e33')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '92d699c1-88c8-4560-8348-409710af3ec5', $q$monetization_target$q$, 9, 9, 10, $q$Documents, PDF & E-signature$q$, 174 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '92d699c1-88c8-4560-8348-409710af3ec5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f4698c6b-f210-42dd-bcc1-bc0d8ae274f3', $q$monetization_target$q$, 9, 9, 10, $q$Finance, Accounting & Payments$q$, 175 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4698c6b-f210-42dd-bcc1-bc0d8ae274f3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ff2a2bb2-265f-4fb2-8b9b-06a77db11584', $q$monetization_target$q$, 9, 9, 10, $q$Project & Work Management$q$, 176 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff2a2bb2-265f-4fb2-8b9b-06a77db11584')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$monetization_target$q$, 9, 9, 10, $q$Social Media Management$q$, 177 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '943e842e-ea6b-423a-ad07-1657fff38f93', $q$monetization_target$q$, 7, 8, 9, $q$CRM & Sales$q$, 178 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '943e842e-ea6b-423a-ad07-1657fff38f93')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '7e2a4455-43c7-4157-9b84-0b155a37c0a1', $q$monetization_target$q$, 7, 8, 9, $q$Customer Support & Success$q$, 179 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e2a4455-43c7-4157-9b84-0b155a37c0a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ba98f35c-82a6-4687-8668-be82a6c21e8d', $q$monetization_target$q$, 7, 8, 9, $q$Developer Tools & Cloud$q$, 180 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba98f35c-82a6-4687-8668-be82a6c21e8d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c936aee7-ae75-49ba-bdd8-c809f3dbe535', $q$monetization_target$q$, 7, 8, 9, $q$Ecommerce & Website Builders$q$, 181 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c936aee7-ae75-49ba-bdd8-c809f3dbe535')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fd78a231-31fa-4eb1-8802-93fe59f582da', $q$monetization_target$q$, 7, 8, 9, $q$Marketing Automation & Email$q$, 182 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd78a231-31fa-4eb1-8802-93fe59f582da')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b704ca00-ce10-434d-b1f3-abb303ffa4e4', $q$monetization_target$q$, 9, 9, 10, $q$Documents, PDF & E-signature$q$, 184 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b704ca00-ce10-434d-b1f3-abb303ffa4e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '96b25c45-e39f-4efc-ab12-25f3b2c786c6', $q$monetization_target$q$, 9, 9, 10, $q$Project & Work Management$q$, 185 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96b25c45-e39f-4efc-ab12-25f3b2c786c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '71aee4e7-d181-4086-ac46-c52b1a6ba51e', $q$monetization_target$q$, 9, 9, 10, $q$Social Media Management$q$, 186 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71aee4e7-d181-4086-ac46-c52b1a6ba51e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '584e1528-a367-458c-a4fb-954e6f1d06c4', $q$monetization_target$q$, 7, 8, 8, $q$CRM & Sales$q$, 187 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '584e1528-a367-458c-a4fb-954e6f1d06c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '34fac46a-38d6-4512-b24c-19e0f5439125', $q$monetization_target$q$, 7, 8, 8, $q$Developer Tools & Cloud$q$, 188 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34fac46a-38d6-4512-b24c-19e0f5439125')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3755468e-f104-4abb-9bde-b2e658eb3053', $q$monetization_target$q$, 7, 8, 8, $q$Ecommerce & Website Builders$q$, 189 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3755468e-f104-4abb-9bde-b2e658eb3053')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c2c65cc7-4f96-4e51-91e3-3da83872e2cd', $q$monetization_target$q$, 7, 8, 8, $q$Marketing Automation & Email$q$, 190 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2c65cc7-4f96-4e51-91e3-3da83872e2cd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'cba47027-91c4-4aeb-adf8-67c52b50f458', $q$monetization_target$q$, 7, 8, 8, $q$SEO, Analytics & Advertising$q$, 191 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cba47027-91c4-4aeb-adf8-67c52b50f458')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ba837227-8967-47be-bd65-e9a86eafe9e3', $q$monetization_target$q$, 9, 9, 9, $q$Documents, PDF & E-signature$q$, 192 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba837227-8967-47be-bd65-e9a86eafe9e3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c0078b68-a3db-4bd7-a30e-97b858ae7f1e', $q$monetization_target$q$, 9, 9, 9, $q$Project & Work Management$q$, 193 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0078b68-a3db-4bd7-a30e-97b858ae7f1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0af4f822-0c8a-4a66-b0ae-4dcb5e2d9f6b', $q$monetization_target$q$, 9, 9, 9, $q$Social Media Management$q$, 194 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0af4f822-0c8a-4a66-b0ae-4dcb5e2d9f6b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '40bbcaf4-84e3-47b8-9d27-074bedb96236', $q$monetization_target$q$, 9, 9, 9, $q$Documents, PDF & E-signature$q$, 195 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40bbcaf4-84e3-47b8-9d27-074bedb96236')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5b7732f8-9233-468e-8b6e-92b089440d94', $q$monetization_target$q$, 9, 9, 9, $q$Finance, Accounting & Payments$q$, 196 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b7732f8-9233-468e-8b6e-92b089440d94')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e762d0b5-3f6a-4165-89d8-5d2a4889217d', $q$monetization_target$q$, 9, 9, 9, $q$Project & Work Management$q$, 197 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e762d0b5-3f6a-4165-89d8-5d2a4889217d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0b8a0924-eba0-43ca-b6e5-f3c97392c07e', $q$monetization_target$q$, 9, 9, 9, $q$Social Media Management$q$, 198 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b8a0924-eba0-43ca-b6e5-f3c97392c07e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'db6b7ee1-78f4-46e7-8173-0f395de936ba', $q$monetization_target$q$, 9, 9, 10, $q$Forms, Surveys & Research$q$, 199 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db6b7ee1-78f4-46e7-8173-0f395de936ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '727ce456-3ada-4396-a467-30164d11f40e', $q$monetization_target$q$, 9, 9, 10, $q$Scheduling, Time & Workforce$q$, 200 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '727ce456-3ada-4396-a467-30164d11f40e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e66e1448-1366-4bae-8a4e-3bcd643199a5', $q$monetization_target$q$, 8, 8, 9, $q$Documents, PDF & E-signature$q$, 202 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e66e1448-1366-4bae-8a4e-3bcd643199a5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '711daa05-d514-411e-aebb-2efdcb754ed0', $q$monetization_target$q$, 8, 8, 9, $q$Project & Work Management$q$, 203 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '711daa05-d514-411e-aebb-2efdcb754ed0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e279aac8-93be-4884-86b3-544687f01909', $q$monetization_target$q$, 8, 8, 9, $q$Social Media Management$q$, 204 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e279aac8-93be-4884-86b3-544687f01909')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'adb39746-99f6-497c-bc76-0bb5b5de259e', $q$monetization_target$q$, 9, 9, 10, $q$HR, Recruiting & Payroll$q$, 206 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'adb39746-99f6-497c-bc76-0bb5b5de259e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e533002d-957b-4a75-967f-c0c9aa3c3fc4', $q$monetization_target$q$, 8, 8, 9, $q$Documents, PDF & E-signature$q$, 209 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e533002d-957b-4a75-967f-c0c9aa3c3fc4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$monetization_target$q$, 8, 8, 9, $q$Project & Work Management$q$, 210 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '10056aba-b816-4765-8bc7-9b81336ea50d', $q$monetization_target$q$, 8, 8, 9, $q$Social Media Management$q$, 211 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10056aba-b816-4765-8bc7-9b81336ea50d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f1fa4604-a254-46d0-ac89-4c0c21148bf3', $q$monetization_target$q$, 9, 9, 10, $q$Data, BI & Databases$q$, 212 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1fa4604-a254-46d0-ac89-4c0c21148bf3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '7f58ae22-1c44-4f9a-9b61-75861272aaaa', $q$monetization_target$q$, 9, 9, 10, $q$HR, Recruiting & Payroll$q$, 214 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f58ae22-1c44-4f9a-9b61-75861272aaaa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6e652351-8445-42ef-91dd-ddbf6f9320b4', $q$monetization_target$q$, 9, 9, 10, $q$Security, IT & Passwords$q$, 216 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e652351-8445-42ef-91dd-ddbf6f9320b4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1f11dc1a-4647-48d8-94d1-00190d730c59', $q$monetization_target$q$, 8, 8, 9, $q$Documents, PDF & E-signature$q$, 217 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f11dc1a-4647-48d8-94d1-00190d730c59')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2160b497-eee0-445d-8e03-8e017410723b', $q$monetization_target$q$, 8, 8, 9, $q$Project & Work Management$q$, 218 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2160b497-eee0-445d-8e03-8e017410723b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd33a449d-fed5-4373-8185-a70d16979e8b', $q$monetization_target$q$, 8, 8, 9, $q$Social Media Management$q$, 219 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd33a449d-fed5-4373-8185-a70d16979e8b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '94b9a1ae-427d-49ec-bb26-75d68dd17562', $q$monetization_target$q$, 9, 9, 10, $q$Data, BI & Databases$q$, 220 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94b9a1ae-427d-49ec-bb26-75d68dd17562')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'bd5a4743-03ea-4f41-9507-17a3a9f17894', $q$monetization_target$q$, 9, 9, 10, $q$Forms, Surveys & Research$q$, 221 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd5a4743-03ea-4f41-9507-17a3a9f17894')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8ba3ae79-2d46-4049-881a-4cf6417f0f42', $q$monetization_target$q$, 9, 9, 10, $q$HR, Recruiting & Payroll$q$, 222 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ba3ae79-2d46-4049-881a-4cf6417f0f42')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e7ad17c3-2624-42dd-affe-a2105bd2af56', $q$monetization_target$q$, 9, 9, 10, $q$Scheduling, Time & Workforce$q$, 223 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7ad17c3-2624-42dd-affe-a2105bd2af56')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4504a9e9-0f49-455b-ad80-15afb8c4139d', $q$monetization_target$q$, 9, 9, 10, $q$Security, IT & Passwords$q$, 224 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4504a9e9-0f49-455b-ad80-15afb8c4139d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$monetization_target$q$, 8, 8, 9, $q$Documents, PDF & E-signature$q$, 225 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d012baf-f581-41bc-84f4-cdf167ff2fba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '336862e5-da77-44d8-bed2-981fb6c31cb8', $q$monetization_target$q$, 8, 8, 9, $q$Project & Work Management$q$, 226 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '336862e5-da77-44d8-bed2-981fb6c31cb8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f42fa8e7-bc0e-4925-ad0e-d76d032684c0', $q$monetization_target$q$, 8, 8, 9, $q$Social Media Management$q$, 227 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f42fa8e7-bc0e-4925-ad0e-d76d032684c0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e2f3e916-a6c5-4d8f-9d3a-df43e916f33c', $q$monetization_target$q$, 9, 9, 10, $q$Data, BI & Databases$q$, 228 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2f3e916-a6c5-4d8f-9d3a-df43e916f33c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f9b2788d-5b29-41aa-b1ae-b0abdc9d06ec', $q$monetization_target$q$, 9, 9, 10, $q$Forms, Surveys & Research$q$, 229 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9b2788d-5b29-41aa-b1ae-b0abdc9d06ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ad16437d-1117-4ccd-976f-2e70d7ae268c', $q$monetization_target$q$, 9, 9, 10, $q$HR, Recruiting & Payroll$q$, 230 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad16437d-1117-4ccd-976f-2e70d7ae268c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '7a1260e7-5c8c-4d8c-bcb5-ddf9865100d6', $q$monetization_target$q$, 9, 9, 10, $q$Scheduling, Time & Workforce$q$, 231 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a1260e7-5c8c-4d8c-bcb5-ddf9865100d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a6135772-7dd2-43ef-9ed6-959bed72bcfd', $q$monetization_target$q$, 9, 9, 10, $q$Security, IT & Passwords$q$, 232 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6135772-7dd2-43ef-9ed6-959bed72bcfd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd074be80-8a70-4e05-b0ba-7f4e75eb95d5', $q$monetization_target$q$, 8, 8, 9, $q$Documents, PDF & E-signature$q$, 233 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd074be80-8a70-4e05-b0ba-7f4e75eb95d5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e05880b5-22df-4a10-a038-632711020632', $q$monetization_target$q$, 8, 8, 9, $q$Project & Work Management$q$, 234 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e05880b5-22df-4a10-a038-632711020632')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0bab077d-6e0b-45aa-9bbf-e0c11e6547d8', $q$monetization_target$q$, 8, 8, 9, $q$Social Media Management$q$, 235 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0bab077d-6e0b-45aa-9bbf-e0c11e6547d8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'aec91730-c8dd-4844-8f50-8eb053c6b5c4', $q$monetization_target$q$, 9, 9, 10, $q$Data, BI & Databases$q$, 236 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aec91730-c8dd-4844-8f50-8eb053c6b5c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '65992870-15b8-4319-a2e6-b0c8037a92bf', $q$monetization_target$q$, 9, 9, 10, $q$Forms, Surveys & Research$q$, 237 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65992870-15b8-4319-a2e6-b0c8037a92bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3ed578b8-4db9-4fce-98af-7a24c8e0021c', $q$monetization_target$q$, 9, 9, 10, $q$HR, Recruiting & Payroll$q$, 238 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ed578b8-4db9-4fce-98af-7a24c8e0021c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '60589788-e511-45e9-b6b4-e65384870261', $q$monetization_target$q$, 9, 9, 10, $q$Scheduling, Time & Workforce$q$, 239 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60589788-e511-45e9-b6b4-e65384870261')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'cb3933a8-b7e0-4fcb-a19a-28725cbedc5d', $q$monetization_target$q$, 9, 9, 10, $q$Security, IT & Passwords$q$, 240 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb3933a8-b7e0-4fcb-a19a-28725cbedc5d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6897dd1f-98ec-4f63-aeb4-0b690c857608', $q$monetization_target$q$, 7, 8, 9, $q$Documents, PDF & E-signature$q$, 241 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6897dd1f-98ec-4f63-aeb4-0b690c857608')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b5ae9c91-1ca9-4659-9b00-8decefc6bfbb', $q$monetization_target$q$, 7, 8, 9, $q$Project & Work Management$q$, 242 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5ae9c91-1ca9-4659-9b00-8decefc6bfbb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '76c85988-2b96-4585-b424-bd7aa44ecb82', $q$monetization_target$q$, 7, 8, 9, $q$Social Media Management$q$, 243 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76c85988-2b96-4585-b424-bd7aa44ecb82')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b3f994ed-6c32-4065-b748-3f9cadf0652e', $q$monetization_target$q$, 9, 9, 10, $q$Forms, Surveys & Research$q$, 245 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3f994ed-6c32-4065-b748-3f9cadf0652e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '113b6907-6942-4e86-a060-16d7decf6a9f', $q$monetization_target$q$, 9, 9, 10, $q$HR, Recruiting & Payroll$q$, 246 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '113b6907-6942-4e86-a060-16d7decf6a9f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246', $q$monetization_target$q$, 9, 9, 10, $q$Scheduling, Time & Workforce$q$, 247 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebc6d4d6-9473-4cc7-b9e8-18f595f9b246')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3030433b-3418-43ac-aa59-beb69c92a481', $q$monetization_target$q$, 9, 9, 10, $q$Security, IT & Passwords$q$, 248 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3030433b-3418-43ac-aa59-beb69c92a481')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '95f3299d-181e-4436-824f-a995c9317a92', $q$monetization_target$q$, 7, 8, 8, $q$Documents, PDF & E-signature$q$, 249 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95f3299d-181e-4436-824f-a995c9317a92')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'bec0d6fd-87d3-42f0-99a3-c8210c0e6b88', $q$monetization_target$q$, 7, 8, 8, $q$Project & Work Management$q$, 250 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bec0d6fd-87d3-42f0-99a3-c8210c0e6b88')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '697e3318-d5de-4b30-adef-f66e599b0f6d', $q$monetization_target$q$, 7, 8, 8, $q$Social Media Management$q$, 251 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '697e3318-d5de-4b30-adef-f66e599b0f6d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1a437a0b-2569-49db-aa44-9626350f97d5', $q$monetization_target$q$, 9, 9, 9, $q$Data, BI & Databases$q$, 252 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a437a0b-2569-49db-aa44-9626350f97d5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '106def15-bc26-47dd-b9c7-dbb691ff1a8c', $q$monetization_target$q$, 9, 9, 9, $q$Forms, Surveys & Research$q$, 253 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '106def15-bc26-47dd-b9c7-dbb691ff1a8c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$monetization_target$q$, 9, 9, 9, $q$HR, Recruiting & Payroll$q$, 254 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21bdfa23-af5d-4b48-9a08-e0e8a30bd531')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d', $q$monetization_target$q$, 9, 9, 9, $q$Scheduling, Time & Workforce$q$, 255 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e8b0c5f-bbcf-4d83-aace-f29444c38a5d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$monetization_target$q$, 9, 9, 9, $q$Security, IT & Passwords$q$, 256 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '548f9382-785a-42f4-972b-c64402b145c7', $q$monetization_target$q$, 9, 9, 9, $q$Data, BI & Databases$q$, 257 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '548f9382-785a-42f4-972b-c64402b145c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e0d19f35-3b93-4946-be3c-8f0848baac1e', $q$monetization_target$q$, 9, 9, 9, $q$Forms, Surveys & Research$q$, 258 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0d19f35-3b93-4946-be3c-8f0848baac1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2f5ec638-3b36-43dd-9893-d9d2465f2931', $q$monetization_target$q$, 9, 9, 9, $q$HR, Recruiting & Payroll$q$, 259 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f5ec638-3b36-43dd-9893-d9d2465f2931')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '46a737e0-4328-492f-9496-68cfcc4a09f1', $q$monetization_target$q$, 9, 9, 9, $q$Scheduling, Time & Workforce$q$, 260 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46a737e0-4328-492f-9496-68cfcc4a09f1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '71439181-0154-4626-9efe-059864fd8420', $q$monetization_target$q$, 9, 9, 9, $q$Security, IT & Passwords$q$, 261 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71439181-0154-4626-9efe-059864fd8420')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'da3ec484-b729-46bf-a035-975b4975e2d9', $q$monetization_target$q$, 9, 9, 10, $q$Education & Learning$q$, 263 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da3ec484-b729-46bf-a035-975b4975e2d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc', $q$monetization_target$q$, 9, 9, 10, $q$File Transfer, Backup & Storage$q$, 264 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de4e2a22-9bfb-45e0-b729-a24052dd6bfc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c1f93663-fc76-4430-8326-61a4f8cb731a', $q$monetization_target$q$, 9, 9, 10, $q$Healthcare & Wellness Software$q$, 265 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1f93663-fc76-4430-8326-61a4f8cb731a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4a9597db-c7eb-4543-a969-70c7a5b25c4e', $q$monetization_target$q$, 9, 9, 10, $q$Legal, Contract & Compliance$q$, 266 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a9597db-c7eb-4543-a969-70c7a5b25c4e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'bc3b8540-7633-45e3-8bb9-3540341f319d', $q$monetization_target$q$, 9, 9, 10, $q$Real Estate, Construction & Field Service$q$, 267 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bc3b8540-7633-45e3-8bb9-3540341f319d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c6868389-8d0e-4fab-b74c-b58f1badba46', $q$monetization_target$q$, 9, 9, 10, $q$Video Conferencing, Webinar & Events$q$, 268 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6868389-8d0e-4fab-b74c-b58f1badba46')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2e3ae148-915e-4e17-8568-b7b871d77ebd', $q$monetization_target$q$, 8, 8, 9, $q$Data, BI & Databases$q$, 269 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2e3ae148-915e-4e17-8568-b7b871d77ebd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8d0cb449-bb08-4c54-9e30-c13e9e4fee0c', $q$monetization_target$q$, 8, 8, 9, $q$Forms, Surveys & Research$q$, 270 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d0cb449-bb08-4c54-9e30-c13e9e4fee0c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '732bd846-a2ef-4fbe-a773-dbbef676dd2d', $q$monetization_target$q$, 8, 8, 9, $q$HR, Recruiting & Payroll$q$, 271 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '732bd846-a2ef-4fbe-a773-dbbef676dd2d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4e050c32-d03f-48b8-8e78-e896adddf250', $q$monetization_target$q$, 8, 8, 9, $q$Scheduling, Time & Workforce$q$, 272 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e050c32-d03f-48b8-8e78-e896adddf250')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '44c37134-11ad-4612-bb00-c445b91881e5', $q$monetization_target$q$, 8, 8, 9, $q$Security, IT & Passwords$q$, 273 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44c37134-11ad-4612-bb00-c445b91881e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '92a082b4-89b7-491c-a783-39088d0397e1', $q$monetization_target$q$, 9, 9, 10, $q$Communication, Phone & Messaging$q$, 274 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '92a082b4-89b7-491c-a783-39088d0397e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2db842ea-f8cf-4398-9294-2de09ec16c62', $q$monetization_target$q$, 9, 9, 10, $q$Education & Learning$q$, 275 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2db842ea-f8cf-4398-9294-2de09ec16c62')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2d8614e8-6ffd-43b6-a2a4-26fe4217c0bd', $q$monetization_target$q$, 9, 9, 10, $q$File Transfer, Backup & Storage$q$, 276 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d8614e8-6ffd-43b6-a2a4-26fe4217c0bd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$monetization_target$q$, 9, 9, 10, $q$Healthcare & Wellness Software$q$, 277 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2debbb6c-85ad-4634-b256-8049d7c1bd11')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b4459135-cfd3-4027-bdc1-046357985283', $q$monetization_target$q$, 9, 9, 10, $q$Legal, Contract & Compliance$q$, 278 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4459135-cfd3-4027-bdc1-046357985283')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$monetization_target$q$, 9, 9, 10, $q$Real Estate, Construction & Field Service$q$, 279 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fb9ac50a-5d37-4f5c-a9c6-8693d7deb334', $q$monetization_target$q$, 8, 8, 9, $q$Data, BI & Databases$q$, 280 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb9ac50a-5d37-4f5c-a9c6-8693d7deb334')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'dd3c3df9-d594-426d-bdb3-8cf09852fd57', $q$monetization_target$q$, 8, 8, 9, $q$Forms, Surveys & Research$q$, 281 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd3c3df9-d594-426d-bdb3-8cf09852fd57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '263195a9-55ed-4e99-acf2-d53db84ad056', $q$monetization_target$q$, 8, 8, 9, $q$HR, Recruiting & Payroll$q$, 282 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '263195a9-55ed-4e99-acf2-d53db84ad056')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e7dee4a3-60ff-47bf-bc48-5261639203a3', $q$monetization_target$q$, 8, 8, 9, $q$Scheduling, Time & Workforce$q$, 283 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7dee4a3-60ff-47bf-bc48-5261639203a3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f8f6d9c2-d0cd-4055-9836-236ee79834a7', $q$monetization_target$q$, 8, 8, 9, $q$Security, IT & Passwords$q$, 284 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8f6d9c2-d0cd-4055-9836-236ee79834a7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3d765235-7add-4917-a93e-2e11d8fe95a8', $q$monetization_target$q$, 9, 9, 10, $q$Communication, Phone & Messaging$q$, 285 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d765235-7add-4917-a93e-2e11d8fe95a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5f612c37-64e2-4aeb-a2a0-9b6d63df09b4', $q$monetization_target$q$, 9, 9, 10, $q$Education & Learning$q$, 286 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f612c37-64e2-4aeb-a2a0-9b6d63df09b4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '7b18dae3-f1c5-476e-a3e2-93902b6308a3', $q$monetization_target$q$, 9, 9, 10, $q$File Transfer, Backup & Storage$q$, 287 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b18dae3-f1c5-476e-a3e2-93902b6308a3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '278217f3-1beb-4f01-8213-5430c71d5245', $q$monetization_target$q$, 9, 9, 10, $q$Legal, Contract & Compliance$q$, 288 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '278217f3-1beb-4f01-8213-5430c71d5245')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'eb149729-5f83-425f-8d50-05c96971bdf3', $q$monetization_target$q$, 9, 9, 10, $q$Real Estate, Construction & Field Service$q$, 289 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb149729-5f83-425f-8d50-05c96971bdf3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'cd25a08d-37be-447e-ac4c-280238739e44', $q$monetization_target$q$, 9, 9, 10, $q$Retail, Restaurant & POS$q$, 290 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd25a08d-37be-447e-ac4c-280238739e44')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '88db22aa-79b8-45ed-b2f4-437c05395830', $q$monetization_target$q$, 9, 9, 10, $q$Video Conferencing, Webinar & Events$q$, 291 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88db22aa-79b8-45ed-b2f4-437c05395830')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ac9546f0-77a3-4dc5-a042-5b38bd39499c', $q$monetization_target$q$, 8, 8, 9, $q$Data, BI & Databases$q$, 292 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac9546f0-77a3-4dc5-a042-5b38bd39499c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3b111844-9cfa-4a96-813d-555779600f9d', $q$monetization_target$q$, 8, 8, 9, $q$Forms, Surveys & Research$q$, 293 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b111844-9cfa-4a96-813d-555779600f9d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$monetization_target$q$, 8, 8, 9, $q$Scheduling, Time & Workforce$q$, 294 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ac91ecc3-0c24-4414-be5b-9971df7a568d', $q$monetization_target$q$, 8, 8, 9, $q$Security, IT & Passwords$q$, 295 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac91ecc3-0c24-4414-be5b-9971df7a568d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$monetization_target$q$, 9, 9, 10, $q$Communication, Phone & Messaging$q$, 296 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b10c6b8a-40e2-4fc2-ad32-f46718541193')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '569c81e4-5756-4a43-b262-297772fa2a0c', $q$monetization_target$q$, 9, 9, 10, $q$Education & Learning$q$, 297 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '569c81e4-5756-4a43-b262-297772fa2a0c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '42d5590c-1f80-447c-a591-4709d5198a5d', $q$monetization_target$q$, 9, 9, 10, $q$File Transfer, Backup & Storage$q$, 298 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42d5590c-1f80-447c-a591-4709d5198a5d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '41637f09-c19d-4491-9683-03950483e648', $q$monetization_target$q$, 9, 9, 10, $q$Legal, Contract & Compliance$q$, 299 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41637f09-c19d-4491-9683-03950483e648')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '332223c1-f22b-409b-9580-2d82c4edda08', $q$monetization_target$q$, 9, 9, 10, $q$Productivity & Collaboration$q$, 300 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '332223c1-f22b-409b-9580-2d82c4edda08')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c9aff19f-2369-4d96-b80f-e33c932398f4', $q$monetization_target$q$, 9, 9, 10, $q$Real Estate, Construction & Field Service$q$, 301 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9aff19f-2369-4d96-b80f-e33c932398f4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6395be6b-6a6a-42ae-a6f6-77c85ea825f2', $q$monetization_target$q$, 9, 9, 10, $q$Retail, Restaurant & POS$q$, 302 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6395be6b-6a6a-42ae-a6f6-77c85ea825f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5a9eace0-9ae6-46ca-a41f-e970f5f11aea', $q$monetization_target$q$, 9, 9, 10, $q$Video Conferencing, Webinar & Events$q$, 303 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a9eace0-9ae6-46ca-a41f-e970f5f11aea')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$monetization_target$q$, 8, 8, 9, $q$Forms, Surveys & Research$q$, 304 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '000dcbeb-599f-406b-9ce6-de68152c9f9a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b5f7e26c-b483-4bd7-8ac4-22126346a402', $q$monetization_target$q$, 8, 8, 9, $q$Scheduling, Time & Workforce$q$, 305 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5f7e26c-b483-4bd7-8ac4-22126346a402')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '552f84ed-11c6-440a-83d9-7d6762dc0517', $q$monetization_target$q$, 9, 9, 10, $q$Communication, Phone & Messaging$q$, 306 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '552f84ed-11c6-440a-83d9-7d6762dc0517')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3272c3b2-7b50-4f01-838c-a33fa1daae36', $q$monetization_target$q$, 9, 9, 10, $q$Education & Learning$q$, 307 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3272c3b2-7b50-4f01-838c-a33fa1daae36')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'cd90d7f0-266d-4308-84e4-03884e03b80c', $q$monetization_target$q$, 9, 9, 10, $q$File Transfer, Backup & Storage$q$, 308 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd90d7f0-266d-4308-84e4-03884e03b80c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'abea60cc-5f26-45e3-9696-3dec899a6984', $q$monetization_target$q$, 9, 9, 10, $q$Healthcare & Wellness Software$q$, 309 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abea60cc-5f26-45e3-9696-3dec899a6984')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '56d2b2f0-b7a4-448f-acba-955eb269b59c', $q$monetization_target$q$, 9, 9, 10, $q$Legal, Contract & Compliance$q$, 310 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56d2b2f0-b7a4-448f-acba-955eb269b59c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '118f8753-a6ca-4e1e-90db-108a98a53646', $q$monetization_target$q$, 9, 9, 10, $q$Productivity & Collaboration$q$, 311 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '118f8753-a6ca-4e1e-90db-108a98a53646')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '9b3f0303-3e4e-44b8-b85b-8e246173d906', $q$monetization_target$q$, 9, 9, 10, $q$Real Estate, Construction & Field Service$q$, 312 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b3f0303-3e4e-44b8-b85b-8e246173d906')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e19def59-87a1-4c56-8c4c-42d792e37cfd', $q$monetization_target$q$, 9, 9, 10, $q$Retail, Restaurant & POS$q$, 313 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e19def59-87a1-4c56-8c4c-42d792e37cfd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '85b65232-2caf-4969-998f-22b6d54fd447', $q$monetization_target$q$, 9, 9, 10, $q$Video Conferencing, Webinar & Events$q$, 314 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85b65232-2caf-4969-998f-22b6d54fd447')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8654c2ee-c1a5-4a9e-82aa-9243994e337c', $q$monetization_target$q$, 8, 8, 9, $q$Forms, Surveys & Research$q$, 315 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8654c2ee-c1a5-4a9e-82aa-9243994e337c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a14db145-0596-4250-b60b-dff6e306c021', $q$monetization_target$q$, 8, 8, 9, $q$Scheduling, Time & Workforce$q$, 316 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a14db145-0596-4250-b60b-dff6e306c021')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2db08197-cb69-436a-acb8-e03d763b0ab6', $q$monetization_target$q$, 9, 9, 10, $q$AI Assistants & Search$q$, 317 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2db08197-cb69-436a-acb8-e03d763b0ab6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '96e91f43-5f01-4104-b90d-be66d79b5e88', $q$monetization_target$q$, 9, 9, 10, $q$Communication, Phone & Messaging$q$, 318 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96e91f43-5f01-4104-b90d-be66d79b5e88')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '7ac9ab5c-4a63-4bad-ba6c-e9edf649f3f5', $q$monetization_target$q$, 9, 9, 10, $q$Education & Learning$q$, 319 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ac9ab5c-4a63-4bad-ba6c-e9edf649f3f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '26363614-3d73-4304-99d9-162b41b02814', $q$monetization_target$q$, 9, 9, 10, $q$File Transfer, Backup & Storage$q$, 320 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26363614-3d73-4304-99d9-162b41b02814')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '658c8cb8-ea59-4b89-bc57-b008fda4a4bd', $q$monetization_target$q$, 9, 9, 10, $q$Healthcare & Wellness Software$q$, 321 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '658c8cb8-ea59-4b89-bc57-b008fda4a4bd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3d29e78e-8c66-4222-a921-bf433a98f869', $q$monetization_target$q$, 9, 9, 10, $q$Legal, Contract & Compliance$q$, 322 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d29e78e-8c66-4222-a921-bf433a98f869')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c23b8837-4a75-4e45-83cf-8a217ebf06ae', $q$monetization_target$q$, 9, 9, 10, $q$Real Estate, Construction & Field Service$q$, 323 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c23b8837-4a75-4e45-83cf-8a217ebf06ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4fba1a19-3d7b-4619-b54f-30bc07736976', $q$monetization_target$q$, 9, 9, 10, $q$Retail, Restaurant & POS$q$, 324 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4fba1a19-3d7b-4619-b54f-30bc07736976')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'eb2d22a1-1ce3-4203-a28c-4dcd411456cf', $q$monetization_target$q$, 9, 9, 10, $q$Video Conferencing, Webinar & Events$q$, 325 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb2d22a1-1ce3-4203-a28c-4dcd411456cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0be53b91-2c15-470e-a5f9-076a0d58497b', $q$monetization_target$q$, 7, 8, 9, $q$Forms, Surveys & Research$q$, 326 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0be53b91-2c15-470e-a5f9-076a0d58497b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fefc9c6e-aa17-4e1e-88f9-9f4d8925e494', $q$monetization_target$q$, 7, 8, 9, $q$Scheduling, Time & Workforce$q$, 327 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fefc9c6e-aa17-4e1e-88f9-9f4d8925e494')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8b23fc94-f6ee-4551-9707-24f01eb5e9e4', $q$monetization_target$q$, 9, 9, 10, $q$AI Assistants & Search$q$, 328 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b23fc94-f6ee-4551-9707-24f01eb5e9e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd833b94c-8537-403d-b648-3070a9fce206', $q$monetization_target$q$, 9, 9, 10, $q$Communication, Phone & Messaging$q$, 329 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd833b94c-8537-403d-b648-3070a9fce206')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '9475419b-62e2-4143-a99d-40ca73927ae3', $q$monetization_target$q$, 9, 9, 10, $q$Education & Learning$q$, 330 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9475419b-62e2-4143-a99d-40ca73927ae3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e09c036b-bf39-4a03-9832-b843bd6525c7', $q$monetization_target$q$, 9, 9, 10, $q$File Transfer, Backup & Storage$q$, 331 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e09c036b-bf39-4a03-9832-b843bd6525c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0554d78a-3a2f-4827-899f-980ac632cee9', $q$monetization_target$q$, 9, 9, 10, $q$Healthcare & Wellness Software$q$, 332 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0554d78a-3a2f-4827-899f-980ac632cee9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c0335fd7-e7db-4c6c-8ece-4a1bf5b78c12', $q$monetization_target$q$, 9, 9, 10, $q$Legal, Contract & Compliance$q$, 333 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0335fd7-e7db-4c6c-8ece-4a1bf5b78c12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'bbbaf42a-877b-4574-bbcf-56a9d704be00', $q$monetization_target$q$, 9, 9, 10, $q$Real Estate, Construction & Field Service$q$, 334 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bbbaf42a-877b-4574-bbcf-56a9d704be00')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '67824c5f-fc78-40c9-a0e2-86281d436d4e', $q$monetization_target$q$, 9, 9, 10, $q$Retail, Restaurant & POS$q$, 335 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '67824c5f-fc78-40c9-a0e2-86281d436d4e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4414714c-18c2-421d-a443-5f73b6e567de', $q$monetization_target$q$, 9, 9, 10, $q$Video Conferencing, Webinar & Events$q$, 336 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4414714c-18c2-421d-a443-5f73b6e567de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f57787ac-8e11-4769-9b64-15fa4453a73c', $q$monetization_target$q$, 7, 8, 8, $q$Forms, Surveys & Research$q$, 337 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f57787ac-8e11-4769-9b64-15fa4453a73c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '93f04fea-8e89-4442-8f71-31d6ca1b31e0', $q$monetization_target$q$, 7, 8, 8, $q$Scheduling, Time & Workforce$q$, 338 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '93f04fea-8e89-4442-8f71-31d6ca1b31e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2d5fbbbd-7977-4815-ba85-695bdb1a2626', $q$monetization_target$q$, 9, 9, 9, $q$AI Assistants & Search$q$, 339 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d5fbbbd-7977-4815-ba85-695bdb1a2626')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b0630601-9e1f-4c1c-928d-85768c104c56', $q$monetization_target$q$, 9, 9, 9, $q$Communication, Phone & Messaging$q$, 340 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0630601-9e1f-4c1c-928d-85768c104c56')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1c10185e-f762-462e-9a99-b6b50263b7cf', $q$monetization_target$q$, 9, 9, 9, $q$Design & Creative$q$, 341 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c10185e-f762-462e-9a99-b6b50263b7cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f40d2d28-fdc6-4f97-93db-e7e3e49b3d87', $q$monetization_target$q$, 9, 9, 9, $q$Education & Learning$q$, 342 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f40d2d28-fdc6-4f97-93db-e7e3e49b3d87')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a0b7cc54-ec23-41b8-8746-9590d13dde47', $q$monetization_target$q$, 9, 9, 9, $q$File Transfer, Backup & Storage$q$, 343 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0b7cc54-ec23-41b8-8746-9590d13dde47')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fdb22c7e-5eac-4888-bd83-48ca29adb96d', $q$monetization_target$q$, 9, 9, 9, $q$Healthcare & Wellness Software$q$, 344 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdb22c7e-5eac-4888-bd83-48ca29adb96d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '19ec34e7-46e8-4c4e-851d-20bbb23e224e', $q$monetization_target$q$, 9, 9, 9, $q$Legal, Contract & Compliance$q$, 345 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19ec34e7-46e8-4c4e-851d-20bbb23e224e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6fc3837d-ade3-437f-ac16-1a4ee783c3f8', $q$monetization_target$q$, 9, 9, 9, $q$Real Estate, Construction & Field Service$q$, 346 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fc3837d-ade3-437f-ac16-1a4ee783c3f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '17484540-c7ef-4a3f-b23f-5866c0cdd5ac', $q$monetization_target$q$, 9, 9, 9, $q$Retail, Restaurant & POS$q$, 347 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17484540-c7ef-4a3f-b23f-5866c0cdd5ac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'dce09c20-9cc8-49b7-8cbd-f9cc75440903', $q$monetization_target$q$, 9, 9, 9, $q$Video Conferencing, Webinar & Events$q$, 348 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dce09c20-9cc8-49b7-8cbd-f9cc75440903')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ea1262a4-d760-4eec-88e1-896425d5ac44', $q$monetization_target$q$, 9, 9, 9, $q$AI Assistants & Search$q$, 349 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea1262a4-d760-4eec-88e1-896425d5ac44')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'eda726b9-eb10-4c2d-8347-89dbb3f5ee51', $q$monetization_target$q$, 9, 9, 9, $q$Communication, Phone & Messaging$q$, 350 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eda726b9-eb10-4c2d-8347-89dbb3f5ee51')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8fd33ff2-2e47-4614-b590-5278d86d8871', $q$emerging_opportunity$q$, 5, 8, 7, $q$AI Image, Video & Audio$q$, 351 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8fd33ff2-2e47-4614-b590-5278d86d8871')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1da348da-ba26-4700-9ed2-47edb28b71cd', $q$emerging_opportunity$q$, 5, 8, 7, $q$No-Code, Automation & AI Coding$q$, 352 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1da348da-ba26-4700-9ed2-47edb28b71cd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '9ee6e97e-879a-408e-b289-62614630623b', $q$emerging_opportunity$q$, 5, 8, 7, $q$AI Image, Video & Audio$q$, 353 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ee6e97e-879a-408e-b289-62614630623b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$emerging_opportunity$q$, 5, 8, 7, $q$No-Code, Automation & AI Coding$q$, 354 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '833f1acd-efc7-412a-b738-65bc35b6ddb1', $q$emerging_opportunity$q$, 6, 8, 8, $q$AI Image, Video & Audio$q$, 355 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '833f1acd-efc7-412a-b738-65bc35b6ddb1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2a22c6c2-59c3-4413-a1b0-00a743efb872', $q$emerging_opportunity$q$, 6, 8, 8, $q$No-Code, Automation & AI Coding$q$, 356 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a22c6c2-59c3-4413-a1b0-00a743efb872')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8551a49c-f983-4a46-ad50-c9e06a796573', $q$emerging_opportunity$q$, 6, 8, 8, $q$AI Image, Video & Audio$q$, 357 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8551a49c-f983-4a46-ad50-c9e06a796573')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'aa297366-5cbc-4dc6-bc99-46ced5726132', $q$emerging_opportunity$q$, 6, 8, 8, $q$No-Code, Automation & AI Coding$q$, 358 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa297366-5cbc-4dc6-bc99-46ced5726132')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '27a0d263-d000-4bfb-ac14-1b67221d0428', $q$emerging_opportunity$q$, 6, 8, 8, $q$AI Image, Video & Audio$q$, 359 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27a0d263-d000-4bfb-ac14-1b67221d0428')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd2aef943-d551-456d-b2f7-bd530c268780', $q$emerging_opportunity$q$, 6, 8, 8, $q$No-Code, Automation & AI Coding$q$, 360 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2aef943-d551-456d-b2f7-bd530c268780')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '409ea4dc-896f-4857-8834-ef3e42d8555a', $q$emerging_opportunity$q$, 6, 8, 8, $q$AI Image, Video & Audio$q$, 361 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '409ea4dc-896f-4857-8834-ef3e42d8555a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '88b09d10-a6f8-417d-b1b5-3f44cf179e0c', $q$emerging_opportunity$q$, 6, 8, 8, $q$AI Writing & Content$q$, 362 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88b09d10-a6f8-417d-b1b5-3f44cf179e0c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '758d739b-574e-4253-96df-178cefd5f067', $q$emerging_opportunity$q$, 6, 8, 8, $q$No-Code, Automation & AI Coding$q$, 363 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '758d739b-574e-4253-96df-178cefd5f067')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '15dd21fe-ee11-4215-995a-79327176360a', $q$emerging_opportunity$q$, 6, 9, 8, $q$AI Image, Video & Audio$q$, 364 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15dd21fe-ee11-4215-995a-79327176360a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '53bb6923-d4d1-4ead-bd6a-7aa8450e41ee', $q$emerging_opportunity$q$, 6, 9, 8, $q$AI Writing & Content$q$, 365 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53bb6923-d4d1-4ead-bd6a-7aa8450e41ee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '7e511518-9008-4caa-98b5-24f31611a25c', $q$emerging_opportunity$q$, 6, 9, 8, $q$No-Code, Automation & AI Coding$q$, 366 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e511518-9008-4caa-98b5-24f31611a25c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c49ab894-eebb-41d9-be22-6e48697bc8a4', $q$emerging_opportunity$q$, 6, 9, 8, $q$AI Image, Video & Audio$q$, 367 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c49ab894-eebb-41d9-be22-6e48697bc8a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '272fac60-438a-4487-9d22-a04e72fbaf3e', $q$emerging_opportunity$q$, 6, 9, 8, $q$AI Writing & Content$q$, 368 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '272fac60-438a-4487-9d22-a04e72fbaf3e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5759ef4a-9adb-4775-9ea3-ae93aa85a490', $q$emerging_opportunity$q$, 6, 9, 8, $q$No-Code, Automation & AI Coding$q$, 369 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5759ef4a-9adb-4775-9ea3-ae93aa85a490')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef', $q$emerging_opportunity$q$, 6, 9, 8, $q$AI Image, Video & Audio$q$, 370 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5bd020f9-bcf8-404f-a366-2c0dae8ee0ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$emerging_opportunity$q$, 6, 9, 8, $q$AI Writing & Content$q$, 371 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e82c60dd-a99b-47e5-b59b-e27db707e04e', $q$emerging_opportunity$q$, 6, 9, 8, $q$No-Code, Automation & AI Coding$q$, 372 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e82c60dd-a99b-47e5-b59b-e27db707e04e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4cf9cd65-f41d-4829-821a-01a2e4394707', $q$emerging_opportunity$q$, 5, 8, 7, $q$Ecommerce & Website Builders$q$, 374 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cf9cd65-f41d-4829-821a-01a2e4394707')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'cb838640-ef5a-4d9a-92b1-14717d41944f', $q$emerging_opportunity$q$, 5, 8, 7, $q$SEO, Analytics & Advertising$q$, 375 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb838640-ef5a-4d9a-92b1-14717d41944f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5799f1ce-5e51-44c3-9992-d68250deeb71', $q$emerging_opportunity$q$, 5, 8, 7, $q$Ecommerce & Website Builders$q$, 377 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5799f1ce-5e51-44c3-9992-d68250deeb71')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$emerging_opportunity$q$, 5, 8, 7, $q$SEO, Analytics & Advertising$q$, 378 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'cf2565ff-7160-42e9-8d6c-efdb9830004d', $q$emerging_opportunity$q$, 6, 8, 8, $q$Developer Tools & Cloud$q$, 379 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf2565ff-7160-42e9-8d6c-efdb9830004d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$emerging_opportunity$q$, 6, 8, 8, $q$SEO, Analytics & Advertising$q$, 381 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '424ed87f-e0ac-4a99-869c-2cecd795e4b1', $q$emerging_opportunity$q$, 6, 8, 8, $q$Developer Tools & Cloud$q$, 382 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '424ed87f-e0ac-4a99-869c-2cecd795e4b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd9e98516-f585-417e-b8e1-aa7ccf705fd5', $q$emerging_opportunity$q$, 6, 8, 8, $q$Ecommerce & Website Builders$q$, 383 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd9e98516-f585-417e-b8e1-aa7ccf705fd5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '665123b3-d769-4ea1-851b-2dfd42fa8509', $q$emerging_opportunity$q$, 6, 8, 8, $q$Developer Tools & Cloud$q$, 384 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '665123b3-d769-4ea1-851b-2dfd42fa8509')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'dd5fd21d-0322-4d4a-b2d6-d37c26aaa320', $q$emerging_opportunity$q$, 6, 8, 8, $q$CRM & Sales$q$, 386 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd5fd21d-0322-4d4a-b2d6-d37c26aaa320')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '79eab7a4-e62b-49e1-b4c9-ba1e46383aec', $q$emerging_opportunity$q$, 6, 8, 8, $q$Customer Support & Success$q$, 387 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79eab7a4-e62b-49e1-b4c9-ba1e46383aec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3190d2c9-97ab-4131-81ee-15a9bb5745a2', $q$emerging_opportunity$q$, 6, 8, 8, $q$Developer Tools & Cloud$q$, 388 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3190d2c9-97ab-4131-81ee-15a9bb5745a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6f813de0-d2a3-471f-a9eb-5435220544a4', $q$emerging_opportunity$q$, 6, 8, 8, $q$Ecommerce & Website Builders$q$, 389 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f813de0-d2a3-471f-a9eb-5435220544a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ff227d86-ddbd-4dae-a781-076d3958c64f', $q$emerging_opportunity$q$, 6, 8, 8, $q$Marketing Automation & Email$q$, 390 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff227d86-ddbd-4dae-a781-076d3958c64f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a2099be2-0fe5-4bea-8970-af25479c0e1a', $q$emerging_opportunity$q$, 6, 8, 8, $q$SEO, Analytics & Advertising$q$, 391 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a2099be2-0fe5-4bea-8970-af25479c0e1a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4f75ddaa-758b-4b98-b9a1-7abb4b581a78', $q$emerging_opportunity$q$, 6, 9, 8, $q$CRM & Sales$q$, 392 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f75ddaa-758b-4b98-b9a1-7abb4b581a78')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ca7516a2-730d-48ae-b2cd-54a3da886bac', $q$emerging_opportunity$q$, 6, 9, 8, $q$Customer Support & Success$q$, 393 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca7516a2-730d-48ae-b2cd-54a3da886bac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '84e314ac-4d36-41da-911b-9eb00173a757', $q$emerging_opportunity$q$, 6, 9, 8, $q$Developer Tools & Cloud$q$, 394 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84e314ac-4d36-41da-911b-9eb00173a757')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$emerging_opportunity$q$, 6, 9, 8, $q$Ecommerce & Website Builders$q$, 395 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3ddd1302-f04e-4a3a-8111-e7b0aaeadc87', $q$emerging_opportunity$q$, 6, 9, 8, $q$SEO, Analytics & Advertising$q$, 397 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ddd1302-f04e-4a3a-8111-e7b0aaeadc87')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '25b50035-747c-462e-a2db-a4e3b14e8c02', $q$emerging_opportunity$q$, 6, 9, 8, $q$CRM & Sales$q$, 398 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25b50035-747c-462e-a2db-a4e3b14e8c02')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '42178daa-c8ed-41d0-b8b7-d8e53057a2ce', $q$emerging_opportunity$q$, 6, 9, 8, $q$Customer Support & Success$q$, 399 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42178daa-c8ed-41d0-b8b7-d8e53057a2ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b696da65-5315-4c8c-b34f-3a2fe6617f10', $q$emerging_opportunity$q$, 6, 9, 8, $q$Developer Tools & Cloud$q$, 400 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b696da65-5315-4c8c-b34f-3a2fe6617f10')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c36767cb-32ab-4d26-8f68-e5a87e160f08', $q$emerging_opportunity$q$, 6, 9, 8, $q$Ecommerce & Website Builders$q$, 401 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c36767cb-32ab-4d26-8f68-e5a87e160f08')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'de6eb85c-e884-4464-97df-4e4c4479c1d0', $q$emerging_opportunity$q$, 6, 9, 8, $q$CRM & Sales$q$, 404 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de6eb85c-e884-4464-97df-4e4c4479c1d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ad6b4961-5c42-461f-8aa7-a80fba6f7c50', $q$emerging_opportunity$q$, 6, 9, 8, $q$Customer Support & Success$q$, 405 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad6b4961-5c42-461f-8aa7-a80fba6f7c50')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '87cb32a2-9663-4c3e-a003-f1735380ac01', $q$emerging_opportunity$q$, 6, 9, 8, $q$Developer Tools & Cloud$q$, 406 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87cb32a2-9663-4c3e-a003-f1735380ac01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '11aeaa6f-ca3a-4980-80c9-07d68c56564a', $q$emerging_opportunity$q$, 6, 9, 8, $q$Ecommerce & Website Builders$q$, 407 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11aeaa6f-ca3a-4980-80c9-07d68c56564a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '88c573c2-bcec-44cf-a9cb-80c691b977d7', $q$emerging_opportunity$q$, 6, 9, 8, $q$Marketing Automation & Email$q$, 408 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88c573c2-bcec-44cf-a9cb-80c691b977d7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd6fe9497-6864-400b-8879-65cfc6655084', $q$emerging_opportunity$q$, 5, 8, 7, $q$Finance, Accounting & Payments$q$, 410 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6fe9497-6864-400b-8879-65cfc6655084')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2899eedd-31f8-47bb-91c7-6b9e3cb0215b', $q$emerging_opportunity$q$, 5, 8, 7, $q$Finance, Accounting & Payments$q$, 411 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2899eedd-31f8-47bb-91c7-6b9e3cb0215b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8e2b1c07-9d70-4dd3-a9e0-b4a7473ba11f', $q$emerging_opportunity$q$, 6, 8, 8, $q$Finance, Accounting & Payments$q$, 412 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e2b1c07-9d70-4dd3-a9e0-b4a7473ba11f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '59e7c6f4-7f3f-4a9d-a078-a2b7d95263db', $q$emerging_opportunity$q$, 6, 8, 8, $q$Finance, Accounting & Payments$q$, 413 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59e7c6f4-7f3f-4a9d-a078-a2b7d95263db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fbffcaa4-b264-4a87-bd4b-d1c6cc1e9c14', $q$emerging_opportunity$q$, 6, 8, 8, $q$Finance, Accounting & Payments$q$, 414 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbffcaa4-b264-4a87-bd4b-d1c6cc1e9c14')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '4cb9b0b4-da99-4023-b92a-3bceb73f3e37', $q$emerging_opportunity$q$, 6, 8, 8, $q$Documents, PDF & E-signature$q$, 415 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cb9b0b4-da99-4023-b92a-3bceb73f3e37')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c6e9e3b9-7b4b-4224-9ce1-e8b76bd4f3c6', $q$emerging_opportunity$q$, 6, 8, 8, $q$Finance, Accounting & Payments$q$, 416 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6e9e3b9-7b4b-4224-9ce1-e8b76bd4f3c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6a07317c-b1f1-40dd-a137-ed66a88f82a7', $q$emerging_opportunity$q$, 6, 8, 8, $q$Project & Work Management$q$, 417 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a07317c-b1f1-40dd-a137-ed66a88f82a7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b0973005-06cc-44c0-81b7-f55d44c44d48', $q$emerging_opportunity$q$, 6, 8, 8, $q$Social Media Management$q$, 418 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0973005-06cc-44c0-81b7-f55d44c44d48')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'edbc5167-46cb-4d31-8eb3-4c9d8b6f911a', $q$emerging_opportunity$q$, 6, 9, 8, $q$Documents, PDF & E-signature$q$, 419 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edbc5167-46cb-4d31-8eb3-4c9d8b6f911a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '22ab0c21-f5e6-4e9a-919f-4e80fdc79abb', $q$emerging_opportunity$q$, 6, 9, 8, $q$Finance, Accounting & Payments$q$, 420 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22ab0c21-f5e6-4e9a-919f-4e80fdc79abb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '534a63de-bd62-4e46-81b3-354224a9fcb1', $q$emerging_opportunity$q$, 6, 9, 8, $q$Project & Work Management$q$, 421 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '534a63de-bd62-4e46-81b3-354224a9fcb1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '055370e8-fd15-4fdf-9dad-531fc3b6a3c9', $q$emerging_opportunity$q$, 6, 9, 8, $q$Social Media Management$q$, 422 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '055370e8-fd15-4fdf-9dad-531fc3b6a3c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '95c9d0a5-64da-46ca-b8b7-a7245a366020', $q$emerging_opportunity$q$, 6, 9, 8, $q$Documents, PDF & E-signature$q$, 423 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95c9d0a5-64da-46ca-b8b7-a7245a366020')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '73bfc873-4265-4959-93b9-df520ad9fcd5', $q$emerging_opportunity$q$, 6, 9, 8, $q$Finance, Accounting & Payments$q$, 424 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '73bfc873-4265-4959-93b9-df520ad9fcd5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8c59b3c9-1d5c-41aa-8b9d-d87093081798', $q$emerging_opportunity$q$, 6, 9, 8, $q$Project & Work Management$q$, 425 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c59b3c9-1d5c-41aa-8b9d-d87093081798')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8e87fe27-ae20-4a92-8b43-5f6016f6f4fa', $q$emerging_opportunity$q$, 6, 9, 8, $q$Social Media Management$q$, 426 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e87fe27-ae20-4a92-8b43-5f6016f6f4fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '23dde3d1-1c69-4fd8-bdea-41ceb5449c9a', $q$emerging_opportunity$q$, 6, 9, 8, $q$Documents, PDF & E-signature$q$, 427 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23dde3d1-1c69-4fd8-bdea-41ceb5449c9a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '90a5952e-cd43-4cf5-bc88-317304be7a50', $q$emerging_opportunity$q$, 6, 9, 8, $q$Finance, Accounting & Payments$q$, 428 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90a5952e-cd43-4cf5-bc88-317304be7a50')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8c9f13c9-cf6c-446e-bb2f-8847796544ec', $q$emerging_opportunity$q$, 6, 9, 8, $q$Project & Work Management$q$, 429 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c9f13c9-cf6c-446e-bb2f-8847796544ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f0e66535-3ff0-4403-abac-5c27a5f34b18', $q$emerging_opportunity$q$, 6, 9, 8, $q$Social Media Management$q$, 430 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0e66535-3ff0-4403-abac-5c27a5f34b18')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '19af63b9-f422-4e73-aa95-41f50d50e098', $q$emerging_opportunity$q$, 6, 9, 8, $q$Finance, Accounting & Payments$q$, 431 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19af63b9-f422-4e73-aa95-41f50d50e098')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a1159d03-001f-4c6e-ae84-122c6665f96f', $q$emerging_opportunity$q$, 7, 9, 8, $q$Finance, Accounting & Payments$q$, 432 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1159d03-001f-4c6e-ae84-122c6665f96f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3eb87668-42e1-459d-9212-aea403d70de9', $q$emerging_opportunity$q$, 7, 9, 8, $q$Finance, Accounting & Payments$q$, 433 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3eb87668-42e1-459d-9212-aea403d70de9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5e899f32-2125-4293-9067-e8fb5b563734', $q$emerging_opportunity$q$, 7, 9, 8, $q$Finance, Accounting & Payments$q$, 434 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e899f32-2125-4293-9067-e8fb5b563734')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '09b41cb4-0b11-4480-ad3f-317c597ce7a4', $q$emerging_opportunity$q$, 5, 8, 7, $q$Data, BI & Databases$q$, 435 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09b41cb4-0b11-4480-ad3f-317c597ce7a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '347340e4-2920-47db-a757-9978b6eb89a7', $q$emerging_opportunity$q$, 5, 8, 7, $q$HR, Recruiting & Payroll$q$, 436 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '347340e4-2920-47db-a757-9978b6eb89a7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'cad47068-0db8-4866-8882-42d54432595e', $q$emerging_opportunity$q$, 5, 8, 7, $q$Security, IT & Passwords$q$, 437 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cad47068-0db8-4866-8882-42d54432595e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b91ae4a4-138d-4d64-ad9d-e248ca4f5aaa', $q$emerging_opportunity$q$, 5, 8, 7, $q$Data, BI & Databases$q$, 438 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b91ae4a4-138d-4d64-ad9d-e248ca4f5aaa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0f3743e6-4384-4d1d-8b20-c6c59c84ed3d', $q$emerging_opportunity$q$, 5, 8, 7, $q$HR, Recruiting & Payroll$q$, 439 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f3743e6-4384-4d1d-8b20-c6c59c84ed3d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '9de5de2c-21ac-48ff-89e4-3f7bf4c1ceb6', $q$emerging_opportunity$q$, 5, 8, 7, $q$Security, IT & Passwords$q$, 440 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9de5de2c-21ac-48ff-89e4-3f7bf4c1ceb6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$emerging_opportunity$q$, 6, 8, 8, $q$Data, BI & Databases$q$, 441 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1cae6850-050f-46cb-a2e7-0f9b43529d66')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6b1fba57-cd15-424e-804c-46b51d8f4396', $q$emerging_opportunity$q$, 6, 8, 8, $q$HR, Recruiting & Payroll$q$, 442 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b1fba57-cd15-424e-804c-46b51d8f4396')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '924c5694-cfb7-4b06-9d9d-b00e1afadb31', $q$emerging_opportunity$q$, 6, 8, 8, $q$Security, IT & Passwords$q$, 443 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '924c5694-cfb7-4b06-9d9d-b00e1afadb31')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f64e5322-805e-4448-852f-2b182baf140a', $q$emerging_opportunity$q$, 6, 8, 8, $q$Data, BI & Databases$q$, 444 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f64e5322-805e-4448-852f-2b182baf140a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$emerging_opportunity$q$, 6, 8, 8, $q$HR, Recruiting & Payroll$q$, 445 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18a08b34-9438-45e5-b3b9-9e7969c6add2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$emerging_opportunity$q$, 6, 8, 8, $q$Security, IT & Passwords$q$, 446 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'edd1bac6-16dc-4bda-b79f-aadb3cc602d0', $q$emerging_opportunity$q$, 6, 8, 8, $q$Data, BI & Databases$q$, 447 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edd1bac6-16dc-4bda-b79f-aadb3cc602d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$emerging_opportunity$q$, 6, 8, 8, $q$HR, Recruiting & Payroll$q$, 448 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c69ab424-480e-464f-8a10-266de3ca5887', $q$emerging_opportunity$q$, 6, 8, 8, $q$Security, IT & Passwords$q$, 449 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c69ab424-480e-464f-8a10-266de3ca5887')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '76f0c5ad-2a6b-4da7-9d21-98785efc0c74', $q$emerging_opportunity$q$, 6, 8, 8, $q$Data, BI & Databases$q$, 450 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76f0c5ad-2a6b-4da7-9d21-98785efc0c74')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '742217b9-34b3-4a6b-ba4a-7592b4fc8b20', $q$emerging_opportunity$q$, 6, 8, 8, $q$Forms, Surveys & Research$q$, 451 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '742217b9-34b3-4a6b-ba4a-7592b4fc8b20')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '5edf3623-fbe7-4031-ae06-d836d7bc2e06', $q$emerging_opportunity$q$, 6, 8, 8, $q$HR, Recruiting & Payroll$q$, 452 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5edf3623-fbe7-4031-ae06-d836d7bc2e06')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '46f3d2a9-02b8-43f2-a139-956dd022d4b6', $q$emerging_opportunity$q$, 6, 8, 8, $q$Scheduling, Time & Workforce$q$, 453 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46f3d2a9-02b8-43f2-a139-956dd022d4b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fafccbf6-913e-4289-9274-59a455a3737b', $q$emerging_opportunity$q$, 6, 8, 8, $q$Security, IT & Passwords$q$, 454 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fafccbf6-913e-4289-9274-59a455a3737b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b4b6eb99-0c87-4eaa-8305-aff383ed3c8f', $q$emerging_opportunity$q$, 6, 9, 8, $q$Data, BI & Databases$q$, 455 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4b6eb99-0c87-4eaa-8305-aff383ed3c8f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0c7ffe5d-03a8-4aa8-aa1e-04f31e023da0', $q$emerging_opportunity$q$, 6, 9, 8, $q$Forms, Surveys & Research$q$, 456 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c7ffe5d-03a8-4aa8-aa1e-04f31e023da0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '26be16cd-25ce-4578-8910-70ede05cb0ab', $q$emerging_opportunity$q$, 6, 9, 8, $q$HR, Recruiting & Payroll$q$, 457 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26be16cd-25ce-4578-8910-70ede05cb0ab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$emerging_opportunity$q$, 6, 9, 8, $q$Scheduling, Time & Workforce$q$, 458 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '99717d1e-0342-4761-94f2-a883ec1305b3', $q$emerging_opportunity$q$, 6, 9, 8, $q$Security, IT & Passwords$q$, 459 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99717d1e-0342-4761-94f2-a883ec1305b3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '503e1e80-efff-4b6e-b3f4-9321fcb8e174', $q$emerging_opportunity$q$, 6, 9, 8, $q$Data, BI & Databases$q$, 460 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '503e1e80-efff-4b6e-b3f4-9321fcb8e174')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '00ea990a-f3f1-4733-b437-22705a46609d', $q$emerging_opportunity$q$, 6, 9, 8, $q$Forms, Surveys & Research$q$, 461 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00ea990a-f3f1-4733-b437-22705a46609d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$emerging_opportunity$q$, 6, 9, 8, $q$HR, Recruiting & Payroll$q$, 462 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cac63e1-ade1-4e49-9c9c-3d85ed715d3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'bf5ccccf-0e75-4299-a56e-49f4447411f2', $q$emerging_opportunity$q$, 6, 9, 8, $q$Scheduling, Time & Workforce$q$, 463 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf5ccccf-0e75-4299-a56e-49f4447411f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'b040c903-f544-4cf7-9de2-2af9f1ecddaa', $q$emerging_opportunity$q$, 6, 9, 8, $q$Security, IT & Passwords$q$, 464 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b040c903-f544-4cf7-9de2-2af9f1ecddaa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '9219abcb-3647-48e3-8c71-39e48254dcdb', $q$emerging_opportunity$q$, 6, 9, 8, $q$Data, BI & Databases$q$, 465 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9219abcb-3647-48e3-8c71-39e48254dcdb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c692a937-f3e2-45ab-ad20-28a30d805a63', $q$emerging_opportunity$q$, 6, 9, 8, $q$Forms, Surveys & Research$q$, 466 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c692a937-f3e2-45ab-ad20-28a30d805a63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '8edc4560-4c87-4f48-9ba0-8af1a559a2e7', $q$emerging_opportunity$q$, 6, 9, 8, $q$HR, Recruiting & Payroll$q$, 467 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8edc4560-4c87-4f48-9ba0-8af1a559a2e7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '10489d53-8568-4993-9c9f-4e97a69b327b', $q$emerging_opportunity$q$, 6, 9, 8, $q$Scheduling, Time & Workforce$q$, 468 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10489d53-8568-4993-9c9f-4e97a69b327b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c', $q$emerging_opportunity$q$, 6, 9, 8, $q$Security, IT & Passwords$q$, 469 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b5e7fc6-540c-4a46-90c4-6e863ad1c70c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'ab77b503-2fbc-48d6-b95b-85468a3d2b09', $q$emerging_opportunity$q$, 6, 9, 8, $q$Data, BI & Databases$q$, 470 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab77b503-2fbc-48d6-b95b-85468a3d2b09')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '63552ca4-8785-47c6-9aaf-f0643adf97b5', $q$emerging_opportunity$q$, 6, 9, 8, $q$HR, Recruiting & Payroll$q$, 471 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63552ca4-8785-47c6-9aaf-f0643adf97b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e4677d7e-e466-487b-b39f-1841d9797908', $q$emerging_opportunity$q$, 6, 9, 8, $q$Security, IT & Passwords$q$, 472 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4677d7e-e466-487b-b39f-1841d9797908')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '50be4027-11b3-43fe-b1ca-c6caad422481', $q$emerging_opportunity$q$, 7, 9, 8, $q$Data, BI & Databases$q$, 473 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50be4027-11b3-43fe-b1ca-c6caad422481')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e059a784-d8bc-45d5-ab94-fea4f0338c4e', $q$emerging_opportunity$q$, 7, 9, 8, $q$HR, Recruiting & Payroll$q$, 474 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e059a784-d8bc-45d5-ab94-fea4f0338c4e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '71dcd814-d7ea-4382-b7e3-3238f93f3360', $q$emerging_opportunity$q$, 7, 9, 8, $q$Security, IT & Passwords$q$, 475 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71dcd814-d7ea-4382-b7e3-3238f93f3360')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$emerging_opportunity$q$, 7, 9, 8, $q$Data, BI & Databases$q$, 476 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80b10260-3b64-43a4-af8d-f79e3fab1f2b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '69afcc2a-09a4-49b5-a478-dc5c7b9d0240', $q$emerging_opportunity$q$, 7, 9, 8, $q$HR, Recruiting & Payroll$q$, 477 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69afcc2a-09a4-49b5-a478-dc5c7b9d0240')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '620140b0-3b84-4d9d-8196-7bb9344c797c', $q$emerging_opportunity$q$, 7, 9, 8, $q$Security, IT & Passwords$q$, 478 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '620140b0-3b84-4d9d-8196-7bb9344c797c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '77bcbe4d-ff51-41f9-a9da-963c98821e89', $q$emerging_opportunity$q$, 7, 9, 8, $q$Data, BI & Databases$q$, 479 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '77bcbe4d-ff51-41f9-a9da-963c98821e89')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '0ef73c08-fc86-4679-b6fc-4e32b1333482', $q$emerging_opportunity$q$, 7, 9, 8, $q$Security, IT & Passwords$q$, 480 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ef73c08-fc86-4679-b6fc-4e32b1333482')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '031d68c5-af3a-4399-8fac-121f0a02a529', $q$emerging_opportunity$q$, 5, 8, 7, $q$Productivity & Collaboration$q$, 482 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '031d68c5-af3a-4399-8fac-121f0a02a529')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd87ead8b-8c90-424b-ae07-9b4003510b45', $q$emerging_opportunity$q$, 6, 8, 8, $q$AI Assistants & Search$q$, 483 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd87ead8b-8c90-424b-ae07-9b4003510b45')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '63f1ca5a-4d50-4646-ab82-bd9bd346c967', $q$emerging_opportunity$q$, 6, 8, 8, $q$Communication, Phone & Messaging$q$, 484 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63f1ca5a-4d50-4646-ab82-bd9bd346c967')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa', $q$emerging_opportunity$q$, 6, 8, 8, $q$Design & Creative$q$, 485 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c90dc5e6-33dc-4dc9-a0be-2c6675db08aa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'f765cfa6-721a-409a-a821-11862b637dcc', $q$emerging_opportunity$q$, 6, 8, 8, $q$Education & Learning$q$, 486 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f765cfa6-721a-409a-a821-11862b637dcc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'daabce27-4231-4e1d-a8a8-f7d8451bc385', $q$emerging_opportunity$q$, 6, 8, 8, $q$File Transfer, Backup & Storage$q$, 487 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'daabce27-4231-4e1d-a8a8-f7d8451bc385')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '98f9f304-96e1-4abd-9d15-b4cb9d09fcfc', $q$emerging_opportunity$q$, 6, 8, 8, $q$Healthcare & Wellness Software$q$, 488 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '98f9f304-96e1-4abd-9d15-b4cb9d09fcfc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'e3ee3433-997d-4462-9aa7-1e921d116666', $q$emerging_opportunity$q$, 6, 8, 8, $q$Legal, Contract & Compliance$q$, 489 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3ee3433-997d-4462-9aa7-1e921d116666')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '37206632-9f9a-460f-8492-df6a397cf34f', $q$emerging_opportunity$q$, 6, 8, 8, $q$Real Estate, Construction & Field Service$q$, 490 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37206632-9f9a-460f-8492-df6a397cf34f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '35eab88b-4ba3-4039-82ea-b4ff8bda85b1', $q$emerging_opportunity$q$, 6, 8, 8, $q$Retail, Restaurant & POS$q$, 491 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35eab88b-4ba3-4039-82ea-b4ff8bda85b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '24fcbb9a-223c-4b44-b8fd-07484fe7b8e4', $q$emerging_opportunity$q$, 6, 8, 8, $q$Video Conferencing, Webinar & Events$q$, 492 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24fcbb9a-223c-4b44-b8fd-07484fe7b8e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'a148f101-9c66-4591-aec9-b3207ca40a0e', $q$emerging_opportunity$q$, 6, 9, 8, $q$AI Assistants & Search$q$, 493 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a148f101-9c66-4591-aec9-b3207ca40a0e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT 'd9e0aeb4-501a-4642-a40a-1a439d823b46', $q$emerging_opportunity$q$, 6, 9, 8, $q$Communication, Phone & Messaging$q$, 494 WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd9e0aeb4-501a-4642-a40a-1a439d823b46')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '3122bcbc-f848-4a5b-bdd0-2fdc1ab47f3e', $q$emerging_opportunity$q$, 6, 9, 8, $q$Design & Creative$q$, 495 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3122bcbc-f848-4a5b-bdd0-2fdc1ab47f3e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '87506dfb-5657-49d7-8e5e-045ff26172f8', $q$emerging_opportunity$q$, 6, 9, 8, $q$Education & Learning$q$, 496 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87506dfb-5657-49d7-8e5e-045ff26172f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '2708453f-26c2-4ab0-9cc3-e26e1734570d', $q$emerging_opportunity$q$, 6, 9, 8, $q$File Transfer, Backup & Storage$q$, 497 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2708453f-26c2-4ab0-9cc3-e26e1734570d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '57bca61a-8bf5-445a-b275-cddca078e066', $q$emerging_opportunity$q$, 6, 9, 8, $q$Healthcare & Wellness Software$q$, 498 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57bca61a-8bf5-445a-b275-cddca078e066')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
SELECT '9a7a119c-cb78-4261-9173-2f602bd0dde1', $q$emerging_opportunity$q$, 6, 9, 8, $q$Legal, Contract & Compliance$q$, 499 WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a7a119c-cb78-4261-9173-2f602bd0dde1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('7e8227b7-0e90-46d7-92df-86b14a774f8a', $q$traffic_anchor$q$, 10, 5, 2, $q$Design & Creative$q$, 4)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 5)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('12ed5fa3-55be-4cc2-b9a9-2e4de24ee3fc', $q$traffic_anchor$q$, 10, 5, 2, $q$Design & Creative$q$, 6)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$traffic_anchor$q$, 10, 5, 2, $q$Ecommerce & Website Builders$q$, 7)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('6f5cfb69-7744-41fa-9d0f-ef4e3662eb1d', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 11)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('f4a6f61d-c3a3-4ca6-b4af-abc327e0f762', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 12)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('d43ee8f4-1247-4fdd-8035-fef66e1db0b3', $q$traffic_anchor$q$, 10, 5, 2, $q$CRM & Sales$q$, 14)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('453ae436-57ca-4b8a-8abd-3f36dcefa927', $q$traffic_anchor$q$, 10, 5, 2, $q$Marketing Automation & Email$q$, 15)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('3564d834-f51a-4718-9030-849e68652d1f', $q$traffic_anchor$q$, 10, 5, 2, $q$SEO, Analytics & Advertising$q$, 16)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$traffic_anchor$q$, 10, 5, 2, $q$SEO, Analytics & Advertising$q$, 17)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('44012f42-48cd-4ac2-a9a1-fdf660d20c58', $q$traffic_anchor$q$, 10, 5, 2, $q$Project & Work Management$q$, 19)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 20)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('7bc1e8a6-de99-4eb8-9968-c92bb4254013', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 21)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('dbd701b9-01ba-4402-984c-660c90af0d4b', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 22)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('08775de0-0ff3-40d7-ba33-f4d648f4381a', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 23)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('a42a7c3c-6971-460f-b902-9c4f09a2e764', $q$traffic_anchor$q$, 10, 5, 2, $q$Finance, Accounting & Payments$q$, 24)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('ab58553d-75b9-40f6-9b54-61fbab218754', $q$traffic_anchor$q$, 10, 5, 2, $q$Finance, Accounting & Payments$q$, 27)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('09bfad13-d346-4bb4-8adf-3ff6863d687e', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 28)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('8b1dea31-abbd-42cc-a4cd-5b6154e0b8f7', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 31)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('e4cf5be0-f089-42c5-bb7c-6eb4c31f427c', $q$traffic_anchor$q$, 10, 5, 2, $q$Developer Tools & Cloud$q$, 37)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('21b62640-e209-4a01-b000-4e8484a033b6', $q$traffic_anchor$q$, 10, 5, 2, $q$Documents, PDF & E-signature$q$, 40)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('24098d22-ccb2-4c35-9926-5bedac902206', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 44)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('ebc7be94-6513-4a4f-9f90-be0618f1b431', $q$traffic_anchor$q$, 10, 5, 2, $q$Productivity & Collaboration$q$, 45)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('8c9d4cc8-10e6-4477-bd67-5b29fe5d266a', $q$traffic_anchor$q$, 10, 5, 2, $q$Design & Creative$q$, 46)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('925daab1-05f1-463d-acca-f58f8cdc0978', $q$monetization_target$q$, 9, 9, 10, $q$No-Code, Automation & AI Coding$q$, 52)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('8069bad0-6be8-4d8e-bbf8-5cdf38829228', $q$monetization_target$q$, 9, 9, 10, $q$AI Writing & Content$q$, 58)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('b87bf8ae-75dd-4294-97a0-45d392ce365a', $q$monetization_target$q$, 9, 9, 10, $q$Customer Support & Success$q$, 75)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('baabcbd9-49ee-4844-9aae-bc407aa1c068', $q$monetization_target$q$, 9, 9, 10, $q$Customer Support & Success$q$, 79)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('d3223547-1bc9-472d-8449-260dc6b88988', $q$monetization_target$q$, 9, 9, 10, $q$Marketing Automation & Email$q$, 81)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('3462f64d-8a5d-4bf1-aaf2-9bbe35c19498', $q$monetization_target$q$, 9, 9, 10, $q$Customer Support & Success$q$, 86)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('93a4e3c6-9406-420d-bf93-f0605bae4c10', $q$monetization_target$q$, 9, 9, 10, $q$Customer Support & Success$q$, 93)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('2a6940b9-4b57-4612-8541-84535793b340', $q$monetization_target$q$, 9, 9, 10, $q$Ecommerce & Website Builders$q$, 95)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$monetization_target$q$, 9, 9, 10, $q$Ecommerce & Website Builders$q$, 103)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$monetization_target$q$, 9, 9, 10, $q$Marketing Automation & Email$q$, 104)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('33552c2c-cd73-4391-9fd5-c7a4f0df8e9e', $q$monetization_target$q$, 9, 9, 10, $q$Ecommerce & Website Builders$q$, 111)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('e36a0c09-82ff-48bd-9da0-38f045bb10a2', $q$monetization_target$q$, 9, 9, 10, $q$Customer Support & Success$q$, 117)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('86565576-9938-418e-8b55-ba39e12ff033', $q$monetization_target$q$, 9, 9, 10, $q$Marketing Automation & Email$q$, 118)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$monetization_target$q$, 9, 9, 9, $q$Developer Tools & Cloud$q$, 130)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('931411f0-b95b-42fa-bb83-f3a80c291cef', $q$monetization_target$q$, 9, 9, 10, $q$Documents, PDF & E-signature$q$, 134)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('db35ba3a-f84e-424f-82ef-b3154b5d2ca0', $q$monetization_target$q$, 9, 9, 10, $q$Social Media Management$q$, 135)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$monetization_target$q$, 9, 9, 10, $q$Social Media Management$q$, 142)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('c9d6721c-323e-461a-9e3f-5f4dfc9baedb', $q$monetization_target$q$, 9, 9, 10, $q$Finance, Accounting & Payments$q$, 149)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('ed06026a-8e0a-484f-bfd3-2d07240984eb', $q$monetization_target$q$, 9, 9, 10, $q$Documents, PDF & E-signature$q$, 157)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$monetization_target$q$, 9, 9, 10, $q$Project & Work Management$q$, 168)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('9163dedf-1317-4248-a79a-e9fd4b8cf999', $q$monetization_target$q$, 8, 8, 9, $q$SEO, Analytics & Advertising$q$, 173)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$monetization_target$q$, 7, 8, 9, $q$SEO, Analytics & Advertising$q$, 183)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$monetization_target$q$, 9, 9, 10, $q$Security, IT & Passwords$q$, 201)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('bb9a5203-561f-405b-883a-bf1a1d13b0fd', $q$monetization_target$q$, 9, 9, 10, $q$Forms, Surveys & Research$q$, 205)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('8077121d-2120-471d-a225-8abe93a45b3b', $q$monetization_target$q$, 9, 9, 10, $q$Scheduling, Time & Workforce$q$, 207)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('442e0b90-c0fa-4f16-8c2e-e77ca49e1ccf', $q$monetization_target$q$, 9, 9, 10, $q$Security, IT & Passwords$q$, 208)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$monetization_target$q$, 9, 9, 10, $q$Forms, Surveys & Research$q$, 213)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('8b4bc6ea-bad2-4c99-9750-883f839aa67e', $q$monetization_target$q$, 9, 9, 10, $q$Scheduling, Time & Workforce$q$, 215)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('742ef257-e98d-45ec-870b-b12953892eab', $q$monetization_target$q$, 9, 9, 10, $q$Data, BI & Databases$q$, 244)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('c884a739-077a-42ee-961b-611a66af1052', $q$monetization_target$q$, 9, 9, 10, $q$Communication, Phone & Messaging$q$, 262)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('f36057a5-8bfe-46d6-b430-56cb10cd464c', $q$emerging_opportunity$q$, 5, 8, 7, $q$Developer Tools & Cloud$q$, 373)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('b7e3de09-3d1f-4cf2-8337-c269090981c8', $q$emerging_opportunity$q$, 5, 8, 7, $q$Developer Tools & Cloud$q$, 376)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('45bcdd12-fc73-4e69-a6ec-4961fd076322', $q$emerging_opportunity$q$, 6, 8, 8, $q$Ecommerce & Website Builders$q$, 380)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('a3310151-7d88-4c23-b959-1faaa5132f8d', $q$emerging_opportunity$q$, 6, 8, 8, $q$Ecommerce & Website Builders$q$, 385)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('5fc7d423-2bfb-4923-85a9-5d419bf4c26f', $q$emerging_opportunity$q$, 6, 9, 8, $q$Marketing Automation & Email$q$, 396)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$emerging_opportunity$q$, 6, 9, 8, $q$Marketing Automation & Email$q$, 402)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('4ad6bb35-29e1-42bd-9183-39a59570aee8', $q$emerging_opportunity$q$, 6, 9, 8, $q$SEO, Analytics & Advertising$q$, 403)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('f83fc3c6-361d-4fca-8f70-695fa0c9ab4f', $q$emerging_opportunity$q$, 6, 9, 8, $q$SEO, Analytics & Advertising$q$, 409)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('a69c9e8e-2b63-4936-9731-f85ffcfa1860', $q$emerging_opportunity$q$, 5, 8, 7, $q$Productivity & Collaboration$q$, 481)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, strategic_segment, traffic_score, seo_score, paid_listing_score, source_category_label, list_rank)
VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$emerging_opportunity$q$, 6, 9, 8, $q$Productivity & Collaboration$q$, 500)
ON CONFLICT (tool_id) DO NOTHING;

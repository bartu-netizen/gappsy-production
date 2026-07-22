-- Bulk import gappsy-500-2026-07-18-batch11: 487 new commercial-SaaS tools,
-- landed as status='needs_review', noindex=true, sitemap_eligible=false.
-- Invisible to the public site until a separate editorial-enrichment pass
-- reviews and publishes each one (same pattern as prior bulk-import batches).

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe668cf5-f27d-4d8d-8bd0-f09a6b46b3f6', $q$abstract-api$q$, $q$Abstract API$q$, $q$https://www.abstractapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe668cf5-f27d-4d8d-8bd0-f09a6b46b3f6', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe668cf5-f27d-4d8d-8bd0-f09a6b46b3f6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('16ab7757-c6c6-454f-853f-f69b743e89cf', $q$accela$q$, $q$Accela$q$, $q$https://accela.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '16ab7757-c6c6-454f-853f-f69b743e89cf', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16ab7757-c6c6-454f-853f-f69b743e89cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d516653b-2737-45ee-86a3-367d5934432c', $q$acquia$q$, $q$Acquia$q$, $q$https://acquia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd516653b-2737-45ee-86a3-367d5934432c', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd516653b-2737-45ee-86a3-367d5934432c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2b907b62-b412-46fd-bc08-9a0edad05860', $q$adapty-io$q$, $q$Adapty.io$q$, $q$https://adapty.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2b907b62-b412-46fd-bc08-9a0edad05860', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b907b62-b412-46fd-bc08-9a0edad05860')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ef7c4e80-e23f-469d-9adc-f5f8fee4d682', $q$adroll$q$, $q$AdRoll$q$, $q$https://www.adroll.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ef7c4e80-e23f-469d-9adc-f5f8fee4d682', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef7c4e80-e23f-469d-9adc-f5f8fee4d682')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f8bd694d-7a01-479d-ba53-ce1d41e74460', $q$adstage$q$, $q$AdStage$q$, $q$https://www.adstage.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f8bd694d-7a01-479d-ba53-ce1d41e74460', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8bd694d-7a01-479d-ba53-ce1d41e74460')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('03c5a767-07d3-404e-bc1f-985cc68f5cc3', $q$advent-software$q$, $q$Advent Software$q$, $q$https://www.advent.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '03c5a767-07d3-404e-bc1f-985cc68f5cc3', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03c5a767-07d3-404e-bc1f-985cc68f5cc3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a5436b3-b815-4a00-a806-16135ddfad99', $q$adwcleaner$q$, $q$AdwCleaner$q$, $q$https://toolslib.net/downloads/viewdownload/1-adwcleaner/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a5436b3-b815-4a00-a806-16135ddfad99', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a5436b3-b815-4a00-a806-16135ddfad99')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bda0d92d-d42a-4a92-8dc2-fe12fc9ae0b7', $q$affirm$q$, $q$Affirm$q$, $q$https://www.affirm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bda0d92d-d42a-4a92-8dc2-fe12fc9ae0b7', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bda0d92d-d42a-4a92-8dc2-fe12fc9ae0b7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e4e497c-9116-4d93-8c45-5cda0f2031d0', $q$ahasend$q$, $q$AhaSend$q$, $q$https://ahasend.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e4e497c-9116-4d93-8c45-5cda0f2031d0', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e4e497c-9116-4d93-8c45-5cda0f2031d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('737c8013-5fb0-4340-91e1-aff65a109a1e', $q$alienvault$q$, $q$AlienVault$q$, $q$https://www.alienvault.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '737c8013-5fb0-4340-91e1-aff65a109a1e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '737c8013-5fb0-4340-91e1-aff65a109a1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('74369188-f2a3-4b16-b206-caa1c4b0f7ef', $q$alloy$q$, $q$Alloy$q$, $q$https://alloy.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '74369188-f2a3-4b16-b206-caa1c4b0f7ef', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74369188-f2a3-4b16-b206-caa1c4b0f7ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cfd17a20-216c-4f15-a6b7-1804992894a8', $q$allratestoday$q$, $q$AllRatesToday$q$, $q$https://allratestoday.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cfd17a20-216c-4f15-a6b7-1804992894a8', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfd17a20-216c-4f15-a6b7-1804992894a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('995aba1d-0e9c-4720-a81a-5336bfae7693', $q$alwaysdata$q$, $q$Alwaysdata$q$, $q$https://www.alwaysdata.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '995aba1d-0e9c-4720-a81a-5336bfae7693', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '995aba1d-0e9c-4720-a81a-5336bfae7693')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a6da71a7-c5bc-4f58-9d3c-849d1a36fcb9', $q$ambient-ai$q$, $q$Ambient.ai$q$, $q$https://ambient.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a6da71a7-c5bc-4f58-9d3c-849d1a36fcb9', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6da71a7-c5bc-4f58-9d3c-849d1a36fcb9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54bd6f4c-5690-40bd-a7c8-4e147d121737', $q$ampt-dev$q$, $q$ampt.dev$q$, $q$https://getampt.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54bd6f4c-5690-40bd-a7c8-4e147d121737', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54bd6f4c-5690-40bd-a7c8-4e147d121737')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8ea7ed3-3202-43a0-a7da-c27078a02de5', $q$android-studio$q$, $q$Android Studio$q$, $q$https://developer.android.com/studio$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8ea7ed3-3202-43a0-a7da-c27078a02de5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8ea7ed3-3202-43a0-a7da-c27078a02de5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('882377f1-49d8-4333-92e4-61ef8fcc52bd', $q$androidfilehost$q$, $q$AndroidFileHost$q$, $q$https://androidfilehost.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '882377f1-49d8-4333-92e4-61ef8fcc52bd', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '882377f1-49d8-4333-92e4-61ef8fcc52bd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6005e3a2-aaff-4619-b719-e43cb61c6339', $q$angaza$q$, $q$Angaza$q$, $q$https://www.angaza.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6005e3a2-aaff-4619-b719-e43cb61c6339', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6005e3a2-aaff-4619-b719-e43cb61c6339')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a29cb73-32d8-421c-825e-8bf03a71343e', $q$anomali$q$, $q$Anomali$q$, $q$https://anomali.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a29cb73-32d8-421c-825e-8bf03a71343e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a29cb73-32d8-421c-825e-8bf03a71343e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('15e06305-a584-4637-8757-1e4f10f35e2b', $q$anon-li-alias$q$, $q$anon.li Alias$q$, $q$https://anon.li/alias$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '15e06305-a584-4637-8757-1e4f10f35e2b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15e06305-a584-4637-8757-1e4f10f35e2b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('14378d00-9526-49d1-ac4a-c583a5ca00b3', $q$antideo$q$, $q$Antideo$q$, $q$https://www.antideo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '14378d00-9526-49d1-ac4a-c583a5ca00b3', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '14378d00-9526-49d1-ac4a-c583a5ca00b3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d590ab6-c568-4a13-a43f-60ed4da3d4ce', $q$apitemplate-io$q$, $q$APITemplate.io$q$, $q$https://apitemplate.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d590ab6-c568-4a13-a43f-60ed4da3d4ce', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d590ab6-c568-4a13-a43f-60ed4da3d4ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e94271a-6bd3-4cfe-8c70-2045e6c59177', $q$apollo-graphql$q$, $q$Apollo GraphQL$q$, $q$https://apollographql.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e94271a-6bd3-4cfe-8c70-2045e6c59177', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e94271a-6bd3-4cfe-8c70-2045e6c59177')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c71588ad-cb34-41cb-8016-8ffedebd64f2', $q$appish$q$, $q$Appish$q$, $q$https://appi.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c71588ad-cb34-41cb-8016-8ffedebd64f2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c71588ad-cb34-41cb-8016-8ffedebd64f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2cc7ef9b-2e27-466c-b828-19fefd1f132d', $q$apple$q$, $q$Apple$q$, $q$https://www.apple.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2cc7ef9b-2e27-466c-b828-19fefd1f132d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2cc7ef9b-2e27-466c-b828-19fefd1f132d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('153bb0d9-7c3e-4e52-ad03-b3d915a1ecdf', $q$appnexus$q$, $q$AppNexus$q$, $q$https://www.appnexus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '153bb0d9-7c3e-4e52-ad03-b3d915a1ecdf', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '153bb0d9-7c3e-4e52-ad03-b3d915a1ecdf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('15dd2a6d-755d-4631-9b8f-1094cc7d1a9c', $q$aptana$q$, $q$Aptana$q$, $q$https://www.axway.com/en/aptana$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '15dd2a6d-755d-4631-9b8f-1094cc7d1a9c', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15dd2a6d-755d-4631-9b8f-1094cc7d1a9c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f324abc7-5879-48b9-8424-5b257644334b', $q$apttus$q$, $q$Apttus$q$, $q$https://apttus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f324abc7-5879-48b9-8424-5b257644334b', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f324abc7-5879-48b9-8424-5b257644334b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a7e8122-3695-461f-84e4-19dc93e5180d', $q$arize-ai$q$, $q$Arize AI$q$, $q$https://arize.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a7e8122-3695-461f-84e4-19dc93e5180d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a7e8122-3695-461f-84e4-19dc93e5180d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b3d4c4d0-2012-458a-bb3e-5c9e61d0a7d6', $q$aspireiq$q$, $q$AspireIQ$q$, $q$https://aspireiq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b3d4c4d0-2012-458a-bb3e-5c9e61d0a7d6', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3d4c4d0-2012-458a-bb3e-5c9e61d0a7d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('70325cb2-c57c-4a36-86a3-b565312186a8', $q$audio-enhancer$q$, $q$Audio Enhancer$q$, $q$https://voice-clone.org/tools/audio-enhancer$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '70325cb2-c57c-4a36-86a3-b565312186a8', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70325cb2-c57c-4a36-86a3-b565312186a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('169a687f-0ee0-451e-8913-86c003b39b9d', $q$audio-recorder$q$, $q$Audio Recorder$q$, $q$https://launchpad.net/~audio-recorder$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '169a687f-0ee0-451e-8913-86c003b39b9d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '169a687f-0ee0-451e-8913-86c003b39b9d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4a2d586-d22b-43f0-a49e-b751d41749b7', $q$awardspace-com$q$, $q$Awardspace.com$q$, $q$https://www.awardspace.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4a2d586-d22b-43f0-a49e-b751d41749b7', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4a2d586-d22b-43f0-a49e-b751d41749b7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e2d845e0-eeb2-4870-bc2f-4dd61546e646', $q$barracuda$q$, $q$Barracuda$q$, $q$https://www.barracuda.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e2d845e0-eeb2-4870-bc2f-4dd61546e646', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2d845e0-eeb2-4870-bc2f-4dd61546e646')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4ce9fda3-247f-4016-bcd5-32551285ec51', $q$beampipe-io$q$, $q$Beampipe.io$q$, $q$https://beampipe.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4ce9fda3-247f-4016-bcd5-32551285ec51', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ce9fda3-247f-4016-bcd5-32551285ec51')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8f541863-33e8-4350-b428-5a3b7fa112fb', $q$bedrock-analytics$q$, $q$Bedrock Analytics$q$, $q$https://bedrockanalytics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8f541863-33e8-4350-b428-5a3b7fa112fb', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f541863-33e8-4350-b428-5a3b7fa112fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e0905064-997b-4b5b-8fd6-50fee6bee0dd', $q$betterbird$q$, $q$Betterbird$q$, $q$https://www.betterbird.eu/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e0905064-997b-4b5b-8fd6-50fee6bee0dd', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0905064-997b-4b5b-8fd6-50fee6bee0dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6a41e74d-6972-4d0c-b2ac-9bc51b258ef6', $q$bexi$q$, $q$Bexi$q$, $q$https://bexi.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6a41e74d-6972-4d0c-b2ac-9bc51b258ef6', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a41e74d-6972-4d0c-b2ac-9bc51b258ef6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9826d35d-e9bd-4d1b-ba34-0605c67a12ec', $q$bigdatacloud$q$, $q$BigDataCloud$q$, $q$https://www.bigdatacloud.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9826d35d-e9bd-4d1b-ba34-0605c67a12ec', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9826d35d-e9bd-4d1b-ba34-0605c67a12ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('49404e0b-053c-468d-ab52-0a98bc3e76f9', $q$binshare-net$q$, $q$BinShare.net$q$, $q$https://binshare.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '49404e0b-053c-468d-ab52-0a98bc3e76f9', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '49404e0b-053c-468d-ab52-0a98bc3e76f9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('572daa6a-290a-4e89-b720-0f7cbb9f2e63', $q$blackbaud$q$, $q$Blackbaud$q$, $q$https://www.blackbaud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '572daa6a-290a-4e89-b720-0f7cbb9f2e63', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '572daa6a-290a-4e89-b720-0f7cbb9f2e63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8a42705-fa35-45d2-8498-8012a881f395', $q$blackhawk-network$q$, $q$Blackhawk Network$q$, $q$https://blackhawknetwork.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8a42705-fa35-45d2-8498-8012a881f395', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8a42705-fa35-45d2-8498-8012a881f395')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fc8da50c-88b4-4b76-8a75-737643d423f5', $q$bluemail$q$, $q$BlueMail$q$, $q$https://www.bluemail.me/desktop/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fc8da50c-88b4-4b76-8a75-737643d423f5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc8da50c-88b4-4b76-8a75-737643d423f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0737618-3545-4dd1-b3c4-a85b03b835bf', $q$blynk$q$, $q$Blynk$q$, $q$https://blynk.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0737618-3545-4dd1-b3c4-a85b03b835bf', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0737618-3545-4dd1-b3c4-a85b03b835bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('44eef01c-f79a-4511-9e31-f502a7e87cd8', $q$bolt$q$, $q$Bolt$q$, $q$https://bolt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '44eef01c-f79a-4511-9e31-f502a7e87cd8', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44eef01c-f79a-4511-9e31-f502a7e87cd8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('117ca2a8-f16a-4fc1-bccc-aadb5800f356', $q$boomurl$q$, $q$boomurl$q$, $q$https://boomurl.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '117ca2a8-f16a-4fc1-bccc-aadb5800f356', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '117ca2a8-f16a-4fc1-bccc-aadb5800f356')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4780ba32-7996-4e79-bff8-bb8b30ce99d3', $q$braintrust$q$, $q$Braintrust$q$, $q$https://www.braintrustdata.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4780ba32-7996-4e79-bff8-bb8b30ce99d3', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4780ba32-7996-4e79-bff8-bb8b30ce99d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e431b41f-c262-4a08-8527-8e08946e3c29', $q$branch$q$, $q$Branch$q$, $q$https://branch.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e431b41f-c262-4a08-8527-8e08946e3c29', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e431b41f-c262-4a08-8527-8e08946e3c29')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('24e9f089-ad76-4e59-9d89-b82d251bd1a3', $q$brightpearl$q$, $q$Brightpearl$q$, $q$https://www.brightpearl.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '24e9f089-ad76-4e59-9d89-b82d251bd1a3', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24e9f089-ad76-4e59-9d89-b82d251bd1a3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('505f0afe-3281-4ae6-949e-e465d2a21dd8', $q$browsercat$q$, $q$BrowserCat$q$, $q$https://www.browsercat.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '505f0afe-3281-4ae6-949e-e465d2a21dd8', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '505f0afe-3281-4ae6-949e-e465d2a21dd8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5d1a94ea-0809-4563-8930-9cce7307fe96', $q$bump$q$, $q$Bump$q$, $q$https://bump.email/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5d1a94ea-0809-4563-8930-9cce7307fe96', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d1a94ea-0809-4563-8930-9cce7307fe96')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('892b9c2b-f173-4064-afce-b923fcc25209', $q$burnermail$q$, $q$Burnermail$q$, $q$https://burnermail.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '892b9c2b-f173-4064-afce-b923fcc25209', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '892b9c2b-f173-4064-afce-b923fcc25209')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('548329f8-5592-4c5d-83d6-3776247c8b2e', $q$buttondown$q$, $q$Buttondown$q$, $q$https://buttondown.email/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '548329f8-5592-4c5d-83d6-3776247c8b2e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '548329f8-5592-4c5d-83d6-3776247c8b2e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('affc9d1b-36d7-4584-8295-6495146e3435', $q$c3$q$, $q$C3$q$, $q$https://c3.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'affc9d1b-36d7-4584-8295-6495146e3435', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'affc9d1b-36d7-4584-8295-6495146e3435')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f46c4b38-6951-443a-af17-7bf78dbe3b27', $q$cachefly$q$, $q$CacheFly$q$, $q$https://portal.cachefly.com/signup/free2023$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f46c4b38-6951-443a-af17-7bf78dbe3b27', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f46c4b38-6951-443a-af17-7bf78dbe3b27')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('90df5fe5-078a-4b5b-9d71-b1f5c26dc331', $q$cacher-io$q$, $q$cacher.io$q$, $q$https://www.cacher.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '90df5fe5-078a-4b5b-9d71-b1f5c26dc331', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90df5fe5-078a-4b5b-9d71-b1f5c26dc331')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('006689e6-24c7-4fff-aebf-57f53db4591e', $q$cadence-design-systems$q$, $q$Cadence Design Systems$q$, $q$https://www.cadence.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '006689e6-24c7-4fff-aebf-57f53db4591e', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '006689e6-24c7-4fff-aebf-57f53db4591e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff837062-8532-4654-b1dc-94c79abddc79', $q$cairo-dock$q$, $q$Cairo-Dock$q$, $q$https://glx-dock.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff837062-8532-4654-b1dc-94c79abddc79', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff837062-8532-4654-b1dc-94c79abddc79')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b49866cb-4d08-4c9b-901d-a464ada3bffc', $q$calliduscloud$q$, $q$CallidusCloud$q$, $q$https://calliduscloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b49866cb-4d08-4c9b-901d-a464ada3bffc', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b49866cb-4d08-4c9b-901d-a464ada3bffc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('94894598-a30c-4b75-a310-5621b4bbab98', $q$cassandra$q$, $q$Cassandra$q$, $q$https://cassandra.apache.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '94894598-a30c-4b75-a310-5621b4bbab98', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94894598-a30c-4b75-a310-5621b4bbab98')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d1c3bb57-a99a-486b-8024-b9dcc1367a4d', $q$catchdoms$q$, $q$CatchDoms$q$, $q$https://catchdoms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd1c3bb57-a99a-486b-8024-b9dcc1367a4d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1c3bb57-a99a-486b-8024-b9dcc1367a4d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e3a9ede-b812-4938-8daa-419a010507ee', $q$catchjs-com$q$, $q$CatchJS.com$q$, $q$https://catchjs.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e3a9ede-b812-4938-8daa-419a010507ee', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e3a9ede-b812-4938-8daa-419a010507ee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd04a7a4-cff0-4b34-a27a-1888f1d00286', $q$cdox$q$, $q$cDox$q$, $q$https://cdox.ca$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd04a7a4-cff0-4b34-a27a-1888f1d00286', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd04a7a4-cff0-4b34-a27a-1888f1d00286')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('88af77ce-8715-488d-b36b-e1ce0f6b05ce', $q$change-healthcare$q$, $q$Change Healthcare$q$, $q$https://changehealthcare.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '88af77ce-8715-488d-b36b-e1ce0f6b05ce', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88af77ce-8715-488d-b36b-e1ce0f6b05ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ade70ee-d432-40f8-bbc1-4f4ace32d4e9', $q$chartboost$q$, $q$Chartboost$q$, $q$https://www.chartboost.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ade70ee-d432-40f8-bbc1-4f4ace32d4e9', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ade70ee-d432-40f8-bbc1-4f4ace32d4e9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('75e14f6f-b97e-4e52-b3db-62135190d89e', $q$chatterino$q$, $q$Chatterino$q$, $q$https://chatterino.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '75e14f6f-b97e-4e52-b3db-62135190d89e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75e14f6f-b97e-4e52-b3db-62135190d89e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('84f4c594-16fc-438c-9ffa-a201e324ee91', $q$checkbot-io$q$, $q$checkbot.io$q$, $q$https://www.checkbot.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '84f4c594-16fc-438c-9ffa-a201e324ee91', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84f4c594-16fc-438c-9ffa-a201e324ee91')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6eff125d-8cfb-41ee-99da-a5236b44da71', $q$checkr$q$, $q$Checkr$q$, $q$https://checkr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6eff125d-8cfb-41ee-99da-a5236b44da71', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6eff125d-8cfb-41ee-99da-a5236b44da71')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20bf9a2d-068d-44a2-b56c-ac1804fb0eb6', $q$churnkey$q$, $q$Churnkey$q$, $q$https://churnkey.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20bf9a2d-068d-44a2-b56c-ac1804fb0eb6', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20bf9a2d-068d-44a2-b56c-ac1804fb0eb6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('310dfd9e-3e2a-4361-aa51-f37142ec1fda', $q$cider$q$, $q$Cider$q$, $q$https://cider.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '310dfd9e-3e2a-4361-aa51-f37142ec1fda', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '310dfd9e-3e2a-4361-aa51-f37142ec1fda')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a9ade2e3-ecd4-4b91-b99c-4b4ca2532232', $q$clappia$q$, $q$Clappia$q$, $q$https://www.clappia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a9ade2e3-ecd4-4b91-b99c-4b4ca2532232', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9ade2e3-ecd4-4b91-b99c-4b4ca2532232')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26fea171-bae5-4fc5-9fd9-d68fbfe1f071', $q$climate-corporation$q$, $q$Climate Corporation$q$, $q$https://climate.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26fea171-bae5-4fc5-9fd9-d68fbfe1f071', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26fea171-bae5-4fc5-9fd9-d68fbfe1f071')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5684952a-089e-41e6-b2a0-907e117d482b', $q$clipgrab$q$, $q$Clipgrab$q$, $q$https://clipgrab.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5684952a-089e-41e6-b2a0-907e117d482b', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5684952a-089e-41e6-b2a0-907e117d482b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d53907a-b4bb-41d9-aeb5-5d05a60f59a4', $q$cloudfabrix$q$, $q$CloudFabrix$q$, $q$https://cloudfabrix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d53907a-b4bb-41d9-aeb5-5d05a60f59a4', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d53907a-b4bb-41d9-aeb5-5d05a60f59a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e66e7381-0f31-4d45-a264-ab2c47af72c3', $q$cloudns-net$q$, $q$cloudns.net$q$, $q$https://www.cloudns.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e66e7381-0f31-4d45-a264-ab2c47af72c3', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e66e7381-0f31-4d45-a264-ab2c47af72c3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dbbc30f2-c883-490b-a1c0-4209fcaac555', $q$codeberg-pages$q$, $q$Codeberg Pages$q$, $q$https://codeberg.page/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dbbc30f2-c883-490b-a1c0-4209fcaac555', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dbbc30f2-c883-490b-a1c0-4209fcaac555')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ef1474b4-0228-487d-8649-9e8c13af556f', $q$codeberg-translate$q$, $q$Codeberg Translate$q$, $q$https://translate.codeberg.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ef1474b4-0228-487d-8649-9e8c13af556f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef1474b4-0228-487d-8649-9e8c13af556f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0f5c9c9d-b59e-41b9-8170-80aed2187fc8', $q$codeberg-s-ci$q$, $q$Codeberg's CI$q$, $q$https://docs.codeberg.org/ci/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0f5c9c9d-b59e-41b9-8170-80aed2187fc8', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f5c9c9d-b59e-41b9-8170-80aed2187fc8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ae5dbe6-de96-475d-8fa3-f54dcfab7a61', $q$codenameone-com$q$, $q$codenameone.com$q$, $q$https://www.codenameone.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ae5dbe6-de96-475d-8fa3-f54dcfab7a61', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ae5dbe6-de96-475d-8fa3-f54dcfab7a61')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('02acf2e5-4009-4310-aa4d-caf63f972e5f', $q$coderabbit-ai$q$, $q$coderabbit.ai$q$, $q$https://coderabbit.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '02acf2e5-4009-4310-aa4d-caf63f972e5f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02acf2e5-4009-4310-aa4d-caf63f972e5f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7f915015-7de1-4fdb-a477-34888a09649c', $q$cognizant$q$, $q$Cognizant$q$, $q$https://cognizant.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7f915015-7de1-4fdb-a477-34888a09649c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f915015-7de1-4fdb-a477-34888a09649c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a04a471-783c-4f17-abc2-93c4160543da', $q$coinmarketcap$q$, $q$CoinMarketCap$q$, $q$https://coinmarketcap.com/api/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a04a471-783c-4f17-abc2-93c4160543da', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a04a471-783c-4f17-abc2-93c4160543da')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c875cabc-dc9a-4645-ac7e-9f9b8a88e2bf', $q$collision$q$, $q$Collision$q$, $q$https://collision.geopjr.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c875cabc-dc9a-4645-ac7e-9f9b8a88e2bf', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c875cabc-dc9a-4645-ac7e-9f9b8a88e2bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c4490765-45f7-48dc-ab27-e987dfb6cd75', $q$composio$q$, $q$Composio$q$, $q$https://composio.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c4490765-45f7-48dc-ab27-e987dfb6cd75', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4490765-45f7-48dc-ab27-e987dfb6cd75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('18c9fbe6-5820-4126-a95d-86d665274a7d', $q$contact-do$q$, $q$Contact.do$q$, $q$https://contact.do/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '18c9fbe6-5820-4126-a95d-86d665274a7d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18c9fbe6-5820-4126-a95d-86d665274a7d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8b68842-72f9-4433-8892-912b315328ba', $q$container-registry-service$q$, $q$Container Registry Service$q$, $q$https://container-registry.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8b68842-72f9-4433-8892-912b315328ba', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8b68842-72f9-4433-8892-912b315328ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('969fc6e1-06d8-42b9-945a-08c091e339c8', $q$conversion-tools$q$, $q$Conversion Tools$q$, $q$https://conversiontools.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '969fc6e1-06d8-42b9-945a-08c091e339c8', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '969fc6e1-06d8-42b9-945a-08c091e339c8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5389682a-e7f3-4c14-bf0a-6c92af78e8c5', $q$cors-tester$q$, $q$CORS-Tester$q$, $q$https://cors-error.dev/cors-tester/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5389682a-e7f3-4c14-bf0a-6c92af78e8c5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5389682a-e7f3-4c14-bf0a-6c92af78e8c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b8b4c82-3192-4141-b307-e4fac936db1b', $q$couchbase-capella$q$, $q$Couchbase Capella$q$, $q$https://www.couchbase.com/products/capella/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b8b4c82-3192-4141-b307-e4fac936db1b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b8b4c82-3192-4141-b307-e4fac936db1b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe1086f4-8a3a-47da-98c7-f45cde6555a4', $q$cradlepoint$q$, $q$Cradlepoint$q$, $q$https://cradlepoint.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe1086f4-8a3a-47da-98c7-f45cde6555a4', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe1086f4-8a3a-47da-98c7-f45cde6555a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('59a4fd91-dc21-4996-ab71-c47a2cab95ef', $q$cratedb$q$, $q$CrateDB$q$, $q$https://crate.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '59a4fd91-dc21-4996-ab71-c47a2cab95ef', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59a4fd91-dc21-4996-ab71-c47a2cab95ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d003f92f-254f-4157-a191-83c6cb343faa', $q$criteo$q$, $q$Criteo$q$, $q$https://www.criteo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd003f92f-254f-4157-a191-83c6cb343faa', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd003f92f-254f-4157-a191-83c6cb343faa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('075e9ba7-9d3b-4956-965d-234dc0ba0422', $q$crystallize$q$, $q$Crystallize$q$, $q$https://crystallize.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '075e9ba7-9d3b-4956-965d-234dc0ba0422', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '075e9ba7-9d3b-4956-965d-234dc0ba0422')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e78368c5-1241-4e12-88e3-2ea4cbc61826', $q$cscope$q$, $q$Cscope$q$, $q$https://cscope.sourceforge.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e78368c5-1241-4e12-88e3-2ea4cbc61826', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e78368c5-1241-4e12-88e3-2ea4cbc61826')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff2032a2-7c89-47ac-91e1-17954079869e', $q$currencyapi$q$, $q$Currencyapi$q$, $q$https://currencyapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff2032a2-7c89-47ac-91e1-17954079869e', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff2032a2-7c89-47ac-91e1-17954079869e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('61188af5-1198-422b-88a6-c3d5d9272337', $q$currencyfreaks$q$, $q$CurrencyFreaks$q$, $q$https://currencyfreaks.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '61188af5-1198-422b-88a6-c3d5d9272337', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61188af5-1198-422b-88a6-c3d5d9272337')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f064b584-3ba5-4055-94d3-094bbe07b335', $q$currencylayer$q$, $q$currencylayer$q$, $q$https://currencylayer.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f064b584-3ba5-4055-94d3-094bbe07b335', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f064b584-3ba5-4055-94d3-094bbe07b335')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a8e0bbd9-c267-4c9c-b77c-8dd8a821f911', $q$d2iq$q$, $q$d2iq$q$, $q$https://d2iq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a8e0bbd9-c267-4c9c-b77c-8dd8a821f911', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8e0bbd9-c267-4c9c-b77c-8dd8a821f911')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c2f5a3f-28a5-4e7e-9f48-0e88a0c88b76', $q$daestro$q$, $q$Daestro$q$, $q$https://daestro.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c2f5a3f-28a5-4e7e-9f48-0e88a0c88b76', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c2f5a3f-28a5-4e7e-9f48-0e88a0c88b76')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b45be46-c2f2-4a0d-9b1f-b521dce38970', $q$dafont$q$, $q$dafont$q$, $q$https://www.dafont.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b45be46-c2f2-4a0d-9b1f-b521dce38970', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b45be46-c2f2-4a0d-9b1f-b521dce38970')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9dee05bc-8721-4b46-9756-fdb1aaa5556b', $q$data-fetcher$q$, $q$Data Fetcher$q$, $q$https://datafetcher.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9dee05bc-8721-4b46-9756-fdb1aaa5556b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9dee05bc-8721-4b46-9756-fdb1aaa5556b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a8b3b9f3-5c35-493d-b36b-15e47b1d0695', $q$dataimporter-io$q$, $q$Dataimporter.io$q$, $q$https://www.dataimporter.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a8b3b9f3-5c35-493d-b36b-15e47b1d0695', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8b3b9f3-5c35-493d-b36b-15e47b1d0695')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9471901f-8ac1-4efa-abb6-76295096241c', $q$datalore$q$, $q$Datalore$q$, $q$https://datalore.jetbrains.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9471901f-8ac1-4efa-abb6-76295096241c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9471901f-8ac1-4efa-abb6-76295096241c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dcd0517e-63d6-460f-9ef1-f446f1a31bca', $q$datavisor$q$, $q$Datavisor$q$, $q$https://datavisor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dcd0517e-63d6-460f-9ef1-f446f1a31bca', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dcd0517e-63d6-460f-9ef1-f446f1a31bca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('51e92830-5fd4-48b4-b404-c9667fbccbf1', $q$dealpath$q$, $q$Dealpath$q$, $q$https://www.dealpath.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '51e92830-5fd4-48b4-b404-c9667fbccbf1', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '51e92830-5fd4-48b4-b404-c9667fbccbf1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e9618ae-8e11-442d-bbb3-7bbaa72af0f4', $q$debugmail-io$q$, $q$debugmail.io$q$, $q$https://debugmail.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e9618ae-8e11-442d-bbb3-7bbaa72af0f4', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e9618ae-8e11-442d-bbb3-7bbaa72af0f4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('52096f12-aa04-48fe-80b2-0163c58ee352', $q$degoo-com$q$, $q$degoo.com$q$, $q$https://degoo.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '52096f12-aa04-48fe-80b2-0163c58ee352', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52096f12-aa04-48fe-80b2-0163c58ee352')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('21623183-c4ff-4385-a5ab-b31b093a7f2b', $q$deliverr$q$, $q$Deliverr$q$, $q$https://deliverr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '21623183-c4ff-4385-a5ab-b31b093a7f2b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21623183-c4ff-4385-a5ab-b31b093a7f2b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f3d3114-a36f-44ef-b68c-3ec6e985e873', $q$deltatrak$q$, $q$DeltaTrak$q$, $q$https://deltatrak.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f3d3114-a36f-44ef-b68c-3ec6e985e873', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f3d3114-a36f-44ef-b68c-3ec6e985e873')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e0c93a45-2424-421b-946c-b9f0937d9e0e', $q$deployhq-com$q$, $q$deployhq.com$q$, $q$https://www.deployhq.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e0c93a45-2424-421b-946c-b9f0937d9e0e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0c93a45-2424-421b-946c-b9f0937d9e0e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f095edfb-b579-41af-a437-28fb83720e7f', $q$designmap$q$, $q$DesignMap$q$, $q$https://www.designmap.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f095edfb-b579-41af-a437-28fb83720e7f', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f095edfb-b579-41af-a437-28fb83720e7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e3a5de9-bac8-46a2-bb14-d9675d5f2140', $q$devtoollab$q$, $q$DevToolLab$q$, $q$https://devtoollab.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e3a5de9-bac8-46a2-bb14-d9675d5f2140', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e3a5de9-bac8-46a2-bb14-d9675d5f2140')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e15fd2f2-3711-49e7-a8af-53c8a7f68c55', $q$didi-labs$q$, $q$DiDi Labs$q$, $q$https://didi-labs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e15fd2f2-3711-49e7-a8af-53c8a7f68c55', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e15fd2f2-3711-49e7-a8af-53c8a7f68c55')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('684d8a2f-623b-4d3a-9118-06543f554a32', $q$diffuse$q$, $q$Diffuse$q$, $q$https://diffuse.sourceforge.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '684d8a2f-623b-4d3a-9118-06543f554a32', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '684d8a2f-623b-4d3a-9118-06543f554a32')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e1ff178-90de-4d0e-9ed9-edb24340efb8', $q$digitalplat$q$, $q$DigitalPlat$q$, $q$https://domain.digitalplat.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e1ff178-90de-4d0e-9ed9-edb24340efb8', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e1ff178-90de-4d0e-9ed9-edb24340efb8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e6581948-a756-408d-9650-1a23ab0e74e6', $q$directly$q$, $q$Directly$q$, $q$https://directly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e6581948-a756-408d-9650-1a23ab0e74e6', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e6581948-a756-408d-9650-1a23ab0e74e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13a95b3f-3391-413c-988e-51e57efbc0e6', $q$distru$q$, $q$Distru$q$, $q$https://distru.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13a95b3f-3391-413c-988e-51e57efbc0e6', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13a95b3f-3391-413c-988e-51e57efbc0e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20f76646-82d7-4eb6-8f85-edf736f0da7f', $q$dkimvalidator-com$q$, $q$dkimvalidator.com$q$, $q$https://dkimvalidator.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20f76646-82d7-4eb6-8f85-edf736f0da7f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20f76646-82d7-4eb6-8f85-edf736f0da7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d402331-e3f6-4dd9-9a40-520ade2df731', $q$dns-he-net$q$, $q$dns.he.net$q$, $q$https://dns.he.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d402331-e3f6-4dd9-9a40-520ade2df731', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d402331-e3f6-4dd9-9a40-520ade2df731')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ecc1cb6e-aed1-4318-8cdc-6a0b619fe52a', $q$dnsexit$q$, $q$DNSExit$q$, $q$https://dnsexit.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ecc1cb6e-aed1-4318-8cdc-6a0b619fe52a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ecc1cb6e-aed1-4318-8cdc-6a0b619fe52a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('00e27e7a-e6c2-4d55-8df8-cf2fab61a968', $q$dnshe$q$, $q$DNSHE$q$, $q$https://www.dnshe.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '00e27e7a-e6c2-4d55-8df8-cf2fab61a968', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00e27e7a-e6c2-4d55-8df8-cf2fab61a968')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a32692a1-811c-48a7-a10a-41a42ba3f8e2', $q$docbeacon$q$, $q$DocBeacon$q$, $q$https://docbeacon.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a32692a1-811c-48a7-a10a-41a42ba3f8e2', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a32692a1-811c-48a7-a10a-41a42ba3f8e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b33a75a-b695-4b6c-aede-7ae2f347a7e2', $q$domcloud-co$q$, $q$domcloud.co$q$, $q$https://domcloud.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b33a75a-b695-4b6c-aede-7ae2f347a7e2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b33a75a-b695-4b6c-aede-7ae2f347a7e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cef608f6-75e0-4b90-ae84-69f7678a2dbe', $q$doqlo$q$, $q$Doqlo$q$, $q$https://doqlo.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cef608f6-75e0-4b90-ae84-69f7678a2dbe', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cef608f6-75e0-4b90-ae84-69f7678a2dbe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a66b238-2997-490c-89f9-86eb75d3dfe2', $q$dotenv$q$, $q$Dotenv$q$, $q$https://dotenv.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a66b238-2997-490c-89f9-86eb75d3dfe2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a66b238-2997-490c-89f9-86eb75d3dfe2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('16e48cc2-25ad-4fd6-9df7-296762411312', $q$downtimemonkey-com$q$, $q$downtimemonkey.com$q$, $q$https://downtimemonkey.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '16e48cc2-25ad-4fd6-9df7-296762411312', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16e48cc2-25ad-4fd6-9df7-296762411312')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9764790e-5fd4-4c54-b249-c790c34e2535', $q$drawing$q$, $q$Drawing$q$, $q$https://maoschanz.github.io/drawing/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9764790e-5fd4-4c54-b249-c790c34e2535', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9764790e-5fd4-4c54-b249-c790c34e2535')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27cba2b3-fe26-4501-b3ed-0741b929b79a', $q$dronedeploy$q$, $q$DroneDeploy$q$, $q$https://www.dronedeploy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27cba2b3-fe26-4501-b3ed-0741b929b79a', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27cba2b3-fe26-4501-b3ed-0741b929b79a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('272d4a55-d9f2-4da4-a4f5-a531050981bb', $q$dubble$q$, $q$Dubble$q$, $q$https://dubble.so/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '272d4a55-d9f2-4da4-a4f5-a531050981bb', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '272d4a55-d9f2-4da4-a4f5-a531050981bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d3a2a6a9-f2dc-46da-8e5b-8b3ceedefce1', $q$duckdns-org$q$, $q$duckdns.org$q$, $q$https://www.duckdns.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd3a2a6a9-f2dc-46da-8e5b-8b3ceedefce1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3a2a6a9-f2dc-46da-8e5b-8b3ceedefce1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f8ba3b43-13b0-4439-970b-b14e7f4694d6', $q$duckly$q$, $q$Duckly$q$, $q$https://duckly.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f8ba3b43-13b0-4439-970b-b14e7f4694d6', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8ba3b43-13b0-4439-970b-b14e7f4694d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b22f595-a122-4e13-85d2-b1f6dc9a7e4d', $q$dynv6-com$q$, $q$Dynv6.com$q$, $q$https://dynv6.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b22f595-a122-4e13-85d2-b1f6dc9a7e4d', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b22f595-a122-4e13-85d2-b1f6dc9a7e4d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8818c378-5c98-4ff4-96ac-0f59c1fc5c02', $q$easypost$q$, $q$EasyPost$q$, $q$https://www.easypost.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8818c378-5c98-4ff4-96ac-0f59c1fc5c02', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8818c378-5c98-4ff4-96ac-0f59c1fc5c02')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7a91f66-57ea-4359-bc70-dbfd3dfd46c2', $q$emailguard$q$, $q$EmailGuard$q$, $q$https://emailguard.lazrek.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7a91f66-57ea-4359-bc70-dbfd3dfd46c2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7a91f66-57ea-4359-bc70-dbfd3dfd46c2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d07545c3-bde7-4f9d-898a-16a33f25dbe2', $q$emailjs$q$, $q$EmailJS$q$, $q$https://www.emailjs.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd07545c3-bde7-4f9d-898a-16a33f25dbe2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd07545c3-bde7-4f9d-898a-16a33f25dbe2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2ede3ff-5d15-4d6f-83d2-6bc7388f8f20', $q$emaillabs-io$q$, $q$EmailLabs.io$q$, $q$https://emaillabs.io/en$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2ede3ff-5d15-4d6f-83d2-6bc7388f8f20', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2ede3ff-5d15-4d6f-83d2-6bc7388f8f20')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('04c582c3-427c-4114-b892-2467c6a685fd', $q$emailqo-email-infrastructure-grader$q$, $q$EmailQo Email Infrastructure Grader$q$, $q$https://emailqo.com/email-grader$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '04c582c3-427c-4114-b892-2467c6a685fd', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04c582c3-427c-4114-b892-2467c6a685fd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d12db00b-0cee-48c1-a703-7087346a1b7b', $q$emailvalidation-io$q$, $q$Emailvalidation.io$q$, $q$https://emailvalidation.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd12db00b-0cee-48c1-a703-7087346a1b7b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd12db00b-0cee-48c1-a703-7087346a1b7b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b5869a5f-c24d-48a6-b8d1-457a4adc3140', $q$emc-data-domain$q$, $q$EMC Data Domain$q$, $q$https://emc.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b5869a5f-c24d-48a6-b8d1-457a4adc3140', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5869a5f-c24d-48a6-b8d1-457a4adc3140')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a415999c-e4c2-4b42-bd97-d79377b862b2', $q$emitlo$q$, $q$Emitlo$q$, $q$https://emitlo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a415999c-e4c2-4b42-bd97-d79377b862b2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a415999c-e4c2-4b42-bd97-d79377b862b2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e018a09f-bf92-42ac-9c5a-c014d029bf97', $q$endpoint-clinical$q$, $q$Endpoint Clinical$q$, $q$https://www.endpointclinical.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e018a09f-bf92-42ac-9c5a-c014d029bf97', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e018a09f-bf92-42ac-9c5a-c014d029bf97')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b015024-058e-4f02-a56b-d685cdf904f6', $q$engage$q$, $q$Engage$q$, $q$https://engage.so/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b015024-058e-4f02-a56b-d685cdf904f6', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b015024-058e-4f02-a56b-d685cdf904f6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3786265c-48f4-4389-a33b-31819188b9f6', $q$etherealmail$q$, $q$EtherealMail$q$, $q$https://ethereal.email$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3786265c-48f4-4389-a33b-31819188b9f6', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3786265c-48f4-4389-a33b-31819188b9f6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e1c83d2-a152-4757-88c3-5613bfd6085f', $q$etlr$q$, $q$ETLR$q$, $q$https://etlr.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e1c83d2-a152-4757-88c3-5613bfd6085f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e1c83d2-a152-4757-88c3-5613bfd6085f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('04d14a40-7693-43cd-bff9-ebb14eaba5f5', $q$everdo$q$, $q$Everdo$q$, $q$https://everdo.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '04d14a40-7693-43cd-bff9-ebb14eaba5f5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04d14a40-7693-43cd-bff9-ebb14eaba5f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('47a2ba20-05a6-4752-ac77-cd32528c4160', $q$eversql-com$q$, $q$eversql.com$q$, $q$https://www.eversql.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '47a2ba20-05a6-4752-ac77-cd32528c4160', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47a2ba20-05a6-4752-ac77-cd32528c4160')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1fd01f9-d63b-4b48-a78b-029d9e796649', $q$exchange-rate-api$q$, $q$Exchange Rate API$q$, $q$https://exchange-rateapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1fd01f9-d63b-4b48-a78b-029d9e796649', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1fd01f9-d63b-4b48-a78b-029d9e796649')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('94558841-3a5d-4856-bc5e-c106f70d0cc7', $q$exchangerate-api-com$q$, $q$exchangerate-api.com$q$, $q$https://www.exchangerate-api.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '94558841-3a5d-4856-bc5e-c106f70d0cc7', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94558841-3a5d-4856-bc5e-c106f70d0cc7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95fcb8ee-12ea-41ca-a736-58e9b1ddd100', $q$exponential$q$, $q$Exponential$q$, $q$https://exponential.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95fcb8ee-12ea-41ca-a736-58e9b1ddd100', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95fcb8ee-12ea-41ca-a736-58e9b1ddd100')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5d5cafa8-8d5b-4953-8df9-5ad4bb09560d', $q$expose$q$, $q$Expose$q$, $q$https://expose.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5d5cafa8-8d5b-4953-8df9-5ad4bb09560d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d5cafa8-8d5b-4953-8df9-5ad4bb09560d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c178ffb-4eb3-4684-8326-234b73a843a1', $q$fabform$q$, $q$FabForm$q$, $q$https://fabform.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c178ffb-4eb3-4684-8326-234b73a843a1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c178ffb-4eb3-4684-8326-234b73a843a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c08a564d-2834-49a8-a4b6-2baf38a4d88e', $q$fabric-genomics$q$, $q$Fabric Genomics$q$, $q$https://fabricgenomics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c08a564d-2834-49a8-a4b6-2baf38a4d88e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c08a564d-2834-49a8-a4b6-2baf38a4d88e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a78850cd-d34f-48f4-a202-98e9c790c008', $q$falkon$q$, $q$Falkon$q$, $q$https://www.falkon.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a78850cd-d34f-48f4-a202-98e9c790c008', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a78850cd-d34f-48f4-a202-98e9c790c008')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d41593bd-b571-47a3-affc-ff5990e2595b', $q$filebase-com$q$, $q$filebase.com$q$, $q$https://filebase.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd41593bd-b571-47a3-affc-ff5990e2595b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd41593bd-b571-47a3-affc-ff5990e2595b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65c7cbb5-705e-428e-b8f6-54abc3b8d075', $q$financialforce$q$, $q$FinancialForce$q$, $q$https://financialforce.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65c7cbb5-705e-428e-b8f6-54abc3b8d075', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65c7cbb5-705e-428e-b8f6-54abc3b8d075')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('42439bc2-f401-44b9-9e17-b654ccf1b784', $q$fingerprint-digital$q$, $q$Fingerprint Digital$q$, $q$https://www.fingerprintplay.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '42439bc2-f401-44b9-9e17-b654ccf1b784', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42439bc2-f401-44b9-9e17-b654ccf1b784')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3bb1daf9-fada-42a1-b148-0b4f79d5d7b3', $q$firecrawl$q$, $q$Firecrawl$q$, $q$https://www.firecrawl.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3bb1daf9-fada-42a1-b148-0b4f79d5d7b3', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bb1daf9-fada-42a1-b148-0b4f79d5d7b3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a4ac2426-2d8e-49ab-84fd-15f2a2082f74', $q$fl-studio$q$, $q$FL Studio$q$, $q$https://www.image-line.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a4ac2426-2d8e-49ab-84fd-15f2a2082f74', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4ac2426-2d8e-49ab-84fd-15f2a2082f74')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b811870d-cfcf-4def-af02-dd0da54f006f', $q$flexport$q$, $q$Flexport$q$, $q$https://www.flexport.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b811870d-cfcf-4def-af02-dd0da54f006f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b811870d-cfcf-4def-af02-dd0da54f006f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2b31c0e8-271c-457a-9848-b7fc35ab50a5', $q$flox$q$, $q$Flox$q$, $q$https://flox.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2b31c0e8-271c-457a-9848-b7fc35ab50a5', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b31c0e8-271c-457a-9848-b7fc35ab50a5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d9256d8-7e7e-4f23-89c6-0695cf4d9c62', $q$fluidforms$q$, $q$FluidForms$q$, $q$https://fluidforms.ai/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d9256d8-7e7e-4f23-89c6-0695cf4d9c62', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d9256d8-7e7e-4f23-89c6-0695cf4d9c62')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b3d4ca63-5918-4a37-9a2d-a4c8d7a686d5', $q$fontget$q$, $q$FontGet$q$, $q$https://www.fontget.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b3d4ca63-5918-4a37-9a2d-a4c8d7a686d5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3d4ca63-5918-4a37-9a2d-a4c8d7a686d5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bfe3050f-c8cc-421f-921f-df16d89cc855', $q$forgecode$q$, $q$ForgeCode$q$, $q$https://forgecode.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bfe3050f-c8cc-421f-921f-df16d89cc855', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfe3050f-c8cc-421f-921f-df16d89cc855')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e93afbb1-35c1-4b5c-940a-6742d27733e1', $q$form-plume$q$, $q$Form Plume$q$, $q$https://formplume.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e93afbb1-35c1-4b5c-940a-6742d27733e1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e93afbb1-35c1-4b5c-940a-6742d27733e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ac95b883-bb9c-4f26-bb44-0309b02d008c', $q$forminit$q$, $q$Forminit$q$, $q$https://forminit.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ac95b883-bb9c-4f26-bb44-0309b02d008c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac95b883-bb9c-4f26-bb44-0309b02d008c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6100f38b-83c4-4386-a10f-d6549288b5f4', $q$formkeep-com$q$, $q$FormKeep.com$q$, $q$https://www.formkeep.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6100f38b-83c4-4386-a10f-d6549288b5f4', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6100f38b-83c4-4386-a10f-d6549288b5f4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b07fa9b-2da9-4362-a1e6-121ede1d6dad', $q$formlets-com$q$, $q$formlets.com$q$, $q$https://formlets.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b07fa9b-2da9-4362-a1e6-121ede1d6dad', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b07fa9b-2da9-4362-a1e6-121ede1d6dad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a13f98a8-e43d-4287-a8f8-b6235d31f535', $q$formnx$q$, $q$FormNX$q$, $q$https://FormNX.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a13f98a8-e43d-4287-a8f8-b6235d31f535', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a13f98a8-e43d-4287-a8f8-b6235d31f535')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('383afb3c-1f8e-4f4a-aa63-91882416de95', $q$forms-app$q$, $q$forms.app$q$, $q$https://forms.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '383afb3c-1f8e-4f4a-aa63-91882416de95', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '383afb3c-1f8e-4f4a-aa63-91882416de95')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28db393a-bd0b-494b-9611-8828e3df60be', $q$formspree-io$q$, $q$Formspree.io$q$, $q$https://formspree.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28db393a-bd0b-494b-9611-8828e3df60be', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28db393a-bd0b-494b-9611-8828e3df60be')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b356105f-8414-445e-a428-251c6e5bb954', $q$fraudlabs-pro$q$, $q$FraudLabs Pro$q$, $q$https://www.fraudlabspro.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b356105f-8414-445e-a428-251c6e5bb954', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b356105f-8414-445e-a428-251c6e5bb954')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('01686801-867e-43b4-8325-9acbfaf64a8d', $q$fre-ac$q$, $q$fre:ac$q$, $q$https://www.freac.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '01686801-867e-43b4-8325-9acbfaf64a8d', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01686801-867e-43b4-8325-9acbfaf64a8d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('488a4ed0-b97b-43bb-bed9-c43d351fb423', $q$freedns-afraid-org$q$, $q$freedns.afraid.org$q$, $q$https://freedns.afraid.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '488a4ed0-b97b-43bb-bed9-c43d351fb423', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '488a4ed0-b97b-43bb-bed9-c43d351fb423')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28a3535e-9599-4f24-9969-2e0184366757', $q$freeipapi$q$, $q$FreeIPAPI$q$, $q$https://freeipapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28a3535e-9599-4f24-9969-2e0184366757', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28a3535e-9599-4f24-9969-2e0184366757')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dac00a00-4220-4509-9c6b-1d8c250bc6ef', $q$future-agi$q$, $q$Future AGI$q$, $q$https://futureagi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dac00a00-4220-4509-9c6b-1d8c250bc6ef', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dac00a00-4220-4509-9c6b-1d8c250bc6ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c507b12-8937-462f-809e-021ca3a77d1e', $q$fxratesapi$q$, $q$FxRatesAPI$q$, $q$https://fxratesapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c507b12-8937-462f-809e-021ca3a77d1e', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c507b12-8937-462f-809e-021ca3a77d1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('04600f92-2876-44fd-ae44-8d6c0af6a932', $q$gaphor$q$, $q$Gaphor$q$, $q$https://gaphor.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '04600f92-2876-44fd-ae44-8d6c0af6a932', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04600f92-2876-44fd-ae44-8d6c0af6a932')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e9684f69-56ee-41f7-afe3-aa0c8a298872', $q$garagescript$q$, $q$GarageScript$q$, $q$https://garagescript.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e9684f69-56ee-41f7-afe3-aa0c8a298872', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9684f69-56ee-41f7-afe3-aa0c8a298872')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c26a6f02-d8c9-4a4c-b770-2bc48f00d555', $q$ge-digital$q$, $q$GE Digital$q$, $q$https://ge.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c26a6f02-d8c9-4a4c-b770-2bc48f00d555', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c26a6f02-d8c9-4a4c-b770-2bc48f00d555')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6c4c5fab-f691-488e-9f56-4d9917930548', $q$genymotion$q$, $q$Genymotion$q$, $q$https://www.genymotion.com/desktop/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6c4c5fab-f691-488e-9f56-4d9917930548', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c4c5fab-f691-488e-9f56-4d9917930548')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8c14a4ec-45dc-4c9f-996b-f20b8c99a583', $q$geojs-io$q$, $q$geojs.io$q$, $q$https://www.geojs.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8c14a4ec-45dc-4c9f-996b-f20b8c99a583', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c14a4ec-45dc-4c9f-996b-f20b8c99a583')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05cfa4e4-8bfe-4e8f-b097-70774ffa12d8', $q$geokeo-api$q$, $q$Geokeo api$q$, $q$https://geokeo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05cfa4e4-8bfe-4e8f-b097-70774ffa12d8', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05cfa4e4-8bfe-4e8f-b097-70774ffa12d8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c162060f-ff95-4bfd-b624-b40c737d5d97', $q$ghidra$q$, $q$ghidra$q$, $q$https://ghidra-sre.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c162060f-ff95-4bfd-b624-b40c737d5d97', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c162060f-ff95-4bfd-b624-b40c737d5d97')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0384c0ff-12ff-47c4-b42a-777bfe687cb6', $q$ghostty$q$, $q$Ghostty$q$, $q$https://ghostty.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0384c0ff-12ff-47c4-b42a-777bfe687cb6', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0384c0ff-12ff-47c4-b42a-777bfe687cb6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dfa9f1c5-7a70-4927-968e-99a725650b50', $q$gigya$q$, $q$Gigya$q$, $q$https://gigya.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dfa9f1c5-7a70-4927-968e-99a725650b50', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dfa9f1c5-7a70-4927-968e-99a725650b50')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('72695c3c-7fcb-4bea-b21d-9216583ef3b8', $q$gitbreeze$q$, $q$GitBreeze$q$, $q$https://gitbreeze.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '72695c3c-7fcb-4bea-b21d-9216583ef3b8', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72695c3c-7fcb-4bea-b21d-9216583ef3b8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('523e6f75-e213-4ac5-9c79-10ceb266e5b9', $q$gitdailies$q$, $q$GitDailies$q$, $q$https://gitdailies.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '523e6f75-e213-4ac5-9c79-10ceb266e5b9', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '523e6f75-e213-4ac5-9c79-10ceb266e5b9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('89606cf4-8ec7-42aa-86eb-9db038c9c76a', $q$gitgud$q$, $q$GitGud$q$, $q$https://gitgud.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '89606cf4-8ec7-42aa-86eb-9db038c9c76a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89606cf4-8ec7-42aa-86eb-9db038c9c76a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be080091-a0ce-4353-8e8c-77899fab2576', $q$gitolite$q$, $q$Gitolite$q$, $q$https://gitolite.com/gitolite/index.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be080091-a0ce-4353-8e8c-77899fab2576', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be080091-a0ce-4353-8e8c-77899fab2576')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9465ac59-0cea-41b2-bfe3-bedc31ab12d0', $q$givecampus$q$, $q$Givecampus$q$, $q$https://www.givecampus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9465ac59-0cea-41b2-bfe3-bedc31ab12d0', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9465ac59-0cea-41b2-bfe3-bedc31ab12d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('42f4ce98-ecbc-4ccd-a6f1-f0f4060abd3d', $q$glauca$q$, $q$Glauca$q$, $q$https://docs.glauca.digital/hexdns/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '42f4ce98-ecbc-4ccd-a6f1-f0f4060abd3d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42f4ce98-ecbc-4ccd-a6f1-f0f4060abd3d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('39e85b48-84a6-4fdb-bb03-c9ad3fde15bb', $q$gnu-linux-libre$q$, $q$GNU Linux-libre$q$, $q$https://www.fsfla.org/ikiwiki/selibre/linux-libre/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '39e85b48-84a6-4fdb-bb03-c9ad3fde15bb', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39e85b48-84a6-4fdb-bb03-c9ad3fde15bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2b471ee-f442-43c6-856e-354109ecb664', $q$gracenote$q$, $q$Gracenote$q$, $q$https://gracenote.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2b471ee-f442-43c6-856e-354109ecb664', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2b471ee-f442-43c6-856e-354109ecb664')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7f32f656-eb9a-4684-aa42-c9c70e84e91e', $q$groove-labs$q$, $q$Groove Labs$q$, $q$https://www.groove.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7f32f656-eb9a-4684-aa42-c9c70e84e91e', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f32f656-eb9a-4684-aa42-c9c70e84e91e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d0a0c2b-cb3d-4471-851e-ac0b79c8926c', $q$hammerhead$q$, $q$Hammerhead$q$, $q$https://www.hammerhead.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d0a0c2b-cb3d-4471-851e-ac0b79c8926c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d0a0c2b-cb3d-4471-851e-ac0b79c8926c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ffbc311b-0b5e-47c0-aff5-943f7db83955', $q$harmonic$q$, $q$Harmonic$q$, $q$https://harmonicinc.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ffbc311b-0b5e-47c0-aff5-943f7db83955', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffbc311b-0b5e-47c0-aff5-943f7db83955')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7dbcb5df-4985-4b30-b861-38521c853df9', $q$helploom$q$, $q$Helploom$q$, $q$https://helploom.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7dbcb5df-4985-4b30-b861-38521c853df9', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7dbcb5df-4985-4b30-b861-38521c853df9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4b920846-827c-46e3-8009-018ebad846f0', $q$helpshift$q$, $q$Helpshift$q$, $q$https://www.helpshift.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4b920846-827c-46e3-8009-018ebad846f0', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b920846-827c-46e3-8009-018ebad846f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6260ed60-9d41-4760-b5d0-7ad4e2c5f4cd', $q$herotofu-com$q$, $q$HeroTofu.com$q$, $q$https://herotofu.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6260ed60-9d41-4760-b5d0-7ad4e2c5f4cd', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6260ed60-9d41-4760-b5d0-7ad4e2c5f4cd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6f253388-38f0-46a9-bdb6-d3b039db962e', $q$hiri$q$, $q$Hiri$q$, $q$https://www.hiri.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6f253388-38f0-46a9-bdb6-d3b039db962e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f253388-38f0-46a9-bdb6-d3b039db962e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2e86a4b1-9b01-495f-8518-e2eb434bc4ab', $q$hook-relay$q$, $q$Hook Relay$q$, $q$https://www.hookrelay.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2e86a4b1-9b01-495f-8518-e2eb434bc4ab', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2e86a4b1-9b01-495f-8518-e2eb434bc4ab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6eb9c111-ec52-4753-916f-d823696cdba4', $q$hosting-checker$q$, $q$Hosting Checker$q$, $q$https://hostingchecker.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6eb9c111-ec52-4753-916f-d823696cdba4', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6eb9c111-ec52-4753-916f-d823696cdba4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cffeed4e-fac8-4a42-ac71-2582c9b36da0', $q$ign-entertainment$q$, $q$IGN Entertainment$q$, $q$https://corp.ign.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cffeed4e-fac8-4a42-ac71-2582c9b36da0', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cffeed4e-fac8-4a42-ac71-2582c9b36da0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a24233c-c8fd-4aab-8b99-13b4f0393fc5', $q$ihear-medical$q$, $q$iHear Medical$q$, $q$https://ihearmedical.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a24233c-c8fd-4aab-8b99-13b4f0393fc5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a24233c-c8fd-4aab-8b99-13b4f0393fc5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95a4fdf2-9a2a-4dfc-a8ee-761f3e1388cf', $q$ilograph$q$, $q$Ilograph$q$, $q$https://www.ilograph.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95a4fdf2-9a2a-4dfc-a8ee-761f3e1388cf', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95a4fdf2-9a2a-4dfc-a8ee-761f3e1388cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4d957567-cea1-48ff-969a-37579afaadfe', $q$imageengine$q$, $q$ImageEngine$q$, $q$https://imageengine.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4d957567-cea1-48ff-969a-37579afaadfe', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d957567-cea1-48ff-969a-37579afaadfe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b8885c0-bcfc-4982-a503-e3926380f329', $q$imgbb$q$, $q$ImgBB$q$, $q$https://imgbb.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b8885c0-bcfc-4982-a503-e3926380f329', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b8885c0-bcfc-4982-a503-e3926380f329')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2d2d142-a34e-42d9-bc84-9efa7d725aa3', $q$imitate-email$q$, $q$Imitate Email$q$, $q$https://imitate.email$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2d2d142-a34e-42d9-bc84-9efa7d725aa3', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2d2d142-a34e-42d9-bc84-9efa7d725aa3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8596fe7d-46fb-497e-8cf8-d08529171769', $q$improvmx$q$, $q$ImprovMX$q$, $q$https://improvmx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8596fe7d-46fb-497e-8cf8-d08529171769', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8596fe7d-46fb-497e-8cf8-d08529171769')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('97f6f0e1-f62f-44fd-af60-a7a687510e60', $q$inboxes-app$q$, $q$Inboxes App$q$, $q$https://inboxesapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '97f6f0e1-f62f-44fd-af60-a7a687510e60', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97f6f0e1-f62f-44fd-af60-a7a687510e60')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4d4f9e37-9266-4952-8e6f-b4cf89361083', $q$inboxkitten-com$q$, $q$inboxkitten.com$q$, $q$https://inboxkitten.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4d4f9e37-9266-4952-8e6f-b4cf89361083', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d4f9e37-9266-4952-8e6f-b4cf89361083')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('34874041-c887-4849-a7a8-bc93901d35c9', $q$indinero$q$, $q$inDinero$q$, $q$https://www.indinero.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '34874041-c887-4849-a7a8-bc93901d35c9', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34874041-c887-4849-a7a8-bc93901d35c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('56138f47-1bf6-4393-8241-6028dc03a4a1', $q$infogain$q$, $q$Infogain$q$, $q$https://infogain.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '56138f47-1bf6-4393-8241-6028dc03a4a1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56138f47-1bf6-4393-8241-6028dc03a4a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d8e0dae6-a713-49ed-9161-06f05303b0cc', $q$informatica$q$, $q$Informatica$q$, $q$https://informatica.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd8e0dae6-a713-49ed-9161-06f05303b0cc', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd8e0dae6-a713-49ed-9161-06f05303b0cc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b643ff9-1613-49ba-81da-42d3c0a8e55e', $q$installonair$q$, $q$InstallOnAir$q$, $q$https://www.installonair.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b643ff9-1613-49ba-81da-42d3c0a8e55e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b643ff9-1613-49ba-81da-42d3c0a8e55e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d64fe53c-4182-484b-b5f1-a8884534e5c8', $q$intodns-ai$q$, $q$IntoDNS.ai$q$, $q$https://intodns.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd64fe53c-4182-484b-b5f1-a8884534e5c8', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd64fe53c-4182-484b-b5f1-a8884534e5c8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb7f02b3-52ca-4b1e-b1c6-cf75cab7b4dc', $q$intuit$q$, $q$Intuit$q$, $q$https://www.intuit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb7f02b3-52ca-4b1e-b1c6-cf75cab7b4dc', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb7f02b3-52ca-4b1e-b1c6-cf75cab7b4dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d623fb8-4583-496b-b8af-272bcab83f47', $q$invantive-cloud$q$, $q$Invantive Cloud$q$, $q$https://cloud.invantive.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d623fb8-4583-496b-b8af-272bcab83f47', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d623fb8-4583-496b-b8af-272bcab83f47')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('03407fe6-e8c7-4014-b909-e9dabcfe7dbf', $q$invoice2go$q$, $q$Invoice2go$q$, $q$https://2go.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '03407fe6-e8c7-4014-b909-e9dabcfe7dbf', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03407fe6-e8c7-4014-b909-e9dabcfe7dbf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4402e30b-a7ee-4489-b0b1-62434f0a48ec', $q$ip2location-io$q$, $q$IP2Location.io$q$, $q$https://www.ip2location.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4402e30b-a7ee-4489-b0b1-62434f0a48ec', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4402e30b-a7ee-4489-b0b1-62434f0a48ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7bed9eb2-c5c2-4de7-a1f0-1ddaf9a20e0e', $q$ipinfo$q$, $q$IPinfo$q$, $q$https://ipinfo.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7bed9eb2-c5c2-4de7-a1f0-1ddaf9a20e0e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bed9eb2-c5c2-4de7-a1f0-1ddaf9a20e0e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dcd2009b-4112-42f9-99e8-f401d1a50490', $q$isroot-in$q$, $q$isroot.in$q$, $q$https://isroot.in$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dcd2009b-4112-42f9-99e8-f401d1a50490', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dcd2009b-4112-42f9-99e8-f401d1a50490')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8b4f1e8-9fb7-4311-8965-a78545cc231d', $q$jetfuel$q$, $q$JetFuel$q$, $q$https://jetfuel.it$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8b4f1e8-9fb7-4311-8965-a78545cc231d', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8b4f1e8-9fb7-4311-8965-a78545cc231d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('32c917f4-ccc3-4004-bf23-4fbee4f248f3', $q$jsdelivr-com$q$, $q$jsdelivr.com$q$, $q$https://www.jsdelivr.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '32c917f4-ccc3-4004-bf23-4fbee4f248f3', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32c917f4-ccc3-4004-bf23-4fbee4f248f3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('722f73db-8eb2-4960-9fa6-c042a569a09c', $q$json2video$q$, $q$JSON2Video$q$, $q$https://json2video.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '722f73db-8eb2-4960-9fa6-c042a569a09c', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '722f73db-8eb2-4960-9fa6-c042a569a09c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8fff5034-7c16-4861-94b7-304c6aa56768', $q$jsonplaceholder$q$, $q$JSONPlaceholder$q$, $q$https://jsonplaceholder.typicode.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8fff5034-7c16-4861-94b7-304c6aa56768', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8fff5034-7c16-4861-94b7-304c6aa56768')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('63a95ecf-d855-4cb0-908c-34d078e11f36', $q$jsonswiss$q$, $q$JSONSwiss$q$, $q$https://www.jsonswiss.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '63a95ecf-d855-4cb0-908c-34d078e11f36', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63a95ecf-d855-4cb0-908c-34d078e11f36')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86b80edd-988e-452f-858b-a4ab9559bc4b', $q$juniper-square$q$, $q$Juniper Square$q$, $q$https://junipersquare.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86b80edd-988e-452f-858b-a4ab9559bc4b', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86b80edd-988e-452f-858b-a4ab9559bc4b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f02d34a8-5e5d-4d22-9033-8d276c0917c5', $q$justblogged$q$, $q$JustBlogged$q$, $q$https://justblogged.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f02d34a8-5e5d-4d22-9033-8d276c0917c5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f02d34a8-5e5d-4d22-9033-8d276c0917c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5ff0556a-65b7-445f-ad89-e71af4f9dccf', $q$kaggle$q$, $q$Kaggle$q$, $q$https://www.kaggle.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5ff0556a-65b7-445f-ad89-e71af4f9dccf', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ff0556a-65b7-445f-ad89-e71af4f9dccf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4217e205-4f45-4914-90a2-b14eb73912cb', $q$kaimail$q$, $q$KaiMail$q$, $q$https://kaimail.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4217e205-4f45-4914-90a2-b14eb73912cb', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4217e205-4f45-4914-90a2-b14eb73912cb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a534038d-c464-4365-9697-4c1f3f0addd5', $q$kaiser-permanente$q$, $q$Kaiser Permanente$q$, $q$https://kaiserpermanente.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a534038d-c464-4365-9697-4c1f3f0addd5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a534038d-c464-4365-9697-4c1f3f0addd5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d7598de0-801d-4638-b80f-bffa88c6ef52', $q$karbon-sites$q$, $q$Karbon Sites$q$, $q$https://www.karbonsites.space$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd7598de0-801d-4638-b80f-bffa88c6ef52', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7598de0-801d-4638-b80f-bffa88c6ef52')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e9036d38-f937-470e-a0f2-39d7f3f5871e', $q$keywords-ai$q$, $q$Keywords AI$q$, $q$https://keywordsai.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e9036d38-f937-470e-a0f2-39d7f3f5871e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9036d38-f937-470e-a0f2-39d7f3f5871e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4b3826d8-2419-4167-b2c1-6a37960d0525', $q$kiip$q$, $q$Kiip$q$, $q$https://www.kiip.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4b3826d8-2419-4167-b2c1-6a37960d0525', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b3826d8-2419-4167-b2c1-6a37960d0525')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c8e7388-425f-47d7-8978-4f44f097978e', $q$killbait-api$q$, $q$KillBait API$q$, $q$https://killbait.com/api/doc$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c8e7388-425f-47d7-8978-4f44f097978e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c8e7388-425f-47d7-8978-4f44f097978e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('71ad3688-d025-4847-a555-c004e39e883c', $q$klarity-law$q$, $q$Klarity Law$q$, $q$https://tryklarity.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '71ad3688-d025-4847-a555-c004e39e883c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71ad3688-d025-4847-a555-c004e39e883c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('68dd03cf-37b9-4822-bcd8-152601cf73db', $q$knocket$q$, $q$Knocket$q$, $q$https://trtc.io/solutions/knocket$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '68dd03cf-37b9-4822-bcd8-152601cf73db', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68dd03cf-37b9-4822-bcd8-152601cf73db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c0db1af8-8a72-49f6-a538-f32bc777cb64', $q$kumu-io$q$, $q$Kumu.io$q$, $q$https://kumu.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c0db1af8-8a72-49f6-a538-f32bc777cb64', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0db1af8-8a72-49f6-a538-f32bc777cb64')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b5fec0ea-2d2e-4276-a1b0-05aebf89e502', $q$langtrace$q$, $q$Langtrace$q$, $q$https://langtrace.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b5fec0ea-2d2e-4276-a1b0-05aebf89e502', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5fec0ea-2d2e-4276-a1b0-05aebf89e502')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a6204437-35a6-4c74-b860-a2cae6787ca5', $q$langwatch$q$, $q$LangWatch$q$, $q$https://langwatch.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a6204437-35a6-4c74-b860-a2cae6787ca5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6204437-35a6-4c74-b860-a2cae6787ca5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('52d48ed1-43c3-4d7e-a906-c74110727e67', $q$lastest$q$, $q$Lastest$q$, $q$https://lastest.cloud$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '52d48ed1-43c3-4d7e-a906-c74110727e67', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52d48ed1-43c3-4d7e-a906-c74110727e67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('39828cca-94f5-457d-821f-cd52cc808184', $q$latitude$q$, $q$Latitude$q$, $q$https://latitude.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '39828cca-94f5-457d-821f-cd52cc808184', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39828cca-94f5-457d-821f-cd52cc808184')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('993b6143-aade-4365-a768-e020350d9bb2', $q$leadspace$q$, $q$Leadspace$q$, $q$https://leadspace.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '993b6143-aade-4365-a768-e020350d9bb2', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '993b6143-aade-4365-a768-e020350d9bb2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95c592c7-addd-41fe-b059-b3c7774ecc76', $q$leapyear$q$, $q$LeapYear$q$, $q$https://leapyear.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95c592c7-addd-41fe-b059-b3c7774ecc76', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95c592c7-addd-41fe-b059-b3c7774ecc76')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd880f55-8807-4baa-8c1d-e58fafc36505', $q$leiga-com$q$, $q$leiga.com$q$, $q$https://www.leiga.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd880f55-8807-4baa-8c1d-e58fafc36505', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd880f55-8807-4baa-8c1d-e58fafc36505')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('943f1727-28a5-42e3-8a35-bb7c62d460d0', $q$lil-bots$q$, $q$lil'bots$q$, $q$https://www.lilbots.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '943f1727-28a5-42e3-8a35-bb7c62d460d0', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '943f1727-28a5-42e3-8a35-bb7c62d460d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3d39d4bd-55a5-495b-91b6-64313061973b', $q$lingo-dev$q$, $q$Lingo.dev$q$, $q$https://lingo.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3d39d4bd-55a5-495b-91b6-64313061973b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d39d4bd-55a5-495b-91b6-64313061973b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de5a8c98-5744-4827-886f-a031ae2fa296', $q$linqia$q$, $q$Linqia$q$, $q$https://www.linqia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de5a8c98-5744-4827-886f-a031ae2fa296', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de5a8c98-5744-4827-886f-a031ae2fa296')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8415021f-63a4-4462-bb16-a265e7ec2ede', $q$liveramp$q$, $q$LiveRamp$q$, $q$https://liveramp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8415021f-63a4-4462-bb16-a265e7ec2ede', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8415021f-63a4-4462-bb16-a265e7ec2ede')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6e88bc91-596e-4e44-b4e6-7fa043735258', $q$lm-studio$q$, $q$LM Studio$q$, $q$https://lmstudio.ai/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6e88bc91-596e-4e44-b4e6-7fa043735258', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e88bc91-596e-4e44-b4e6-7fa043735258')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1113adad-38e9-4c13-883f-4814aa550b8d', $q$loansnap$q$, $q$LoanSnap$q$, $q$https://goloansnap.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1113adad-38e9-4c13-883f-4814aa550b8d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1113adad-38e9-4c13-883f-4814aa550b8d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1acd0745-a4cd-40de-80b7-029a90e987ae', $q$localcert$q$, $q$LocalCert$q$, $q$https://localcert.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1acd0745-a4cd-40de-80b7-029a90e987ae', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1acd0745-a4cd-40de-80b7-029a90e987ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1040f6e0-aef4-4709-9e0a-4940e079d836', $q$localit$q$, $q$Localit$q$, $q$https://localit.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1040f6e0-aef4-4709-9e0a-4940e079d836', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1040f6e0-aef4-4709-9e0a-4940e079d836')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('950a7e5b-d15c-4de8-81d4-08f535b52a9e', $q$locuslabs$q$, $q$LocusLabs$q$, $q$https://locuslabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '950a7e5b-d15c-4de8-81d4-08f535b52a9e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '950a7e5b-d15c-4de8-81d4-08f535b52a9e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0998731b-1909-49b1-a4e8-2abf49e4b34c', $q$logzab-com$q$, $q$logzab.com$q$, $q$https://logzab.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0998731b-1909-49b1-a4e8-2abf49e4b34c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0998731b-1909-49b1-a4e8-2abf49e4b34c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('515cd376-bab6-4591-9e9f-2d93f3edab8b', $q$luadns-com$q$, $q$luadns.com$q$, $q$https://www.luadns.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '515cd376-bab6-4591-9e9f-2d93f3edab8b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '515cd376-bab6-4591-9e9f-2d93f3edab8b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a3fee94d-51d3-447e-a7a4-25714f5c6e55', $q$lumenfall-ai$q$, $q$Lumenfall.ai$q$, $q$https://lumenfall.ai/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a3fee94d-51d3-447e-a7a4-25714f5c6e55', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a3fee94d-51d3-447e-a7a4-25714f5c6e55')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2bcf8d4b-c610-4df9-abbc-7047385f6e3a', $q$mail-tester-com$q$, $q$mail-tester.com$q$, $q$https://www.mail-tester.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2bcf8d4b-c610-4df9-abbc-7047385f6e3a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2bcf8d4b-c610-4df9-abbc-7047385f6e3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1dadcef4-9c39-4d27-ac5d-27e9300be635', $q$mailcatcher-me$q$, $q$mailcatcher.me$q$, $q$https://mailcatcher.me/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1dadcef4-9c39-4d27-ac5d-27e9300be635', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1dadcef4-9c39-4d27-ac5d-27e9300be635')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ef5b0768-6c73-4e73-a470-b37807727cc0', $q$mailchannels-com$q$, $q$mailchannels.com$q$, $q$https://www.mailchannels.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ef5b0768-6c73-4e73-a470-b37807727cc0', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef5b0768-6c73-4e73-a470-b37807727cc0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('277947e0-2c92-4b67-bdfe-1bedebfcd9c5', $q$mailcheck-ai$q$, $q$Mailcheck.ai$q$, $q$https://www.mailcheck.ai/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '277947e0-2c92-4b67-bdfe-1bedebfcd9c5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '277947e0-2c92-4b67-bdfe-1bedebfcd9c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b4a80d9-84ec-468d-934a-726c427d5ac5', $q$maildroppa$q$, $q$Maildroppa$q$, $q$https://maildroppa.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b4a80d9-84ec-468d-934a-726c427d5ac5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b4a80d9-84ec-468d-934a-726c427d5ac5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8f6b6b00-3caa-4a59-8b9a-2071575c83cd', $q$maileroo$q$, $q$Maileroo$q$, $q$https://maileroo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8f6b6b00-3caa-4a59-8b9a-2071575c83cd', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f6b6b00-3caa-4a59-8b9a-2071575c83cd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c0593066-13cf-405e-b2d0-0dc863be04e0', $q$mailersend-com$q$, $q$MailerSend.com$q$, $q$https://www.mailersend.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c0593066-13cf-405e-b2d0-0dc863be04e0', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0593066-13cf-405e-b2d0-0dc863be04e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c039753b-cbb8-4c1e-888a-aea38aaf5a76', $q$mailinator-com$q$, $q$mailinator.com$q$, $q$https://www.mailinator.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c039753b-cbb8-4c1e-888a-aea38aaf5a76', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c039753b-cbb8-4c1e-888a-aea38aaf5a76')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3f35b5b1-2870-47b5-b91c-79b3af0c1ee2', $q$mailsac-com$q$, $q$mailsac.com$q$, $q$https://mailsac.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3f35b5b1-2870-47b5-b91c-79b3af0c1ee2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f35b5b1-2870-47b5-b91c-79b3af0c1ee2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('828ef5da-45c4-4d21-8214-61a09c4ab9c4', $q$mailtrap-io$q$, $q$Mailtrap.io$q$, $q$https://mailtrap.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '828ef5da-45c4-4d21-8214-61a09c4ab9c4', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '828ef5da-45c4-4d21-8214-61a09c4ab9c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d4d4bb2-81b4-4721-83f2-ea8e32eb03f3', $q$manifold$q$, $q$Manifold$q$, $q$https://manifold.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d4d4bb2-81b4-4721-83f2-ea8e32eb03f3', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d4d4bb2-81b4-4721-83f2-ea8e32eb03f3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fbe544fd-1842-4404-904c-25dd310bb335', $q$mantledb$q$, $q$MantleDB$q$, $q$https://mantledb.sh$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fbe544fd-1842-4404-904c-25dd310bb335', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbe544fd-1842-4404-904c-25dd310bb335')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('145527fc-51b2-40e6-bf69-4e88510fe188', $q$manubes$q$, $q$manubes$q$, $q$https://www.manubes.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '145527fc-51b2-40e6-bf69-4e88510fe188', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '145527fc-51b2-40e6-bf69-4e88510fe188')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ecaee100-be65-4bac-a384-6b4131606dbf', $q$mapr-technologies$q$, $q$MapR Technologies$q$, $q$https://mapr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ecaee100-be65-4bac-a384-6b4131606dbf', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ecaee100-be65-4bac-a384-6b4131606dbf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a2db3295-4f66-42f9-8270-324408419608', $q$market-data-api$q$, $q$Market Data API$q$, $q$https://www.marketdata.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a2db3295-4f66-42f9-8270-324408419608', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a2db3295-4f66-42f9-8270-324408419608')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de30e6f4-f6bb-4645-8412-de02b0addbae', $q$marketo$q$, $q$Marketo$q$, $q$https://marketo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de30e6f4-f6bb-4645-8412-de02b0addbae', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de30e6f4-f6bb-4645-8412-de02b0addbae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('89eb5c97-46bd-4973-bf9d-67b0bf4f567a', $q$marscode$q$, $q$MarsCode$q$, $q$https://www.marscode.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '89eb5c97-46bd-4973-bf9d-67b0bf4f567a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89eb5c97-46bd-4973-bf9d-67b0bf4f567a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e45dedc9-239f-4130-bc7c-5188da72b1a5', $q$maxim-ai$q$, $q$Maxim AI$q$, $q$https://getmaxim.ai/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e45dedc9-239f-4130-bc7c-5188da72b1a5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e45dedc9-239f-4130-bc7c-5188da72b1a5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99bea50f-c004-4f8a-a9b0-c63d81d3f603', $q$mconverter$q$, $q$MConverter$q$, $q$https://mconverter.eu/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99bea50f-c004-4f8a-a9b0-c63d81d3f603', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99bea50f-c004-4f8a-a9b0-c63d81d3f603')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f5d6b17-0e95-47ff-8d48-180e79853964', $q$mdb-go$q$, $q$MDB GO$q$, $q$https://mdbgo.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f5d6b17-0e95-47ff-8d48-180e79853964', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f5d6b17-0e95-47ff-8d48-180e79853964')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0f136bb0-858e-4bbc-a2d9-74a4c0de346e', $q$mediaworkbench-ai$q$, $q$Mediaworkbench.ai$q$, $q$https://mediaworkbench.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0f136bb0-858e-4bbc-a2d9-74a4c0de346e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f136bb0-858e-4bbc-a2d9-74a4c0de346e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99763729-7f20-4619-b4f0-0fce16d6e136', $q$memfault-com$q$, $q$memfault.com$q$, $q$https://memfault.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99763729-7f20-4619-b4f0-0fce16d6e136', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99763729-7f20-4619-b4f0-0fce16d6e136')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5c9c0844-0b81-41dc-94d4-67bfceaf57ae', $q$mendix$q$, $q$Mendix$q$, $q$https://www.mendix.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5c9c0844-0b81-41dc-94d4-67bfceaf57ae', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c9c0844-0b81-41dc-94d4-67bfceaf57ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2637a1fd-0305-4f69-8e7f-7c431b04bcd1', $q$metashot$q$, $q$Metashot$q$, $q$https://metashot.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2637a1fd-0305-4f69-8e7f-7c431b04bcd1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2637a1fd-0305-4f69-8e7f-7c431b04bcd1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a5952c1a-878a-4ba4-9cb3-5557c11f5bb1', $q$metaswitch-networks$q$, $q$Metaswitch Networks$q$, $q$https://metaswitch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a5952c1a-878a-4ba4-9cb3-5557c11f5bb1', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5952c1a-878a-4ba4-9cb3-5557c11f5bb1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b58c81e6-4b6c-4458-88c7-faa56423bf8c', $q$metricstream$q$, $q$MetricStream$q$, $q$https://metricstream.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b58c81e6-4b6c-4458-88c7-faa56423bf8c', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b58c81e6-4b6c-4458-88c7-faa56423bf8c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed2288c7-864a-47df-8e84-763eac30ce6d', $q$mindmup-com$q$, $q$Mindmup.com$q$, $q$https://www.mindmup.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed2288c7-864a-47df-8e84-763eac30ce6d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed2288c7-864a-47df-8e84-763eac30ce6d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('25e9dfb0-cce0-4d30-9ade-5523b72b4808', $q$mockerito$q$, $q$Mockerito$q$, $q$https://mockerito.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '25e9dfb0-cce0-4d30-9ade-5523b72b4808', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25e9dfb0-cce0-4d30-9ade-5523b72b4808')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('afa4c962-c3eb-4047-9e27-deb9aeada0ae', $q$mockplus-idoc$q$, $q$Mockplus iDoc$q$, $q$https://www.mockplus.com/idoc$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'afa4c962-c3eb-4047-9e27-deb9aeada0ae', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afa4c962-c3eb-4047-9e27-deb9aeada0ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7609fa65-f246-4380-b366-0bebef9e7e5d', $q$model-n$q$, $q$Model N$q$, $q$https://modeln.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7609fa65-f246-4380-b366-0bebef9e7e5d', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7609fa65-f246-4380-b366-0bebef9e7e5d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2186766a-e051-4271-adea-a2fb17ca1b32', $q$moogsoft$q$, $q$MoogSoft$q$, $q$https://www.moogsoft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2186766a-e051-4271-adea-a2fb17ca1b32', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2186766a-e051-4271-adea-a2fb17ca1b32')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4037a6b2-b07c-442c-8a08-2afe3a8d8dd4', $q$motionloft$q$, $q$Motionloft$q$, $q$https://motionloft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4037a6b2-b07c-442c-8a08-2afe3a8d8dd4', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4037a6b2-b07c-442c-8a08-2afe3a8d8dd4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e32fa7aa-dbf7-4212-87b0-b0563893d11c', $q$mutant-mail$q$, $q$Mutant Mail$q$, $q$https://www.mutantmail.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e32fa7aa-dbf7-4212-87b0-b0563893d11c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e32fa7aa-dbf7-4212-87b0-b0563893d11c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d170ef3d-b9b0-49e2-a45b-8a843f4fd2f5', $q$namae$q$, $q$Namae$q$, $q$https://namae.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd170ef3d-b9b0-49e2-a45b-8a843f4fd2f5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd170ef3d-b9b0-49e2-a45b-8a843f4fd2f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('651ffabf-97bc-4e58-86d8-5d939de22e82', $q$newreleases-io$q$, $q$newreleases.io$q$, $q$https://newreleases.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '651ffabf-97bc-4e58-86d8-5d939de22e82', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '651ffabf-97bc-4e58-86d8-5d939de22e82')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7578399b-bb58-4555-8dc6-9182b218ce1f', $q$nile$q$, $q$Nile$q$, $q$https://www.thenile.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7578399b-bb58-4555-8dc6-9182b218ce1f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7578399b-bb58-4555-8dc6-9182b218ce1f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('add7cd84-f6dc-4f0c-8cad-77bda1357c3c', $q$noip-at$q$, $q$noip.at$q$, $q$https://noip.at/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'add7cd84-f6dc-4f0c-8cad-77bda1357c3c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'add7cd84-f6dc-4f0c-8cad-77bda1357c3c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a7d725d5-fb32-4fcf-ac8d-b7f89dff364b', $q$nordic$q$, $q$Nordic$q$, $q$https://app.memfault.com/register-nordic$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a7d725d5-fb32-4fcf-ac8d-b7f89dff364b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a7d725d5-fb32-4fcf-ac8d-b7f89dff364b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9fd87a9c-789f-4022-9f96-cd52597ed6a2', $q$noyo$q$, $q$Noyo$q$, $q$https://gonoyo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9fd87a9c-789f-4022-9f96-cd52597ed6a2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9fd87a9c-789f-4022-9f96-cd52597ed6a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('50b811dd-6b4d-4a67-998c-def3e7193b28', $q$nubo-email$q$, $q$Nubo Email$q$, $q$https://nubo.email$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '50b811dd-6b4d-4a67-998c-def3e7193b28', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50b811dd-6b4d-4a67-998c-def3e7193b28')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1fe5d6d9-9617-4d9b-a9d3-99e6bfc037c1', $q$nylas$q$, $q$Nylas$q$, $q$https://www.nylas.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1fe5d6d9-9617-4d9b-a9d3-99e6bfc037c1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1fe5d6d9-9617-4d9b-a9d3-99e6bfc037c1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('96a70036-d1ee-46f9-8683-196b6aaf479e', $q$oderful$q$, $q$Oderful$q$, $q$https://orderful.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '96a70036-d1ee-46f9-8683-196b6aaf479e', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96a70036-d1ee-46f9-8683-196b6aaf479e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('51b1d7de-c3c3-45c3-b1b2-aa7f179c2a4b', $q$onecompiler$q$, $q$OneCompiler$q$, $q$https://onecompiler.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '51b1d7de-c3c3-45c3-b1b2-aa7f179c2a4b', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '51b1d7de-c3c3-45c3-b1b2-aa7f179c2a4b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('768b68a2-3688-4f57-9fcd-907e3a041c4a', $q$onlinegdb$q$, $q$OnlineGDB$q$, $q$https://onlinegdb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '768b68a2-3688-4f57-9fcd-907e3a041c4a', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '768b68a2-3688-4f57-9fcd-907e3a041c4a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('18f86bf9-419f-4434-8400-11841d7bf11a', $q$onlineornot-com$q$, $q$OnlineOrNot.com$q$, $q$https://onlineornot.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '18f86bf9-419f-4434-8400-11841d7bf11a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18f86bf9-419f-4434-8400-11841d7bf11a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0238af0-e018-43c1-bf01-30735534434e', $q$openoffice$q$, $q$OpenOffice$q$, $q$https://www.openoffice.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0238af0-e018-43c1-bf01-30735534434e', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0238af0-e018-43c1-bf01-30735534434e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('400b1fc7-6386-4925-bb8a-1e0f0a1020e1', $q$orbisearch$q$, $q$Orbisearch$q$, $q$https://orbisearch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '400b1fc7-6386-4925-bb8a-1e0f0a1020e1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '400b1fc7-6386-4925-bb8a-1e0f0a1020e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d0d9ddb-1c47-47cb-8aa2-9a6ef5c7cfff', $q$otterwatch$q$, $q$Otterwatch$q$, $q$https://otterwatch.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d0d9ddb-1c47-47cb-8aa2-9a6ef5c7cfff', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d0d9ddb-1c47-47cb-8aa2-9a6ef5c7cfff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53d66e11-a50a-409b-96f9-f121adc5867e', $q$outreachcircle$q$, $q$OutreachCircle$q$, $q$https://outreachcircle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53d66e11-a50a-409b-96f9-f121adc5867e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53d66e11-a50a-409b-96f9-f121adc5867e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2486a93-bd8b-42bf-867c-bdef97d6470a', $q$packagecloud-io$q$, $q$packagecloud.io$q$, $q$https://packagecloud.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2486a93-bd8b-42bf-867c-bdef97d6470a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2486a93-bd8b-42bf-867c-bdef97d6470a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cba42b99-94e3-4d26-a765-4778c9922f81', $q$pagecrawl-io$q$, $q$pagecrawl.io$q$, $q$https://pagecrawl.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cba42b99-94e3-4d26-a765-4778c9922f81', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cba42b99-94e3-4d26-a765-4778c9922f81')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e8f8e71b-c44a-4180-8dca-a1cf69c50793', $q$pandastack$q$, $q$PandaStack$q$, $q$https://www.pandastack.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e8f8e71b-c44a-4180-8dca-a1cf69c50793', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8f8e71b-c44a-4180-8dca-a1cf69c50793')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11a9367b-73c5-4da1-8931-0d4177d907d4', $q$paperspace$q$, $q$paperspace$q$, $q$https://www.paperspace.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11a9367b-73c5-4da1-8931-0d4177d907d4', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11a9367b-73c5-4da1-8931-0d4177d907d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('385a4501-db8c-44a5-8680-1fc382507138', $q$parityvend$q$, $q$ParityVend$q$, $q$https://www.ambeteco.com/ParityVend/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '385a4501-db8c-44a5-8680-1fc382507138', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '385a4501-db8c-44a5-8680-1fc382507138')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b68f528b-111c-4339-bd27-b283626558c7', $q$parseur$q$, $q$Parseur$q$, $q$https://parseur.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b68f528b-111c-4339-bd27-b283626558c7', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b68f528b-111c-4339-bd27-b283626558c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('869c5602-e8aa-4c96-be74-20b8906fc31e', $q$parsio-io$q$, $q$Parsio.io$q$, $q$https://parsio.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '869c5602-e8aa-4c96-be74-20b8906fc31e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '869c5602-e8aa-4c96-be74-20b8906fc31e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e1f5d739-74e2-4675-bfc5-0d386b1d22fd', $q$percolate$q$, $q$Percolate$q$, $q$https://percolate.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e1f5d739-74e2-4675-bfc5-0d386b1d22fd', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1f5d739-74e2-4675-bfc5-0d386b1d22fd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b3dc92a-35f4-4c79-a369-3ff4ac7d06e0', $q$phase-two$q$, $q$Phase Two$q$, $q$https://phasetwo.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b3dc92a-35f4-4c79-a369-3ff4ac7d06e0', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b3dc92a-35f4-4c79-a369-3ff4ac7d06e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c9249e17-798b-489a-8ec7-8c172c96a714', $q$phone2action$q$, $q$Phone2Action$q$, $q$https://phone2action.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c9249e17-798b-489a-8ec7-8c172c96a714', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9249e17-798b-489a-8ec7-8c172c96a714')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bdd0c681-a670-48f8-bc19-3f5c4beb1a64', $q$photopea-com$q$, $q$photopea.com$q$, $q$https://www.photopea.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bdd0c681-a670-48f8-bc19-3f5c4beb1a64', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bdd0c681-a670-48f8-bc19-3f5c4beb1a64')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b9fc53cd-185f-4f57-8b76-11b8443fb75a', $q$pieces$q$, $q$Pieces$q$, $q$https://pieces.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b9fc53cd-185f-4f57-8b76-11b8443fb75a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9fc53cd-185f-4f57-8b76-11b8443fb75a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c29aeef3-d24c-4223-b6df-ee9ed586b417', $q$pingbreak-com$q$, $q$pingbreak.com$q$, $q$https://pingbreak.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c29aeef3-d24c-4223-b6df-ee9ed586b417', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c29aeef3-d24c-4223-b6df-ee9ed586b417')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54e00116-1ecb-4279-8363-1153539fd4f2', $q$pingpong-one$q$, $q$pingpong.one$q$, $q$https://pingpong.one/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54e00116-1ecb-4279-8363-1153539fd4f2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54e00116-1ecb-4279-8363-1153539fd4f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eeae9bdc-471c-44e9-ab33-0c6d7ef76a9c', $q$pingram-io$q$, $q$Pingram.io$q$, $q$https://www.pingram.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eeae9bdc-471c-44e9-ab33-0c6d7ef76a9c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eeae9bdc-471c-44e9-ab33-0c6d7ef76a9c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c87f841a-472d-43fb-a987-f87e75114293', $q$pivotal$q$, $q$Pivotal$q$, $q$https://pivotal.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c87f841a-472d-43fb-a987-f87e75114293', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c87f841a-472d-43fb-a987-f87e75114293')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b2e0f74-4972-4178-b6f3-de1f454e87fe', $q$pixlee$q$, $q$Pixlee$q$, $q$https://www.pixlee.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b2e0f74-4972-4178-b6f3-de1f454e87fe', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b2e0f74-4972-4178-b6f3-de1f454e87fe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('33666f95-eb97-4766-b3bf-7c7378494256', $q$plaid$q$, $q$Plaid$q$, $q$https://plaid.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '33666f95-eb97-4766-b3bf-7c7378494256', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33666f95-eb97-4766-b3bf-7c7378494256')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1003bf1b-4439-40ba-bf78-d4aee7519593', $q$plunk$q$, $q$Plunk$q$, $q$https://useplunk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1003bf1b-4439-40ba-bf78-d4aee7519593', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1003bf1b-4439-40ba-bf78-d4aee7519593')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('78fe8b58-2944-437f-8ac6-bb278e23f3df', $q$pocket-alert$q$, $q$Pocket Alert$q$, $q$https://pocketalert.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '78fe8b58-2944-437f-8ac6-bb278e23f3df', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78fe8b58-2944-437f-8ac6-bb278e23f3df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b8e12da-659a-4785-bb27-e7542fd39554', $q$pollinations-ai$q$, $q$Pollinations.AI$q$, $q$https://pollinations.ai/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b8e12da-659a-4785-bb27-e7542fd39554', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b8e12da-659a-4785-bb27-e7542fd39554')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7cfac37f-5931-44af-a777-8af5b90ecb76', $q$portrait-displays$q$, $q$Portrait Displays$q$, $q$https://www.portrait.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7cfac37f-5931-44af-a777-8af5b90ecb76', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cfac37f-5931-44af-a777-8af5b90ecb76')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8099b7b-126c-44be-8fd2-fcaf2513b37e', $q$postbox$q$, $q$Postbox$q$, $q$https://postbox-inc.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8099b7b-126c-44be-8fd2-fcaf2513b37e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8099b7b-126c-44be-8fd2-fcaf2513b37e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('610c232e-61d6-4802-bec1-f244d89c092d', $q$posthook$q$, $q$Posthook$q$, $q$https://posthook.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '610c232e-61d6-4802-bec1-f244d89c092d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '610c232e-61d6-4802-bec1-f244d89c092d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb143158-7c0c-4577-b5a4-ede570e97bf5', $q$pp-ua$q$, $q$pp.ua$q$, $q$https://nic.ua/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb143158-7c0c-4577-b5a4-ede570e97bf5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb143158-7c0c-4577-b5a4-ede570e97bf5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a6668fda-25f1-46e3-a0ac-85b2f43bce61', $q$prismix$q$, $q$Prismix$q$, $q$https://prismix.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a6668fda-25f1-46e3-a0ac-85b2f43bce61', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6668fda-25f1-46e3-a0ac-85b2f43bce61')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('42d674cb-cf98-4f29-b2ee-39519b4dca8a', $q$protectumus$q$, $q$Protectumus$q$, $q$https://protectumus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '42d674cb-cf98-4f29-b2ee-39519b4dca8a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42d674cb-cf98-4f29-b2ee-39519b4dca8a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('148d9a88-d90a-45ca-95d6-b48eaa435c0b', $q$proteus-digital-health$q$, $q$Proteus Digital Health$q$, $q$https://www.proteus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '148d9a88-d90a-45ca-95d6-b48eaa435c0b', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '148d9a88-d90a-45ca-95d6-b48eaa435c0b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('02ff0e2c-5ae8-49ff-8e44-7d1493777a20', $q$proto-io$q$, $q$Proto.io$q$, $q$https://www.proto.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '02ff0e2c-5ae8-49ff-8e44-7d1493777a20', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02ff0e2c-5ae8-49ff-8e44-7d1493777a20')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('57d17f08-6616-4174-b7a0-98cdf573bbc4', $q$pterocos$q$, $q$pterocos$q$, $q$https://pterocos.eu.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '57d17f08-6616-4174-b7a0-98cdf573bbc4', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57d17f08-6616-4174-b7a0-98cdf573bbc4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d8dba91-aa49-4585-85b9-68eaa26fc497', $q$public-cloud-threat-intelligence$q$, $q$Public Cloud Threat Intelligence$q$, $q$https://cloudintel.himanshuanand.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d8dba91-aa49-4585-85b9-68eaa26fc497', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d8dba91-aa49-4585-85b9-68eaa26fc497')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('371b1ff7-bc8f-47e1-9c40-3406ea48ad5b', $q$pubnub-com$q$, $q$pubnub.com$q$, $q$https://www.pubnub.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '371b1ff7-bc8f-47e1-9c40-3406ea48ad5b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '371b1ff7-bc8f-47e1-9c40-3406ea48ad5b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('366cb116-91cb-47e4-9985-f0bf1b93d268', $q$pullflow$q$, $q$Pullflow$q$, $q$https://pullflow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '366cb116-91cb-47e4-9985-f0bf1b93d268', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '366cb116-91cb-47e4-9985-f0bf1b93d268')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b38b732f-fce6-4975-8c4e-91502e24f23b', $q$pythonanywhere-com$q$, $q$pythonanywhere.com$q$, $q$https://www.pythonanywhere.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b38b732f-fce6-4975-8c4e-91502e24f23b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b38b732f-fce6-4975-8c4e-91502e24f23b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('327d47c3-f1c7-4c9a-b96e-43646f4f6bdb', $q$qase-io$q$, $q$qase.io$q$, $q$https://qase.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '327d47c3-f1c7-4c9a-b96e-43646f4f6bdb', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '327d47c3-f1c7-4c9a-b96e-43646f4f6bdb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b368f3d-7c7d-4ed2-b21c-dc76f796b92f', $q$qonversion$q$, $q$Qonversion$q$, $q$http://qonversion.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b368f3d-7c7d-4ed2-b21c-dc76f796b92f', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b368f3d-7c7d-4ed2-b21c-dc76f796b92f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c476cf3a-dff3-438d-8529-1df0754d0238', $q$quay-io$q$, $q$quay.io$q$, $q$https://quay.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c476cf3a-dff3-438d-8529-1df0754d0238', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c476cf3a-dff3-438d-8529-1df0754d0238')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('108b0f8d-7171-4aa5-9969-9ab1794127de', $q$quizlet$q$, $q$Quizlet$q$, $q$https://quizlet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '108b0f8d-7171-4aa5-9969-9ab1794127de', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '108b0f8d-7171-4aa5-9969-9ab1794127de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8706734-ceff-410b-8cc5-26b9b9dfce4f', $q$quora$q$, $q$Quora$q$, $q$https://quora.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8706734-ceff-410b-8cc5-26b9b9dfce4f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8706734-ceff-410b-8cc5-26b9b9dfce4f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc2ffb71-01fb-4a1e-bc19-fb17b027d4c7', $q$qwil$q$, $q$Qwil$q$, $q$https://qwil.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc2ffb71-01fb-4a1e-bc19-fb17b027d4c7', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc2ffb71-01fb-4a1e-bc19-fb17b027d4c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('572e6355-9329-4e89-a595-ee619a0404c5', $q$rainforest-qa$q$, $q$RainForest QA$q$, $q$https://www.rainforestqa.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '572e6355-9329-4e89-a595-ee619a0404c5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '572e6355-9329-4e89-a595-ee619a0404c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26feaf51-502a-45e0-b694-87292ab8193b', $q$red-bridge-internet$q$, $q$Red Bridge Internet$q$, $q$https://www.redbridgenet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26feaf51-502a-45e0-b694-87292ab8193b', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26feaf51-502a-45e0-b694-87292ab8193b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('40332bfe-6fcd-4fb5-9deb-e61b1fbe0217', $q$redirect-pizza$q$, $q$redirect.pizza$q$, $q$https://redirect.pizza/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '40332bfe-6fcd-4fb5-9deb-e61b1fbe0217', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40332bfe-6fcd-4fb5-9deb-e61b1fbe0217')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d212680-dbdb-4fa4-b9cf-6eb97af033c2', $q$redirection-io$q$, $q$redirection.io$q$, $q$https://redirection.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d212680-dbdb-4fa4-b9cf-6eb97af033c2', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d212680-dbdb-4fa4-b9cf-6eb97af033c2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b368ca12-b68c-44e9-aac2-66e409742f5b', $q$redirs-com$q$, $q$redirs.com$q$, $q$https://www.redirs.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b368ca12-b68c-44e9-aac2-66e409742f5b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b368ca12-b68c-44e9-aac2-66e409742f5b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8977700-1ccd-47e9-81be-a49a8e74f014', $q$remarkbox$q$, $q$Remarkbox$q$, $q$https://www.remarkbox.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8977700-1ccd-47e9-81be-a49a8e74f014', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8977700-1ccd-47e9-81be-a49a8e74f014')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a0a33c4-c828-49dd-a9ee-c00b5e40407b', $q$remsupp$q$, $q$RemSupp$q$, $q$https://remsupp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a0a33c4-c828-49dd-a9ee-c00b5e40407b', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a0a33c4-c828-49dd-a9ee-c00b5e40407b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a32a5ba6-ef39-4e17-b141-97840151e125', $q$rendi$q$, $q$Rendi$q$, $q$https://rendi.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a32a5ba6-ef39-4e17-b141-97840151e125', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a32a5ba6-ef39-4e17-b141-97840151e125')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c6be591-0d62-4a97-a8f4-1ffe8c766c70', $q$repeato$q$, $q$Repeato$q$, $q$https://repeato.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c6be591-0d62-4a97-a8f4-1ffe8c766c70', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c6be591-0d62-4a97-a8f4-1ffe8c766c70')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d176e6e-0a72-4a6f-b587-da8c342b8fac', $q$repoflow$q$, $q$RepoFlow$q$, $q$https://repoflow.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d176e6e-0a72-4a6f-b587-da8c342b8fac', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d176e6e-0a72-4a6f-b587-da8c342b8fac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('076ee3c7-ae2f-4574-b432-81b409bf0c58', $q$reportgpt$q$, $q$ReportGPT$q$, $q$https://ReportGPT.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '076ee3c7-ae2f-4574-b432-81b409bf0c58', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '076ee3c7-ae2f-4574-b432-81b409bf0c58')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d7b55187-f6ec-4abe-bfa6-1bd11f40863c', $q$reqbin$q$, $q$ReqBin$q$, $q$https://reqbin.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd7b55187-f6ec-4abe-bfa6-1bd11f40863c', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7b55187-f6ec-4abe-bfa6-1bd11f40863c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82363812-2950-4f09-ad13-b98f19374f60', $q$restdb-io$q$, $q$restdb.io$q$, $q$https://restdb.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82363812-2950-4f09-ad13-b98f19374f60', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82363812-2950-4f09-ad13-b98f19374f60')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1a12353f-df69-4cbf-8aab-dcac5b693a83', $q$revdoku$q$, $q$Revdoku$q$, $q$https://revdoku.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1a12353f-df69-4cbf-8aab-dcac5b693a83', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a12353f-df69-4cbf-8aab-dcac5b693a83')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be4cf334-96fb-4799-b32b-b84c7695d75b', $q$riffyn$q$, $q$Riffyn$q$, $q$https://riffyn.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be4cf334-96fb-4799-b32b-b84c7695d75b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be4cf334-96fb-4799-b32b-b84c7695d75b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('31b300d8-ab16-48a3-a728-fd2d45802ba0', $q$rivestack$q$, $q$Rivestack$q$, $q$https://rivestack.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '31b300d8-ab16-48a3-a728-fd2d45802ba0', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31b300d8-ab16-48a3-a728-fd2d45802ba0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('45d0634d-8699-4f28-b949-988b8f3f9ed7', $q$royaltsx$q$, $q$RoyalTSX$q$, $q$https://www.royalapps.com/ts/win/features$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '45d0634d-8699-4f28-b949-988b8f3f9ed7', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45d0634d-8699-4f28-b949-988b8f3f9ed7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('601d626a-002b-4ca2-b38e-97b5c361a4b5', $q$runcloud-io$q$, $q$runcloud.io$q$, $q$https://runcloud.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '601d626a-002b-4ca2-b38e-97b5c361a4b5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '601d626a-002b-4ca2-b38e-97b5c361a4b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('98cc5a1c-7dca-436f-aaa3-776fdb980a23', $q$runmat$q$, $q$RunMat$q$, $q$https://runmat.com/sandbox$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '98cc5a1c-7dca-436f-aaa3-776fdb980a23', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '98cc5a1c-7dca-436f-aaa3-776fdb980a23')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dd313f0c-2f05-45aa-867d-2e8b6a64b7e6', $q$rylo$q$, $q$Rylo$q$, $q$https://www.rylo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dd313f0c-2f05-45aa-867d-2e8b6a64b7e6', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd313f0c-2f05-45aa-867d-2e8b6a64b7e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('517f9af8-588b-4bba-b267-779265c90a6a', $q$saildrone$q$, $q$Saildrone$q$, $q$https://www.saildrone.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '517f9af8-588b-4bba-b267-779265c90a6a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '517f9af8-588b-4bba-b267-779265c90a6a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8d59fd2-3722-42bb-9a41-85d00e01f4c5', $q$sap$q$, $q$SAP$q$, $q$https://sap.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8d59fd2-3722-42bb-9a41-85d00e01f4c5', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8d59fd2-3722-42bb-9a41-85d00e01f4c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('875e2281-c1bb-4bd3-84a6-7569af199c47', $q$scality$q$, $q$Scality$q$, $q$https://scality.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '875e2281-c1bb-4bd3-84a6-7569af199c47', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '875e2281-c1bb-4bd3-84a6-7569af199c47')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0758127-7ab8-4f09-870c-0a95f456dbf6', $q$scalr-com$q$, $q$scalr.com$q$, $q$https://scalr.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0758127-7ab8-4f09-870c-0a95f456dbf6', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0758127-7ab8-4f09-870c-0a95f456dbf6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('81cc192a-3244-438f-81e8-a5d8f2c8cadb', $q$scraper-s-proxy$q$, $q$Scraper's Proxy$q$, $q$https://scrapersproxy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '81cc192a-3244-438f-81e8-a5d8f2c8cadb', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81cc192a-3244-438f-81e8-a5d8f2c8cadb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('caabb242-95f1-40c0-916e-54e6a6f609aa', $q$sendbridge-mail-tester$q$, $q$SendBridge Mail Tester$q$, $q$https://sendbridge.com/mail-tester$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'caabb242-95f1-40c0-916e-54e6a6f609aa', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'caabb242-95f1-40c0-916e-54e6a6f609aa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba079c86-c85a-4cbf-ae1a-c1ec99038382', $q$sendstreak$q$, $q$SendStreak$q$, $q$https://www.sendstreak.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba079c86-c85a-4cbf-ae1a-c1ec99038382', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba079c86-c85a-4cbf-ae1a-c1ec99038382')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('01975df7-8ba7-4430-ab3f-ac411d846da8', $q$seotest-me$q$, $q$seotest.me$q$, $q$https://seotest.me/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '01975df7-8ba7-4430-ab3f-ac411d846da8', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01975df7-8ba7-4430-ab3f-ac411d846da8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('10297f06-4d81-4ce7-9fe8-1ecd418a67f0', $q$serpapi$q$, $q$SerpApi$q$, $q$https://serpapi.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '10297f06-4d81-4ce7-9fe8-1ecd418a67f0', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10297f06-4d81-4ce7-9fe8-1ecd418a67f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('859c24d7-5a2b-41d1-bc3a-24a0c80059f1', $q$serveo$q$, $q$serveo$q$, $q$https://serveo.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '859c24d7-5a2b-41d1-bc3a-24a0c80059f1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '859c24d7-5a2b-41d1-bc3a-24a0c80059f1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('58fc5eb8-c8f2-471a-987e-9b1364eaaa82', $q$servervana$q$, $q$Servervana$q$, $q$https://servervana.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '58fc5eb8-c8f2-471a-987e-9b1364eaaa82', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '58fc5eb8-c8f2-471a-987e-9b1364eaaa82')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('940dc4e3-b064-4ed1-a436-69e15f64060f', $q$servicemax$q$, $q$ServiceMax$q$, $q$https://servicemax.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '940dc4e3-b064-4ed1-a436-69e15f64060f', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '940dc4e3-b064-4ed1-a436-69e15f64060f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('37b13dda-fa3b-420f-b7c5-a69b41153873', $q$sflow$q$, $q$Sflow$q$, $q$https://sflow.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '37b13dda-fa3b-420f-b7c5-a69b41153873', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37b13dda-fa3b-420f-b7c5-a69b41153873')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c444e8a9-3c1b-4803-b50f-cd94822c3c77', $q$sheetson$q$, $q$Sheetson$q$, $q$https://sheetson.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c444e8a9-3c1b-4803-b50f-cd94822c3c77', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c444e8a9-3c1b-4803-b50f-cd94822c3c77')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e895464c-eda6-45f6-be4d-9642675f006c', $q$shoppad$q$, $q$ShopPad$q$, $q$https://theshoppad.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e895464c-eda6-45f6-be4d-9642675f006c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e895464c-eda6-45f6-be4d-9642675f006c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9efb85c2-c27b-4b41-9457-10fee6f86678', $q$sikkerapi$q$, $q$SikkerAPI$q$, $q$https://sikkerapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9efb85c2-c27b-4b41-9457-10fee6f86678', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9efb85c2-c27b-4b41-9457-10fee6f86678')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('baaa239d-707f-4bc2-8d3a-0d44a805ed89', $q$sizmek$q$, $q$Sizmek$q$, $q$https://sizmek.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'baaa239d-707f-4bc2-8d3a-0d44a805ed89', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'baaa239d-707f-4bc2-8d3a-0d44a805ed89')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ce548496-d94e-4d0f-a5ad-c0737c80c881', $q$skillz$q$, $q$Skillz$q$, $q$https://skillz.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ce548496-d94e-4d0f-a5ad-c0737c80c881', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce548496-d94e-4d0f-a5ad-c0737c80c881')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f7400b93-066c-4be0-86c2-b404fbe6d59d', $q$skupos$q$, $q$Skupos$q$, $q$https://skupos.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f7400b93-066c-4be0-86c2-b404fbe6d59d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7400b93-066c-4be0-86c2-b404fbe6d59d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('68a0581c-9787-449a-8e58-99cd73bb298b', $q$skylight-io$q$, $q$skylight.io$q$, $q$https://www.skylight.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '68a0581c-9787-449a-8e58-99cd73bb298b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68a0581c-9787-449a-8e58-99cd73bb298b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c10d4ed-838e-41bc-b960-a1302cd1dcc2', $q$skypack$q$, $q$Skypack$q$, $q$https://www.skypack.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c10d4ed-838e-41bc-b960-a1302cd1dcc2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c10d4ed-838e-41bc-b960-a1302cd1dcc2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7465b5a9-4bf6-4232-9609-3ae95c18a137', $q$slashdot-media$q$, $q$Slashdot Media$q$, $q$https://slashdot.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7465b5a9-4bf6-4232-9609-3ae95c18a137', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7465b5a9-4bf6-4232-9609-3ae95c18a137')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('67ac58ed-7c99-4b2d-97d1-29edce5e049c', $q$smarking$q$, $q$Smarking$q$, $q$https://smarking.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '67ac58ed-7c99-4b2d-97d1-29edce5e049c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '67ac58ed-7c99-4b2d-97d1-29edce5e049c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed0078cd-c688-499e-a907-ff3a7c8e72fb', $q$smartforms-dev$q$, $q$smartforms.dev$q$, $q$https://smartforms.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed0078cd-c688-499e-a907-ff3a7c8e72fb', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed0078cd-c688-499e-a907-ff3a7c8e72fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2660c3b9-ef58-4b08-8348-4312c7f59b2c', $q$smartzip$q$, $q$SmartZip$q$, $q$https://smartzip.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2660c3b9-ef58-4b08-8348-4312c7f59b2c', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2660c3b9-ef58-4b08-8348-4312c7f59b2c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca91fb9e-c359-4585-b927-a983112af7a7', $q$smsgate$q$, $q$SMSGate$q$, $q$https://sms-gate.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca91fb9e-c359-4585-b927-a983112af7a7', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca91fb9e-c359-4585-b927-a983112af7a7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('16a7914e-179d-4aeb-ba94-c58d58d52469', $q$solo$q$, $q$Solo$q$, $q$https://soloist.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '16a7914e-179d-4aeb-ba94-c58d58d52469', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16a7914e-179d-4aeb-ba94-c58d58d52469')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3f27506-4265-424a-b31b-8d2768af8b36', $q$sololearn$q$, $q$SoloLearn$q$, $q$https://code.sololearn.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3f27506-4265-424a-b31b-8d2768af8b36', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3f27506-4265-424a-b31b-8d2768af8b36')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1db2f036-a8ab-4246-850e-98a3f1ba710b', $q$space-systems-loral$q$, $q$Space Systems Loral$q$, $q$https://sslmda.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1db2f036-a8ab-4246-850e-98a3f1ba710b', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1db2f036-a8ab-4246-850e-98a3f1ba710b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6a01f151-a44f-4a4b-a177-45b43b738e11', $q$squash-labs$q$, $q$Squash Labs$q$, $q$https://www.squash.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6a01f151-a44f-4a4b-a177-45b43b738e11', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a01f151-a44f-4a4b-a177-45b43b738e11')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee54830a-08ea-48d0-b1a0-725923fa2a78', $q$stackblitz-com$q$, $q$stackblitz.com$q$, $q$https://stackblitz.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee54830a-08ea-48d0-b1a0-725923fa2a78', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee54830a-08ea-48d0-b1a0-725923fa2a78')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('16a5b28a-5c7d-43c1-867c-fceb6bdb1a75', $q$staticforms-xyz$q$, $q$staticforms.xyz$q$, $q$https://www.staticforms.xyz/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '16a5b28a-5c7d-43c1-867c-fceb6bdb1a75', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16a5b28a-5c7d-43c1-867c-fceb6bdb1a75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d41a6867-2352-40c9-924f-b7863bdbb6f7', $q$stickies$q$, $q$Stickies$q$, $q$https://stickies.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd41a6867-2352-40c9-924f-b7863bdbb6f7', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd41a6867-2352-40c9-924f-b7863bdbb6f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('35d64a9a-5421-45fe-b59e-5129ac8a4872', $q$storm-ventures$q$, $q$Storm Ventures$q$, $q$https://stormventures.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '35d64a9a-5421-45fe-b59e-5129ac8a4872', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35d64a9a-5421-45fe-b59e-5129ac8a4872')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0078c140-b40f-4069-a43f-54eac906b4e1', $q$sumo-logic$q$, $q$Sumo Logic$q$, $q$https://sumologic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0078c140-b40f-4069-a43f-54eac906b4e1', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0078c140-b40f-4069-a43f-54eac906b4e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d3ac5e85-8c24-4024-b315-b796107eee40', $q$supaguard-app$q$, $q$supaguard.app$q$, $q$https://supaguard.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd3ac5e85-8c24-4024-b315-b796107eee40', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3ac5e85-8c24-4024-b315-b796107eee40')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d4cf68f-a3de-4c2c-9afe-cbc19c81cc8e', $q$superlog-sh$q$, $q$superlog.sh$q$, $q$https://superlog.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d4cf68f-a3de-4c2c-9afe-cbc19c81cc8e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d4cf68f-a3de-4c2c-9afe-cbc19c81cc8e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d63582a-758a-4b69-893f-7ba74fa274c2', $q$supermaven$q$, $q$Supermaven$q$, $q$https://www.supermaven.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d63582a-758a-4b69-893f-7ba74fa274c2', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d63582a-758a-4b69-893f-7ba74fa274c2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eceb93ec-9f3e-4f31-8b66-ac0a6dc441e9', $q$surge-sh$q$, $q$surge.sh$q$, $q$https://surge.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eceb93ec-9f3e-4f31-8b66-ac0a6dc441e9', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eceb93ec-9f3e-4f31-8b66-ac0a6dc441e9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a5d05e8c-9c0c-41e7-ba0c-9b35679eefe9', $q$sweego$q$, $q$Sweego$q$, $q$https://www.sweego.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a5d05e8c-9c0c-41e7-ba0c-9b35679eefe9', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5d05e8c-9c0c-41e7-ba0c-9b35679eefe9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d9d6652-2c69-4446-806e-36154b5adf76', $q$sweetuptime$q$, $q$SweetUptime$q$, $q$https://dicloud.net/sweetuptime-server-uptime-monitoring/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d9d6652-2c69-4446-806e-36154b5adf76', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d9d6652-2c69-4446-806e-36154b5adf76')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('abf72590-80aa-4226-b2f9-f24ae5951a97', $q$swrve$q$, $q$Swrve$q$, $q$https://swrve.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'abf72590-80aa-4226-b2f9-f24ae5951a97', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abf72590-80aa-4226-b2f9-f24ae5951a97')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bd94d00d-81c9-433f-8822-3c95b08bfa12', $q$syllable-ai$q$, $q$Syllable.ai$q$, $q$https://syllable.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bd94d00d-81c9-433f-8822-3c95b08bfa12', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd94d00d-81c9-433f-8822-3c95b08bfa12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41ea7854-1e4e-437c-8710-98aece57ac01', $q$symantec$q$, $q$Symantec$q$, $q$https://symantec.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41ea7854-1e4e-437c-8710-98aece57ac01', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41ea7854-1e4e-437c-8710-98aece57ac01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6f56340b-175e-4ec5-a034-c7b74cd4231b', $q$syncfab$q$, $q$SyncFab$q$, $q$https://syncfab.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6f56340b-175e-4ec5-a034-c7b74cd4231b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f56340b-175e-4ec5-a034-c7b74cd4231b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('35c6ce99-ee69-4168-a45c-87c3ab537447', $q$talkable$q$, $q$Talkable$q$, $q$https://www.talkable.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '35c6ce99-ee69-4168-a45c-87c3ab537447', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35c6ce99-ee69-4168-a45c-87c3ab537447')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f04996a9-fdb5-49a4-8faa-fb21e9c8f2b3', $q$talky-io$q$, $q$talky.io$q$, $q$https://talky.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f04996a9-fdb5-49a4-8faa-fb21e9c8f2b3', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f04996a9-fdb5-49a4-8faa-fb21e9c8f2b3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d499659c-fea7-4505-9dd1-bc17b5822f5f', $q$tascent$q$, $q$Tascent$q$, $q$https://tascent.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd499659c-fea7-4505-9dd1-bc17b5822f5f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd499659c-fea7-4505-9dd1-bc17b5822f5f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a8419920-0109-4155-a8ca-b65b85366551', $q$teamhood$q$, $q$Teamhood$q$, $q$https://teamhood.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a8419920-0109-4155-a8ca-b65b85366551', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8419920-0109-4155-a8ca-b65b85366551')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff2febbe-0365-409c-add7-5f19395b5b62', $q$teamplify$q$, $q$Teamplify$q$, $q$https://teamplify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff2febbe-0365-409c-add7-5f19395b5b62', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff2febbe-0365-409c-add7-5f19395b5b62')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('747e0d30-9793-468a-8555-2eb0174407d3', $q$temp-mail-io$q$, $q$temp-mail.io$q$, $q$https://temp-mail.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '747e0d30-9793-468a-8555-2eb0174407d3', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '747e0d30-9793-468a-8555-2eb0174407d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('85c94fe1-8160-40ce-81ef-8d73553f992c', $q$temp-mail-org$q$, $q$Temp-Mail.org$q$, $q$https://temp-mail.org/en/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '85c94fe1-8160-40ce-81ef-8d73553f992c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85c94fe1-8160-40ce-81ef-8d73553f992c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9be2ab8c-c868-44a9-a988-6a4d797c6f9b', $q$tempmaildetector-com$q$, $q$TempMailDetector.com$q$, $q$https://tempmaildetector.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9be2ab8c-c868-44a9-a988-6a4d797c6f9b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9be2ab8c-c868-44a9-a988-6a4d797c6f9b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e240a255-8124-45b8-8913-c348b1d7c86a', $q$tenzu$q$, $q$Tenzu$q$, $q$https://tenzu.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e240a255-8124-45b8-8913-c348b1d7c86a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e240a255-8124-45b8-8913-c348b1d7c86a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b24586a9-7f46-451e-89a0-6f5b3be30b07', $q$testtls-com$q$, $q$TestTLS.com$q$, $q$https://testtls.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b24586a9-7f46-451e-89a0-6f5b3be30b07', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b24586a9-7f46-451e-89a0-6f5b3be30b07')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('52ee37e5-73fa-44a6-b017-e86b803f457b', $q$the-hive$q$, $q$The Hive$q$, $q$https://thehive.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '52ee37e5-73fa-44a6-b017-e86b803f457b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52ee37e5-73fa-44a6-b017-e86b803f457b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed512c48-b3c1-4a68-9a5a-a8990f990c77', $q$the-realreal$q$, $q$The RealReal$q$, $q$https://www.therealreal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed512c48-b3c1-4a68-9a5a-a8990f990c77', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed512c48-b3c1-4a68-9a5a-a8990f990c77')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de5013b4-47a9-4926-a0dc-911d7ee05c36', $q$the-trade-desk$q$, $q$The Trade Desk$q$, $q$https://www.thetradedesk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de5013b4-47a9-4926-a0dc-911d7ee05c36', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de5013b4-47a9-4926-a0dc-911d7ee05c36')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('317ab008-b73a-44ff-95fd-751a3030b205', $q$thrive-global$q$, $q$Thrive Global$q$, $q$https://thriveglobal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '317ab008-b73a-44ff-95fd-751a3030b205', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '317ab008-b73a-44ff-95fd-751a3030b205')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a06ed370-b34a-423f-bdf1-bd523b5d4b72', $q$thumbnail-ws$q$, $q$thumbnail.ws$q$, $q$https://thumbnail.ws$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a06ed370-b34a-423f-bdf1-bd523b5d4b72', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a06ed370-b34a-423f-bdf1-bd523b5d4b72')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0bcc5fec-771f-4f9a-b464-f9ced0dab854', $q$tibco-software$q$, $q$TIBCO Software$q$, $q$https://tibco.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0bcc5fec-771f-4f9a-b464-f9ced0dab854', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0bcc5fec-771f-4f9a-b464-f9ced0dab854')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d74daa8-c900-4444-9382-b620613ba6df', $q$titanapps-io$q$, $q$titanapps.io$q$, $q$https://titanapps.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d74daa8-c900-4444-9382-b620613ba6df', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d74daa8-c900-4444-9382-b620613ba6df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3f92b1f8-fcbb-40d5-a6bf-123e0d84e96f', $q$tophatter$q$, $q$Tophatter$q$, $q$https://tophatter.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3f92b1f8-fcbb-40d5-a6bf-123e0d84e96f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f92b1f8-fcbb-40d5-a6bf-123e0d84e96f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('50ba5c2c-8f51-48bf-9cfe-1fcf2758cebf', $q$toranproxy-com$q$, $q$toranproxy.com$q$, $q$https://toranproxy.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '50ba5c2c-8f51-48bf-9cfe-1fcf2758cebf', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50ba5c2c-8f51-48bf-9cfe-1fcf2758cebf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65f6f8bf-619b-4a1c-ac20-3aec2fda4f87', $q$tracelog$q$, $q$TraceLog$q$, $q$https://tracelog.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65f6f8bf-619b-4a1c-ac20-3aec2fda4f87', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65f6f8bf-619b-4a1c-ac20-3aec2fda4f87')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('64705a72-4037-4989-8764-96da9f567896', $q$trackingplan$q$, $q$Trackingplan$q$, $q$https://www.trackingplan.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '64705a72-4037-4989-8764-96da9f567896', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64705a72-4037-4989-8764-96da9f567896')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d6ef33b3-15c2-47c3-8d5f-12987d6ab6c3', $q$tradeshift$q$, $q$Tradeshift$q$, $q$https://tradeshift.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd6ef33b3-15c2-47c3-8d5f-12987d6ab6c3', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6ef33b3-15c2-47c3-8d5f-12987d6ab6c3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d50fedfd-6ed4-4e28-94e2-94e1ced833f6', $q$transcript-lol$q$, $q$Transcript LOL$q$, $q$https://transcript.lol/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd50fedfd-6ed4-4e28-94e2-94e1ced833f6', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd50fedfd-6ed4-4e28-94e2-94e1ced833f6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('484662d5-4594-420c-8ae4-dd762cf283cb', $q$trashmail-com$q$, $q$trashmail.com$q$, $q$https://www.trashmail.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '484662d5-4594-420c-8ae4-dd762cf283cb', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '484662d5-4594-420c-8ae4-dd762cf283cb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3bd8d992-4cbd-486c-be25-dabcb78aefc4', $q$trophy$q$, $q$Trophy$q$, $q$https://trophy.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3bd8d992-4cbd-486c-be25-dabcb78aefc4', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bd8d992-4cbd-486c-be25-dabcb78aefc4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f137be75-03af-430c-93da-1531f23e6fb3', $q$truly$q$, $q$Truly$q$, $q$https://truly.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f137be75-03af-430c-93da-1531f23e6fb3', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f137be75-03af-430c-93da-1531f23e6fb3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d36c6bca-dd54-4c6d-8a0a-9673013d3b75', $q$udacity$q$, $q$Udacity$q$, $q$https://www.udacity.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd36c6bca-dd54-4c6d-8a0a-9673013d3b75', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd36c6bca-dd54-4c6d-8a0a-9673013d3b75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('15d78f2b-8666-412d-9e9f-5ea374441c37', $q$ui-bakery$q$, $q$UI Bakery$q$, $q$https://uibakery.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '15d78f2b-8666-412d-9e9f-5ea374441c37', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15d78f2b-8666-412d-9e9f-5ea374441c37')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8f61515a-5504-4853-b416-90c2101b4d1e', $q$unirateapi$q$, $q$UniRateAPI$q$, $q$https://unirateapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8f61515a-5504-4853-b416-90c2101b4d1e', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f61515a-5504-4853-b416-90c2101b4d1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f37ad9cc-44ea-4a83-af7b-5d96c1504661', $q$unitq$q$, $q$unitQ$q$, $q$https://unitq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f37ad9cc-44ea-4a83-af7b-5d96c1504661', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f37ad9cc-44ea-4a83-af7b-5d96c1504661')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c54b52d-a920-4f0c-b19d-a0ad335eb909', $q$updrafts-app$q$, $q$Updrafts.app$q$, $q$https://updrafts.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c54b52d-a920-4f0c-b19d-a0ad335eb909', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c54b52d-a920-4f0c-b19d-a0ad335eb909')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4caa11a1-4f61-4b83-a305-e7386ad59deb', $q$uploadcare-com$q$, $q$uploadcare.com$q$, $q$https://uploadcare.com/hub/developers/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4caa11a1-4f61-4b83-a305-e7386ad59deb', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4caa11a1-4f61-4b83-a305-e7386ad59deb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bd8cd105-56a8-4ece-8c61-78f51ee0f581', $q$uptimeobserver-com$q$, $q$UptimeObserver.com$q$, $q$https://uptimeobserver.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bd8cd105-56a8-4ece-8c61-78f51ee0f581', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd8cd105-56a8-4ece-8c61-78f51ee0f581')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ddd627e6-e1d5-488b-be7e-0bce39b10b12', $q$vaadin$q$, $q$Vaadin$q$, $q$https://vaadin.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ddd627e6-e1d5-488b-be7e-0bce39b10b12', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ddd627e6-e1d5-488b-be7e-0bce39b10b12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('becb7109-b144-4b5a-aa9c-359b3d782460', $q$vaocherapp-qr-code-generator$q$, $q$VaocherApp QR Code Generator$q$, $q$https://www.vaocherapp.com/qr-code-generator$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'becb7109-b144-4b5a-aa9c-359b3d782460', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'becb7109-b144-4b5a-aa9c-359b3d782460')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d3303e57-57a0-4971-a22f-f4858d0243ea', $q$vatlayer$q$, $q$vatlayer$q$, $q$https://vatlayer.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd3303e57-57a0-4971-a22f-f4858d0243ea', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3303e57-57a0-4971-a22f-f4858d0243ea')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a88cd01-2b0b-4b04-a3c9-5acc749d0088', $q$verifalia$q$, $q$Verifalia$q$, $q$https://verifalia.com/email-verification-api$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a88cd01-2b0b-4b04-a3c9-5acc749d0088', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a88cd01-2b0b-4b04-a3c9-5acc749d0088')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86aba49d-2864-4004-91b7-d9b56a4eb9eb', $q$verimail-io$q$, $q$verimail.io$q$, $q$https://verimail.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86aba49d-2864-4004-91b7-d9b56a4eb9eb', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86aba49d-2864-4004-91b7-d9b56a4eb9eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1bcd317a-37e8-4d87-96e5-d1a9d7750b2d', $q$versoly$q$, $q$Versoly$q$, $q$https://versoly.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1bcd317a-37e8-4d87-96e5-d1a9d7750b2d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1bcd317a-37e8-4d87-96e5-d1a9d7750b2d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2ebf022b-9d7d-43df-8f64-910499d82f65', $q$vevo$q$, $q$Vevo$q$, $q$https://www.vevo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2ebf022b-9d7d-43df-8f64-910499d82f65', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ebf022b-9d7d-43df-8f64-910499d82f65')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe380ae3-6bb8-42b3-9756-292823a0fc8f', $q$visa$q$, $q$Visa$q$, $q$https://usa.visa.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe380ae3-6bb8-42b3-9756-292823a0fc8f', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe380ae3-6bb8-42b3-9756-292823a0fc8f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d22c1b1d-15aa-4600-8be5-b3553aefcb51', $q$visual-studio-community$q$, $q$Visual Studio Community$q$, $q$https://visualstudio.microsoft.com/vs/community/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd22c1b1d-15aa-4600-8be5-b3553aefcb51', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd22c1b1d-15aa-4600-8be5-b3553aefcb51')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc08f556-cb64-4696-98f1-59077b684a1f', $q$vmail$q$, $q$Vmail$q$, $q$https://danielchoi.com/software/vmail.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc08f556-cb64-4696-98f1-59077b684a1f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc08f556-cb64-4696-98f1-59077b684a1f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1dc7403d-a9d2-4c4d-a2e1-a9010a9034b7', $q$vmware$q$, $q$VMWare$q$, $q$https://www.vmware.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1dc7403d-a9d2-4c4d-a2e1-a9010a9034b7', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1dc7403d-a9d2-4c4d-a2e1-a9010a9034b7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a1ad5ca-e058-4fee-b515-ce29ef2fa629', $q$vonnda$q$, $q$Vonnda$q$, $q$https://www.vonnda.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a1ad5ca-e058-4fee-b515-ce29ef2fa629', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a1ad5ca-e058-4fee-b515-ce29ef2fa629')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c830c55-19ef-4b4e-baf2-5c88dc9b1419', $q$vungle$q$, $q$Vungle$q$, $q$https://vungle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c830c55-19ef-4b4e-baf2-5c88dc9b1419', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c830c55-19ef-4b4e-baf2-5c88dc9b1419')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9ef2b968-dbb8-4754-a5c0-fdc5c4b4a308', $q$waitlio$q$, $q$Waitlio$q$, $q$https://waitlio.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9ef2b968-dbb8-4754-a5c0-fdc5c4b4a308', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ef2b968-dbb8-4754-a5c0-fdc5c4b4a308')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('34fe63a9-d5c6-4e5b-8ce5-1a5ce27dd30b', $q$warp$q$, $q$Warp$q$, $q$https://www.warp.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '34fe63a9-d5c6-4e5b-8ce5-1a5ce27dd30b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34fe63a9-d5c6-4e5b-8ce5-1a5ce27dd30b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('595842cb-464b-4753-9877-7bb727a45879', $q$watsi$q$, $q$Watsi$q$, $q$https://watsi.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '595842cb-464b-4753-9877-7bb727a45879', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '595842cb-464b-4753-9877-7bb727a45879')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5c6b5f1-0ab0-4591-ab25-caf5d0b0cfa7', $q$weatherxu$q$, $q$WeatherXu$q$, $q$https://weatherxu.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5c6b5f1-0ab0-4591-ab25-caf5d0b0cfa7', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5c6b5f1-0ab0-4591-ab25-caf5d0b0cfa7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('afb2ef1a-0be8-4ff7-b987-771d61087314', $q$web3forms$q$, $q$Web3Forms$q$, $q$https://web3forms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'afb2ef1a-0be8-4ff7-b987-771d61087314', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afb2ef1a-0be8-4ff7-b987-771d61087314')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dbe936f9-3611-4c78-9319-dda94c3a5d39', $q$webhookrelay-com$q$, $q$webhookrelay.com$q$, $q$https://webhookrelay.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dbe936f9-3611-4c78-9319-dda94c3a5d39', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dbe936f9-3611-4c78-9319-dda94c3a5d39')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('218a9077-4af3-4d9e-86bd-9a9cc6d77a52', $q$wellio$q$, $q$Wellio$q$, $q$https://getwellio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '218a9077-4af3-4d9e-86bd-9a9cc6d77a52', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '218a9077-4af3-4d9e-86bd-9a9cc6d77a52')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe481f4a-28b8-46df-b96c-39faf5e591f4', $q$wellpay$q$, $q$WellPay$q$, $q$https://www.wellpay.care$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe481f4a-28b8-46df-b96c-39faf5e591f4', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe481f4a-28b8-46df-b96c-39faf5e591f4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4ba8dabc-5c55-4617-a529-12bb860208e6', $q$wepay$q$, $q$WePay$q$, $q$https://go.wepay.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4ba8dabc-5c55-4617-a529-12bb860208e6', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ba8dabc-5c55-4617-a529-12bb860208e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b1c442d-438b-4390-b6fc-1a94839d1086', $q$what-the-diff$q$, $q$What The Diff$q$, $q$https://whatthediff.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b1c442d-438b-4390-b6fc-1a94839d1086', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b1c442d-438b-4390-b6fc-1a94839d1086')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e1195935-0045-4f3e-9643-a966d97879ec', $q$whatsapp$q$, $q$WhatsApp$q$, $q$https://whatsapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e1195935-0045-4f3e-9643-a966d97879ec', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1195935-0045-4f3e-9643-a966d97879ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cdc3066f-0294-40ab-a21a-66f69daf7995', $q$whitespace$q$, $q$Whitespace$q$, $q$https://whitespace.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cdc3066f-0294-40ab-a21a-66f69daf7995', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdc3066f-0294-40ab-a21a-66f69daf7995')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a8c909b-6853-4f75-a68b-f48836d4e1fc', $q$wind-river$q$, $q$Wind River$q$, $q$https://www.windriver.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a8c909b-6853-4f75-a68b-f48836d4e1fc', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a8c909b-6853-4f75-a68b-f48836d4e1fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b3a3a2f6-3f0a-47ef-807f-33fa734549b5', $q$wiser-solutions$q$, $q$Wiser Solutions$q$, $q$https://wiser.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b3a3a2f6-3f0a-47ef-807f-33fa734549b5', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3a3a2f6-3f0a-47ef-807f-33fa734549b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f4e4ab32-4937-4f32-bca7-dffad228c685', $q$wistia-com$q$, $q$wistia.com$q$, $q$https://wistia.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f4e4ab32-4937-4f32-bca7-dffad228c685', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4e4ab32-4937-4f32-bca7-dffad228c685')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c509176a-adeb-41e7-9d27-a11db9b0dca5', $q$wonderware$q$, $q$Wonderware$q$, $q$https://www.wonderware.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c509176a-adeb-41e7-9d27-a11db9b0dca5', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c509176a-adeb-41e7-9d27-a11db9b0dca5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a2d472b-7d9b-4dcd-ab4b-486279884521', $q$wormhol-org$q$, $q$wormhol.org$q$, $q$https://www.wormhol.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a2d472b-7d9b-4dcd-ab4b-486279884521', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a2d472b-7d9b-4dcd-ab4b-486279884521')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c265bd5c-1d70-45d1-a063-77cd27cfdbab', $q$wraps$q$, $q$Wraps$q$, $q$https://wraps.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c265bd5c-1d70-45d1-a063-77cd27cfdbab', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c265bd5c-1d70-45d1-a063-77cd27cfdbab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2237a5d1-a171-4ed5-84e4-dc99309b90f1', $q$xcloud-host$q$, $q$xcloud.host$q$, $q$https://xcloud.host$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2237a5d1-a171-4ed5-84e4-dc99309b90f1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2237a5d1-a171-4ed5-84e4-dc99309b90f1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e8d44c7-96b8-4675-bfb6-d05f822f14a4', $q$xftp-7$q$, $q$Xftp 7$q$, $q$https://www.netsarang.com/en/xftp/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e8d44c7-96b8-4675-bfb6-d05f822f14a4', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e8d44c7-96b8-4675-bfb6-d05f822f14a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c80549d5-a7c7-4899-b4b5-2eba5771ca88', $q$yapstone$q$, $q$Yapstone$q$, $q$https://yapstone.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c80549d5-a7c7-4899-b4b5-2eba5771ca88', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c80549d5-a7c7-4899-b4b5-2eba5771ca88')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('000e4633-fa2f-440f-bb2c-cf58719b9993', $q$zeitio$q$, $q$Zeitio$q$, $q$https://zeitio.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '000e4633-fa2f-440f-bb2c-cf58719b9993', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '000e4633-fa2f-440f-bb2c-cf58719b9993')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('84ef3718-64a5-40c5-af95-43301500ca75', $q$zenable$q$, $q$Zenable$q$, $q$https://zenable.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '84ef3718-64a5-40c5-af95-43301500ca75', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84ef3718-64a5-40c5-af95-43301500ca75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('56883d82-5818-4cd7-9c47-570defea8d8b', $q$zenscrape$q$, $q$Zenscrape$q$, $q$https://zenscrape.com/web-scraping-api$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '56883d82-5818-4cd7-9c47-570defea8d8b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56883d82-5818-4cd7-9c47-570defea8d8b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11a10180-12a4-4329-aa8c-06844cccbc31', $q$zilore-com$q$, $q$zilore.com$q$, $q$https://zilore.com/en/dns$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11a10180-12a4-4329-aa8c-06844cccbc31', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11a10180-12a4-4329-aa8c-06844cccbc31')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27e3e76b-0b41-4bf8-abd4-0c16dcdc9ac0', $q$zoneedit-com$q$, $q$zoneedit.com$q$, $q$https://www.zoneedit.com/free-dns/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27e3e76b-0b41-4bf8-abd4-0c16dcdc9ac0', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27e3e76b-0b41-4bf8-abd4-0c16dcdc9ac0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('84874bf5-8ebb-4413-b586-5955ae59b4e8', $q$zonomi$q$, $q$Zonomi$q$, $q$https://zonomi.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '84874bf5-8ebb-4413-b586-5955ae59b4e8', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84874bf5-8ebb-4413-b586-5955ae59b4e8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('89b36bbc-a7fc-403b-9819-4e16ea73a08f', $q$zube$q$, $q$Zube$q$, $q$https://zube.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '89b36bbc-a7fc-403b-9819-4e16ea73a08f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89b36bbc-a7fc-403b-9819-4e16ea73a08f')
ON CONFLICT DO NOTHING;


-- Strategic metadata — one row per list entry (new tool or matched existing).
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe668cf5-f27d-4d8d-8bd0-f09a6b46b3f6', $q$AI & Automation$q$, 1, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe668cf5-f27d-4d8d-8bd0-f09a6b46b3f6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '16ab7757-c6c6-454f-853f-f69b743e89cf', $q$Sales & CRM$q$, 2, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16ab7757-c6c6-454f-853f-f69b743e89cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd516653b-2737-45ee-86a3-367d5934432c', $q$Sales & CRM$q$, 3, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd516653b-2737-45ee-86a3-367d5934432c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2b907b62-b412-46fd-bc08-9a0edad05860', $q$Sales & CRM$q$, 4, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b907b62-b412-46fd-bc08-9a0edad05860')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ef7c4e80-e23f-469d-9adc-f5f8fee4d682', $q$AI & Automation$q$, 5, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef7c4e80-e23f-469d-9adc-f5f8fee4d682')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f8bd694d-7a01-479d-ba53-ce1d41e74460', $q$AI & Automation$q$, 6, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8bd694d-7a01-479d-ba53-ce1d41e74460')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '03c5a767-07d3-404e-bc1f-985cc68f5cc3', $q$Finance & Billing$q$, 7, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03c5a767-07d3-404e-bc1f-985cc68f5cc3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a5436b3-b815-4a00-a806-16135ddfad99', $q$Security & Identity$q$, 8, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a5436b3-b815-4a00-a806-16135ddfad99')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bda0d92d-d42a-4a92-8dc2-fe12fc9ae0b7', $q$Finance & Billing$q$, 10, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bda0d92d-d42a-4a92-8dc2-fe12fc9ae0b7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e4e497c-9116-4d93-8c45-5cda0f2031d0', $q$AI & Automation$q$, 11, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e4e497c-9116-4d93-8c45-5cda0f2031d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '737c8013-5fb0-4340-91e1-aff65a109a1e', $q$Security & Identity$q$, 13, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '737c8013-5fb0-4340-91e1-aff65a109a1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '74369188-f2a3-4b16-b206-caa1c4b0f7ef', $q$AI & Automation$q$, 14, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74369188-f2a3-4b16-b206-caa1c4b0f7ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cfd17a20-216c-4f15-a6b7-1804992894a8', $q$Finance & Billing$q$, 15, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfd17a20-216c-4f15-a6b7-1804992894a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '995aba1d-0e9c-4720-a81a-5336bfae7693', $q$AI & Automation$q$, 16, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '995aba1d-0e9c-4720-a81a-5336bfae7693')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a6da71a7-c5bc-4f58-9d3c-849d1a36fcb9', $q$AI & Automation$q$, 17, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6da71a7-c5bc-4f58-9d3c-849d1a36fcb9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54bd6f4c-5690-40bd-a7c8-4e147d121737', $q$AI & Automation$q$, 18, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54bd6f4c-5690-40bd-a7c8-4e147d121737')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8ea7ed3-3202-43a0-a7da-c27078a02de5', $q$AI & Automation$q$, 19, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8ea7ed3-3202-43a0-a7da-c27078a02de5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '882377f1-49d8-4333-92e4-61ef8fcc52bd', $q$AI & Automation$q$, 20, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '882377f1-49d8-4333-92e4-61ef8fcc52bd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6005e3a2-aaff-4619-b719-e43cb61c6339', $q$Sales & CRM$q$, 21, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6005e3a2-aaff-4619-b719-e43cb61c6339')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a29cb73-32d8-421c-825e-8bf03a71343e', $q$AI & Automation$q$, 22, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a29cb73-32d8-421c-825e-8bf03a71343e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '15e06305-a584-4637-8757-1e4f10f35e2b', $q$AI & Automation$q$, 23, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15e06305-a584-4637-8757-1e4f10f35e2b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '14378d00-9526-49d1-ac4a-c583a5ca00b3', $q$AI & Automation$q$, 24, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '14378d00-9526-49d1-ac4a-c583a5ca00b3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8d590ab6-c568-4a13-a43f-60ed4da3d4ce', $q$AI & Automation$q$, 25, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d590ab6-c568-4a13-a43f-60ed4da3d4ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e94271a-6bd3-4cfe-8c70-2045e6c59177', $q$Customer Support$q$, 26, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e94271a-6bd3-4cfe-8c70-2045e6c59177')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c71588ad-cb34-41cb-8016-8ffedebd64f2', $q$AI & Automation$q$, 27, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c71588ad-cb34-41cb-8016-8ffedebd64f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2cc7ef9b-2e27-466c-b828-19fefd1f132d', $q$AI & Automation$q$, 28, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2cc7ef9b-2e27-466c-b828-19fefd1f132d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '153bb0d9-7c3e-4e52-ad03-b3d915a1ecdf', $q$Marketing$q$, 29, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '153bb0d9-7c3e-4e52-ad03-b3d915a1ecdf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '15dd2a6d-755d-4631-9b8f-1094cc7d1a9c', $q$Customer Support$q$, 30, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15dd2a6d-755d-4631-9b8f-1094cc7d1a9c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f324abc7-5879-48b9-8424-5b257644334b', $q$Sales & CRM$q$, 31, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f324abc7-5879-48b9-8424-5b257644334b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a7e8122-3695-461f-84e4-19dc93e5180d', $q$AI & Automation$q$, 32, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a7e8122-3695-461f-84e4-19dc93e5180d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b3d4c4d0-2012-458a-bb3e-5c9e61d0a7d6', $q$Marketing$q$, 33, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3d4c4d0-2012-458a-bb3e-5c9e61d0a7d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '70325cb2-c57c-4a36-86a3-b565312186a8', $q$AI & Automation$q$, 34, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70325cb2-c57c-4a36-86a3-b565312186a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '169a687f-0ee0-451e-8913-86c003b39b9d', $q$AI & Automation$q$, 35, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '169a687f-0ee0-451e-8913-86c003b39b9d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b4a2d586-d22b-43f0-a49e-b751d41749b7', $q$AI & Automation$q$, 36, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4a2d586-d22b-43f0-a49e-b751d41749b7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e2d845e0-eeb2-4870-bc2f-4dd61546e646', $q$Sales & CRM$q$, 37, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2d845e0-eeb2-4870-bc2f-4dd61546e646')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4ce9fda3-247f-4016-bcd5-32551285ec51', $q$AI & Automation$q$, 38, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ce9fda3-247f-4016-bcd5-32551285ec51')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8f541863-33e8-4350-b428-5a3b7fa112fb', $q$AI & Automation$q$, 39, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f541863-33e8-4350-b428-5a3b7fa112fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e0905064-997b-4b5b-8fd6-50fee6bee0dd', $q$AI & Automation$q$, 40, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0905064-997b-4b5b-8fd6-50fee6bee0dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6a41e74d-6972-4d0c-b2ac-9bc51b258ef6', $q$AI & Automation$q$, 41, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a41e74d-6972-4d0c-b2ac-9bc51b258ef6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9826d35d-e9bd-4d1b-ba34-0605c67a12ec', $q$AI & Automation$q$, 42, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9826d35d-e9bd-4d1b-ba34-0605c67a12ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '49404e0b-053c-468d-ab52-0a98bc3e76f9', $q$AI & Automation$q$, 43, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '49404e0b-053c-468d-ab52-0a98bc3e76f9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '572daa6a-290a-4e89-b720-0f7cbb9f2e63', $q$AI & Automation$q$, 44, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '572daa6a-290a-4e89-b720-0f7cbb9f2e63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8a42705-fa35-45d2-8498-8012a881f395', $q$Finance & Billing$q$, 45, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8a42705-fa35-45d2-8498-8012a881f395')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fc8da50c-88b4-4b76-8a75-737643d423f5', $q$AI & Automation$q$, 46, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc8da50c-88b4-4b76-8a75-737643d423f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f0737618-3545-4dd1-b3c4-a85b03b835bf', $q$AI & Automation$q$, 47, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0737618-3545-4dd1-b3c4-a85b03b835bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '44eef01c-f79a-4511-9e31-f502a7e87cd8', $q$Sales & CRM$q$, 48, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44eef01c-f79a-4511-9e31-f502a7e87cd8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '117ca2a8-f16a-4fc1-bccc-aadb5800f356', $q$AI & Automation$q$, 49, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '117ca2a8-f16a-4fc1-bccc-aadb5800f356')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4780ba32-7996-4e79-bff8-bb8b30ce99d3', $q$AI & Automation$q$, 50, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4780ba32-7996-4e79-bff8-bb8b30ce99d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e431b41f-c262-4a08-8527-8e08946e3c29', $q$Sales & CRM$q$, 51, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e431b41f-c262-4a08-8527-8e08946e3c29')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '24e9f089-ad76-4e59-9d89-b82d251bd1a3', $q$AI & Automation$q$, 52, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24e9f089-ad76-4e59-9d89-b82d251bd1a3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '505f0afe-3281-4ae6-949e-e465d2a21dd8', $q$AI & Automation$q$, 53, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '505f0afe-3281-4ae6-949e-e465d2a21dd8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5d1a94ea-0809-4563-8930-9cce7307fe96', $q$AI & Automation$q$, 54, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d1a94ea-0809-4563-8930-9cce7307fe96')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '892b9c2b-f173-4064-afce-b923fcc25209', $q$AI & Automation$q$, 55, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '892b9c2b-f173-4064-afce-b923fcc25209')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '548329f8-5592-4c5d-83d6-3776247c8b2e', $q$AI & Automation$q$, 56, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '548329f8-5592-4c5d-83d6-3776247c8b2e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'affc9d1b-36d7-4584-8295-6495146e3435', $q$AI & Automation$q$, 57, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'affc9d1b-36d7-4584-8295-6495146e3435')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f46c4b38-6951-443a-af17-7bf78dbe3b27', $q$AI & Automation$q$, 58, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f46c4b38-6951-443a-af17-7bf78dbe3b27')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '90df5fe5-078a-4b5b-9d71-b1f5c26dc331', $q$Customer Support$q$, 59, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90df5fe5-078a-4b5b-9d71-b1f5c26dc331')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '006689e6-24c7-4fff-aebf-57f53db4591e', $q$Sales & CRM$q$, 60, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '006689e6-24c7-4fff-aebf-57f53db4591e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ff837062-8532-4654-b1dc-94c79abddc79', $q$AI & Automation$q$, 61, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff837062-8532-4654-b1dc-94c79abddc79')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b49866cb-4d08-4c9b-901d-a464ada3bffc', $q$Marketing$q$, 62, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b49866cb-4d08-4c9b-901d-a464ada3bffc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '94894598-a30c-4b75-a310-5621b4bbab98', $q$AI & Automation$q$, 63, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94894598-a30c-4b75-a310-5621b4bbab98')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd1c3bb57-a99a-486b-8024-b9dcc1367a4d', $q$AI & Automation$q$, 64, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1c3bb57-a99a-486b-8024-b9dcc1367a4d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8e3a9ede-b812-4938-8daa-419a010507ee', $q$AI & Automation$q$, 65, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e3a9ede-b812-4938-8daa-419a010507ee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fd04a7a4-cff0-4b34-a27a-1888f1d00286', $q$AI & Automation$q$, 66, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd04a7a4-cff0-4b34-a27a-1888f1d00286')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '88af77ce-8715-488d-b36b-e1ce0f6b05ce', $q$Sales & CRM$q$, 67, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88af77ce-8715-488d-b36b-e1ce0f6b05ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ade70ee-d432-40f8-bbc1-4f4ace32d4e9', $q$Sales & CRM$q$, 68, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ade70ee-d432-40f8-bbc1-4f4ace32d4e9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '75e14f6f-b97e-4e52-b3db-62135190d89e', $q$AI & Automation$q$, 69, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75e14f6f-b97e-4e52-b3db-62135190d89e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '84f4c594-16fc-438c-9ffa-a201e324ee91', $q$Marketing$q$, 70, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84f4c594-16fc-438c-9ffa-a201e324ee91')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6eff125d-8cfb-41ee-99da-a5236b44da71', $q$AI & Automation$q$, 71, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6eff125d-8cfb-41ee-99da-a5236b44da71')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20bf9a2d-068d-44a2-b56c-ac1804fb0eb6', $q$Sales & CRM$q$, 72, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20bf9a2d-068d-44a2-b56c-ac1804fb0eb6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '310dfd9e-3e2a-4361-aa51-f37142ec1fda', $q$AI & Automation$q$, 73, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '310dfd9e-3e2a-4361-aa51-f37142ec1fda')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a9ade2e3-ecd4-4b91-b99c-4b4ca2532232', $q$Customer Support$q$, 74, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9ade2e3-ecd4-4b91-b99c-4b4ca2532232')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '26fea171-bae5-4fc5-9fd9-d68fbfe1f071', $q$Sales & CRM$q$, 75, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26fea171-bae5-4fc5-9fd9-d68fbfe1f071')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5684952a-089e-41e6-b2a0-907e117d482b', $q$Customer Support$q$, 76, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5684952a-089e-41e6-b2a0-907e117d482b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d53907a-b4bb-41d9-aeb5-5d05a60f59a4', $q$AI & Automation$q$, 77, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d53907a-b4bb-41d9-aeb5-5d05a60f59a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e66e7381-0f31-4d45-a264-ab2c47af72c3', $q$AI & Automation$q$, 78, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e66e7381-0f31-4d45-a264-ab2c47af72c3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dbbc30f2-c883-490b-a1c0-4209fcaac555', $q$AI & Automation$q$, 80, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dbbc30f2-c883-490b-a1c0-4209fcaac555')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ef1474b4-0228-487d-8649-9e8c13af556f', $q$AI & Automation$q$, 81, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef1474b4-0228-487d-8649-9e8c13af556f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0f5c9c9d-b59e-41b9-8170-80aed2187fc8', $q$AI & Automation$q$, 82, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f5c9c9d-b59e-41b9-8170-80aed2187fc8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ae5dbe6-de96-475d-8fa3-f54dcfab7a61', $q$AI & Automation$q$, 83, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ae5dbe6-de96-475d-8fa3-f54dcfab7a61')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '02acf2e5-4009-4310-aa4d-caf63f972e5f', $q$AI & Automation$q$, 84, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02acf2e5-4009-4310-aa4d-caf63f972e5f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7f915015-7de1-4fdb-a477-34888a09649c', $q$AI & Automation$q$, 85, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f915015-7de1-4fdb-a477-34888a09649c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a04a471-783c-4f17-abc2-93c4160543da', $q$Finance & Billing$q$, 86, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a04a471-783c-4f17-abc2-93c4160543da')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c875cabc-dc9a-4645-ac7e-9f9b8a88e2bf', $q$Customer Support$q$, 87, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c875cabc-dc9a-4645-ac7e-9f9b8a88e2bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c4490765-45f7-48dc-ab27-e987dfb6cd75', $q$AI & Automation$q$, 88, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4490765-45f7-48dc-ab27-e987dfb6cd75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '18c9fbe6-5820-4126-a95d-86d665274a7d', $q$AI & Automation$q$, 89, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18c9fbe6-5820-4126-a95d-86d665274a7d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8b68842-72f9-4433-8892-912b315328ba', $q$AI & Automation$q$, 90, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8b68842-72f9-4433-8892-912b315328ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '969fc6e1-06d8-42b9-945a-08c091e339c8', $q$AI & Automation$q$, 91, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '969fc6e1-06d8-42b9-945a-08c091e339c8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5389682a-e7f3-4c14-bf0a-6c92af78e8c5', $q$AI & Automation$q$, 92, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5389682a-e7f3-4c14-bf0a-6c92af78e8c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8b8b4c82-3192-4141-b307-e4fac936db1b', $q$AI & Automation$q$, 93, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b8b4c82-3192-4141-b307-e4fac936db1b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe1086f4-8a3a-47da-98c7-f45cde6555a4', $q$Sales & CRM$q$, 94, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe1086f4-8a3a-47da-98c7-f45cde6555a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '59a4fd91-dc21-4996-ab71-c47a2cab95ef', $q$Finance & Billing$q$, 95, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59a4fd91-dc21-4996-ab71-c47a2cab95ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd003f92f-254f-4157-a191-83c6cb343faa', $q$Marketing$q$, 96, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd003f92f-254f-4157-a191-83c6cb343faa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '075e9ba7-9d3b-4956-965d-234dc0ba0422', $q$Customer Support$q$, 97, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '075e9ba7-9d3b-4956-965d-234dc0ba0422')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e78368c5-1241-4e12-88e3-2ea4cbc61826', $q$Customer Support$q$, 98, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e78368c5-1241-4e12-88e3-2ea4cbc61826')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ff2032a2-7c89-47ac-91e1-17954079869e', $q$Finance & Billing$q$, 99, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff2032a2-7c89-47ac-91e1-17954079869e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '61188af5-1198-422b-88a6-c3d5d9272337', $q$AI & Automation$q$, 100, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61188af5-1198-422b-88a6-c3d5d9272337')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f064b584-3ba5-4055-94d3-094bbe07b335', $q$Finance & Billing$q$, 101, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f064b584-3ba5-4055-94d3-094bbe07b335')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a8e0bbd9-c267-4c9c-b77c-8dd8a821f911', $q$Customer Support$q$, 103, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8e0bbd9-c267-4c9c-b77c-8dd8a821f911')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c2f5a3f-28a5-4e7e-9f48-0e88a0c88b76', $q$AI & Automation$q$, 104, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c2f5a3f-28a5-4e7e-9f48-0e88a0c88b76')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0b45be46-c2f2-4a0d-9b1f-b521dce38970', $q$AI & Automation$q$, 105, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b45be46-c2f2-4a0d-9b1f-b521dce38970')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9dee05bc-8721-4b46-9756-fdb1aaa5556b', $q$AI & Automation$q$, 106, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9dee05bc-8721-4b46-9756-fdb1aaa5556b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a8b3b9f3-5c35-493d-b36b-15e47b1d0695', $q$Sales & CRM$q$, 107, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8b3b9f3-5c35-493d-b36b-15e47b1d0695')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9471901f-8ac1-4efa-abb6-76295096241c', $q$AI & Automation$q$, 108, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9471901f-8ac1-4efa-abb6-76295096241c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dcd0517e-63d6-460f-9ef1-f446f1a31bca', $q$AI & Automation$q$, 109, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dcd0517e-63d6-460f-9ef1-f446f1a31bca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '51e92830-5fd4-48b4-b404-c9667fbccbf1', $q$Sales & CRM$q$, 110, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '51e92830-5fd4-48b4-b404-c9667fbccbf1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8e9618ae-8e11-442d-bbb3-7bbaa72af0f4', $q$AI & Automation$q$, 111, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e9618ae-8e11-442d-bbb3-7bbaa72af0f4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '52096f12-aa04-48fe-80b2-0163c58ee352', $q$AI & Automation$q$, 112, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52096f12-aa04-48fe-80b2-0163c58ee352')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '21623183-c4ff-4385-a5ab-b31b093a7f2b', $q$AI & Automation$q$, 113, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21623183-c4ff-4385-a5ab-b31b093a7f2b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f3d3114-a36f-44ef-b68c-3ec6e985e873', $q$AI & Automation$q$, 114, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f3d3114-a36f-44ef-b68c-3ec6e985e873')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e0c93a45-2424-421b-946c-b9f0937d9e0e', $q$AI & Automation$q$, 115, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0c93a45-2424-421b-946c-b9f0937d9e0e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f095edfb-b579-41af-a437-28fb83720e7f', $q$Sales & CRM$q$, 116, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f095edfb-b579-41af-a437-28fb83720e7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e3a5de9-bac8-46a2-bb14-d9675d5f2140', $q$Customer Support$q$, 117, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e3a5de9-bac8-46a2-bb14-d9675d5f2140')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e15fd2f2-3711-49e7-a8af-53c8a7f68c55', $q$AI & Automation$q$, 118, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e15fd2f2-3711-49e7-a8af-53c8a7f68c55')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '684d8a2f-623b-4d3a-9118-06543f554a32', $q$Customer Support$q$, 119, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '684d8a2f-623b-4d3a-9118-06543f554a32')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e1ff178-90de-4d0e-9ed9-edb24340efb8', $q$AI & Automation$q$, 120, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e1ff178-90de-4d0e-9ed9-edb24340efb8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e6581948-a756-408d-9650-1a23ab0e74e6', $q$Sales & CRM$q$, 121, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e6581948-a756-408d-9650-1a23ab0e74e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13a95b3f-3391-413c-988e-51e57efbc0e6', $q$AI & Automation$q$, 122, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13a95b3f-3391-413c-988e-51e57efbc0e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20f76646-82d7-4eb6-8f85-edf736f0da7f', $q$AI & Automation$q$, 123, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20f76646-82d7-4eb6-8f85-edf736f0da7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d402331-e3f6-4dd9-9a40-520ade2df731', $q$Customer Support$q$, 124, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d402331-e3f6-4dd9-9a40-520ade2df731')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ecc1cb6e-aed1-4318-8cdc-6a0b619fe52a', $q$AI & Automation$q$, 125, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ecc1cb6e-aed1-4318-8cdc-6a0b619fe52a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '00e27e7a-e6c2-4d55-8df8-cf2fab61a968', $q$AI & Automation$q$, 126, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00e27e7a-e6c2-4d55-8df8-cf2fab61a968')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a32692a1-811c-48a7-a10a-41a42ba3f8e2', $q$Customer Support$q$, 127, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a32692a1-811c-48a7-a10a-41a42ba3f8e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b33a75a-b695-4b6c-aede-7ae2f347a7e2', $q$AI & Automation$q$, 128, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b33a75a-b695-4b6c-aede-7ae2f347a7e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cef608f6-75e0-4b90-ae84-69f7678a2dbe', $q$AI & Automation$q$, 129, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cef608f6-75e0-4b90-ae84-69f7678a2dbe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a66b238-2997-490c-89f9-86eb75d3dfe2', $q$AI & Automation$q$, 130, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a66b238-2997-490c-89f9-86eb75d3dfe2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '16e48cc2-25ad-4fd6-9df7-296762411312', $q$AI & Automation$q$, 131, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16e48cc2-25ad-4fd6-9df7-296762411312')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9764790e-5fd4-4c54-b249-c790c34e2535', $q$AI & Automation$q$, 132, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9764790e-5fd4-4c54-b249-c790c34e2535')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '27cba2b3-fe26-4501-b3ed-0741b929b79a', $q$Sales & CRM$q$, 133, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27cba2b3-fe26-4501-b3ed-0741b929b79a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '272d4a55-d9f2-4da4-a4f5-a531050981bb', $q$Customer Support$q$, 134, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '272d4a55-d9f2-4da4-a4f5-a531050981bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd3a2a6a9-f2dc-46da-8e5b-8b3ceedefce1', $q$AI & Automation$q$, 135, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3a2a6a9-f2dc-46da-8e5b-8b3ceedefce1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f8ba3b43-13b0-4439-970b-b14e7f4694d6', $q$AI & Automation$q$, 136, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8ba3b43-13b0-4439-970b-b14e7f4694d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b22f595-a122-4e13-85d2-b1f6dc9a7e4d', $q$Customer Support$q$, 137, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b22f595-a122-4e13-85d2-b1f6dc9a7e4d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8818c378-5c98-4ff4-96ac-0f59c1fc5c02', $q$AI & Automation$q$, 138, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8818c378-5c98-4ff4-96ac-0f59c1fc5c02')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7a91f66-57ea-4359-bc70-dbfd3dfd46c2', $q$AI & Automation$q$, 139, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7a91f66-57ea-4359-bc70-dbfd3dfd46c2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd07545c3-bde7-4f9d-898a-16a33f25dbe2', $q$AI & Automation$q$, 140, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd07545c3-bde7-4f9d-898a-16a33f25dbe2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd2ede3ff-5d15-4d6f-83d2-6bc7388f8f20', $q$AI & Automation$q$, 141, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2ede3ff-5d15-4d6f-83d2-6bc7388f8f20')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '04c582c3-427c-4114-b892-2467c6a685fd', $q$AI & Automation$q$, 142, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04c582c3-427c-4114-b892-2467c6a685fd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd12db00b-0cee-48c1-a703-7087346a1b7b', $q$AI & Automation$q$, 143, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd12db00b-0cee-48c1-a703-7087346a1b7b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b5869a5f-c24d-48a6-b8d1-457a4adc3140', $q$AI & Automation$q$, 144, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5869a5f-c24d-48a6-b8d1-457a4adc3140')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a415999c-e4c2-4b42-bd97-d79377b862b2', $q$AI & Automation$q$, 145, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a415999c-e4c2-4b42-bd97-d79377b862b2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e018a09f-bf92-42ac-9c5a-c014d029bf97', $q$Sales & CRM$q$, 146, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e018a09f-bf92-42ac-9c5a-c014d029bf97')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7b015024-058e-4f02-a56b-d685cdf904f6', $q$AI & Automation$q$, 147, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b015024-058e-4f02-a56b-d685cdf904f6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3786265c-48f4-4389-a33b-31819188b9f6', $q$AI & Automation$q$, 148, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3786265c-48f4-4389-a33b-31819188b9f6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e1c83d2-a152-4757-88c3-5613bfd6085f', $q$AI & Automation$q$, 149, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e1c83d2-a152-4757-88c3-5613bfd6085f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '04d14a40-7693-43cd-bff9-ebb14eaba5f5', $q$AI & Automation$q$, 150, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04d14a40-7693-43cd-bff9-ebb14eaba5f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '47a2ba20-05a6-4752-ac77-cd32528c4160', $q$AI & Automation$q$, 151, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47a2ba20-05a6-4752-ac77-cd32528c4160')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a1fd01f9-d63b-4b48-a78b-029d9e796649', $q$Finance & Billing$q$, 152, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1fd01f9-d63b-4b48-a78b-029d9e796649')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '94558841-3a5d-4856-bc5e-c106f70d0cc7', $q$Finance & Billing$q$, 153, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94558841-3a5d-4856-bc5e-c106f70d0cc7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95fcb8ee-12ea-41ca-a736-58e9b1ddd100', $q$Marketing$q$, 154, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95fcb8ee-12ea-41ca-a736-58e9b1ddd100')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5d5cafa8-8d5b-4953-8df9-5ad4bb09560d', $q$AI & Automation$q$, 155, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d5cafa8-8d5b-4953-8df9-5ad4bb09560d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c178ffb-4eb3-4684-8326-234b73a843a1', $q$AI & Automation$q$, 156, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c178ffb-4eb3-4684-8326-234b73a843a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c08a564d-2834-49a8-a4b6-2baf38a4d88e', $q$AI & Automation$q$, 157, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c08a564d-2834-49a8-a4b6-2baf38a4d88e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a78850cd-d34f-48f4-a202-98e9c790c008', $q$AI & Automation$q$, 158, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a78850cd-d34f-48f4-a202-98e9c790c008')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd41593bd-b571-47a3-affc-ff5990e2595b', $q$AI & Automation$q$, 159, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd41593bd-b571-47a3-affc-ff5990e2595b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '65c7cbb5-705e-428e-b8f6-54abc3b8d075', $q$Sales & CRM$q$, 160, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65c7cbb5-705e-428e-b8f6-54abc3b8d075')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '42439bc2-f401-44b9-9e17-b654ccf1b784', $q$AI & Automation$q$, 161, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42439bc2-f401-44b9-9e17-b654ccf1b784')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3bb1daf9-fada-42a1-b148-0b4f79d5d7b3', $q$AI & Automation$q$, 162, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bb1daf9-fada-42a1-b148-0b4f79d5d7b3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a4ac2426-2d8e-49ab-84fd-15f2a2082f74', $q$AI & Automation$q$, 163, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4ac2426-2d8e-49ab-84fd-15f2a2082f74')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b811870d-cfcf-4def-af02-dd0da54f006f', $q$AI & Automation$q$, 164, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b811870d-cfcf-4def-af02-dd0da54f006f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2b31c0e8-271c-457a-9848-b7fc35ab50a5', $q$Customer Support$q$, 165, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b31c0e8-271c-457a-9848-b7fc35ab50a5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8d9256d8-7e7e-4f23-89c6-0695cf4d9c62', $q$AI & Automation$q$, 166, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d9256d8-7e7e-4f23-89c6-0695cf4d9c62')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b3d4ca63-5918-4a37-9a2d-a4c8d7a686d5', $q$AI & Automation$q$, 167, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3d4ca63-5918-4a37-9a2d-a4c8d7a686d5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bfe3050f-c8cc-421f-921f-df16d89cc855', $q$AI & Automation$q$, 168, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfe3050f-c8cc-421f-921f-df16d89cc855')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e93afbb1-35c1-4b5c-940a-6742d27733e1', $q$AI & Automation$q$, 169, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e93afbb1-35c1-4b5c-940a-6742d27733e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ac95b883-bb9c-4f26-bb44-0309b02d008c', $q$AI & Automation$q$, 170, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac95b883-bb9c-4f26-bb44-0309b02d008c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6100f38b-83c4-4386-a10f-d6549288b5f4', $q$AI & Automation$q$, 171, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6100f38b-83c4-4386-a10f-d6549288b5f4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b07fa9b-2da9-4362-a1e6-121ede1d6dad', $q$AI & Automation$q$, 172, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b07fa9b-2da9-4362-a1e6-121ede1d6dad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a13f98a8-e43d-4287-a8f8-b6235d31f535', $q$AI & Automation$q$, 173, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a13f98a8-e43d-4287-a8f8-b6235d31f535')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '383afb3c-1f8e-4f4a-aa63-91882416de95', $q$AI & Automation$q$, 174, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '383afb3c-1f8e-4f4a-aa63-91882416de95')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28db393a-bd0b-494b-9611-8828e3df60be', $q$AI & Automation$q$, 175, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28db393a-bd0b-494b-9611-8828e3df60be')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b356105f-8414-445e-a428-251c6e5bb954', $q$AI & Automation$q$, 176, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b356105f-8414-445e-a428-251c6e5bb954')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '01686801-867e-43b4-8325-9acbfaf64a8d', $q$Customer Support$q$, 177, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01686801-867e-43b4-8325-9acbfaf64a8d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '488a4ed0-b97b-43bb-bed9-c43d351fb423', $q$AI & Automation$q$, 178, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '488a4ed0-b97b-43bb-bed9-c43d351fb423')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28a3535e-9599-4f24-9969-2e0184366757', $q$AI & Automation$q$, 179, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28a3535e-9599-4f24-9969-2e0184366757')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dac00a00-4220-4509-9c6b-1d8c250bc6ef', $q$AI & Automation$q$, 180, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dac00a00-4220-4509-9c6b-1d8c250bc6ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c507b12-8937-462f-809e-021ca3a77d1e', $q$Finance & Billing$q$, 181, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c507b12-8937-462f-809e-021ca3a77d1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '04600f92-2876-44fd-ae44-8d6c0af6a932', $q$Customer Support$q$, 182, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04600f92-2876-44fd-ae44-8d6c0af6a932')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e9684f69-56ee-41f7-afe3-aa0c8a298872', $q$AI & Automation$q$, 183, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9684f69-56ee-41f7-afe3-aa0c8a298872')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c26a6f02-d8c9-4a4c-b770-2bc48f00d555', $q$Sales & CRM$q$, 184, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c26a6f02-d8c9-4a4c-b770-2bc48f00d555')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6c4c5fab-f691-488e-9f56-4d9917930548', $q$Customer Support$q$, 185, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c4c5fab-f691-488e-9f56-4d9917930548')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8c14a4ec-45dc-4c9f-996b-f20b8c99a583', $q$AI & Automation$q$, 186, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c14a4ec-45dc-4c9f-996b-f20b8c99a583')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05cfa4e4-8bfe-4e8f-b097-70774ffa12d8', $q$AI & Automation$q$, 187, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05cfa4e4-8bfe-4e8f-b097-70774ffa12d8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c162060f-ff95-4bfd-b624-b40c737d5d97', $q$Customer Support$q$, 188, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c162060f-ff95-4bfd-b624-b40c737d5d97')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0384c0ff-12ff-47c4-b42a-777bfe687cb6', $q$AI & Automation$q$, 189, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0384c0ff-12ff-47c4-b42a-777bfe687cb6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dfa9f1c5-7a70-4927-968e-99a725650b50', $q$Marketing$q$, 190, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dfa9f1c5-7a70-4927-968e-99a725650b50')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '72695c3c-7fcb-4bea-b21d-9216583ef3b8', $q$Customer Support$q$, 191, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72695c3c-7fcb-4bea-b21d-9216583ef3b8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '523e6f75-e213-4ac5-9c79-10ceb266e5b9', $q$AI & Automation$q$, 192, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '523e6f75-e213-4ac5-9c79-10ceb266e5b9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '89606cf4-8ec7-42aa-86eb-9db038c9c76a', $q$AI & Automation$q$, 193, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89606cf4-8ec7-42aa-86eb-9db038c9c76a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be080091-a0ce-4353-8e8c-77899fab2576', $q$AI & Automation$q$, 194, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be080091-a0ce-4353-8e8c-77899fab2576')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9465ac59-0cea-41b2-bfe3-bedc31ab12d0', $q$AI & Automation$q$, 195, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9465ac59-0cea-41b2-bfe3-bedc31ab12d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '42f4ce98-ecbc-4ccd-a6f1-f0f4060abd3d', $q$AI & Automation$q$, 196, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42f4ce98-ecbc-4ccd-a6f1-f0f4060abd3d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '39e85b48-84a6-4fdb-bb03-c9ad3fde15bb', $q$AI & Automation$q$, 197, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39e85b48-84a6-4fdb-bb03-c9ad3fde15bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c2b471ee-f442-43c6-856e-354109ecb664', $q$AI & Automation$q$, 198, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2b471ee-f442-43c6-856e-354109ecb664')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7f32f656-eb9a-4684-aa42-c9c70e84e91e', $q$Sales & CRM$q$, 199, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f32f656-eb9a-4684-aa42-c9c70e84e91e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d0a0c2b-cb3d-4471-851e-ac0b79c8926c', $q$AI & Automation$q$, 200, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d0a0c2b-cb3d-4471-851e-ac0b79c8926c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ffbc311b-0b5e-47c0-aff5-943f7db83955', $q$Sales & CRM$q$, 201, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffbc311b-0b5e-47c0-aff5-943f7db83955')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7dbcb5df-4985-4b30-b861-38521c853df9', $q$Customer Support$q$, 202, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7dbcb5df-4985-4b30-b861-38521c853df9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4b920846-827c-46e3-8009-018ebad846f0', $q$AI & Automation$q$, 203, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b920846-827c-46e3-8009-018ebad846f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6260ed60-9d41-4760-b5d0-7ad4e2c5f4cd', $q$AI & Automation$q$, 204, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6260ed60-9d41-4760-b5d0-7ad4e2c5f4cd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6f253388-38f0-46a9-bdb6-d3b039db962e', $q$AI & Automation$q$, 205, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f253388-38f0-46a9-bdb6-d3b039db962e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2e86a4b1-9b01-495f-8518-e2eb434bc4ab', $q$Customer Support$q$, 206, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2e86a4b1-9b01-495f-8518-e2eb434bc4ab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6eb9c111-ec52-4753-916f-d823696cdba4', $q$AI & Automation$q$, 207, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6eb9c111-ec52-4753-916f-d823696cdba4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cffeed4e-fac8-4a42-ac71-2582c9b36da0', $q$AI & Automation$q$, 208, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cffeed4e-fac8-4a42-ac71-2582c9b36da0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a24233c-c8fd-4aab-8b99-13b4f0393fc5', $q$AI & Automation$q$, 209, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a24233c-c8fd-4aab-8b99-13b4f0393fc5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95a4fdf2-9a2a-4dfc-a8ee-761f3e1388cf', $q$AI & Automation$q$, 210, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95a4fdf2-9a2a-4dfc-a8ee-761f3e1388cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4d957567-cea1-48ff-969a-37579afaadfe', $q$AI & Automation$q$, 211, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d957567-cea1-48ff-969a-37579afaadfe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b8885c0-bcfc-4982-a503-e3926380f329', $q$AI & Automation$q$, 212, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b8885c0-bcfc-4982-a503-e3926380f329')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c2d2d142-a34e-42d9-bc84-9efa7d725aa3', $q$AI & Automation$q$, 213, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2d2d142-a34e-42d9-bc84-9efa7d725aa3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8596fe7d-46fb-497e-8cf8-d08529171769', $q$AI & Automation$q$, 214, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8596fe7d-46fb-497e-8cf8-d08529171769')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '97f6f0e1-f62f-44fd-af60-a7a687510e60', $q$AI & Automation$q$, 215, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97f6f0e1-f62f-44fd-af60-a7a687510e60')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4d4f9e37-9266-4952-8e6f-b4cf89361083', $q$AI & Automation$q$, 216, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d4f9e37-9266-4952-8e6f-b4cf89361083')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '34874041-c887-4849-a7a8-bc93901d35c9', $q$Finance & Billing$q$, 217, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34874041-c887-4849-a7a8-bc93901d35c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '56138f47-1bf6-4393-8241-6028dc03a4a1', $q$AI & Automation$q$, 218, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56138f47-1bf6-4393-8241-6028dc03a4a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd8e0dae6-a713-49ed-9161-06f05303b0cc', $q$Sales & CRM$q$, 219, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd8e0dae6-a713-49ed-9161-06f05303b0cc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b643ff9-1613-49ba-81da-42d3c0a8e55e', $q$AI & Automation$q$, 220, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b643ff9-1613-49ba-81da-42d3c0a8e55e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd64fe53c-4182-484b-b5f1-a8884534e5c8', $q$AI & Automation$q$, 221, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd64fe53c-4182-484b-b5f1-a8884534e5c8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb7f02b3-52ca-4b1e-b1c6-cf75cab7b4dc', $q$AI & Automation$q$, 222, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb7f02b3-52ca-4b1e-b1c6-cf75cab7b4dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d623fb8-4583-496b-b8af-272bcab83f47', $q$AI & Automation$q$, 223, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d623fb8-4583-496b-b8af-272bcab83f47')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '03407fe6-e8c7-4014-b909-e9dabcfe7dbf', $q$Finance & Billing$q$, 224, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03407fe6-e8c7-4014-b909-e9dabcfe7dbf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4402e30b-a7ee-4489-b0b1-62434f0a48ec', $q$AI & Automation$q$, 225, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4402e30b-a7ee-4489-b0b1-62434f0a48ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7bed9eb2-c5c2-4de7-a1f0-1ddaf9a20e0e', $q$AI & Automation$q$, 226, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bed9eb2-c5c2-4de7-a1f0-1ddaf9a20e0e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dcd2009b-4112-42f9-99e8-f401d1a50490', $q$AI & Automation$q$, 227, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dcd2009b-4112-42f9-99e8-f401d1a50490')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8b4f1e8-9fb7-4311-8965-a78545cc231d', $q$Marketing$q$, 228, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8b4f1e8-9fb7-4311-8965-a78545cc231d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '32c917f4-ccc3-4004-bf23-4fbee4f248f3', $q$Customer Support$q$, 229, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32c917f4-ccc3-4004-bf23-4fbee4f248f3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '722f73db-8eb2-4960-9fa6-c042a569a09c', $q$Marketing$q$, 230, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '722f73db-8eb2-4960-9fa6-c042a569a09c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8fff5034-7c16-4861-94b7-304c6aa56768', $q$AI & Automation$q$, 231, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8fff5034-7c16-4861-94b7-304c6aa56768')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '63a95ecf-d855-4cb0-908c-34d078e11f36', $q$AI & Automation$q$, 232, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63a95ecf-d855-4cb0-908c-34d078e11f36')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86b80edd-988e-452f-858b-a4ab9559bc4b', $q$Sales & CRM$q$, 233, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86b80edd-988e-452f-858b-a4ab9559bc4b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f02d34a8-5e5d-4d22-9033-8d276c0917c5', $q$AI & Automation$q$, 234, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f02d34a8-5e5d-4d22-9033-8d276c0917c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5ff0556a-65b7-445f-ad89-e71af4f9dccf', $q$AI & Automation$q$, 235, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ff0556a-65b7-445f-ad89-e71af4f9dccf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4217e205-4f45-4914-90a2-b14eb73912cb', $q$AI & Automation$q$, 236, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4217e205-4f45-4914-90a2-b14eb73912cb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a534038d-c464-4365-9697-4c1f3f0addd5', $q$AI & Automation$q$, 237, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a534038d-c464-4365-9697-4c1f3f0addd5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd7598de0-801d-4638-b80f-bffa88c6ef52', $q$AI & Automation$q$, 238, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7598de0-801d-4638-b80f-bffa88c6ef52')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e9036d38-f937-470e-a0f2-39d7f3f5871e', $q$AI & Automation$q$, 239, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9036d38-f937-470e-a0f2-39d7f3f5871e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4b3826d8-2419-4167-b2c1-6a37960d0525', $q$Marketing$q$, 240, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b3826d8-2419-4167-b2c1-6a37960d0525')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c8e7388-425f-47d7-8978-4f44f097978e', $q$AI & Automation$q$, 241, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c8e7388-425f-47d7-8978-4f44f097978e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '71ad3688-d025-4847-a555-c004e39e883c', $q$AI & Automation$q$, 242, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71ad3688-d025-4847-a555-c004e39e883c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '68dd03cf-37b9-4822-bcd8-152601cf73db', $q$AI & Automation$q$, 243, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68dd03cf-37b9-4822-bcd8-152601cf73db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c0db1af8-8a72-49f6-a538-f32bc777cb64', $q$AI & Automation$q$, 244, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0db1af8-8a72-49f6-a538-f32bc777cb64')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b5fec0ea-2d2e-4276-a1b0-05aebf89e502', $q$AI & Automation$q$, 245, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5fec0ea-2d2e-4276-a1b0-05aebf89e502')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a6204437-35a6-4c74-b860-a2cae6787ca5', $q$AI & Automation$q$, 246, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6204437-35a6-4c74-b860-a2cae6787ca5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '52d48ed1-43c3-4d7e-a906-c74110727e67', $q$AI & Automation$q$, 247, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52d48ed1-43c3-4d7e-a906-c74110727e67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '39828cca-94f5-457d-821f-cd52cc808184', $q$AI & Automation$q$, 248, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39828cca-94f5-457d-821f-cd52cc808184')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '993b6143-aade-4365-a768-e020350d9bb2', $q$Sales & CRM$q$, 249, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '993b6143-aade-4365-a768-e020350d9bb2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95c592c7-addd-41fe-b059-b3c7774ecc76', $q$AI & Automation$q$, 250, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95c592c7-addd-41fe-b059-b3c7774ecc76')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd880f55-8807-4baa-8c1d-e58fafc36505', $q$AI & Automation$q$, 251, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd880f55-8807-4baa-8c1d-e58fafc36505')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '943f1727-28a5-42e3-8a35-bb7c62d460d0', $q$AI & Automation$q$, 252, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '943f1727-28a5-42e3-8a35-bb7c62d460d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3d39d4bd-55a5-495b-91b6-64313061973b', $q$AI & Automation$q$, 253, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d39d4bd-55a5-495b-91b6-64313061973b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de5a8c98-5744-4827-886f-a031ae2fa296', $q$Marketing$q$, 254, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de5a8c98-5744-4827-886f-a031ae2fa296')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8415021f-63a4-4462-bb16-a265e7ec2ede', $q$Marketing$q$, 255, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8415021f-63a4-4462-bb16-a265e7ec2ede')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6e88bc91-596e-4e44-b4e6-7fa043735258', $q$AI & Automation$q$, 256, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e88bc91-596e-4e44-b4e6-7fa043735258')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1113adad-38e9-4c13-883f-4814aa550b8d', $q$AI & Automation$q$, 257, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1113adad-38e9-4c13-883f-4814aa550b8d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1acd0745-a4cd-40de-80b7-029a90e987ae', $q$AI & Automation$q$, 258, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1acd0745-a4cd-40de-80b7-029a90e987ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1040f6e0-aef4-4709-9e0a-4940e079d836', $q$AI & Automation$q$, 259, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1040f6e0-aef4-4709-9e0a-4940e079d836')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '950a7e5b-d15c-4de8-81d4-08f535b52a9e', $q$AI & Automation$q$, 260, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '950a7e5b-d15c-4de8-81d4-08f535b52a9e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0998731b-1909-49b1-a4e8-2abf49e4b34c', $q$AI & Automation$q$, 261, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0998731b-1909-49b1-a4e8-2abf49e4b34c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '515cd376-bab6-4591-9e9f-2d93f3edab8b', $q$AI & Automation$q$, 262, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '515cd376-bab6-4591-9e9f-2d93f3edab8b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a3fee94d-51d3-447e-a7a4-25714f5c6e55', $q$AI & Automation$q$, 263, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a3fee94d-51d3-447e-a7a4-25714f5c6e55')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2bcf8d4b-c610-4df9-abbc-7047385f6e3a', $q$AI & Automation$q$, 264, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2bcf8d4b-c610-4df9-abbc-7047385f6e3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1dadcef4-9c39-4d27-ac5d-27e9300be635', $q$AI & Automation$q$, 265, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1dadcef4-9c39-4d27-ac5d-27e9300be635')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ef5b0768-6c73-4e73-a470-b37807727cc0', $q$AI & Automation$q$, 266, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef5b0768-6c73-4e73-a470-b37807727cc0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '277947e0-2c92-4b67-bdfe-1bedebfcd9c5', $q$AI & Automation$q$, 267, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '277947e0-2c92-4b67-bdfe-1bedebfcd9c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b4a80d9-84ec-468d-934a-726c427d5ac5', $q$AI & Automation$q$, 268, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b4a80d9-84ec-468d-934a-726c427d5ac5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8f6b6b00-3caa-4a59-8b9a-2071575c83cd', $q$AI & Automation$q$, 269, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f6b6b00-3caa-4a59-8b9a-2071575c83cd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c0593066-13cf-405e-b2d0-0dc863be04e0', $q$AI & Automation$q$, 270, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0593066-13cf-405e-b2d0-0dc863be04e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c039753b-cbb8-4c1e-888a-aea38aaf5a76', $q$AI & Automation$q$, 271, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c039753b-cbb8-4c1e-888a-aea38aaf5a76')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3f35b5b1-2870-47b5-b91c-79b3af0c1ee2', $q$AI & Automation$q$, 272, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f35b5b1-2870-47b5-b91c-79b3af0c1ee2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '828ef5da-45c4-4d21-8214-61a09c4ab9c4', $q$AI & Automation$q$, 273, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '828ef5da-45c4-4d21-8214-61a09c4ab9c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7d4d4bb2-81b4-4721-83f2-ea8e32eb03f3', $q$AI & Automation$q$, 274, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d4d4bb2-81b4-4721-83f2-ea8e32eb03f3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fbe544fd-1842-4404-904c-25dd310bb335', $q$AI & Automation$q$, 275, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbe544fd-1842-4404-904c-25dd310bb335')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '145527fc-51b2-40e6-bf69-4e88510fe188', $q$AI & Automation$q$, 276, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '145527fc-51b2-40e6-bf69-4e88510fe188')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ecaee100-be65-4bac-a384-6b4131606dbf', $q$AI & Automation$q$, 277, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ecaee100-be65-4bac-a384-6b4131606dbf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a2db3295-4f66-42f9-8270-324408419608', $q$AI & Automation$q$, 278, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a2db3295-4f66-42f9-8270-324408419608')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de30e6f4-f6bb-4645-8412-de02b0addbae', $q$Marketing$q$, 279, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de30e6f4-f6bb-4645-8412-de02b0addbae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '89eb5c97-46bd-4973-bf9d-67b0bf4f567a', $q$AI & Automation$q$, 280, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89eb5c97-46bd-4973-bf9d-67b0bf4f567a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e45dedc9-239f-4130-bc7c-5188da72b1a5', $q$AI & Automation$q$, 281, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e45dedc9-239f-4130-bc7c-5188da72b1a5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99bea50f-c004-4f8a-a9b0-c63d81d3f603', $q$Customer Support$q$, 283, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99bea50f-c004-4f8a-a9b0-c63d81d3f603')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f5d6b17-0e95-47ff-8d48-180e79853964', $q$AI & Automation$q$, 284, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f5d6b17-0e95-47ff-8d48-180e79853964')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0f136bb0-858e-4bbc-a2d9-74a4c0de346e', $q$AI & Automation$q$, 285, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f136bb0-858e-4bbc-a2d9-74a4c0de346e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99763729-7f20-4619-b4f0-0fce16d6e136', $q$AI & Automation$q$, 286, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99763729-7f20-4619-b4f0-0fce16d6e136')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5c9c0844-0b81-41dc-94d4-67bfceaf57ae', $q$Customer Support$q$, 287, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c9c0844-0b81-41dc-94d4-67bfceaf57ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2637a1fd-0305-4f69-8e7f-7c431b04bcd1', $q$AI & Automation$q$, 288, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2637a1fd-0305-4f69-8e7f-7c431b04bcd1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a5952c1a-878a-4ba4-9cb3-5557c11f5bb1', $q$Sales & CRM$q$, 289, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5952c1a-878a-4ba4-9cb3-5557c11f5bb1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b58c81e6-4b6c-4458-88c7-faa56423bf8c', $q$Sales & CRM$q$, 290, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b58c81e6-4b6c-4458-88c7-faa56423bf8c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed2288c7-864a-47df-8e84-763eac30ce6d', $q$AI & Automation$q$, 291, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed2288c7-864a-47df-8e84-763eac30ce6d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '25e9dfb0-cce0-4d30-9ade-5523b72b4808', $q$AI & Automation$q$, 292, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25e9dfb0-cce0-4d30-9ade-5523b72b4808')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'afa4c962-c3eb-4047-9e27-deb9aeada0ae', $q$AI & Automation$q$, 293, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afa4c962-c3eb-4047-9e27-deb9aeada0ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7609fa65-f246-4380-b366-0bebef9e7e5d', $q$Sales & CRM$q$, 294, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7609fa65-f246-4380-b366-0bebef9e7e5d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2186766a-e051-4271-adea-a2fb17ca1b32', $q$AI & Automation$q$, 295, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2186766a-e051-4271-adea-a2fb17ca1b32')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4037a6b2-b07c-442c-8a08-2afe3a8d8dd4', $q$AI & Automation$q$, 296, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4037a6b2-b07c-442c-8a08-2afe3a8d8dd4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e32fa7aa-dbf7-4212-87b0-b0563893d11c', $q$AI & Automation$q$, 297, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e32fa7aa-dbf7-4212-87b0-b0563893d11c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd170ef3d-b9b0-49e2-a45b-8a843f4fd2f5', $q$AI & Automation$q$, 298, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd170ef3d-b9b0-49e2-a45b-8a843f4fd2f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '651ffabf-97bc-4e58-86d8-5d939de22e82', $q$AI & Automation$q$, 299, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '651ffabf-97bc-4e58-86d8-5d939de22e82')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7578399b-bb58-4555-8dc6-9182b218ce1f', $q$AI & Automation$q$, 300, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7578399b-bb58-4555-8dc6-9182b218ce1f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'add7cd84-f6dc-4f0c-8cad-77bda1357c3c', $q$AI & Automation$q$, 301, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'add7cd84-f6dc-4f0c-8cad-77bda1357c3c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a7d725d5-fb32-4fcf-ac8d-b7f89dff364b', $q$AI & Automation$q$, 302, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a7d725d5-fb32-4fcf-ac8d-b7f89dff364b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9fd87a9c-789f-4022-9f96-cd52597ed6a2', $q$AI & Automation$q$, 303, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9fd87a9c-789f-4022-9f96-cd52597ed6a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '50b811dd-6b4d-4a67-998c-def3e7193b28', $q$AI & Automation$q$, 304, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50b811dd-6b4d-4a67-998c-def3e7193b28')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1fe5d6d9-9617-4d9b-a9d3-99e6bfc037c1', $q$AI & Automation$q$, 305, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1fe5d6d9-9617-4d9b-a9d3-99e6bfc037c1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '96a70036-d1ee-46f9-8683-196b6aaf479e', $q$Sales & CRM$q$, 306, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96a70036-d1ee-46f9-8683-196b6aaf479e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '51b1d7de-c3c3-45c3-b1b2-aa7f179c2a4b', $q$Customer Support$q$, 307, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '51b1d7de-c3c3-45c3-b1b2-aa7f179c2a4b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '768b68a2-3688-4f57-9fcd-907e3a041c4a', $q$Customer Support$q$, 308, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '768b68a2-3688-4f57-9fcd-907e3a041c4a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '18f86bf9-419f-4434-8400-11841d7bf11a', $q$AI & Automation$q$, 309, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18f86bf9-419f-4434-8400-11841d7bf11a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0238af0-e018-43c1-bf01-30735534434e', $q$Customer Support$q$, 310, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0238af0-e018-43c1-bf01-30735534434e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '400b1fc7-6386-4925-bb8a-1e0f0a1020e1', $q$AI & Automation$q$, 311, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '400b1fc7-6386-4925-bb8a-1e0f0a1020e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d0d9ddb-1c47-47cb-8aa2-9a6ef5c7cfff', $q$AI & Automation$q$, 312, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d0d9ddb-1c47-47cb-8aa2-9a6ef5c7cfff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '53d66e11-a50a-409b-96f9-f121adc5867e', $q$AI & Automation$q$, 313, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53d66e11-a50a-409b-96f9-f121adc5867e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c2486a93-bd8b-42bf-867c-bdef97d6470a', $q$AI & Automation$q$, 314, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2486a93-bd8b-42bf-867c-bdef97d6470a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cba42b99-94e3-4d26-a765-4778c9922f81', $q$AI & Automation$q$, 315, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cba42b99-94e3-4d26-a765-4778c9922f81')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e8f8e71b-c44a-4180-8dca-a1cf69c50793', $q$AI & Automation$q$, 316, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8f8e71b-c44a-4180-8dca-a1cf69c50793')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11a9367b-73c5-4da1-8931-0d4177d907d4', $q$AI & Automation$q$, 317, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11a9367b-73c5-4da1-8931-0d4177d907d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '385a4501-db8c-44a5-8680-1fc382507138', $q$Finance & Billing$q$, 318, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '385a4501-db8c-44a5-8680-1fc382507138')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b68f528b-111c-4339-bd27-b283626558c7', $q$AI & Automation$q$, 319, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b68f528b-111c-4339-bd27-b283626558c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '869c5602-e8aa-4c96-be74-20b8906fc31e', $q$AI & Automation$q$, 320, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '869c5602-e8aa-4c96-be74-20b8906fc31e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e1f5d739-74e2-4675-bfc5-0d386b1d22fd', $q$Marketing$q$, 322, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1f5d739-74e2-4675-bfc5-0d386b1d22fd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3b3dc92a-35f4-4c79-a369-3ff4ac7d06e0', $q$AI & Automation$q$, 323, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b3dc92a-35f4-4c79-a369-3ff4ac7d06e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c9249e17-798b-489a-8ec7-8c172c96a714', $q$AI & Automation$q$, 324, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9249e17-798b-489a-8ec7-8c172c96a714')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bdd0c681-a670-48f8-bc19-3f5c4beb1a64', $q$Customer Support$q$, 325, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bdd0c681-a670-48f8-bc19-3f5c4beb1a64')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b9fc53cd-185f-4f57-8b76-11b8443fb75a', $q$AI & Automation$q$, 326, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9fc53cd-185f-4f57-8b76-11b8443fb75a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c29aeef3-d24c-4223-b6df-ee9ed586b417', $q$AI & Automation$q$, 327, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c29aeef3-d24c-4223-b6df-ee9ed586b417')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54e00116-1ecb-4279-8363-1153539fd4f2', $q$AI & Automation$q$, 328, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54e00116-1ecb-4279-8363-1153539fd4f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eeae9bdc-471c-44e9-ab33-0c6d7ef76a9c', $q$AI & Automation$q$, 329, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eeae9bdc-471c-44e9-ab33-0c6d7ef76a9c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c87f841a-472d-43fb-a987-f87e75114293', $q$Sales & CRM$q$, 330, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c87f841a-472d-43fb-a987-f87e75114293')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7b2e0f74-4972-4178-b6f3-de1f454e87fe', $q$Marketing$q$, 331, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b2e0f74-4972-4178-b6f3-de1f454e87fe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '33666f95-eb97-4766-b3bf-7c7378494256', $q$AI & Automation$q$, 332, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33666f95-eb97-4766-b3bf-7c7378494256')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1003bf1b-4439-40ba-bf78-d4aee7519593', $q$AI & Automation$q$, 333, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1003bf1b-4439-40ba-bf78-d4aee7519593')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '78fe8b58-2944-437f-8ac6-bb278e23f3df', $q$AI & Automation$q$, 334, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78fe8b58-2944-437f-8ac6-bb278e23f3df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0b8e12da-659a-4785-bb27-e7542fd39554', $q$AI & Automation$q$, 335, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b8e12da-659a-4785-bb27-e7542fd39554')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7cfac37f-5931-44af-a777-8af5b90ecb76', $q$AI & Automation$q$, 336, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cfac37f-5931-44af-a777-8af5b90ecb76')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8099b7b-126c-44be-8fd2-fcaf2513b37e', $q$AI & Automation$q$, 337, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8099b7b-126c-44be-8fd2-fcaf2513b37e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '610c232e-61d6-4802-bec1-f244d89c092d', $q$AI & Automation$q$, 338, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '610c232e-61d6-4802-bec1-f244d89c092d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fb143158-7c0c-4577-b5a4-ede570e97bf5', $q$AI & Automation$q$, 339, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb143158-7c0c-4577-b5a4-ede570e97bf5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a6668fda-25f1-46e3-a0ac-85b2f43bce61', $q$AI & Automation$q$, 340, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6668fda-25f1-46e3-a0ac-85b2f43bce61')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '42d674cb-cf98-4f29-b2ee-39519b4dca8a', $q$AI & Automation$q$, 341, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42d674cb-cf98-4f29-b2ee-39519b4dca8a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '148d9a88-d90a-45ca-95d6-b48eaa435c0b', $q$Sales & CRM$q$, 342, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '148d9a88-d90a-45ca-95d6-b48eaa435c0b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '02ff0e2c-5ae8-49ff-8e44-7d1493777a20', $q$AI & Automation$q$, 343, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02ff0e2c-5ae8-49ff-8e44-7d1493777a20')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '57d17f08-6616-4174-b7a0-98cdf573bbc4', $q$AI & Automation$q$, 344, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57d17f08-6616-4174-b7a0-98cdf573bbc4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d8dba91-aa49-4585-85b9-68eaa26fc497', $q$AI & Automation$q$, 345, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d8dba91-aa49-4585-85b9-68eaa26fc497')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '371b1ff7-bc8f-47e1-9c40-3406ea48ad5b', $q$AI & Automation$q$, 346, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '371b1ff7-bc8f-47e1-9c40-3406ea48ad5b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '366cb116-91cb-47e4-9985-f0bf1b93d268', $q$AI & Automation$q$, 347, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '366cb116-91cb-47e4-9985-f0bf1b93d268')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b38b732f-fce6-4975-8c4e-91502e24f23b', $q$AI & Automation$q$, 348, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b38b732f-fce6-4975-8c4e-91502e24f23b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '327d47c3-f1c7-4c9a-b96e-43646f4f6bdb', $q$AI & Automation$q$, 349, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '327d47c3-f1c7-4c9a-b96e-43646f4f6bdb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7b368f3d-7c7d-4ed2-b21c-dc76f796b92f', $q$Sales & CRM$q$, 350, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b368f3d-7c7d-4ed2-b21c-dc76f796b92f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c476cf3a-dff3-438d-8529-1df0754d0238', $q$AI & Automation$q$, 351, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c476cf3a-dff3-438d-8529-1df0754d0238')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '108b0f8d-7171-4aa5-9969-9ab1794127de', $q$Sales & CRM$q$, 353, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '108b0f8d-7171-4aa5-9969-9ab1794127de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8706734-ceff-410b-8cc5-26b9b9dfce4f', $q$AI & Automation$q$, 354, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8706734-ceff-410b-8cc5-26b9b9dfce4f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc2ffb71-01fb-4a1e-bc19-fb17b027d4c7', $q$AI & Automation$q$, 355, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc2ffb71-01fb-4a1e-bc19-fb17b027d4c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '572e6355-9329-4e89-a595-ee619a0404c5', $q$AI & Automation$q$, 356, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '572e6355-9329-4e89-a595-ee619a0404c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '26feaf51-502a-45e0-b694-87292ab8193b', $q$Customer Support$q$, 357, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26feaf51-502a-45e0-b694-87292ab8193b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '40332bfe-6fcd-4fb5-9deb-e61b1fbe0217', $q$Customer Support$q$, 358, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40332bfe-6fcd-4fb5-9deb-e61b1fbe0217')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d212680-dbdb-4fa4-b9cf-6eb97af033c2', $q$Marketing$q$, 359, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d212680-dbdb-4fa4-b9cf-6eb97af033c2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b368ca12-b68c-44e9-aac2-66e409742f5b', $q$AI & Automation$q$, 360, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b368ca12-b68c-44e9-aac2-66e409742f5b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8977700-1ccd-47e9-81be-a49a8e74f014', $q$AI & Automation$q$, 361, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8977700-1ccd-47e9-81be-a49a8e74f014')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a0a33c4-c828-49dd-a9ee-c00b5e40407b', $q$Customer Support$q$, 362, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a0a33c4-c828-49dd-a9ee-c00b5e40407b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a32a5ba6-ef39-4e17-b141-97840151e125', $q$AI & Automation$q$, 363, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a32a5ba6-ef39-4e17-b141-97840151e125')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c6be591-0d62-4a97-a8f4-1ffe8c766c70', $q$AI & Automation$q$, 364, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c6be591-0d62-4a97-a8f4-1ffe8c766c70')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d176e6e-0a72-4a6f-b587-da8c342b8fac', $q$Customer Support$q$, 365, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d176e6e-0a72-4a6f-b587-da8c342b8fac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '076ee3c7-ae2f-4574-b432-81b409bf0c58', $q$AI & Automation$q$, 366, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '076ee3c7-ae2f-4574-b432-81b409bf0c58')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd7b55187-f6ec-4abe-bfa6-1bd11f40863c', $q$Customer Support$q$, 367, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7b55187-f6ec-4abe-bfa6-1bd11f40863c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82363812-2950-4f09-ad13-b98f19374f60', $q$AI & Automation$q$, 368, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82363812-2950-4f09-ad13-b98f19374f60')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1a12353f-df69-4cbf-8aab-dcac5b693a83', $q$AI & Automation$q$, 369, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a12353f-df69-4cbf-8aab-dcac5b693a83')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be4cf334-96fb-4799-b32b-b84c7695d75b', $q$AI & Automation$q$, 370, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be4cf334-96fb-4799-b32b-b84c7695d75b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '31b300d8-ab16-48a3-a728-fd2d45802ba0', $q$AI & Automation$q$, 371, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31b300d8-ab16-48a3-a728-fd2d45802ba0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '45d0634d-8699-4f28-b949-988b8f3f9ed7', $q$Customer Support$q$, 372, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45d0634d-8699-4f28-b949-988b8f3f9ed7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '601d626a-002b-4ca2-b38e-97b5c361a4b5', $q$AI & Automation$q$, 373, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '601d626a-002b-4ca2-b38e-97b5c361a4b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '98cc5a1c-7dca-436f-aaa3-776fdb980a23', $q$Customer Support$q$, 374, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '98cc5a1c-7dca-436f-aaa3-776fdb980a23')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dd313f0c-2f05-45aa-867d-2e8b6a64b7e6', $q$AI & Automation$q$, 375, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd313f0c-2f05-45aa-867d-2e8b6a64b7e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '517f9af8-588b-4bba-b267-779265c90a6a', $q$AI & Automation$q$, 376, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '517f9af8-588b-4bba-b267-779265c90a6a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8d59fd2-3722-42bb-9a41-85d00e01f4c5', $q$Sales & CRM$q$, 377, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8d59fd2-3722-42bb-9a41-85d00e01f4c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '875e2281-c1bb-4bd3-84a6-7569af199c47', $q$Sales & CRM$q$, 378, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '875e2281-c1bb-4bd3-84a6-7569af199c47')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0758127-7ab8-4f09-870c-0a95f456dbf6', $q$Customer Support$q$, 379, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0758127-7ab8-4f09-870c-0a95f456dbf6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '81cc192a-3244-438f-81e8-a5d8f2c8cadb', $q$AI & Automation$q$, 380, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81cc192a-3244-438f-81e8-a5d8f2c8cadb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'caabb242-95f1-40c0-916e-54e6a6f609aa', $q$AI & Automation$q$, 381, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'caabb242-95f1-40c0-916e-54e6a6f609aa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba079c86-c85a-4cbf-ae1a-c1ec99038382', $q$AI & Automation$q$, 382, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba079c86-c85a-4cbf-ae1a-c1ec99038382')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '01975df7-8ba7-4430-ab3f-ac411d846da8', $q$Marketing$q$, 383, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01975df7-8ba7-4430-ab3f-ac411d846da8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '10297f06-4d81-4ce7-9fe8-1ecd418a67f0', $q$AI & Automation$q$, 384, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10297f06-4d81-4ce7-9fe8-1ecd418a67f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '859c24d7-5a2b-41d1-bc3a-24a0c80059f1', $q$AI & Automation$q$, 385, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '859c24d7-5a2b-41d1-bc3a-24a0c80059f1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '58fc5eb8-c8f2-471a-987e-9b1364eaaa82', $q$AI & Automation$q$, 386, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '58fc5eb8-c8f2-471a-987e-9b1364eaaa82')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '940dc4e3-b064-4ed1-a436-69e15f64060f', $q$Sales & CRM$q$, 387, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '940dc4e3-b064-4ed1-a436-69e15f64060f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '37b13dda-fa3b-420f-b7c5-a69b41153873', $q$Marketing$q$, 388, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37b13dda-fa3b-420f-b7c5-a69b41153873')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c444e8a9-3c1b-4803-b50f-cd94822c3c77', $q$AI & Automation$q$, 389, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c444e8a9-3c1b-4803-b50f-cd94822c3c77')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e895464c-eda6-45f6-be4d-9642675f006c', $q$AI & Automation$q$, 390, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e895464c-eda6-45f6-be4d-9642675f006c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9efb85c2-c27b-4b41-9457-10fee6f86678', $q$AI & Automation$q$, 391, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9efb85c2-c27b-4b41-9457-10fee6f86678')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'baaa239d-707f-4bc2-8d3a-0d44a805ed89', $q$Marketing$q$, 392, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'baaa239d-707f-4bc2-8d3a-0d44a805ed89')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ce548496-d94e-4d0f-a5ad-c0737c80c881', $q$Sales & CRM$q$, 393, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce548496-d94e-4d0f-a5ad-c0737c80c881')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f7400b93-066c-4be0-86c2-b404fbe6d59d', $q$AI & Automation$q$, 394, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7400b93-066c-4be0-86c2-b404fbe6d59d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '68a0581c-9787-449a-8e58-99cd73bb298b', $q$AI & Automation$q$, 395, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68a0581c-9787-449a-8e58-99cd73bb298b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c10d4ed-838e-41bc-b960-a1302cd1dcc2', $q$AI & Automation$q$, 396, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c10d4ed-838e-41bc-b960-a1302cd1dcc2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7465b5a9-4bf6-4232-9609-3ae95c18a137', $q$Sales & CRM$q$, 397, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7465b5a9-4bf6-4232-9609-3ae95c18a137')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '67ac58ed-7c99-4b2d-97d1-29edce5e049c', $q$AI & Automation$q$, 398, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '67ac58ed-7c99-4b2d-97d1-29edce5e049c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed0078cd-c688-499e-a907-ff3a7c8e72fb', $q$AI & Automation$q$, 399, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed0078cd-c688-499e-a907-ff3a7c8e72fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2660c3b9-ef58-4b08-8348-4312c7f59b2c', $q$Marketing$q$, 400, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2660c3b9-ef58-4b08-8348-4312c7f59b2c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ca91fb9e-c359-4585-b927-a983112af7a7', $q$AI & Automation$q$, 401, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca91fb9e-c359-4585-b927-a983112af7a7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '16a7914e-179d-4aeb-ba94-c58d58d52469', $q$AI & Automation$q$, 402, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16a7914e-179d-4aeb-ba94-c58d58d52469')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e3f27506-4265-424a-b31b-8d2768af8b36', $q$Customer Support$q$, 403, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3f27506-4265-424a-b31b-8d2768af8b36')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1db2f036-a8ab-4246-850e-98a3f1ba710b', $q$Sales & CRM$q$, 404, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1db2f036-a8ab-4246-850e-98a3f1ba710b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6a01f151-a44f-4a4b-a177-45b43b738e11', $q$AI & Automation$q$, 406, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a01f151-a44f-4a4b-a177-45b43b738e11')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee54830a-08ea-48d0-b1a0-725923fa2a78', $q$Customer Support$q$, 407, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee54830a-08ea-48d0-b1a0-725923fa2a78')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '16a5b28a-5c7d-43c1-867c-fceb6bdb1a75', $q$AI & Automation$q$, 408, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16a5b28a-5c7d-43c1-867c-fceb6bdb1a75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd41a6867-2352-40c9-924f-b7863bdbb6f7', $q$AI & Automation$q$, 409, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd41a6867-2352-40c9-924f-b7863bdbb6f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '35d64a9a-5421-45fe-b59e-5129ac8a4872', $q$AI & Automation$q$, 410, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35d64a9a-5421-45fe-b59e-5129ac8a4872')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0078c140-b40f-4069-a43f-54eac906b4e1', $q$Sales & CRM$q$, 411, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0078c140-b40f-4069-a43f-54eac906b4e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd3ac5e85-8c24-4024-b315-b796107eee40', $q$AI & Automation$q$, 412, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3ac5e85-8c24-4024-b315-b796107eee40')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d4cf68f-a3de-4c2c-9afe-cbc19c81cc8e', $q$AI & Automation$q$, 413, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d4cf68f-a3de-4c2c-9afe-cbc19c81cc8e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d63582a-758a-4b69-893f-7ba74fa274c2', $q$AI & Automation$q$, 414, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d63582a-758a-4b69-893f-7ba74fa274c2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eceb93ec-9f3e-4f31-8b66-ac0a6dc441e9', $q$AI & Automation$q$, 415, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eceb93ec-9f3e-4f31-8b66-ac0a6dc441e9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a5d05e8c-9c0c-41e7-ba0c-9b35679eefe9', $q$AI & Automation$q$, 416, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5d05e8c-9c0c-41e7-ba0c-9b35679eefe9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0d9d6652-2c69-4446-806e-36154b5adf76', $q$AI & Automation$q$, 417, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d9d6652-2c69-4446-806e-36154b5adf76')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'abf72590-80aa-4226-b2f9-f24ae5951a97', $q$Marketing$q$, 418, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abf72590-80aa-4226-b2f9-f24ae5951a97')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bd94d00d-81c9-433f-8822-3c95b08bfa12', $q$AI & Automation$q$, 419, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd94d00d-81c9-433f-8822-3c95b08bfa12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '41ea7854-1e4e-437c-8710-98aece57ac01', $q$AI & Automation$q$, 420, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41ea7854-1e4e-437c-8710-98aece57ac01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6f56340b-175e-4ec5-a034-c7b74cd4231b', $q$AI & Automation$q$, 421, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f56340b-175e-4ec5-a034-c7b74cd4231b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '35c6ce99-ee69-4168-a45c-87c3ab537447', $q$AI & Automation$q$, 422, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35c6ce99-ee69-4168-a45c-87c3ab537447')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f04996a9-fdb5-49a4-8faa-fb21e9c8f2b3', $q$Finance & Billing$q$, 423, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f04996a9-fdb5-49a4-8faa-fb21e9c8f2b3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd499659c-fea7-4505-9dd1-bc17b5822f5f', $q$AI & Automation$q$, 424, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd499659c-fea7-4505-9dd1-bc17b5822f5f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a8419920-0109-4155-a8ca-b65b85366551', $q$Customer Support$q$, 425, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8419920-0109-4155-a8ca-b65b85366551')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ff2febbe-0365-409c-add7-5f19395b5b62', $q$AI & Automation$q$, 426, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff2febbe-0365-409c-add7-5f19395b5b62')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '747e0d30-9793-468a-8555-2eb0174407d3', $q$AI & Automation$q$, 427, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '747e0d30-9793-468a-8555-2eb0174407d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '85c94fe1-8160-40ce-81ef-8d73553f992c', $q$AI & Automation$q$, 428, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85c94fe1-8160-40ce-81ef-8d73553f992c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9be2ab8c-c868-44a9-a988-6a4d797c6f9b', $q$AI & Automation$q$, 429, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9be2ab8c-c868-44a9-a988-6a4d797c6f9b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e240a255-8124-45b8-8913-c348b1d7c86a', $q$AI & Automation$q$, 430, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e240a255-8124-45b8-8913-c348b1d7c86a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b24586a9-7f46-451e-89a0-6f5b3be30b07', $q$AI & Automation$q$, 431, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b24586a9-7f46-451e-89a0-6f5b3be30b07')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '52ee37e5-73fa-44a6-b017-e86b803f457b', $q$AI & Automation$q$, 432, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52ee37e5-73fa-44a6-b017-e86b803f457b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed512c48-b3c1-4a68-9a5a-a8990f990c77', $q$AI & Automation$q$, 433, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed512c48-b3c1-4a68-9a5a-a8990f990c77')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de5013b4-47a9-4926-a0dc-911d7ee05c36', $q$Marketing$q$, 434, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de5013b4-47a9-4926-a0dc-911d7ee05c36')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '317ab008-b73a-44ff-95fd-751a3030b205', $q$AI & Automation$q$, 435, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '317ab008-b73a-44ff-95fd-751a3030b205')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a06ed370-b34a-423f-bdf1-bd523b5d4b72', $q$AI & Automation$q$, 436, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a06ed370-b34a-423f-bdf1-bd523b5d4b72')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0bcc5fec-771f-4f9a-b464-f9ced0dab854', $q$Sales & CRM$q$, 437, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0bcc5fec-771f-4f9a-b464-f9ced0dab854')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0d74daa8-c900-4444-9382-b620613ba6df', $q$AI & Automation$q$, 438, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d74daa8-c900-4444-9382-b620613ba6df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3f92b1f8-fcbb-40d5-a6bf-123e0d84e96f', $q$AI & Automation$q$, 439, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f92b1f8-fcbb-40d5-a6bf-123e0d84e96f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '50ba5c2c-8f51-48bf-9cfe-1fcf2758cebf', $q$AI & Automation$q$, 440, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50ba5c2c-8f51-48bf-9cfe-1fcf2758cebf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '65f6f8bf-619b-4a1c-ac20-3aec2fda4f87', $q$AI & Automation$q$, 441, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65f6f8bf-619b-4a1c-ac20-3aec2fda4f87')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '64705a72-4037-4989-8764-96da9f567896', $q$AI & Automation$q$, 442, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64705a72-4037-4989-8764-96da9f567896')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd6ef33b3-15c2-47c3-8d5f-12987d6ab6c3', $q$AI & Automation$q$, 443, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6ef33b3-15c2-47c3-8d5f-12987d6ab6c3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd50fedfd-6ed4-4e28-94e2-94e1ced833f6', $q$AI & Automation$q$, 444, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd50fedfd-6ed4-4e28-94e2-94e1ced833f6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '484662d5-4594-420c-8ae4-dd762cf283cb', $q$AI & Automation$q$, 445, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '484662d5-4594-420c-8ae4-dd762cf283cb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3bd8d992-4cbd-486c-be25-dabcb78aefc4', $q$Sales & CRM$q$, 446, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bd8d992-4cbd-486c-be25-dabcb78aefc4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f137be75-03af-430c-93da-1531f23e6fb3', $q$Sales & CRM$q$, 447, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f137be75-03af-430c-93da-1531f23e6fb3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd36c6bca-dd54-4c6d-8a0a-9673013d3b75', $q$AI & Automation$q$, 448, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd36c6bca-dd54-4c6d-8a0a-9673013d3b75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '15d78f2b-8666-412d-9e9f-5ea374441c37', $q$AI & Automation$q$, 449, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15d78f2b-8666-412d-9e9f-5ea374441c37')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8f61515a-5504-4853-b416-90c2101b4d1e', $q$Finance & Billing$q$, 450, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f61515a-5504-4853-b416-90c2101b4d1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f37ad9cc-44ea-4a83-af7b-5d96c1504661', $q$Marketing$q$, 451, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f37ad9cc-44ea-4a83-af7b-5d96c1504661')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c54b52d-a920-4f0c-b19d-a0ad335eb909', $q$AI & Automation$q$, 452, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c54b52d-a920-4f0c-b19d-a0ad335eb909')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4caa11a1-4f61-4b83-a305-e7386ad59deb', $q$AI & Automation$q$, 453, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4caa11a1-4f61-4b83-a305-e7386ad59deb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bd8cd105-56a8-4ece-8c61-78f51ee0f581', $q$AI & Automation$q$, 454, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd8cd105-56a8-4ece-8c61-78f51ee0f581')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ddd627e6-e1d5-488b-be7e-0bce39b10b12', $q$AI & Automation$q$, 456, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ddd627e6-e1d5-488b-be7e-0bce39b10b12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'becb7109-b144-4b5a-aa9c-359b3d782460', $q$Customer Support$q$, 457, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'becb7109-b144-4b5a-aa9c-359b3d782460')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd3303e57-57a0-4971-a22f-f4858d0243ea', $q$Finance & Billing$q$, 458, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3303e57-57a0-4971-a22f-f4858d0243ea')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4a88cd01-2b0b-4b04-a3c9-5acc749d0088', $q$AI & Automation$q$, 459, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a88cd01-2b0b-4b04-a3c9-5acc749d0088')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86aba49d-2864-4004-91b7-d9b56a4eb9eb', $q$AI & Automation$q$, 460, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86aba49d-2864-4004-91b7-d9b56a4eb9eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1bcd317a-37e8-4d87-96e5-d1a9d7750b2d', $q$AI & Automation$q$, 461, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1bcd317a-37e8-4d87-96e5-d1a9d7750b2d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2ebf022b-9d7d-43df-8f64-910499d82f65', $q$AI & Automation$q$, 462, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ebf022b-9d7d-43df-8f64-910499d82f65')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe380ae3-6bb8-42b3-9756-292823a0fc8f', $q$Finance & Billing$q$, 463, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe380ae3-6bb8-42b3-9756-292823a0fc8f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd22c1b1d-15aa-4600-8be5-b3553aefcb51', $q$AI & Automation$q$, 464, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd22c1b1d-15aa-4600-8be5-b3553aefcb51')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc08f556-cb64-4696-98f1-59077b684a1f', $q$AI & Automation$q$, 465, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc08f556-cb64-4696-98f1-59077b684a1f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1dc7403d-a9d2-4c4d-a2e1-a9010a9034b7', $q$Sales & CRM$q$, 466, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1dc7403d-a9d2-4c4d-a2e1-a9010a9034b7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a1ad5ca-e058-4fee-b515-ce29ef2fa629', $q$AI & Automation$q$, 467, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a1ad5ca-e058-4fee-b515-ce29ef2fa629')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c830c55-19ef-4b4e-baf2-5c88dc9b1419', $q$Marketing$q$, 468, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c830c55-19ef-4b4e-baf2-5c88dc9b1419')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9ef2b968-dbb8-4754-a5c0-fdc5c4b4a308', $q$AI & Automation$q$, 469, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ef2b968-dbb8-4754-a5c0-fdc5c4b4a308')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '34fe63a9-d5c6-4e5b-8ce5-1a5ce27dd30b', $q$AI & Automation$q$, 470, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34fe63a9-d5c6-4e5b-8ce5-1a5ce27dd30b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '595842cb-464b-4753-9877-7bb727a45879', $q$Finance & Billing$q$, 471, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '595842cb-464b-4753-9877-7bb727a45879')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5c6b5f1-0ab0-4591-ab25-caf5d0b0cfa7', $q$AI & Automation$q$, 472, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5c6b5f1-0ab0-4591-ab25-caf5d0b0cfa7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'afb2ef1a-0be8-4ff7-b987-771d61087314', $q$AI & Automation$q$, 473, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afb2ef1a-0be8-4ff7-b987-771d61087314')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dbe936f9-3611-4c78-9319-dda94c3a5d39', $q$AI & Automation$q$, 474, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dbe936f9-3611-4c78-9319-dda94c3a5d39')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '218a9077-4af3-4d9e-86bd-9a9cc6d77a52', $q$AI & Automation$q$, 475, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '218a9077-4af3-4d9e-86bd-9a9cc6d77a52')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe481f4a-28b8-46df-b96c-39faf5e591f4', $q$Finance & Billing$q$, 476, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe481f4a-28b8-46df-b96c-39faf5e591f4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4ba8dabc-5c55-4617-a529-12bb860208e6', $q$Sales & CRM$q$, 477, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ba8dabc-5c55-4617-a529-12bb860208e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b1c442d-438b-4390-b6fc-1a94839d1086', $q$AI & Automation$q$, 478, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b1c442d-438b-4390-b6fc-1a94839d1086')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e1195935-0045-4f3e-9643-a966d97879ec', $q$AI & Automation$q$, 479, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1195935-0045-4f3e-9643-a966d97879ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cdc3066f-0294-40ab-a21a-66f69daf7995', $q$AI & Automation$q$, 480, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdc3066f-0294-40ab-a21a-66f69daf7995')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a8c909b-6853-4f75-a68b-f48836d4e1fc', $q$Sales & CRM$q$, 481, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a8c909b-6853-4f75-a68b-f48836d4e1fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b3a3a2f6-3f0a-47ef-807f-33fa734549b5', $q$AI & Automation$q$, 483, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b3a3a2f6-3f0a-47ef-807f-33fa734549b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f4e4ab32-4937-4f32-bca7-dffad228c685', $q$Marketing$q$, 484, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4e4ab32-4937-4f32-bca7-dffad228c685')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c509176a-adeb-41e7-9d27-a11db9b0dca5', $q$Sales & CRM$q$, 485, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c509176a-adeb-41e7-9d27-a11db9b0dca5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a2d472b-7d9b-4dcd-ab4b-486279884521', $q$AI & Automation$q$, 486, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a2d472b-7d9b-4dcd-ab4b-486279884521')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c265bd5c-1d70-45d1-a063-77cd27cfdbab', $q$AI & Automation$q$, 487, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c265bd5c-1d70-45d1-a063-77cd27cfdbab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2237a5d1-a171-4ed5-84e4-dc99309b90f1', $q$AI & Automation$q$, 488, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2237a5d1-a171-4ed5-84e4-dc99309b90f1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1e8d44c7-96b8-4675-bfb6-d05f822f14a4', $q$AI & Automation$q$, 490, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e8d44c7-96b8-4675-bfb6-d05f822f14a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c80549d5-a7c7-4899-b4b5-2eba5771ca88', $q$Finance & Billing$q$, 491, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c80549d5-a7c7-4899-b4b5-2eba5771ca88')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '000e4633-fa2f-440f-bb2c-cf58719b9993', $q$Finance & Billing$q$, 492, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '000e4633-fa2f-440f-bb2c-cf58719b9993')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '84ef3718-64a5-40c5-af95-43301500ca75', $q$AI & Automation$q$, 493, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84ef3718-64a5-40c5-af95-43301500ca75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '56883d82-5818-4cd7-9c47-570defea8d8b', $q$AI & Automation$q$, 494, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56883d82-5818-4cd7-9c47-570defea8d8b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11a10180-12a4-4329-aa8c-06844cccbc31', $q$AI & Automation$q$, 495, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11a10180-12a4-4329-aa8c-06844cccbc31')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '27e3e76b-0b41-4bf8-abd4-0c16dcdc9ac0', $q$Customer Support$q$, 496, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27e3e76b-0b41-4bf8-abd4-0c16dcdc9ac0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '84874bf5-8ebb-4413-b586-5955ae59b4e8', $q$AI & Automation$q$, 497, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84874bf5-8ebb-4413-b586-5955ae59b4e8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '89b36bbc-a7fc-403b-9819-4e16ea73a08f', $q$AI & Automation$q$, 499, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89b36bbc-a7fc-403b-9819-4e16ea73a08f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Finance & Billing$q$, 9, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('1cae6850-050f-46cb-a2e7-0f9b43529d66', $q$AI & Automation$q$, 12, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e19def59-87a1-4c56-8c4c-42d792e37cfd', $q$Finance & Billing$q$, 79, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('693230a0-d462-46dc-9108-9752df61caba', $q$AI & Automation$q$, 102, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('620140b0-3b84-4d9d-8196-7bb9344c797c', $q$Sales & CRM$q$, 282, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('309c46ca-1066-4ecc-be4d-d5984e2cd67e', $q$Finance & Billing$q$, 321, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('9e200cb1-a048-4c0a-ac15-ece1a517f982', $q$Finance & Billing$q$, 352, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Finance & Billing$q$, 405, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$AI & Automation$q$, 455, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('758d739b-574e-4253-96df-178cefd5f067', $q$AI & Automation$q$, 482, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ab58553d-75b9-40f6-9b54-61fbab218754', $q$Finance & Billing$q$, 489, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f4a6f61d-c3a3-4ca6-b4af-abc327e0f762', $q$AI & Automation$q$, 498, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d43ee8f4-1247-4fdd-8035-fef66e1db0b3', $q$Sales & CRM$q$, 500, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch11$q$)
ON CONFLICT (tool_id) DO NOTHING;

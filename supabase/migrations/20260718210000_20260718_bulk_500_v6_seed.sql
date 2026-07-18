-- Data for the v6 500-target bulk import (batch 6, see 20260718200000 for
-- the companion new-categories migration). Idempotent: every INSERT is
-- ON CONFLICT DO NOTHING keyed on tools.slug or
-- tool_strategic_metadata.tool_id. New tools land as
-- status='needs_review', noindex=true, sitemap_eligible=false — invisible
-- to the public site until enrichment (Phase B) reviews and publishes them.

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$awstats$q$, $q$AWStats$q$, $q$http://www.awstats.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '675b4134-c6dd-4c7a-8480-7fcb63af924a', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '675b4134-c6dd-4c7a-8480-7fcb63af924a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$countly-community-edition$q$, $q$Countly Community Edition$q$, $q$https://count.ly$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a59d5166-cc6a-417b-90b1-e5b6c0fb5f11')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$d8a-tech$q$, $q$d8a.tech$q$, $q$https://d8a.tech$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd5186176-1b9e-4d69-9272-f95fc9700a4c', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5186176-1b9e-4d69-9272-f95fc9700a4c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$daily-stars-explorer$q$, $q$Daily Stars Explorer$q$, $q$https://emanuelef.github.io/daily-stars-explorer$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d0f250c-fcb6-42a1-ba65-14a33ddeb307', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d0f250c-fcb6-42a1-ba65-14a33ddeb307')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$hitkeep$q$, $q$HitKeep$q$, $q$https://hitkeep.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '908dae33-8b4a-4b73-8ca9-33e3eb8522aa', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '908dae33-8b4a-4b73-8ca9-33e3eb8522aa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$litlyx$q$, $q$Litlyx$q$, $q$https://litlyx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bcaaafb7-ce4e-47a5-9712-f545552b12e7', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bcaaafb7-ce4e-47a5-9712-f545552b12e7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$liwan$q$, $q$Liwan$q$, $q$https://liwan.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c95b7ac8-c110-41fe-a3fc-2fb5237155d8', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c95b7ac8-c110-41fe-a3fc-2fb5237155d8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$medama-analytics$q$, $q$Medama Analytics$q$, $q$https://oss.medama.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd820a867-fd9f-44d0-a672-841fea19edfc', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd820a867-fd9f-44d0-a672-841fea19edfc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$offen$q$, $q$Offen$q$, $q$https://www.offen.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20af8fc3-9e0e-4ee6-9421-b638361573df', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20af8fc3-9e0e-4ee6-9421-b638361573df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$prisme-analytics$q$, $q$Prisme Analytics$q$, $q$https://www.prismeanalytics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2273c295-f582-4fee-a5d0-42845b0dfade', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2273c295-f582-4fee-a5d0-42845b0dfade')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$rybbit$q$, $q$Rybbit$q$, $q$https://rybbit.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c1b5e9c-512c-48b9-b212-f464f5c0a339', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c1b5e9c-512c-48b9-b212-f464f5c0a339')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$shaper$q$, $q$Shaper$q$, $q$https://taleshape.com/shaper/docs$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed136ebf-ec30-4027-aba4-c834b251578e', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed136ebf-ec30-4027-aba4-c834b251578e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$superset$q$, $q$Superset$q$, $q$http://superset.apache.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c430e24-d037-4fa9-9d90-6b483daf4467', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c430e24-d037-4fa9-9d90-6b483daf4467')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$swetrix$q$, $q$Swetrix$q$, $q$https://swetrix.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$vince$q$, $q$Vince$q$, $q$https://www.vinceanalytics.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$collective-access-providence$q$, $q$Collective Access - Providence$q$, $q$https://collectiveaccess.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f7ad8964-3bed-4b24-a76a-71a5d1f01f13', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7ad8964-3bed-4b24-a76a-71a5d1f01f13')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$eonvelope$q$, $q$Eonvelope$q$, $q$https://dacid99.gitlab.io/eonvelope$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd5204669-8ef8-4418-a89c-cac392863262', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5204669-8ef8-4418-a89c-cac392863262')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$omeka-s$q$, $q$Omeka S$q$, $q$https://omeka.org/s/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed103661-d4a3-4fa4-8ac8-dccb7c67ed04')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$discount-bandit$q$, $q$Discount Bandit$q$, $q$https://discount-bandit.cybrarist.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '09c39a74-1b42-4789-af73-47c7785446b4', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09c39a74-1b42-4789-af73-47c7785446b4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$flowctl$q$, $q$flowctl$q$, $q$https://flowctl.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4bc25f51-5006-4396-aeab-6860c203eba6', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bc25f51-5006-4396-aeab-6860c203eba6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$fredy$q$, $q$Fredy$q$, $q$https://fredy.orange-coding.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2315b74d-957e-4a28-a863-32fc0da75242', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2315b74d-957e-4a28-a863-32fc0da75242')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$homebutler$q$, $q$HomeButler$q$, $q$https://homebutler.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c5d35463-736d-427c-b730-eb483d33b643', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5d35463-736d-427c-b730-eb483d33b643')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$kibitzr$q$, $q$Kibitzr$q$, $q$https://kibitzr.github.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '508967b9-da79-458e-ad83-e0c334e50a8c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '508967b9-da79-458e-ad83-e0c334e50a8c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$mylar3$q$, $q$Mylar3$q$, $q$https://mylarcomics.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a78ce366-8967-4df1-b706-40b8958bb998', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a78ce366-8967-4df1-b706-40b8958bb998')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$antville$q$, $q$Antville$q$, $q$https://antville.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06494ee1-ad30-4cee-bd7c-a25eb468d7da', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$ech0$q$, $q$Ech0$q$, $q$https://echo.soopy.cn/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0bc21b7f-dfe2-4c44-a7ad-9cac54962d52')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$flatpress$q$, $q$FlatPress$q$, $q$https://flatpress.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4e5010c0-47f6-477a-b108-d4572881cb9c', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e5010c0-47f6-477a-b108-d4572881cb9c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$htmly$q$, $q$HTMLy$q$, $q$https://www.htmly.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c23263cf-333f-4561-ac68-e421277a1f58', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c23263cf-333f-4561-ac68-e421277a1f58')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$mataroa$q$, $q$Mataroa$q$, $q$https://mataroa.blog/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '207eb58f-a5bd-46b7-ad43-c35ea9d0fecf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$pluxml$q$, $q$PluXml$q$, $q$https://pluxml.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eba0f7e5-197a-4285-93b2-3fcbd9da16ba', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eba0f7e5-197a-4285-93b2-3fcbd9da16ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$serendipity$q$, $q$Serendipity$q$, $q$https://docs.s9y.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba173115-45c7-42cb-850e-739cef0cdccb', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba173115-45c7-42cb-850e-739cef0cdccb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$digibunch$q$, $q$Digibunch$q$, $q$https://ladigitale.dev/digibunch/#/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8d19f4f-f413-441c-b903-3a6fd99103e0', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8d19f4f-f413-441c-b903-3a6fd99103e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$faved$q$, $q$Faved$q$, $q$https://faved.to/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3185965d-fd1d-45c7-a0e1-03ac82f24008', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3185965d-fd1d-45c7-a0e1-03ac82f24008')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$firefox-account-server$q$, $q$Firefox Account Server$q$, $q$https://mozilla-services.readthedocs.io/en/latest/howtos/run-fxa.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '864fba7c-ef16-406d-a4f4-ba7e53df55cc', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '864fba7c-ef16-406d-a4f4-ba7e53df55cc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$karakeep$q$, $q$Karakeep$q$, $q$https://karakeep.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fab34bce-400c-45a0-b3be-67931923345e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fab34bce-400c-45a0-b3be-67931923345e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$linkwarden$q$, $q$LinkWarden$q$, $q$https://linkwarden.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '012e0305-9686-40a7-a4fd-779a85ef6658', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '012e0305-9686-40a7-a4fd-779a85ef6658')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$syncmarks$q$, $q$SyncMarks$q$, $q$https://codeberg.org/Offerel/SyncMarks-Webapp$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$baikal$q$, $q$Baïkal$q$, $q$https://sabre.io/baikal/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '140a021c-be44-4b36-b077-68c7c32ded9b', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '140a021c-be44-4b36-b077-68c7c32ded9b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$davical$q$, $q$DAViCal$q$, $q$https://www.davical.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1107dc4a-e771-4cc9-887a-5ba99556372b', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1107dc4a-e771-4cc9-887a-5ba99556372b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$keeper-sh$q$, $q$Keeper.sh$q$, $q$https://keeper.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f9315862-aea5-4bd1-8365-1d5381cc4337', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9315862-aea5-4bd1-8365-1d5381cc4337')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$manage-my-damn-life$q$, $q$Manage My Damn Life$q$, $q$https://intri.in/manage-my-damn-life/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5876a809-20b6-4a29-bd49-189eea244f05', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5876a809-20b6-4a29-bd49-189eea244f05')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$radicale$q$, $q$Radicale$q$, $q$https://radicale.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95330f45-8ddc-4fe4-b00d-c7498b26f5ac', 'c60c123c-b9e8-49b4-ba2e-b0d7a2a1afe8', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95330f45-8ddc-4fe4-b00d-c7498b26f5ac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$anycable$q$, $q$AnyCable$q$, $q$https://anycable.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$centrifugo$q$, $q$Centrifugo$q$, $q$https://centrifugal.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1c38ae10-51dd-4efa-aae5-4c2f20863745', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c38ae10-51dd-4efa-aae5-4c2f20863745')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$chitchatter$q$, $q$Chitchatter$q$, $q$https://chitchatter.im/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dd982ac6-15fa-4c92-86fd-7b3367a55768', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd982ac6-15fa-4c92-86fd-7b3367a55768')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$conduit$q$, $q$Conduit$q$, $q$https://conduit.rs/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e84117d-d544-4f29-89e5-dcf3d6e9f06a', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e84117d-d544-4f29-89e5-dcf3d6e9f06a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$continuwuity$q$, $q$Continuwuity$q$, $q$https://continuwuity.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '35d633ed-e78a-443f-ae86-ab29e7bc10d2', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35d633ed-e78a-443f-ae86-ab29e7bc10d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$globaleaks$q$, $q$GlobaLeaks$q$, $q$https://www.globaleaks.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3573cac7-ce24-4055-bf17-e0ce515e92a5', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3573cac7-ce24-4055-bf17-e0ce515e92a5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$gnunet$q$, $q$GNUnet$q$, $q$https://gnunet.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '685a2454-07f3-45db-9fc9-03a9a78f0a9b', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '685a2454-07f3-45db-9fc9-03a9a78f0a9b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$hyphanet$q$, $q$Hyphanet$q$, $q$https://hyphanet.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e4e15aa2-1586-4029-bdbb-ccdc26761466', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4e15aa2-1586-4029-bdbb-ccdc26761466')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$jami$q$, $q$Jami$q$, $q$https://jami.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23bab05b-2293-4f46-a717-4934ba3b60c5', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23bab05b-2293-4f46-a717-4934ba3b60c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$live-helper-chat$q$, $q$Live Helper Chat$q$, $q$https://livehelperchat.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '593f4d82-8400-4cbe-bca8-aa39046b2d53', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '593f4d82-8400-4cbe-bca8-aa39046b2d53')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$mumble$q$, $q$Mumble$q$, $q$https://wiki.mumble.info/wiki/Main_Page$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$one-time-secret$q$, $q$One Time Secret$q$, $q$https://docs.onetimesecret.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d593e07-ef39-4892-8798-7b56252691bd', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d593e07-ef39-4892-8798-7b56252691bd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$ots$q$, $q$OTS$q$, $q$https://ots.fyi/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c4d14d8f-274a-43ad-92f6-8e61529bc76c', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4d14d8f-274a-43ad-92f6-8e61529bc76c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$retroshare$q$, $q$RetroShare$q$, $q$https://retroshare.cc$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '456fbc5c-1126-4664-96da-4a376804c0f8', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '456fbc5c-1126-4664-96da-4a376804c0f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$sama$q$, $q$SAMA$q$, $q$https://samacloud.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb62ae2f-72bd-4969-b944-dde6d7d56470', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb62ae2f-72bd-4969-b944-dde6d7d56470')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$screego$q$, $q$Screego$q$, $q$https://screego.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eac79351-70e4-48de-8016-9c64aff91049', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eac79351-70e4-48de-8016-9c64aff91049')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$spectrum-2$q$, $q$Spectrum 2$q$, $q$https://spectrum.im/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c2a0403-bded-465c-89d4-44577324f0fc', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c2a0403-bded-465c-89d4-44577324f0fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$stoat$q$, $q$Stoat$q$, $q$https://stoat.chat/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ec9cb7b-3758-48d4-b21c-ca4d6d43754e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$tiledesk$q$, $q$Tiledesk$q$, $q$https://tiledesk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2dc99054-a142-46e9-ba1a-fcacb6132ea9', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2dc99054-a142-46e9-ba1a-fcacb6132ea9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$tox$q$, $q$Tox$q$, $q$https://tox.chat/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86a4e6f7-b835-4bf1-b393-2519995d609a', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86a4e6f7-b835-4bf1-b393-2519995d609a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$tuwunel$q$, $q$Tuwunel$q$, $q$https://tuwunel.chat$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '345a3674-eba8-4d0e-a817-1203b09a6953', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '345a3674-eba8-4d0e-a817-1203b09a6953')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$typebot$q$, $q$Typebot$q$, $q$https://typebot.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1d7d4b6-0a0c-446a-a22f-7046fe96be45', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1d7d4b6-0a0c-446a-a22f-7046fe96be45')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$anonaddy$q$, $q$AnonAddy$q$, $q$https://anonaddy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$b1gmail$q$, $q$b1gMail$q$, $q$https://www.b1gmail.eu$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a7fb82b-cf5b-48e3-8862-a245becc0e75', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$debops$q$, $q$DebOps$q$, $q$https://docs.debops.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0f37df20-288c-490c-8a89-5a00b2c6478e', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f37df20-288c-490c-8a89-5a00b2c6478e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$docker-mailserver$q$, $q$docker-mailserver$q$, $q$https://docker-mailserver.github.io/docker-mailserver/edge/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6761ccd8-5a87-4df7-8db5-4222ccd81539', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6761ccd8-5a87-4df7-8db5-4222ccd81539')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$dovel$q$, $q$Dovel$q$, $q$https://dovel.email$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd1caaa4a-2950-4499-9b5a-375119656c09', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1caaa4a-2950-4499-9b5a-375119656c09')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$inboxen$q$, $q$Inboxen$q$, $q$https://inboxen.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1dea1981-a33c-4b6f-bacd-a384dacee7f2', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1dea1981-a33c-4b6f-bacd-a384dacee7f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$iredmail$q$, $q$iRedMail$q$, $q$https://www.iredmail.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba51550d-a30f-4ff6-991a-d6db68d152ca', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba51550d-a30f-4ff6-991a-d6db68d152ca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$mox$q$, $q$Mox$q$, $q$https://www.xmox.nl/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba65b701-bea2-49e3-a8e6-c127d99725d5', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba65b701-bea2-49e3-a8e6-c127d99725d5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$simplelogin$q$, $q$SimpleLogin$q$, $q$https://simplelogin.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e645d12e-427d-4de8-a46d-9232f2a915d2', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e645d12e-427d-4de8-a46d-9232f2a915d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$wildduck$q$, $q$wildduck$q$, $q$https://wildduck.email/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '591b7aee-2302-4201-805a-465e25e4cfbc', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '591b7aee-2302-4201-805a-465e25e4cfbc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$cyrus-imap$q$, $q$Cyrus IMAP$q$, $q$https://www.cyrusimap.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e2764a7-0bfa-42fa-913d-469e0d66e4ce', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e2764a7-0bfa-42fa-913d-469e0d66e4ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$davmail$q$, $q$DavMail$q$, $q$https://davmail.sourceforge.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a42ba043-aed3-4e2a-accc-c2fe75a65c67', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a42ba043-aed3-4e2a-accc-c2fe75a65c67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$dovecot$q$, $q$Dovecot$q$, $q$https://www.dovecot.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$chasquid$q$, $q$chasquid$q$, $q$https://blitiri.com.ar/p/chasquid/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd084534-24c8-4496-a272-eb646dc24f55', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd084534-24c8-4496-a272-eb646dc24f55')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$courier-mta$q$, $q$Courier MTA$q$, $q$https://www.courier-mta.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd0165e6b-299a-413e-8603-112e26c2317d', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd0165e6b-299a-413e-8603-112e26c2317d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$emailrelay$q$, $q$EmailRelay$q$, $q$https://emailrelay.sourceforge.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48dce657-93e5-4f57-b7c7-2ec20c859674', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48dce657-93e5-4f57-b7c7-2ec20c859674')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$exim$q$, $q$Exim$q$, $q$https://www.exim.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a5b0bebc-38eb-4762-ae9c-52a84181c2e6', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5b0bebc-38eb-4762-ae9c-52a84181c2e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$haraka$q$, $q$Haraka$q$, $q$https://haraka.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9af66bbf-b130-4408-9f34-c92e212205a4', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9af66bbf-b130-4408-9f34-c92e212205a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$opensmtpd$q$, $q$OpenSMTPD$q$, $q$https://opensmtpd.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99730711-228d-48f9-acb0-4108e2522d7d', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99730711-228d-48f9-acb0-4108e2522d7d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$postfix$q$, $q$Postfix$q$, $q$http://www.postfix.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8af6231d-94ed-4f47-822f-a4b6cf8b5e1f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$sendmail$q$, $q$Sendmail$q$, $q$https://www.proofpoint.com/us/products/email-protection/open-source-email-solution$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4741d451-b4f1-4455-802f-b4d98dfdba96', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4741d451-b4f1-4455-802f-b4d98dfdba96')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$hyperkitty$q$, $q$HyperKitty$q$, $q$https://wiki.list.org/HyperKitty$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11597642-219f-4d25-9f31-8486b2b24eba', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11597642-219f-4d25-9f31-8486b2b24eba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$mailman$q$, $q$Mailman$q$, $q$https://www.list.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09b6e7a8-b810-4a31-9ecf-e4e0719bc76c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$mlmmj$q$, $q$mlmmj$q$, $q$https://mlmmj.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f8dc7535-36b0-4fce-a7c3-155bcabd5963', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8dc7535-36b0-4fce-a7c3-155bcabd5963')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$phplist$q$, $q$phpList$q$, $q$https://www.phplist.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05c5746c-f3a3-47a9-b647-2b4ab14ad200', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05c5746c-f3a3-47a9-b647-2b4ab14ad200')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$postorius$q$, $q$Postorius$q$, $q$https://docs.mailman3.org/projects/postorius/en/latest/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6930e11f-db83-4fac-9da3-6754439654e5', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6930e11f-db83-4fac-9da3-6754439654e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$schleuder$q$, $q$Schleuder$q$, $q$https://schleuder.nadir.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$sympa$q$, $q$Sympa$q$, $q$https://www.sympa.community/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$cypht$q$, $q$Cypht$q$, $q$https://cypht.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '665b1bfd-5f00-4b50-b428-2743e447dd31', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '665b1bfd-5f00-4b50-b428-2743e447dd31')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$roundcube$q$, $q$Roundcube$q$, $q$https://roundcube.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb4553dc-a02b-4c01-a2c6-6a0dc57786d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$snappymail$q$, $q$SnappyMail$q$, $q$https://snappymail.eu/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6bf9cca5-6080-4b58-bce7-1bc8b964a3f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$squirrelmail$q$, $q$SquirrelMail$q$, $q$https://squirrelmail.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$ergo$q$, $q$Ergo$q$, $q$https://ergo.chat/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ccc97952-4222-4741-b1ae-b6303ffa2241', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ccc97952-4222-4741-b1ae-b6303ffa2241')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$inspircd$q$, $q$InspIRCd$q$, $q$https://www.inspircd.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3277e798-0260-4d98-ba6f-cc95e7dc5b48', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3277e798-0260-4d98-ba6f-cc95e7dc5b48')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$kiwi-irc$q$, $q$Kiwi IRC$q$, $q$https://kiwiirc.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c54263d-78af-448f-8e86-9807365dad70', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c54263d-78af-448f-8e86-9807365dad70')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$ngircd$q$, $q$ngircd$q$, $q$https://ngircd.barton.de/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9bad036a-a837-4c1f-9a3f-9f0c17e20ff1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$quassel-irc$q$, $q$Quassel IRC$q$, $q$https://quassel-irc.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2fb7e2c0-a5af-47c6-b92d-1e035732d406', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2fb7e2c0-a5af-47c6-b92d-1e035732d406')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$robust-irc$q$, $q$Robust IRC$q$, $q$https://robustirc.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '979bd91f-de34-4fc6-a7cd-59bb08136756', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '979bd91f-de34-4fc6-a7cd-59bb08136756')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$the-lounge$q$, $q$The Lounge$q$, $q$https://thelounge.chat/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3bc3a20-56e4-4435-a993-1159046d7812', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3bc3a20-56e4-4435-a993-1159046d7812')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$unrealircd$q$, $q$UnrealIRCd$q$, $q$https://www.unrealircd.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a4646d4-397c-4756-8f0b-985b9dce7a8e', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a4646d4-397c-4756-8f0b-985b9dce7a8e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$weechat$q$, $q$Weechat$q$, $q$https://weechat.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee6c8b88-f000-4f14-8c23-19ab2bda304c', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee6c8b88-f000-4f14-8c23-19ab2bda304c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$znc$q$, $q$ZNC$q$, $q$https://wiki.znc.in/ZNC$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1f9434f4-e927-45b2-a88a-bd4e32807373', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f9434f4-e927-45b2-a88a-bd4e32807373')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$asterisk$q$, $q$Asterisk$q$, $q$https://www.asterisk.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5208a8e5-fcd9-4333-a413-ca2e73058d97', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5208a8e5-fcd9-4333-a413-ca2e73058d97')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$flexisip$q$, $q$Flexisip$q$, $q$https://www.linphone.org/en/flexisip-sip-server/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1e7307b-a3f8-4883-8420-6b25b0764ca6', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1e7307b-a3f8-4883-8420-6b25b0764ca6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$freepbx$q$, $q$Freepbx$q$, $q$https://www.freepbx.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a33553b-3246-4484-92da-a333ec40b5e4', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a33553b-3246-4484-92da-a333ec40b5e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$freeswitch$q$, $q$FreeSWITCH$q$, $q$https://freeswitch.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '359edbcb-cdb7-4e0e-96ec-f81303289aa2', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '359edbcb-cdb7-4e0e-96ec-f81303289aa2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$fusionpbx$q$, $q$FusionPBX$q$, $q$https://www.fusionpbx.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$kamailio$q$, $q$Kamailio$q$, $q$https://www.kamailio.org/w/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9f4e2487-8444-49f1-b4b1-729b8e49b3c9', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f4e2487-8444-49f1-b4b1-729b8e49b3c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$opensips$q$, $q$openSIPS$q$, $q$https://opensips.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9571c8ca-968b-4f1b-93a0-ecf103c67bfa', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9571c8ca-968b-4f1b-93a0-ecf103c67bfa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$routr$q$, $q$Routr$q$, $q$https://routr.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$sip3$q$, $q$SIP3$q$, $q$https://sip3.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d6bc0d1-04aa-46ba-873c-4820037e561d', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d6bc0d1-04aa-46ba-873c-4820037e561d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$sipcapture-homer$q$, $q$SIPCAPTURE Homer$q$, $q$https://www.sipcapture.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c77c93d7-d6d3-492d-95bf-b629ef60e4c2', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c77c93d7-d6d3-492d-95bf-b629ef60e4c2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$wazo$q$, $q$Wazo$q$, $q$https://wazo-platform.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '688d8396-0ab3-420a-ba26-729121f64809', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '688d8396-0ab3-420a-ba26-729121f64809')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$yeti-switch$q$, $q$Yeti-Switch$q$, $q$https://yeti-switch.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8734f0fa-231e-48e0-b9b8-faa68fe18c4b', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8734f0fa-231e-48e0-b9b8-faa68fe18c4b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$akkoma$q$, $q$Akkoma$q$, $q$https://akkoma.social/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '747424fb-e9a8-434a-b7eb-6df34846ecf9', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '747424fb-e9a8-434a-b7eb-6df34846ecf9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$answer$q$, $q$Answer$q$, $q$https://answer.apache.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b5cba06-a001-4209-a582-cc94a5c108b0', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b5cba06-a001-4209-a582-cc94a5c108b0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$artalk$q$, $q$Artalk$q$, $q$https://artalk.js.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$asmbb$q$, $q$AsmBB$q$, $q$https://board.asm32.info$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$buddypress$q$, $q$BuddyPress$q$, $q$https://buddypress.org/about/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9bcf631f-554c-4a18-befe-b606018906d6', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9bcf631f-554c-4a18-befe-b606018906d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$coral$q$, $q$Coral$q$, $q$https://coralproject.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '67b35559-aa14-4347-b26e-f153e6e02e8c', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '67b35559-aa14-4347-b26e-f153e6e02e8c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$diaspora$q$, $q$diaspora*$q$, $q$https://diasporafoundation.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8116962c-5001-43e3-b838-698a93f20293', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8116962c-5001-43e3-b838-698a93f20293')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$elgg$q$, $q$Elgg$q$, $q$https://elgg.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '52d15888-e7a1-4bf4-a86f-407a65530036', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52d15888-e7a1-4bf4-a86f-407a65530036')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$enigma-1-2-bbs$q$, $q$Enigma 1/2 BBS$q$, $q$https://nuskooler.github.io/enigma-bbs/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fcc4c746-3637-450b-9b93-e0c4703382b5', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fcc4c746-3637-450b-9b93-e0c4703382b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$gotosocial$q$, $q$GoToSocial$q$, $q$https://docs.gotosocial.org/en/latest/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f9ddf754-14b8-4ba3-b736-ca0959c8894d', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9ddf754-14b8-4ba3-b736-ca0959c8894d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$hatsu$q$, $q$Hatsu$q$, $q$https://hatsu.cli.rs/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ef53b6f-d698-4b20-ab83-57c388a50f2d', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ef53b6f-d698-4b20-ab83-57c388a50f2d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$hubzilla$q$, $q$Hubzilla$q$, $q$https://hubzilla.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a66fca94-72b5-448d-a986-f5944ee873d8', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a66fca94-72b5-448d-a986-f5944ee873d8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$iceshrimp-net$q$, $q$Iceshrimp.NET$q$, $q$https://iceshrimp.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc45a7d5-8397-4680-90b5-60974a154019', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc45a7d5-8397-4680-90b5-60974a154019')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$isso$q$, $q$Isso$q$, $q$https://isso-comments.de/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '45e476ca-e137-4841-abde-19c6273464c0', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45e476ca-e137-4841-abde-19c6273464c0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$misago$q$, $q$Misago$q$, $q$https://misago-project.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2b43eeda-4ceb-459a-a73d-d764275698c6', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b43eeda-4ceb-459a-a73d-d764275698c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$movim$q$, $q$Movim$q$, $q$https://movim.eu/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4bb6de5a-4c58-4a03-a3da-62dde82c521f', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bb6de5a-4c58-4a03-a3da-62dde82c521f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$ossn$q$, $q$OSSN$q$, $q$https://www.opensource-socialnetwork.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f05bad91-5d44-4ab8-bd64-a36e981b6349', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f05bad91-5d44-4ab8-bd64-a36e981b6349')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$piefed$q$, $q$PieFed$q$, $q$https://join.piefed.social$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$qpixel$q$, $q$qpixel$q$, $q$https://codidact.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6f591ae-29a7-48f3-86f6-535c814b5f34', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6f591ae-29a7-48f3-86f6-535c814b5f34')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$remark42$q$, $q$remark42$q$, $q$https://remark42.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f1b6cce1-f828-4060-b252-e9dae59643ea', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1b6cce1-f828-4060-b252-e9dae59643ea')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$scoold$q$, $q$Scoold$q$, $q$https://scoold.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c4424b7-aba0-4e04-9853-edd33d4b7072', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c4424b7-aba0-4e04-9853-edd33d4b7072')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$simple-machines-forum$q$, $q$Simple Machines Forum$q$, $q$https://www.simplemachines.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$socialhome$q$, $q$Socialhome$q$, $q$https://socialhome.network$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a76489e-3b83-431e-b735-25922ce9a2b5', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a76489e-3b83-431e-b735-25922ce9a2b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$talkyard$q$, $q$Talkyard$q$, $q$https://www.talkyard.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1345ae06-82b8-4acb-9958-4dfcce5198b6', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1345ae06-82b8-4acb-9958-4dfcce5198b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$yarn-social$q$, $q$yarn.social$q$, $q$https://yarn.social$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '656d2c55-b8db-44a2-823d-f15eac0f5ffb', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '656d2c55-b8db-44a2-823d-f15eac0f5ffb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$janus$q$, $q$Janus$q$, $q$https://janus.conf.meetecho.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fabd1ffb-a233-4c33-bb07-50f94bcfa2d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$mirotalk-c2c$q$, $q$MiroTalk C2C$q$, $q$https://c2c.mirotalk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '71c7930e-f978-4543-907b-1d45df9c86d7', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71c7930e-f978-4543-907b-1d45df9c86d7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$mirotalk-p2p$q$, $q$MiroTalk P2P$q$, $q$https://p2p.mirotalk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0650c50c-6e38-47ff-9b1c-ad5c7004e35a', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0650c50c-6e38-47ff-9b1c-ad5c7004e35a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$mirotalk-sfu$q$, $q$MiroTalk SFU$q$, $q$https://sfu.mirotalk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b7e3dfde-b66e-49af-b87b-8a41ddca3f88', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7e3dfde-b66e-49af-b87b-8a41ddca3f88')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$plugnmeet$q$, $q$plugNmeet$q$, $q$https://www.plugnmeet.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6bb04494-9b4c-4959-9345-35cb07ffe59d', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6bb04494-9b4c-4959-9345-35cb07ffe59d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$ejabberd$q$, $q$ejabberd$q$, $q$https://www.ejabberd.im/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7060eb6f-8b75-4dcd-b7ed-90b63b5d8986')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$mongooseim$q$, $q$MongooseIM$q$, $q$https://www.erlang-solutions.com/products/mongooseim.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c477791e-4aea-459c-b6d0-e2247ad6316f', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c477791e-4aea-459c-b6d0-e2247ad6316f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$openfire$q$, $q$Openfire$q$, $q$https://www.igniterealtime.org/projects/openfire/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '46b963c1-7eca-4b94-ade9-a168bc61594e', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46b963c1-7eca-4b94-ade9-a168bc61594e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$prosody-im$q$, $q$Prosody IM$q$, $q$https://prosody.im/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd57f5a1-59c8-4b23-bc86-a81e777d5f57', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd57f5a1-59c8-4b23-bc86-a81e777d5f57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$snikket$q$, $q$Snikket$q$, $q$https://snikket.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e600f81d-f148-4525-b8ff-0baa4cd86eab', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e600f81d-f148-4525-b8ff-0baa4cd86eab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$tigase$q$, $q$Tigase$q$, $q$https://tigase.net/xmpp-server$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '93755188-c1ee-4269-9581-f911c716c21f', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '93755188-c1ee-4269-9581-f911c716c21f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$converse-js$q$, $q$Converse.js$q$, $q$https://conversejs.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b2670c3-5248-4140-a4b2-ade8ee34ed2b', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b2670c3-5248-4140-a4b2-ade8ee34ed2b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e38ebadd-d243-4db5-95a7-1bc30798d6e1', $q$libervia$q$, $q$Libervia$q$, $q$https://repos.goffi.org/libervia-web$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e38ebadd-d243-4db5-95a7-1bc30798d6e1', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e38ebadd-d243-4db5-95a7-1bc30798d6e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$salut-a-toi$q$, $q$Salut à Toi$q$, $q$https://www.salut-a-toi.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0da45043-d5e4-43e0-b1d2-e47565c3ce95', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0da45043-d5e4-43e0-b1d2-e47565c3ce95')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$acp-admin$q$, $q$ACP Admin$q$, $q$https://acp-admin.ch/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$foodcoopshop$q$, $q$FoodCoopShop$q$, $q$https://www.foodcoopshop.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '640f5401-b849-4bad-b457-90e05c828c55', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '640f5401-b849-4bad-b457-90e05c828c55')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$foodsoft$q$, $q$Foodsoft$q$, $q$https://foodcoops.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1807f881-55e3-4c8e-81e1-3548278fad9e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1807f881-55e3-4c8e-81e1-3548278fad9e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$hive-pal$q$, $q$Hive-Pal$q$, $q$https://hivepal.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4b370b9c-680b-4e36-b5eb-96116115e439', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b370b9c-680b-4e36-b5eb-96116115e439')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$juntagrico$q$, $q$juntagrico$q$, $q$https://juntagrico.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6c0d797b-de68-4b90-9beb-fcaefd4f1108', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c0d797b-de68-4b90-9beb-fcaefd4f1108')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$open-food-network$q$, $q$Open Food Network$q$, $q$https://www.openfoodnetwork.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a8beb2a4-e936-455d-aa4d-c21b017173fb', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8beb2a4-e936-455d-aa4d-c21b017173fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$openolitor$q$, $q$OpenOlitor$q$, $q$https://openolitor.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0070da27-b0bd-4679-add1-4cfaeb297161', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0070da27-b0bd-4679-add1-4cfaeb297161')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$indico$q$, $q$indico$q$, $q$https://getindico.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '367a6bce-9b7f-4b10-9faa-47430b894121', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '367a6bce-9b7f-4b10-9faa-47430b894121')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$motion-tools-antragsgrun$q$, $q$motion.tools (Antragsgrün)$q$, $q$https://motion.tools/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c846e33-a0ef-4fe5-b290-203fbdef22b6', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c846e33-a0ef-4fe5-b290-203fbdef22b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$openslides$q$, $q$OpenSlides$q$, $q$https://openslides.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9dee94a4-8e82-47af-beeb-930afb5a54a0', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9dee94a4-8e82-47af-beeb-930afb5a54a0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$osem$q$, $q$osem$q$, $q$https://osem.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff42786e-7806-4c57-bfcc-7884411de95a', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff42786e-7806-4c57-bfcc-7884411de95a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$alfresco-community-edition$q$, $q$Alfresco Community Edition$q$, $q$https://www.alfresco.com/products/community/download$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2fed864f-8761-4cf7-88e9-e53eb76e2f42', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$apostrophe$q$, $q$Apostrophe$q$, $q$https://apostrophecms.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bea71619-57c8-4b82-a974-34977a4a07b2', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bea71619-57c8-4b82-a974-34977a4a07b2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$automad$q$, $q$Automad$q$, $q$https://automad.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '355c526d-e07b-4c3a-acc9-565c7b6f3d13', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$bludit$q$, $q$Bludit$q$, $q$https://www.bludit.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2dacf89b-e2ef-4c5b-abc5-d221801f171b', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2dacf89b-e2ef-4c5b-abc5-d221801f171b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$bolt-cms$q$, $q$Bolt CMS$q$, $q$https://boltcms.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ddf71270-678f-48af-a74a-407a4c5982bb', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ddf71270-678f-48af-a74a-407a4c5982bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$cms-made-simple$q$, $q$CMS Made Simple$q$, $q$https://www.cmsmadesimple.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '330370f7-f51f-46b8-a8a2-9d0d70a14749', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '330370f7-f51f-46b8-a8a2-9d0d70a14749')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$contao$q$, $q$Contao$q$, $q$https://contao.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2ffe72c4-8110-4eaf-b546-5d3899b26ca0', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ffe72c4-8110-4eaf-b546-5d3899b26ca0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$couchcms$q$, $q$CouchCMS$q$, $q$https://www.couchcms.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ae627ac-41a3-4d2a-80ef-75696ca1cfb2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$drupal$q$, $q$Drupal$q$, $q$https://www.drupal.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f8fefc7b-8f41-4745-a164-82c127ab7a0f', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8fefc7b-8f41-4745-a164-82c127ab7a0f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$elabftw$q$, $q$eLabFTW$q$, $q$https://www.elabftw.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '40837e93-aef4-40d6-a619-0330eaa64ea6', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40837e93-aef4-40d6-a619-0330eaa64ea6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$joomla$q$, $q$Joomla!$q$, $q$https://www.joomla.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b17cb33e-88ec-4a90-a49e-1ba15fca71cb', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b17cb33e-88ec-4a90-a49e-1ba15fca71cb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$localess$q$, $q$Localess$q$, $q$https://localess.org/home$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba1e26ba-4573-4e22-a55a-4786e0233908', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba1e26ba-4573-4e22-a55a-4786e0233908')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$modx$q$, $q$MODX$q$, $q$https://modx.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba2afed9-4dd0-452e-8365-2334d0c54742', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba2afed9-4dd0-452e-8365-2334d0c54742')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$neos$q$, $q$Neos$q$, $q$https://www.neos.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe036b27-0ca6-4aa1-8287-c9d8dafd6b57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$pimcore$q$, $q$Pimcore$q$, $q$http://www.pimcore.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '392c0dc0-952f-4089-9489-2c63d22bd5a1', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '392c0dc0-952f-4089-9489-2c63d22bd5a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$plone$q$, $q$Plone$q$, $q$https://plone.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '97866dd0-6dea-4e55-a594-ffa15a710dc6', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97866dd0-6dea-4e55-a594-ffa15a710dc6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$publify$q$, $q$Publify$q$, $q$https://publify.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8c59b52-b5c2-4b4d-9425-6cc9d93670f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$redaxo$q$, $q$REDAXO$q$, $q$https://www.redaxo.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bfc00fd3-6190-4930-b4d3-4453015d69ed', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfc00fd3-6190-4930-b4d3-4453015d69ed')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$spip$q$, $q$SPIP$q$, $q$https://www.spip.net/fr$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f7206e3a-e992-4f4e-b237-ddd3af5fbec1', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7206e3a-e992-4f4e-b237-ddd3af5fbec1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$squidex$q$, $q$Squidex$q$, $q$https://squidex.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '63cfef32-95ca-4b6d-8212-b1eeaaace93b', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$superdesk$q$, $q$Superdesk$q$, $q$https://superdesk.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '21706d7e-fb96-4cf7-b074-0ee12931d3ca', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$textpattern$q$, $q$Textpattern$q$, $q$https://textpattern.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b080413-76d9-4f14-9aef-d7d87f04bc3d', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$typemill$q$, $q$Typemill$q$, $q$https://typemill.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '08338430-d0a4-4361-b6b5-4d22262c823c', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08338430-d0a4-4361-b6b5-4d22262c823c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$vvveb-cms$q$, $q$Vvveb CMS$q$, $q$https://www.vvveb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64642ef0-b3ed-44e3-9e65-2ef843fbfc7e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$wagtail$q$, $q$Wagtail$q$, $q$https://wagtail.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eaf343b7-68ce-48ea-8f63-afd6f23421df', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eaf343b7-68ce-48ea-8f63-afd6f23421df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$wintercms$q$, $q$WinterCMS$q$, $q$https://wintercms.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b894fce3-7970-4562-8f82-502c745c7472', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b894fce3-7970-4562-8f82-502c745c7472')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$wondercms$q$, $q$WonderCMS$q$, $q$https://www.wondercms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd7da54f6-2b64-440b-9f41-a831adbd9e11', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7da54f6-2b64-440b-9f41-a831adbd9e11')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$corteza$q$, $q$Corteza$q$, $q$https://docs.cortezaproject.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '925db15a-65f7-4d4f-bb9d-cd05222b869f', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '925db15a-65f7-4d4f-bb9d-cd05222b869f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$django-crm$q$, $q$Django-CRM$q$, $q$https://DjangoCRM.github.io/info/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb776dbd-be66-4afc-b3df-cfd58e6b6dd3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$adminer$q$, $q$Adminer$q$, $q$https://www.adminer.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0e2f15fa-8304-4251-896f-4956273cb503', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0e2f15fa-8304-4251-896f-4956273cb503')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$azimutt$q$, $q$Azimutt$q$, $q$https://azimutt.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4b8c7210-2173-4e7a-95b0-7458564b09fd', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b8c7210-2173-4e7a-95b0-7458564b09fd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$bytebase$q$, $q$Bytebase$q$, $q$https://www.bytebase.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$chartbrew$q$, $q$Chartbrew$q$, $q$https://chartbrew.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e940e3d2-e870-4b3e-819f-28d10c4d7db4', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e940e3d2-e870-4b3e-819f-28d10c4d7db4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$chartdb$q$, $q$ChartDB$q$, $q$https://chartdb.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d81dd7e-c136-40e4-8989-d72a34c9daf3', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d81dd7e-c136-40e4-8989-d72a34c9daf3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$cloudbeaver$q$, $q$CloudBeaver$q$, $q$https://dbeaver.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d9c68d3-f61e-4d38-95a1-0fda3d821068', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$d9$q$, $q$d9$q$, $q$https://d9.webcapsule.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b2320603-ad1f-48d1-a744-9445e8269225', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2320603-ad1f-48d1-a744-9445e8269225')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$databunker$q$, $q$Databunker$q$, $q$https://databunker.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd09c518a-e080-4d5d-83f0-8565089486cf', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd09c518a-e080-4d5d-83f0-8565089486cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$datasette$q$, $q$Datasette$q$, $q$https://datasette.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd9436d03-14e1-4e93-969b-27951c8697e7', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd9436d03-14e1-4e93-969b-27951c8697e7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$limbas$q$, $q$Limbas$q$, $q$https://www.limbas.com/en/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a77d14f1-cb26-4d11-9d26-6fc0a6e26e61')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$adguard-home$q$, $q$AdGuard Home$q$, $q$https://adguard.com/en/adguard-home/overview.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b231ad20-3ac0-418a-8e94-0bcad60fb2de', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$blocky$q$, $q$blocky$q$, $q$https://0xerr0r.github.io/blocky/latest/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '68da8924-7233-4187-b3c7-8e5486ea5ee0', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68da8924-7233-4187-b3c7-8e5486ea5ee0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$maza-ad-blocking$q$, $q$Maza ad blocking$q$, $q$https://maza-ad-blocking.andros.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff61bcc5-91e7-4059-9a0b-4ca89539d8cb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$pi-hole$q$, $q$Pi-hole$q$, $q$https://pi-hole.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '08450324-4200-4667-af14-f12d8180794b', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08450324-4200-4667-af14-f12d8180794b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$technitium-dns-server$q$, $q$Technitium DNS Server$q$, $q$https://technitium.com/dns/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '324e805f-15ca-4f08-af33-49fee415253c', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '324e805f-15ca-4f08-af33-49fee415253c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$bentopdf$q$, $q$BentoPDF$q$, $q$https://bentopdf.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$gotenberg$q$, $q$Gotenberg$q$, $q$https://gotenberg.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cc56b3f3-f4c5-4009-b322-e2f5719481b6', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc56b3f3-f4c5-4009-b322-e2f5719481b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$i-librarian$q$, $q$I, Librarian$q$, $q$https://i-librarian.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff47afbc-51e2-479e-9cbb-45a5ec96314e', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff47afbc-51e2-479e-9cbb-45a5ec96314e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$papra$q$, $q$Papra$q$, $q$https://papra.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '993944af-a2d6-42bb-a3a0-2b1c8a4c460d', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '993944af-a2d6-42bb-a3a0-2b1c8a4c460d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$pdfding$q$, $q$PdfDing$q$, $q$https://www.pdfding.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7407b9cd-1500-4f27-a02b-adda67302c80', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7407b9cd-1500-4f27-a02b-adda67302c80')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$simpledms$q$, $q$SimpleDMS$q$, $q$https://simpledms.eu$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b160eec3-7dec-4749-aa87-4cbf8e786590', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b160eec3-7dec-4749-aa87-4cbf8e786590')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$atsumeru$q$, $q$Atsumeru$q$, $q$https://atsumeru.xyz$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95db99cc-d2cd-4227-a213-282aa828ef80', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95db99cc-d2cd-4227-a213-282aa828ef80')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$calibre$q$, $q$Calibre$q$, $q$https://calibre-ebook.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e99368f-6adc-431d-9ed6-588c0d07395e', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e99368f-6adc-431d-9ed6-588c0d07395e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$kapowarr$q$, $q$Kapowarr$q$, $q$https://casvt.github.io/Kapowarr/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '298368f7-68f8-4264-b78c-a684a417a0b3', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '298368f7-68f8-4264-b78c-a684a417a0b3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$kavita$q$, $q$Kavita$q$, $q$https://www.kavitareader.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e4a075d-f88d-4c7c-b3da-ff99a7d73884', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e4a075d-f88d-4c7c-b3da-ff99a7d73884')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$komga$q$, $q$Komga$q$, $q$https://komga.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '45a5beb8-a950-4bc0-908e-c7d7b3bef34a', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45a5beb8-a950-4bc0-908e-c7d7b3bef34a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$stump$q$, $q$Stump$q$, $q$https://www.stumpapp.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '002172fd-e41e-488b-88d6-f387f92abea3', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '002172fd-e41e-488b-88d6-f387f92abea3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$dspace$q$, $q$DSpace$q$, $q$http://www.dspace.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ac2da229-e50c-4b42-a614-0213a13fd14e', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac2da229-e50c-4b42-a614-0213a13fd14e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$eprints$q$, $q$EPrints$q$, $q$https://www.eprints.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99b70ad3-9af0-4ac2-9da3-d697947ef658', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99b70ad3-9af0-4ac2-9da3-d697947ef658')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$fedora-commons-repository$q$, $q$Fedora Commons Repository$q$, $q$https://wiki.lyrasis.org/display/FF/Fedora+Repository+Home$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5e577d8-a36b-4321-96a7-960980e7373b', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5e577d8-a36b-4321-96a7-960980e7373b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$inveniordm$q$, $q$InvenioRDM$q$, $q$https://inveniordm.docs.cern.ch/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b860b3a-7f1c-4237-9c04-9f584f03194c', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b860b3a-7f1c-4237-9c04-9f584f03194c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$islandora$q$, $q$Islandora$q$, $q$https://www.islandora.ca/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '014ca794-6131-4f44-a025-a0ff78da3c46', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '014ca794-6131-4f44-a025-a0ff78da3c46')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$samvera-hyrax$q$, $q$Samvera Hyrax$q$, $q$https://samvera.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f31da656-5abb-4ac5-8a10-1c4937d3ecce', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f31da656-5abb-4ac5-8a10-1c4937d3ecce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$evergreen$q$, $q$Evergreen$q$, $q$https://evergreen-ils.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a72c0059-3aea-470f-b7ae-d8605c64dfda', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a72c0059-3aea-470f-b7ae-d8605c64dfda')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$koha$q$, $q$Koha$q$, $q$https://koha-community.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6642f7be-b54a-4974-8b1c-50cd8c2c2785', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6642f7be-b54a-4974-8b1c-50cd8c2c2785')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$rero-ils$q$, $q$RERO ILS$q$, $q$https://rero21.ch/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea0dd7b0-e3e8-4424-afc9-75a3c6224c09')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$aimeos$q$, $q$Aimeos$q$, $q$https://aimeos.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c1eb1b8-1598-427b-9f30-311ffe09b8d3', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$coreshop$q$, $q$CoreShop$q$, $q$https://www.coreshop.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '69b58e37-645a-40d2-a5a2-c859a6b2c481', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69b58e37-645a-40d2-a5a2-c859a6b2c481')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$evershop$q$, $q$EverShop$q$, $q$https://evershop.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0cb0a80b-0a80-4999-85e6-81d72d140ab9', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0cb0a80b-0a80-4999-85e6-81d72d140ab9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$microweber$q$, $q$Microweber$q$, $q$https://microweber.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa18bfe8-dba3-4e07-9d0c-7fd408d29121', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa18bfe8-dba3-4e07-9d0c-7fd408d29121')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$s-cart$q$, $q$s-cart$q$, $q$https://s-cart.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '73e6abda-a9cd-47e5-b644-042f92c64ac5', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '73e6abda-a9cd-47e5-b644-042f92c64ac5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$thelia$q$, $q$Thelia$q$, $q$https://thelia.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3dd97986-493e-470c-90a6-4ef415e3a585', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3dd97986-493e-470c-90a6-4ef415e3a585')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$commafeed$q$, $q$CommaFeed$q$, $q$https://www.commafeed.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c3476f2a-8c51-4b81-9db1-f7d876d3be6b', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3476f2a-8c51-4b81-9db1-f7d876d3be6b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$feeds-fun$q$, $q$Feeds Fun$q$, $q$https://feeds.fun/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6e8f44a2-732d-4807-a318-25a5ce7d982d', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e8f44a2-732d-4807-a318-25a5ce7d982d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$freshrss$q$, $q$FreshRSS$q$, $q$https://freshrss.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '98aaa86f-78de-4ac7-a8a6-37ad046c4363', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '98aaa86f-78de-4ac7-a8a6-37ad046c4363')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$jarr$q$, $q$JARR$q$, $q$https://1pxsolidblack.pl/jarr-en.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1030679b-2caa-4c26-9774-5521af246bfb', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1030679b-2caa-4c26-9774-5521af246bfb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$miniflux$q$, $q$Miniflux$q$, $q$https://miniflux.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '126ce4f2-e1c8-43fc-b77f-37c96ff7806a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '126ce4f2-e1c8-43fc-b77f-37c96ff7806a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$newsblur$q$, $q$NewsBlur$q$, $q$https://www.newsblur.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '70519451-7711-4cb1-9596-53310b5b53d4', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70519451-7711-4cb1-9596-53310b5b53d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$newspipe$q$, $q$Newspipe$q$, $q$https://git.sr.ht/~cedric/newspipe$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$readflow$q$, $q$Readflow$q$, $q$https://readflow.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b8dd75e-cb27-4973-af45-0de6a657268d', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b8dd75e-cb27-4973-af45-0de6a657268d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$rsshub$q$, $q$RSSHub$q$, $q$https://docs.rsshub.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '97ffdc76-9598-495d-a32e-3ec8c21cde65', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97ffdc76-9598-495d-a32e-3ec8c21cde65')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$selfoss$q$, $q$Selfoss$q$, $q$https://selfoss.aditu.de/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c279c42d-acd3-443e-8e69-69c91b4a2455', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c279c42d-acd3-443e-8e69-69c91b4a2455')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$tiny-tiny-rss$q$, $q$Tiny Tiny RSS$q$, $q$https://tt-rss.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f00ab228-25cf-4d37-82c5-5df4bbab3062', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f00ab228-25cf-4d37-82c5-5df4bbab3062')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$tinyfeed$q$, $q$TinyFeed$q$, $q$https://feed.lovergne.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd3359f3-5c52-465c-94cd-46d304141c29', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd3359f3-5c52-465c-94cd-46d304141c29')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$upvote-rss$q$, $q$Upvote RSS$q$, $q$https://www.upvote-rss.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd63cd81e-6805-4383-b257-12cd36fa4b4c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd63cd81e-6805-4383-b257-12cd36fa4b4c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$bewcloud$q$, $q$bewCloud$q$, $q$https://bewcloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b9f2a9ff-f6e9-415b-8ffe-221f389239e2', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9f2a9ff-f6e9-415b-8ffe-221f389239e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$cloudreve$q$, $q$Cloudreve$q$, $q$https://cloudreve.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c0ffef8-0b61-4153-bb6a-0904755b7f86', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$git-annex$q$, $q$Git Annex$q$, $q$https://git-annex.branchable.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '89ceb22c-3639-45b9-b003-00aa1f289c00', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89ceb22c-3639-45b9-b003-00aa1f289c00')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$kinto$q$, $q$Kinto$q$, $q$https://kinto.readthedocs.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5f2b023-ad94-4d73-8138-8c4e2d679679', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5f2b023-ad94-4d73-8138-8c4e2d679679')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$opencloud$q$, $q$OpenCloud$q$, $q$https://docs.opencloud.eu/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c5146704-2de4-4305-9ffc-65de453586a7', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5146704-2de4-4305-9ffc-65de453586a7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$openssh-sftp-server$q$, $q$OpenSSH SFTP server$q$, $q$https://www.openssh.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$puter$q$, $q$Puter$q$, $q$https://puter.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd43ef06f-bad4-42e0-8b7a-9c651d64b167', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd43ef06f-bad4-42e0-8b7a-9c651d64b167')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$samba$q$, $q$Samba$q$, $q$https://www.samba.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '592933ba-3f90-4b7b-9d93-73fb6b1fd373', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '592933ba-3f90-4b7b-9d93-73fb6b1fd373')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$sync-in$q$, $q$Sync-in$q$, $q$https://sync-in.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '89b689d1-3d07-4577-bcb7-a18bdd8ce661', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$zenko-cloudserver$q$, $q$Zenko CloudServer$q$, $q$https://www.zenko.io/cloudserver$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '38a2e613-81b8-4dd1-a50b-c900db574bb3', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38a2e613-81b8-4dd1-a50b-c900db574bb3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$zot-oci-registry$q$, $q$ZOT OCI Registry$q$, $q$https://zotregistry.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$bittorrent-tracker$q$, $q$bittorrent-tracker$q$, $q$https://webtorrent.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2656ef1b-64da-4cfd-a088-8db929a97a0a', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2656ef1b-64da-4cfd-a088-8db929a97a0a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$deluge$q$, $q$Deluge$q$, $q$https://deluge-torrent.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a4888a56-3678-4b59-b919-440fd6bf1847', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4888a56-3678-4b59-b919-440fd6bf1847')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$privydrop$q$, $q$PrivyDrop$q$, $q$https://www.privydrop.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7cb48bdf-2a61-44e4-8397-27e42d5d763d', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cb48bdf-2a61-44e4-8397-27e42d5d763d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$qbittorrent$q$, $q$qBittorrent$q$, $q$https://www.qbittorrent.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7196ce6f-7454-4ae5-8a10-7ac77752c856', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7196ce6f-7454-4ae5-8a10-7ac77752c856')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$transmission$q$, $q$Transmission$q$, $q$https://transmissionbt.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae1278c1-c356-40cb-b81c-795513168fe4', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae1278c1-c356-40cb-b81c-795513168fe4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$015$q$, $q$015$q$, $q$https://send.fudaoyuan.icu$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae67381f-84b3-429f-9ba2-4dc9e646db97', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae67381f-84b3-429f-9ba2-4dc9e646db97')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$chibisafe$q$, $q$Chibisafe$q$, $q$https://chibisafe.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e4812bd-f938-4e90-be82-f06e39de6ab3', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e4812bd-f938-4e90-be82-f06e39de6ab3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$enclosed$q$, $q$Enclosed$q$, $q$https://enclosed.cc/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b886551b-23de-40d7-8f48-7bb6d59c286b', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b886551b-23de-40d7-8f48-7bb6d59c286b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$goploader$q$, $q$goploader$q$, $q$https://depado.github.io/goploader/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ffae92bf-f4f5-40c4-b5cb-88cc30edd135', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffae92bf-f4f5-40c4-b5cb-88cc30edd135')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$pictshare$q$, $q$PictShare$q$, $q$https://www.pictshare.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d7aacfb-24f7-4b69-a710-ff2942eeaaa7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$projectsend$q$, $q$ProjectSend$q$, $q$https://www.projectsend.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7eb54f85-fa53-45b8-9643-952ef361763c', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7eb54f85-fa53-45b8-9643-952ef361763c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$quickshare$q$, $q$QuickShare$q$, $q$https://ihexxa.github.io/quickshare.site/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '84a38488-775c-4325-9b1d-4639474c2773', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84a38488-775c-4325-9b1d-4639474c2773')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$safebucket$q$, $q$Safebucket$q$, $q$https://docs.safebucket.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '991a14b4-c72d-4cf5-87f7-81f3fc26205a', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '991a14b4-c72d-4cf5-87f7-81f3fc26205a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$slink$q$, $q$Slink$q$, $q$https://docs.slinkapp.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05360a62-d1a4-4432-b898-08dd0ad1189d', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05360a62-d1a4-4432-b898-08dd0ad1189d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$xbackbone$q$, $q$XBackBone$q$, $q$https://xbackbone.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee29016b-e8bd-48bb-949d-e74570770e58', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee29016b-e8bd-48bb-949d-e74570770e58')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$apaxy$q$, $q$Apaxy$q$, $q$https://oupala.github.io/apaxy/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e21a118-a6e5-4ac0-876d-d6b91e27da98', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$clyocloud$q$, $q$ClyoCloud$q$, $q$https://code.weexnes.dev/ClyoCloud$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a25838b-7398-4938-8fa5-7b5fcd9080f0', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a25838b-7398-4938-8fa5-7b5fcd9080f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$directory-lister$q$, $q$Directory Lister$q$, $q$https://www.directorylister.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7970f696-afb2-4a60-a110-66287a0c9216', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7970f696-afb2-4a60-a110-66287a0c9216')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$filegator$q$, $q$FileGator$q$, $q$https://filegator.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ba9e98b-5119-4b61-bcba-6f4764974281', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ba9e98b-5119-4b61-bcba-6f4764974281')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$resourcespace$q$, $q$ResourceSpace$q$, $q$https://www.resourcespace.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '00400667-6209-4172-b7aa-b8106d654692', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00400667-6209-4172-b7aa-b8106d654692')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a912766-4254-41da-82e0-c0807adcbbb5', $q$slcl$q$, $q$slcl$q$, $q$https://gitea.privatedns.org/xavi/slcl$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a912766-4254-41da-82e0-c0807adcbbb5', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a912766-4254-41da-82e0-c0807adcbbb5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$surfer$q$, $q$Surfer$q$, $q$https://git.cloudron.io/cloudron/surfer$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7790e8ea-c240-4ee6-9b40-8da31a143d62', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7790e8ea-c240-4ee6-9b40-8da31a143d62')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$tagspaces$q$, $q$TagSpaces$q$, $q$https://www.tagspaces.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$tiny-file-manager$q$, $q$Tiny File Manager$q$, $q$https://tinyfilemanager.github.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3f583e3e-2f7f-4949-b806-41aa6c8365bb', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f583e3e-2f7f-4949-b806-41aa6c8365bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$0-a-d$q$, $q$0 A.D.$q$, $q$https://play0ad.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$ddracenetwork$q$, $q$DDraceNetwork$q$, $q$https://ddnet.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'acb4633f-9c12-4fe7-abe7-4e2c008d1d04', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'acb4633f-9c12-4fe7-abe7-4e2c008d1d04')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$digibuzzer$q$, $q$Digibuzzer$q$, $q$https://digibuzzer.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '384faab2-7aa8-4e95-8df9-454c72ae8bb2', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '384faab2-7aa8-4e95-8df9-454c72ae8bb2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$lila$q$, $q$Lila$q$, $q$https://lichess.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c79fd2a4-de89-4e02-bf96-2e51b3747f3b', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c79fd2a4-de89-4e02-bf96-2e51b3747f3b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$luanti$q$, $q$Luanti$q$, $q$https://www.luanti.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '77a26385-9077-48ad-bcca-92dcc22cef2e', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '77a26385-9077-48ad-bcca-92dcc22cef2e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$mindustry$q$, $q$Mindustry$q$, $q$https://mindustrygame.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a0efe36-6967-41a8-8703-57fdd1450a58', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a0efe36-6967-41a8-8703-57fdd1450a58')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$mta-sa$q$, $q$MTA:SA$q$, $q$https://multitheftauto.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb496915-ab02-4433-8bfc-70ec1fc91a9c', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb496915-ab02-4433-8bfc-70ec1fc91a9c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$openttd$q$, $q$OpenTTD$q$, $q$https://www.openttd.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae510c8a-18ad-492c-8df9-432190e35f9d', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae510c8a-18ad-492c-8df9-432190e35f9d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$red-eclipse-2$q$, $q$Red Eclipse 2$q$, $q$https://www.redeclipse.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '59de2787-72b5-4f39-9d09-b260b1994aa6', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59de2787-72b5-4f39-9d09-b260b1994aa6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$suroi$q$, $q$Suroi$q$, $q$https://suroi.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd02a6964-f2f8-4c33-b305-57eb379fdf40', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$veloren$q$, $q$Veloren$q$, $q$https://veloren.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bd0b0ec4-080c-44f8-8cca-2ceddee81151', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd0b0ec4-080c-44f8-8cca-2ceddee81151')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$zero-k$q$, $q$Zero-K$q$, $q$https://zero-k.info/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b3e2e73-ff9d-46eb-852d-a3b455445f8b', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b3e2e73-ff9d-46eb-852d-a3b455445f8b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$auto-mcs$q$, $q$auto-mcs$q$, $q$https://www.auto-mcs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$calagopus$q$, $q$Calagopus$q$, $q$https://calagopus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5950887b-56e9-4a05-b6d2-f57b3d882853', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5950887b-56e9-4a05-b6d2-f57b3d882853')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$crafty-controller$q$, $q$Crafty Controller$q$, $q$https://craftycontrol.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27d05620-43c3-4522-a6b6-5ae2a23a50b9', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27d05620-43c3-4522-a6b6-5ae2a23a50b9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$drop$q$, $q$Drop$q$, $q$https://droposs.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$easywi$q$, $q$EasyWI$q$, $q$https://easy-wi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9f50961f-98ec-4271-b1ef-2f486257a4a5', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f50961f-98ec-4271-b1ef-2f486257a4a5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$gameap$q$, $q$GameAP$q$, $q$https://gameap.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebf3f796-8c8b-4d07-a8cf-8d19e32204e3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$gameyfin$q$, $q$Gameyfin$q$, $q$https://gameyfin.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '615af08e-8dd3-4316-8837-e9ead4f24aa4', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '615af08e-8dd3-4316-8837-e9ead4f24aa4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$lancache$q$, $q$Lancache$q$, $q$https://lancache.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b2362d6f-46ea-441d-ab8b-269f62578937', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2362d6f-46ea-441d-ab8b-269f62578937')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$linuxgsm$q$, $q$LinuxGSM$q$, $q$https://linuxgsm.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fa9fa04e-02dc-4476-8e37-077443604250', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa9fa04e-02dc-4476-8e37-077443604250')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$minus-games$q$, $q$Minus Games$q$, $q$https://accessory.github.io/minus_games_user_guide$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '39827ac6-8122-4689-9464-0147ac338943', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39827ac6-8122-4689-9464-0147ac338943')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$pelican-panel$q$, $q$Pelican Panel$q$, $q$https://pelican.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '55f67bf7-283b-46a3-a504-fefc5445313f', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '55f67bf7-283b-46a3-a504-fefc5445313f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$pterodactyl$q$, $q$Pterodactyl$q$, $q$https://pterodactyl.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0575e08f-1ac0-4b93-bd8d-6102a19fd89c', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0575e08f-1ac0-4b93-bd8d-6102a19fd89c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$pufferpanel$q$, $q$PufferPanel$q$, $q$https://www.pufferpanel.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'daea352e-0ee8-41c6-a46e-47f6922604f2', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'daea352e-0ee8-41c6-a46e-47f6922604f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$romm$q$, $q$RomM$q$, $q$https://romm.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27cd08d4-3907-484c-bde4-d06e726c6674', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27cd08d4-3907-484c-bde4-d06e726c6674')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$sourcebans$q$, $q$SourceBans++$q$, $q$https://sbpp.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$sunshine$q$, $q$Sunshine$q$, $q$https://app.lizardbyte.dev/Sunshine/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '082de0e2-a5b9-4328-a2b9-bb364605a75a', '16f06c25-6ff1-4576-840e-5385076b83e0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '082de0e2-a5b9-4328-a2b9-bb364605a75a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$genea-app$q$, $q$Genea.app$q$, $q$https://www.genea.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd31d369-2e60-4849-9a2b-8481c41a9d08', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd31d369-2e60-4849-9a2b-8481c41a9d08')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$genealogy$q$, $q$Genealogy$q$, $q$https://genealogy.kreaweb.be/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a671332-0a6d-44a2-a483-911ca563acab', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a671332-0a6d-44a2-a483-911ca563acab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$geneweb$q$, $q$GeneWeb$q$, $q$https://geneweb.tuxfamily.org/wiki/GeneWeb$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eed15499-677d-4aec-b709-b24744a436e5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eed15499-677d-4aec-b709-b24744a436e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$gramps-web$q$, $q$Gramps Web$q$, $q$https://www.grampsweb.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b34c93e2-f29b-45a6-8b23-284d2b2cdca9', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b34c93e2-f29b-45a6-8b23-284d2b2cdca9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$webtrees$q$, $q$webtrees$q$, $q$https://www.webtrees.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '61b1b0a8-fc36-4a65-86e4-2a1059a7c262', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61b1b0a8-fc36-4a65-86e4-2a1059a7c262')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$agenta$q$, $q$Agenta$q$, $q$https://agenta.ai/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$gomodel$q$, $q$GoModel$q$, $q$https://gomodel.enterpilot.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '15d61a4f-9e28-4299-9ecb-c1c0998fc971', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15d61a4f-9e28-4299-9ecb-c1c0998fc971')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$khoj$q$, $q$Khoj$q$, $q$https://khoj.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '78732199-bee3-492f-a014-b27c713b3691', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78732199-bee3-492f-a014-b27c713b3691')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$llmkube$q$, $q$LLMKube$q$, $q$https://llmkube.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9428b91f-6588-4b7f-9850-7d2b5813f72a', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9428b91f-6588-4b7f-9850-7d2b5813f72a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$onyx-community-edition$q$, $q$Onyx Community Edition$q$, $q$https://onyx.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$citadel$q$, $q$Citadel$q$, $q$https://www.citadel.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fdeb2872-5b58-466b-b859-445bc95577f4', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdeb2872-5b58-466b-b859-445bc95577f4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$colanode$q$, $q$Colanode$q$, $q$https://colanode.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c831cf1-d2a5-44c9-9cea-c5206afcba70', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c831cf1-d2a5-44c9-9cea-c5206afcba70')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$digipad$q$, $q$Digipad$q$, $q$https://digipad.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$digistorm$q$, $q$Digistorm$q$, $q$https://digistorm.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '36a13fec-4212-4e84-87b2-11cac8bee967', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36a13fec-4212-4e84-87b2-11cac8bee967')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$digiwall$q$, $q$Digiwall$q$, $q$https://digiwall.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '08388501-9b47-462d-b036-ddaf4b02c5a5', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08388501-9b47-462d-b036-ddaf4b02c5a5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$egroupware$q$, $q$egroupware$q$, $q$https://www.egroupware.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e78263bf-152d-483f-a33a-9b78428215b6', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e78263bf-152d-483f-a33a-9b78428215b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$group-office$q$, $q$Group Office$q$, $q$https://www.group-office.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '75c612e3-c807-4326-9997-c8d5eb872687', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75c612e3-c807-4326-9997-c8d5eb872687')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$openmeetings$q$, $q$Openmeetings$q$, $q$https://openmeetings.apache.org/index.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '02606861-acdd-47b6-b630-9860c5848608', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02606861-acdd-47b6-b630-9860c5848608')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$sogo$q$, $q$SOGo$q$, $q$https://www.sogo.nu/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c574afd-be4a-449c-adfa-0158130d6f1d', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c574afd-be4a-449c-adfa-0158130d6f1d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$tine$q$, $q$Tine$q$, $q$https://www.tine-groupware.de/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13d8e1cf-dc46-4ceb-a3df-aaf2719813b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$zimbra-collaboration$q$, $q$Zimbra Collaboration$q$, $q$https://www.zimbra.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fac8e051-0c40-4179-bbbd-8363f2ad6985', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fac8e051-0c40-4179-bbbd-8363f2ad6985')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$endurain$q$, $q$Endurain$q$, $q$https://docs.endurain.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ef40ba1-79b2-4345-9ec2-bc2a4731b77e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$fittrackee$q$, $q$FitTrackee$q$, $q$https://docs.fittrackee.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b2325b7f-fda2-40f8-adc4-5f3940ce498f', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2325b7f-fda2-40f8-adc4-5f3940ce498f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$mere-medical$q$, $q$Mere Medical$q$, $q$https://meremedical.co/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1a73a78a-9eb5-44c7-beb9-2f36900d5602', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a73a78a-9eb5-44c7-beb9-2f36900d5602')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$openemr$q$, $q$OpenEMR$q$, $q$https://www.open-emr.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '183473d1-eb82-4807-95c3-e4a1c525575e', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '183473d1-eb82-4807-95c3-e4a1c525575e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$wger$q$, $q$wger$q$, $q$https://wger.de/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c05a9b7-fdb5-409f-8a14-64eb71fbdace', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c05a9b7-fdb5-409f-8a14-64eb71fbdace')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$wingfit$q$, $q$Wingfit$q$, $q$https://wingfit.fr$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa9d2774-9a4d-4792-8ad7-4de1b095e3bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$admidio$q$, $q$admidio$q$, $q$https://www.admidio.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$domoticz$q$, $q$Domoticz$q$, $q$https://www.domoticz.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '079c889d-8df9-4612-92ff-bb745bc64902', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '079c889d-8df9-4612-92ff-bb745bc64902')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$emqx$q$, $q$EMQX$q$, $q$https://www.emqx.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5acefb5-8215-460f-9c6a-0a3d1e382f7e', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5acefb5-8215-460f-9c6a-0a3d1e382f7e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$evcc$q$, $q$evcc$q$, $q$https://evcc.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bbf9b79-3028-47ee-bd1d-05dbaf8b833d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$fhem$q$, $q$FHEM$q$, $q$https://fhem.de/fhem.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c12bd7ea-536c-4be0-9ac5-7f0daa0d7911')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$flowforge$q$, $q$FlowForge$q$, $q$https://flowforge.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ae3dedf-781d-4eba-bac7-7d80412bd2db', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ae3dedf-781d-4eba-bac7-7d80412bd2db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$fmd-server$q$, $q$FMD Server$q$, $q$https://fmd-foss.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$gladys$q$, $q$Gladys$q$, $q$https://gladysassistant.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82491f2c-b6b1-4919-82ea-838eafd86db9', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82491f2c-b6b1-4919-82ea-838eafd86db9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$home-assistant$q$, $q$Home Assistant$q$, $q$https://home-assistant.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'caf4aea6-fd20-4af6-9d16-4a5cbc4d2503')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$iobroker$q$, $q$ioBroker$q$, $q$https://www.iobroker.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '040370f5-8835-4009-88cd-4a1d8b345969', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '040370f5-8835-4009-88cd-4a1d8b345969')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$onloc$q$, $q$Onloc$q$, $q$https://onloc.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e1493d3f-721d-4cee-8c01-f904dc3274ec', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1493d3f-721d-4cee-8c01-f904dc3274ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$openhab$q$, $q$openHAB$q$, $q$https://www.openhab.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '00ff6895-5fbd-49c5-9a5f-500fdaab2761', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00ff6895-5fbd-49c5-9a5f-500fdaab2761')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$openremote$q$, $q$OpenRemote$q$, $q$https://openremote.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86bb955c-8712-45a0-8f45-aeab54c99a6f', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86bb955c-8712-45a0-8f45-aeab54c99a6f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$sip-irrigation-control$q$, $q$SIP Irrigation Control$q$, $q$https://dan-in-ca.github.io/SIP/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '985dacad-07a6-451c-b58a-1273bc999b4c', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '985dacad-07a6-451c-b58a-1273bc999b4c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$solectrus$q$, $q$SOLECTRUS$q$, $q$https://solectrus.de$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a231e16-9bac-4260-965f-8748c267e354', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a231e16-9bac-4260-965f-8748c267e354')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$tasmota$q$, $q$Tasmota$q$, $q$https://tasmota.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a94ac23-3cd5-4a86-822c-cdd69541e32e', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$thingsboard$q$, $q$Thingsboard$q$, $q$https://thingsboard.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e405b1d-8563-4f77-89f4-97e61f455d64', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e405b1d-8563-4f77-89f4-97e61f455d64')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$webthings-gateway$q$, $q$WebThings Gateway$q$, $q$https://webthings.io/gateway/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3732b36-1f7f-4598-84f0-2ab858cfea63', '08b895d0-d3c9-433c-a055-7a0f640cb485', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3732b36-1f7f-4598-84f0-2ab858cfea63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$cannery$q$, $q$Cannery$q$, $q$https://cannery.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c31deb25-5ad3-4424-a471-a168e2a0264c', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c31deb25-5ad3-4424-a471-a168e2a0264c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$homebox-sysadminsmedia$q$, $q$HomeBox (SysAdminsMedia)$q$, $q$https://homebox.software/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'edf1831f-3d22-4a14-9dc1-185e22d2141d', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edf1831f-3d22-4a14-9dc1-185e22d2141d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$inventaire$q$, $q$Inventaire$q$, $q$https://inventaire.io/welcome$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '17bcec27-a728-457f-9bcf-8278ac304f04', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17bcec27-a728-457f-9bcf-8278ac304f04')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$inventree$q$, $q$Inventree$q$, $q$https://docs.inventree.org/en/latest/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ecc3f02-c0cd-49b1-9080-12b8eb327cb3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$open-quartermaster$q$, $q$Open QuarterMaster$q$, $q$https://openquartermaster.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5643f8fa-5baa-4b88-b21e-5e0c97a9a43a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$part-db$q$, $q$Part-DB$q$, $q$https://docs.part-db.de/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '22f25c2f-1b4c-48c2-90e3-6d5df186e020', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22f25c2f-1b4c-48c2-90e3-6d5df186e020')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$shelf$q$, $q$Shelf$q$, $q$https://www.shelf.nu$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4af91cc7-bff6-4870-8966-384ef1477386', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4af91cc7-bff6-4870-8966-384ef1477386')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$atomic-server$q$, $q$Atomic Server$q$, $q$https://atomicserver.eu/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$librekb$q$, $q$LibreKB$q$, $q$https://librekb.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c69e1506-7e03-4ddc-b000-d2233369bdcb', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c69e1506-7e03-4ddc-b000-d2233369bdcb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$chamilo-lms$q$, $q$Chamilo LMS$q$, $q$https://chamilo.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e674cd08-a074-41e5-a462-469391a5b739', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e674cd08-a074-41e5-a462-469391a5b739')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$edx$q$, $q$edX$q$, $q$https://www.edx.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e95356b-e091-45fd-baab-10b9302b101c', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e95356b-e091-45fd-baab-10b9302b101c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$gibbon$q$, $q$Gibbon$q$, $q$https://gibbonedu.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23a978e7-3e1a-4d34-b4db-5a37d2dff05c', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23a978e7-3e1a-4d34-b4db-5a37d2dff05c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$helium$q$, $q$Helium$q$, $q$https://www.heliumedu.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4cbf934b-aea7-4a55-98f6-4e21939c1ec3', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cbf934b-aea7-4a55-98f6-4e21939c1ec3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$ilias$q$, $q$ILIAS$q$, $q$https://www.ilias.de$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bc4665f4-feb7-4c9e-a25a-245306d04d1f', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bc4665f4-feb7-4c9e-a25a-245306d04d1f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$inginious$q$, $q$INGInious$q$, $q$https://inginious.org/?lang=en$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '455123f9-8dc8-466a-b9ac-7b565c629ede', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '455123f9-8dc8-466a-b9ac-7b565c629ede')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$open-eclass$q$, $q$Open eClass$q$, $q$https://www.openeclass.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '128ae277-f9ab-42e4-8593-e90d754504e5', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '128ae277-f9ab-42e4-8593-e90d754504e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$openolat$q$, $q$OpenOLAT$q$, $q$https://www.openolat.com/?lang=en$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a2781d6d-0be8-4b83-b404-3a5b91254b15', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a2781d6d-0be8-4b83-b404-3a5b91254b15')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$qst$q$, $q$QST$q$, $q$https://qstonline.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '21d33fd5-20b2-4b49-8ccd-579b0f9edba6', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21d33fd5-20b2-4b49-8ccd-579b0f9edba6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$relate$q$, $q$RELATE$q$, $q$https://documen.tician.de/relate/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9bf9becd-f896-4366-81eb-031d10afdd43', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9bf9becd-f896-4366-81eb-031d10afdd43')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$rosariosis$q$, $q$RosarioSIS$q$, $q$https://www.rosariosis.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54383e70-4d96-4382-b653-361b0eb6367d', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54383e70-4d96-4382-b653-361b0eb6367d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$cncjs$q$, $q$CNCjs$q$, $q$https://cnc.js.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$fluidd$q$, $q$Fluidd$q$, $q$https://docs.fluidd.xyz/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e77b193d-a129-4b8a-ad01-cfd44b2a8850', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e77b193d-a129-4b8a-ad01-cfd44b2a8850')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$linuxcnc$q$, $q$LinuxCNC$q$, $q$https://www.linuxcnc.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '439efd18-8520-4a40-8b29-fb1b7b9c33f9', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '439efd18-8520-4a40-8b29-fb1b7b9c33f9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$mainsail$q$, $q$Mainsail$q$, $q$https://docs.mainsail.xyz/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6a6419f3-298f-4290-865a-3d302e88068a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a6419f3-298f-4290-865a-3d302e88068a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$manyfold$q$, $q$Manyfold$q$, $q$https://manyfold.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ded501a2-3874-4feb-b810-f1dff8c8fb1d', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ded501a2-3874-4feb-b810-f1dff8c8fb1d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$octoprint$q$, $q$Octoprint$q$, $q$https://octoprint.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '33fedead-cbf1-426b-aefe-c1f89bb34b01', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33fedead-cbf1-426b-aefe-c1f89bb34b01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$adventurelog$q$, $q$AdventureLog$q$, $q$https://adventurelog.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae7e7673-dded-4176-856d-7eaad4bbfe3e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$airtrail$q$, $q$AirTrail$q$, $q$https://airtrail.johan.ohly.dk$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af972f5d-442a-4182-b478-b2ab2783c080', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af972f5d-442a-4182-b478-b2ab2783c080')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$dawarich$q$, $q$Dawarich$q$, $q$https://dawarich.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5b11a993-2f55-40d0-abfa-c3ac9710bd48', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b11a993-2f55-40d0-abfa-c3ac9710bd48')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$graphhopper$q$, $q$GraphHopper$q$, $q$https://graphhopper.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a06850cf-38ac-4eb8-ba1c-a0710d10ee23', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a06850cf-38ac-4eb8-ba1c-a0710d10ee23')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$nominatim$q$, $q$Nominatim$q$, $q$https://nominatim.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48148d92-39dd-4402-8645-08c7801fdbd5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48148d92-39dd-4402-8645-08c7801fdbd5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$open-source-routing-machine-osrm$q$, $q$Open Source Routing Machine (OSRM)$q$, $q$http://project-osrm.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86baafbf-f9bc-4449-a7f2-056ec61dfb90', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86baafbf-f9bc-4449-a7f2-056ec61dfb90')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$openrouteservice$q$, $q$OpenRouteService$q$, $q$https://openrouteservice.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bc74d5c2-961f-4a99-a34b-c92eee310096', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bc74d5c2-961f-4a99-a34b-c92eee310096')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$openstreetmap$q$, $q$OpenStreetMap$q$, $q$https://www.openstreetmap.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '57200a8f-f3cf-4f52-8aed-098c07fbd667', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57200a8f-f3cf-4f52-8aed-098c07fbd667')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$opentripplanner$q$, $q$OpenTripPlanner$q$, $q$https://www.opentripplanner.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5f8129e3-98ab-4d78-94b2-3a35a0efb279', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f8129e3-98ab-4d78-94b2-3a35a0efb279')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$tileserver-gl$q$, $q$TileServer GL$q$, $q$https://tileserver.readthedocs.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '60df7045-6dba-4088-8dad-1316174aa0df', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60df7045-6dba-4088-8dad-1316174aa0df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$traccar$q$, $q$Traccar$q$, $q$https://www.traccar.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '74308889-bf28-4f84-8e8e-f6ebecc1b93a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74308889-bf28-4f84-8e8e-f6ebecc1b93a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$trip$q$, $q$TRIP$q$, $q$https://itskovacs-trip.netlify.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd1da66a-312f-432a-8e37-1dc816cc5520', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd1da66a-312f-432a-8e37-1dc816cc5520')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$downtify$q$, $q$Downtify$q$, $q$https://downtify.henriquesebastiao.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0608cdcb-8ede-4cee-a620-9cc6d15af341', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0608cdcb-8ede-4cee-a620-9cc6d15af341')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$lidarr$q$, $q$Lidarr$q$, $q$https://lidarr.audio/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95c108e4-15cb-4703-b18c-02fcb91adb45', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95c108e4-15cb-4703-b18c-02fcb91adb45')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$nefarious$q$, $q$nefarious$q$, $q$https://lardbit.github.io/nefarious/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '83b24c52-88dd-4d43-8826-92e123f63cae', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83b24c52-88dd-4d43-8826-92e123f63cae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$ombi$q$, $q$Ombi$q$, $q$https://ombi.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ffe78cc3-84d8-4e34-88df-15226b1e5736', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffe78cc3-84d8-4e34-88df-15226b1e5736')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$podfetch$q$, $q$PodFetch$q$, $q$https://samtv12345.github.io/PodFetch$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '63b21fd2-9266-4e94-acfa-f6a9f0e85347', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63b21fd2-9266-4e94-acfa-f6a9f0e85347')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$radarr$q$, $q$Radarr$q$, $q$https://radarr.video/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'faf3dbd9-cf17-44f0-87da-3ad94eaa9671', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'faf3dbd9-cf17-44f0-87da-3ad94eaa9671')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$reaparr$q$, $q$Reaparr$q$, $q$https://www.reaparr.rocks/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'effcc65a-35ca-4139-bbe4-ff1e95fd6c80', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'effcc65a-35ca-4139-bbe4-ff1e95fd6c80')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$sonarr$q$, $q$Sonarr$q$, $q$https://sonarr.tv/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$trackwatch$q$, $q$TrackWatch$q$, $q$https://trackwatch.emlopezr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27408a9d-fa62-429f-be90-8c7e77ed1deb', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27408a9d-fa62-429f-be90-8c7e77ed1deb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$youtube-dl-nas$q$, $q$youtube-dl-nas$q$, $q$https://hyeonsangjeon.github.io/youtube-dl-nas/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ee38403-9c79-4f01-b843-b92c0873dc50', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ee38403-9c79-4f01-b843-b92c0873dc50')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$beets$q$, $q$Beets$q$, $q$https://beets.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$botwave$q$, $q$BotWave$q$, $q$https://botwave.dpip.lol$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b3278d1-8d02-4f74-81f9-c990fdd076fb', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b3278d1-8d02-4f74-81f9-c990fdd076fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$libretime$q$, $q$LibreTime$q$, $q$https://libretime.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd508cac6-6459-4054-ae69-1f4088c41400', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd508cac6-6459-4054-ae69-1f4088c41400')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$lyrion-music-server$q$, $q$Lyrion Music Server$q$, $q$https://lyrion.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'afe3197a-f0df-4980-b89c-90bb6be2715d', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afe3197a-f0df-4980-b89c-90bb6be2715d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$moode-audio$q$, $q$moOde Audio$q$, $q$https://moodeaudio.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '80afb5c8-0281-4cec-9c4b-b2b6bf20335e', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80afb5c8-0281-4cec-9c4b-b2b6bf20335e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$mopidy$q$, $q$Mopidy$q$, $q$https://docs.mopidy.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5843c8b6-d28f-4688-bb58-9b9b806ffe66', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5843c8b6-d28f-4688-bb58-9b9b806ffe66')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$mpd$q$, $q$mpd$q$, $q$https://www.musicpd.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$mstream$q$, $q$mStream$q$, $q$https://mstream.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6be73240-b846-4480-b296-99aefc7411ce', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6be73240-b846-4480-b296-99aefc7411ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$multi-scrobbler$q$, $q$multi-scrobbler$q$, $q$https://foxxmd.github.io/multi-scrobbler$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c94279f7-118b-4aae-a54e-6cce37b4a7f3', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c94279f7-118b-4aae-a54e-6cce37b4a7f3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$musikcube$q$, $q$musikcube$q$, $q$https://musikcube.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e04290f0-461c-4d34-99c8-53dd4fc5a339', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e04290f0-461c-4d34-99c8-53dd4fc5a339')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$pinepods$q$, $q$Pinepods$q$, $q$https://www.pinepods.online/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '85c3b235-223c-45ae-bc99-db8243a2c741', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85c3b235-223c-45ae-bc99-db8243a2c741')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$swingmusic$q$, $q$SwingMusic$q$, $q$https://swingmusic.vercel.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '12f51e8d-3567-4f17-8ef0-8ba1de67aa06', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$clipbucket$q$, $q$ClipBucket$q$, $q$https://clipbucket.fr/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20d0dcea-e515-425a-9158-96cea2e7f443', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20d0dcea-e515-425a-9158-96cea2e7f443')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$gerbera$q$, $q$Gerbera$q$, $q$https://gerbera.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1fd3a23c-84e4-4c6b-bd89-e880123d495c', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1fd3a23c-84e4-4c6b-bd89-e880123d495c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$icecast-2$q$, $q$Icecast 2$q$, $q$https://icecast.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '160ef825-4aa7-47be-8ed9-f30810cb8ba2', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '160ef825-4aa7-47be-8ed9-f30810cb8ba2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$karaoke-eternal$q$, $q$Karaoke Eternal$q$, $q$https://www.karaoke-eternal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$kodi$q$, $q$Kodi$q$, $q$https://kodi.tv/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f15ae2d8-b82f-4e7b-b033-07c65a5c2617', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f15ae2d8-b82f-4e7b-b033-07c65a5c2617')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$mediamtx$q$, $q$MediaMTX$q$, $q$https://mediamtx.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$mistserver$q$, $q$MistServer$q$, $q$https://mistserver.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f4959893-76cd-46a8-ac09-5ec52854907c', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4959893-76cd-46a8-ac09-5ec52854907c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$nymphcast$q$, $q$NymphCast$q$, $q$http://nyanko.ws/nymphcast.php$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bd17012-c4b3-4edc-a6fb-45ecafd92bb2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$rygel$q$, $q$Rygel$q$, $q$https://gnome.pages.gitlab.gnome.org/rygel/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1269899d-d0a4-4fea-afe2-1530e36e1f6f', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1269899d-d0a4-4fea-afe2-1530e36e1f6f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$stash$q$, $q$Stash$q$, $q$https://stashapp.cc$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7fcb3565-0b7e-4173-967c-63ee940c83a4', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7fcb3565-0b7e-4173-967c-63ee940c83a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$uwave$q$, $q$üWave$q$, $q$https://u-wave.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$restreamer$q$, $q$Restreamer$q$, $q$https://datarhei.github.io/restreamer/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f3b942d1-643e-4d8c-b830-41cfe23c130e', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3b942d1-643e-4d8c-b830-41cfe23c130e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$tube$q$, $q$Tube$q$, $q$https://git.mills.io/prologic/tube$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4e301513-c3b6-4e23-8121-6625186cf446', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e301513-c3b6-4e23-8121-6625186cf446')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$videolan-client-vlc$q$, $q$VideoLAN Client (VLC)$q$, $q$https://www.videolan.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'afaa3312-5d01-48a5-af22-141fd2ad264f', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afaa3312-5d01-48a5-af22-141fd2ad264f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$anchr$q$, $q$Anchr$q$, $q$https://anchr.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a8479085-b069-4122-84f4-d7d97ae020d3', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8479085-b069-4122-84f4-d7d97ae020d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$anubis$q$, $q$Anubis$q$, $q$https://anubis.techaro.lol/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$asciinema$q$, $q$asciinema$q$, $q$https://asciinema.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a871d31-fa92-435d-8be7-8639d7f2476f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a871d31-fa92-435d-8be7-8639d7f2476f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$cloudlog$q$, $q$Cloudlog$q$, $q$https://magicbug.co.uk/cloudlog/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1f86602f-2198-4b4a-ae20-0793534244a7', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f86602f-2198-4b4a-ae20-0793534244a7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$cups$q$, $q$CUPS$q$, $q$https://www.cups.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0fe96227-1d6d-4bd6-83ce-4ceea48aafd2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$digiboard$q$, $q$Digiboard$q$, $q$https://digiboard.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '49e87fbd-548a-4c83-b5b3-b84d439ae13c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '49e87fbd-548a-4c83-b5b3-b84d439ae13c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$domain-locker$q$, $q$Domain Locker$q$, $q$https://domain-locker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '03502625-329e-43e5-b9a4-c57308f6f0a3', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03502625-329e-43e5-b9a4-c57308f6f0a3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$domjudge$q$, $q$DOMJudge$q$, $q$https://www.domjudge.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '854f8d2c-af4c-48f6-b7f6-07a0687b0ff0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$esmira$q$, $q$ESMira$q$, $q$https://esmira.kl.ac.at$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cbb55d0e-101f-4a0d-851d-02e7d9feca7f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cbb55d0e-101f-4a0d-851d-02e7d9feca7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$f-droid$q$, $q$F-Droid$q$, $q$https://f-droid.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '16f675b3-a2df-4104-8242-9d861140e8cf', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16f675b3-a2df-4104-8242-9d861140e8cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$flyimg$q$, $q$Flyimg$q$, $q$https://flyimg.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '90850fdb-68e2-47bf-bb23-ea2ccb2848e1', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90850fdb-68e2-47bf-bb23-ea2ccb2848e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$habitica$q$, $q$Habitica$q$, $q$https://habitica.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c66c0bf-66e6-4947-82a4-244a69ecb504', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c66c0bf-66e6-4947-82a4-244a69ecb504')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$hortusfox$q$, $q$HortusFox$q$, $q$https://hortusfox.github.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0a11055-ce1c-48de-8c3b-a99cd8a998eb', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0a11055-ce1c-48de-8c3b-a99cd8a998eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$imgcompress$q$, $q$ImgCompress$q$, $q$https://imgcompress.karimzouine.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '959b9d2f-85ba-483f-9122-54acf02a036f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '959b9d2f-85ba-483f-9122-54acf02a036f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$jelu$q$, $q$Jelu$q$, $q$https://bayang.github.io/jelu-web$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae515eae-68cb-450f-8fad-3f3174591ee1', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae515eae-68cb-450f-8fad-3f3174591ee1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$kasm-workspaces$q$, $q$Kasm Workspaces$q$, $q$https://kasmweb.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cca6ce71-65f3-480e-80b7-a4723f4b0866', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cca6ce71-65f3-480e-80b7-a4723f4b0866')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$koillection$q$, $q$Koillection$q$, $q$https://koillection.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c742a777-74f7-4981-aabd-5b21669059f3', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c742a777-74f7-4981-aabd-5b21669059f3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$languagetool$q$, $q$LanguageTool$q$, $q$https://languagetool.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '917d6a1d-804c-4ce5-b0e0-d9db22f252c6', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '917d6a1d-804c-4ce5-b0e0-d9db22f252c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$libre-translate$q$, $q$Libre Translate$q$, $q$https://libretranslate.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '349b9202-524b-41fb-ba14-33f80aa672b7', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '349b9202-524b-41fb-ba14-33f80aa672b7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$lubelogger$q$, $q$LubeLogger$q$, $q$https://lubelogger.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '270d9194-a92c-41d2-84b2-40be25395e12', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '270d9194-a92c-41d2-84b2-40be25395e12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$mosparo$q$, $q$mosparo$q$, $q$https://mosparo.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f23f15f9-2364-493f-94fb-df321638df83', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f23f15f9-2364-493f-94fb-df321638df83')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$neko$q$, $q$Neko$q$, $q$https://neko.m1k1o.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e9197c5d-03b9-4574-a2ba-90f4d26880a9', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9197c5d-03b9-4574-a2ba-90f4d26880a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$omnitools$q$, $q$OmniTools$q$, $q$https://omnitools.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea56c01c-6b17-4ccc-b7b7-0f3ee6227368')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$open-meteo$q$, $q$Open-Meteo$q$, $q$https://open-meteo.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$openreader$q$, $q$OpenReader$q$, $q$https://openreader.richardr.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f47d23ca-0f56-4a32-b7b9-20cfb7465b77', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f47d23ca-0f56-4a32-b7b9-20cfb7465b77')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$openziti$q$, $q$OpenZiti$q$, $q$https://openziti.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$operational-co$q$, $q$Operational.co$q$, $q$https://operational.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '324cb4c8-ccb6-493d-82c4-2a69fa15670f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '324cb4c8-ccb6-493d-82c4-2a69fa15670f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$pomjs$q$, $q$POMjs$q$, $q$https://password.oppetmoln.se/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd83a1349-8ab9-4eea-8c4f-73b628234bab', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd83a1349-8ab9-4eea-8c4f-73b628234bab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$re-director$q$, $q$re:Director$q$, $q$https://re-director.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff286dd5-38ce-4dba-930e-50e4da2c4d62', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff286dd5-38ce-4dba-930e-50e4da2c4d62')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$reactive-resume$q$, $q$Reactive Resume$q$, $q$https://rxresu.me/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '537f4377-d765-4451-9d22-d3ae543d7b4e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '537f4377-d765-4451-9d22-d3ae543d7b4e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$revealjs$q$, $q$revealjs$q$, $q$https://revealjs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f61c5d6-c000-4e54-918d-cc68123a94de', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f61c5d6-c000-4e54-918d-cc68123a94de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$revive-adserver$q$, $q$Revive Adserver$q$, $q$https://www.revive-adserver.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e449918-7518-479f-8208-8ee3735b2652', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e449918-7518-479f-8208-8ee3735b2652')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$sane-network-scanning$q$, $q$SANE Network Scanning$q$, $q$http://sane-project.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bab3c6db-9b5a-484e-b9f3-7c8e256e957e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bab3c6db-9b5a-484e-b9f3-7c8e256e957e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$string-is$q$, $q$string.is$q$, $q$https://string.is/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1c713be1-b714-409c-be08-f7969e107f24', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c713be1-b714-409c-be08-f7969e107f24')
ON CONFLICT DO NOTHING;


-- Strategic metadata — one row per list entry (new tool or matched existing).
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Analytics$q$, 2, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '675b4134-c6dd-4c7a-8480-7fcb63af924a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Analytics$q$, 3, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a59d5166-cc6a-417b-90b1-e5b6c0fb5f11')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Analytics$q$, 4, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5186176-1b9e-4d69-9272-f95fc9700a4c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Analytics$q$, 5, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d0f250c-fcb6-42a1-ba65-14a33ddeb307')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Analytics$q$, 7, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '908dae33-8b4a-4b73-8ca9-33e3eb8522aa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Analytics$q$, 8, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bcaaafb7-ce4e-47a5-9712-f545552b12e7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Analytics$q$, 9, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c95b7ac8-c110-41fe-a3fc-2fb5237155d8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd820a867-fd9f-44d0-a672-841fea19edfc', $q$Analytics$q$, 10, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd820a867-fd9f-44d0-a672-841fea19edfc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Analytics$q$, 13, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20af8fc3-9e0e-4ee6-9421-b638361573df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2273c295-f582-4fee-a5d0-42845b0dfade', $q$Analytics$q$, 15, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2273c295-f582-4fee-a5d0-42845b0dfade')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Analytics$q$, 16, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c1b5e9c-512c-48b9-b212-f464f5c0a339')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed136ebf-ec30-4027-aba4-c834b251578e', $q$Analytics$q$, 17, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed136ebf-ec30-4027-aba4-c834b251578e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Analytics$q$, 18, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c430e24-d037-4fa9-9d90-6b483daf4467')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Analytics$q$, 19, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Analytics$q$, 20, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Document Management$q$, 24, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7ad8964-3bed-4b24-a76a-71a5d1f01f13')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd5204669-8ef8-4418-a89c-cac392863262', $q$Document Management$q$, 25, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5204669-8ef8-4418-a89c-cac392863262')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Document Management$q$, 26, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed103661-d4a3-4fa4-8ac8-dccb7c67ed04')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '09c39a74-1b42-4789-af73-47c7785446b4', $q$Workflow Automation$q$, 34, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09c39a74-1b42-4789-af73-47c7785446b4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4bc25f51-5006-4396-aeab-6860c203eba6', $q$Workflow Automation$q$, 36, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bc25f51-5006-4396-aeab-6860c203eba6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2315b74d-957e-4a28-a863-32fc0da75242', $q$Workflow Automation$q$, 37, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2315b74d-957e-4a28-a863-32fc0da75242')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c5d35463-736d-427c-b730-eb483d33b643', $q$Workflow Automation$q$, 38, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5d35463-736d-427c-b730-eb483d33b643')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '508967b9-da79-458e-ad83-e0c334e50a8c', $q$Workflow Automation$q$, 39, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '508967b9-da79-458e-ad83-e0c334e50a8c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a78ce366-8967-4df1-b706-40b8958bb998', $q$Workflow Automation$q$, 41, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a78ce366-8967-4df1-b706-40b8958bb998')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Blogging Platforms$q$, 44, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Blogging Platforms$q$, 47, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0bc21b7f-dfe2-4c44-a7ad-9cac54962d52')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Blogging Platforms$q$, 48, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e5010c0-47f6-477a-b108-d4572881cb9c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c23263cf-333f-4561-ac68-e421277a1f58', $q$Blogging Platforms$q$, 50, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c23263cf-333f-4561-ac68-e421277a1f58')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Blogging Platforms$q$, 51, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '207eb58f-a5bd-46b7-ad43-c35ea9d0fecf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Blogging Platforms$q$, 52, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eba0f7e5-197a-4285-93b2-3fcbd9da16ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba173115-45c7-42cb-850e-739cef0cdccb', $q$Blogging Platforms$q$, 53, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba173115-45c7-42cb-850e-739cef0cdccb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Bookmark Management$q$, 60, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8d19f4f-f413-441c-b903-3a6fd99103e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Bookmark Management$q$, 61, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3185965d-fd1d-45c7-a0e1-03ac82f24008')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Bookmark Management$q$, 62, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '864fba7c-ef16-406d-a4f4-ba7e53df55cc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fab34bce-400c-45a0-b3be-67931923345e', $q$Bookmark Management$q$, 63, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fab34bce-400c-45a0-b3be-67931923345e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '012e0305-9686-40a7-a4fd-779a85ef6658', $q$Bookmark Management$q$, 64, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '012e0305-9686-40a7-a4fd-779a85ef6658')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Bookmark Management$q$, 65, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '140a021c-be44-4b36-b077-68c7c32ded9b', $q$Calendar & Contacts$q$, 66, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '140a021c-be44-4b36-b077-68c7c32ded9b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Calendar & Contacts$q$, 67, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1107dc4a-e771-4cc9-887a-5ba99556372b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Calendar & Contacts$q$, 68, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9315862-aea5-4bd1-8365-1d5381cc4337')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5876a809-20b6-4a29-bd49-189eea244f05', $q$Calendar & Contacts$q$, 69, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5876a809-20b6-4a29-bd49-189eea244f05')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Calendar & Contacts$q$, 70, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95330f45-8ddc-4fe4-b00d-c7498b26f5ac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Team Communication$q$, 71, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Team Communication$q$, 72, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c38ae10-51dd-4efa-aae5-4c2f20863745')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Team Communication$q$, 73, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd982ac6-15fa-4c92-86fd-7b3367a55768')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Team Communication$q$, 74, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e84117d-d544-4f29-89e5-dcf3d6e9f06a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Team Communication$q$, 75, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35d633ed-e78a-443f-ae86-ab29e7bc10d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Team Communication$q$, 76, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3573cac7-ce24-4055-bf17-e0ce515e92a5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Team Communication$q$, 77, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '685a2454-07f3-45db-9fc9-03a9a78f0a9b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Team Communication$q$, 78, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4e15aa2-1586-4029-bdbb-ccdc26761466')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Team Communication$q$, 79, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23bab05b-2293-4f46-a717-4934ba3b60c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Team Communication$q$, 80, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '593f4d82-8400-4cbe-bca8-aa39046b2d53')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Team Communication$q$, 81, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d593e07-ef39-4892-8798-7b56252691bd', $q$Team Communication$q$, 82, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d593e07-ef39-4892-8798-7b56252691bd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Team Communication$q$, 83, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4d14d8f-274a-43ad-92f6-8e61529bc76c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '456fbc5c-1126-4664-96da-4a376804c0f8', $q$Team Communication$q$, 84, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '456fbc5c-1126-4664-96da-4a376804c0f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Team Communication$q$, 85, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb62ae2f-72bd-4969-b944-dde6d7d56470')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eac79351-70e4-48de-8016-9c64aff91049', $q$Team Communication$q$, 86, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eac79351-70e4-48de-8016-9c64aff91049')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c2a0403-bded-465c-89d4-44577324f0fc', $q$Team Communication$q$, 87, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c2a0403-bded-465c-89d4-44577324f0fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Team Communication$q$, 88, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ec9cb7b-3758-48d4-b21c-ca4d6d43754e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Team Communication$q$, 89, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2dc99054-a142-46e9-ba1a-fcacb6132ea9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Team Communication$q$, 90, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86a4e6f7-b835-4bf1-b393-2519995d609a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '345a3674-eba8-4d0e-a817-1203b09a6953', $q$Team Communication$q$, 91, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '345a3674-eba8-4d0e-a817-1203b09a6953')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Team Communication$q$, 92, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1d7d4b6-0a0c-446a-a22f-7046fe96be45')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Email Software$q$, 93, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Email Software$q$, 94, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Email Software$q$, 95, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f37df20-288c-490c-8a89-5a00b2c6478e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Email Software$q$, 96, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6761ccd8-5a87-4df7-8db5-4222ccd81539')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd1caaa4a-2950-4499-9b5a-375119656c09', $q$Email Software$q$, 97, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1caaa4a-2950-4499-9b5a-375119656c09')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Email Software$q$, 98, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1dea1981-a33c-4b6f-bacd-a384dacee7f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Email Software$q$, 99, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba51550d-a30f-4ff6-991a-d6db68d152ca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Email Software$q$, 100, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba65b701-bea2-49e3-a8e6-c127d99725d5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Email Software$q$, 101, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e645d12e-427d-4de8-a46d-9232f2a915d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '591b7aee-2302-4201-805a-465e25e4cfbc', $q$Email Software$q$, 102, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '591b7aee-2302-4201-805a-465e25e4cfbc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Email Infrastructure$q$, 103, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e2764a7-0bfa-42fa-913d-469e0d66e4ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Email Infrastructure$q$, 104, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a42ba043-aed3-4e2a-accc-c2fe75a65c67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Email Infrastructure$q$, 105, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fd084534-24c8-4496-a272-eb646dc24f55', $q$Email Infrastructure$q$, 106, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd084534-24c8-4496-a272-eb646dc24f55')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd0165e6b-299a-413e-8603-112e26c2317d', $q$Email Infrastructure$q$, 107, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd0165e6b-299a-413e-8603-112e26c2317d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Email Infrastructure$q$, 108, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48dce657-93e5-4f57-b7c7-2ec20c859674')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Email Infrastructure$q$, 109, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5b0bebc-38eb-4762-ae9c-52a84181c2e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9af66bbf-b130-4408-9f34-c92e212205a4', $q$Email Infrastructure$q$, 110, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9af66bbf-b130-4408-9f34-c92e212205a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99730711-228d-48f9-acb0-4108e2522d7d', $q$Email Infrastructure$q$, 111, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99730711-228d-48f9-acb0-4108e2522d7d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Email Infrastructure$q$, 112, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8af6231d-94ed-4f47-822f-a4b6cf8b5e1f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Email Infrastructure$q$, 113, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4741d451-b4f1-4455-802f-b4d98dfdba96')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11597642-219f-4d25-9f31-8486b2b24eba', $q$Email Marketing$q$, 114, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11597642-219f-4d25-9f31-8486b2b24eba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Email Marketing$q$, 115, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09b6e7a8-b810-4a31-9ecf-e4e0719bc76c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Email Marketing$q$, 116, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8dc7535-36b0-4fce-a7c3-155bcabd5963')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Email Marketing$q$, 117, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05c5746c-f3a3-47a9-b647-2b4ab14ad200')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6930e11f-db83-4fac-9da3-6754439654e5', $q$Email Marketing$q$, 118, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6930e11f-db83-4fac-9da3-6754439654e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Email Marketing$q$, 119, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Email Marketing$q$, 120, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Email Software$q$, 121, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '665b1bfd-5f00-4b50-b428-2743e447dd31')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Email Software$q$, 122, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb4553dc-a02b-4c01-a2c6-6a0dc57786d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Email Software$q$, 123, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6bf9cca5-6080-4b58-bce7-1bc8b964a3f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Email Software$q$, 124, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Team Communication$q$, 125, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ccc97952-4222-4741-b1ae-b6303ffa2241')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Team Communication$q$, 126, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3277e798-0260-4d98-ba6f-cc95e7dc5b48')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c54263d-78af-448f-8e86-9807365dad70', $q$Team Communication$q$, 127, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c54263d-78af-448f-8e86-9807365dad70')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Team Communication$q$, 128, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9bad036a-a837-4c1f-9a3f-9f0c17e20ff1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Team Communication$q$, 129, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2fb7e2c0-a5af-47c6-b92d-1e035732d406')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Team Communication$q$, 130, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '979bd91f-de34-4fc6-a7cd-59bb08136756')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e3bc3a20-56e4-4435-a993-1159046d7812', $q$Team Communication$q$, 131, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3bc3a20-56e4-4435-a993-1159046d7812')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Team Communication$q$, 132, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a4646d4-397c-4756-8f0b-985b9dce7a8e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Team Communication$q$, 133, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee6c8b88-f000-4f14-8c23-19ab2bda304c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Team Communication$q$, 134, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f9434f4-e927-45b2-a88a-bd4e32807373')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$VoIP Software$q$, 135, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5208a8e5-fcd9-4333-a413-ca2e73058d97')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$VoIP Software$q$, 136, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1e7307b-a3f8-4883-8420-6b25b0764ca6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a33553b-3246-4484-92da-a333ec40b5e4', $q$VoIP Software$q$, 137, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a33553b-3246-4484-92da-a333ec40b5e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$VoIP Software$q$, 138, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '359edbcb-cdb7-4e0e-96ec-f81303289aa2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$VoIP Software$q$, 139, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$VoIP Software$q$, 140, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f4e2487-8444-49f1-b4b1-729b8e49b3c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$VoIP Software$q$, 141, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9571c8ca-968b-4f1b-93a0-ecf103c67bfa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$VoIP Software$q$, 142, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$VoIP Software$q$, 143, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d6bc0d1-04aa-46ba-873c-4820037e561d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$VoIP Software$q$, 144, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c77c93d7-d6d3-492d-95bf-b629ef60e4c2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '688d8396-0ab3-420a-ba26-729121f64809', $q$VoIP Software$q$, 145, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '688d8396-0ab3-420a-ba26-729121f64809')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$VoIP Software$q$, 146, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8734f0fa-231e-48e0-b9b8-faa68fe18c4b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Community Platforms$q$, 147, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '747424fb-e9a8-434a-b7eb-6df34846ecf9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Community Platforms$q$, 148, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b5cba06-a001-4209-a582-cc94a5c108b0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Community Platforms$q$, 149, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Community Platforms$q$, 150, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9bcf631f-554c-4a18-befe-b606018906d6', $q$Community Platforms$q$, 151, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9bcf631f-554c-4a18-befe-b606018906d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Community Platforms$q$, 152, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '67b35559-aa14-4347-b26e-f153e6e02e8c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8116962c-5001-43e3-b838-698a93f20293', $q$Community Platforms$q$, 153, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8116962c-5001-43e3-b838-698a93f20293')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '52d15888-e7a1-4bf4-a86f-407a65530036', $q$Community Platforms$q$, 154, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52d15888-e7a1-4bf4-a86f-407a65530036')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Community Platforms$q$, 155, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fcc4c746-3637-450b-9b93-e0c4703382b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Community Platforms$q$, 156, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9ddf754-14b8-4ba3-b736-ca0959c8894d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Community Platforms$q$, 157, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ef53b6f-d698-4b20-ab83-57c388a50f2d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a66fca94-72b5-448d-a986-f5944ee873d8', $q$Community Platforms$q$, 158, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a66fca94-72b5-448d-a986-f5944ee873d8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc45a7d5-8397-4680-90b5-60974a154019', $q$Community Platforms$q$, 159, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc45a7d5-8397-4680-90b5-60974a154019')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '45e476ca-e137-4841-abde-19c6273464c0', $q$Community Platforms$q$, 160, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45e476ca-e137-4841-abde-19c6273464c0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Community Platforms$q$, 161, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b43eeda-4ceb-459a-a73d-d764275698c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Community Platforms$q$, 162, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bb6de5a-4c58-4a03-a3da-62dde82c521f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Community Platforms$q$, 163, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f05bad91-5d44-4ab8-bd64-a36e981b6349')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Community Platforms$q$, 164, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Community Platforms$q$, 165, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6f591ae-29a7-48f3-86f6-535c814b5f34')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Community Platforms$q$, 166, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1b6cce1-f828-4060-b252-e9dae59643ea')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Community Platforms$q$, 167, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c4424b7-aba0-4e04-9853-edd33d4b7072')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Community Platforms$q$, 168, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Community Platforms$q$, 169, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a76489e-3b83-431e-b735-25922ce9a2b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Community Platforms$q$, 170, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1345ae06-82b8-4acb-9958-4dfcce5198b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Community Platforms$q$, 171, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '656d2c55-b8db-44a2-823d-f15eac0f5ffb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Video Conferencing$q$, 172, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fabd1ffb-a233-4c33-bb07-50f94bcfa2d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '71c7930e-f978-4543-907b-1d45df9c86d7', $q$Video Conferencing$q$, 173, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '71c7930e-f978-4543-907b-1d45df9c86d7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Video Conferencing$q$, 174, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0650c50c-6e38-47ff-9b1c-ad5c7004e35a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Video Conferencing$q$, 175, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7e3dfde-b66e-49af-b87b-8a41ddca3f88')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Video Conferencing$q$, 176, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6bb04494-9b4c-4959-9345-35cb07ffe59d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Team Communication$q$, 177, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7060eb6f-8b75-4dcd-b7ed-90b63b5d8986')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Team Communication$q$, 178, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c477791e-4aea-459c-b6d0-e2247ad6316f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Team Communication$q$, 179, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46b963c1-7eca-4b94-ade9-a168bc61594e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Team Communication$q$, 180, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd57f5a1-59c8-4b23-bc86-a81e777d5f57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Team Communication$q$, 181, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e600f81d-f148-4525-b8ff-0baa4cd86eab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '93755188-c1ee-4269-9581-f911c716c21f', $q$Team Communication$q$, 182, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '93755188-c1ee-4269-9581-f911c716c21f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Team Communication$q$, 183, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b2670c3-5248-4140-a4b2-ade8ee34ed2b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e38ebadd-d243-4db5-95a7-1bc30798d6e1', $q$Team Communication$q$, 184, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e38ebadd-d243-4db5-95a7-1bc30798d6e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Team Communication$q$, 185, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0da45043-d5e4-43e0-b1d2-e47565c3ce95')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Industry Software$q$, 186, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '640f5401-b849-4bad-b457-90e05c828c55', $q$Industry Software$q$, 187, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '640f5401-b849-4bad-b457-90e05c828c55')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Industry Software$q$, 188, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1807f881-55e3-4c8e-81e1-3548278fad9e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4b370b9c-680b-4e36-b5eb-96116115e439', $q$Industry Software$q$, 189, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b370b9c-680b-4e36-b5eb-96116115e439')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Industry Software$q$, 190, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c0d797b-de68-4b90-9beb-fcaefd4f1108')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Industry Software$q$, 191, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8beb2a4-e936-455d-aa4d-c21b017173fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0070da27-b0bd-4679-add1-4cfaeb297161', $q$Industry Software$q$, 192, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0070da27-b0bd-4679-add1-4cfaeb297161')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '367a6bce-9b7f-4b10-9faa-47430b894121', $q$Event Management$q$, 193, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '367a6bce-9b7f-4b10-9faa-47430b894121')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Event Management$q$, 194, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c846e33-a0ef-4fe5-b290-203fbdef22b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Event Management$q$, 195, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9dee94a4-8e82-47af-beeb-930afb5a54a0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ff42786e-7806-4c57-bfcc-7884411de95a', $q$Event Management$q$, 196, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff42786e-7806-4c57-bfcc-7884411de95a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$CMS$q$, 197, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bea71619-57c8-4b82-a974-34977a4a07b2', $q$CMS$q$, 198, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bea71619-57c8-4b82-a974-34977a4a07b2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$CMS$q$, 199, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$CMS$q$, 200, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2dacf89b-e2ef-4c5b-abc5-d221801f171b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ddf71270-678f-48af-a74a-407a4c5982bb', $q$CMS$q$, 201, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ddf71270-678f-48af-a74a-407a4c5982bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$CMS$q$, 202, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '330370f7-f51f-46b8-a8a2-9d0d70a14749')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$CMS$q$, 203, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ffe72c4-8110-4eaf-b546-5d3899b26ca0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$CMS$q$, 204, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ae627ac-41a3-4d2a-80ef-75696ca1cfb2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$CMS$q$, 205, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8fefc7b-8f41-4745-a164-82c127ab7a0f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '40837e93-aef4-40d6-a619-0330eaa64ea6', $q$CMS$q$, 206, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40837e93-aef4-40d6-a619-0330eaa64ea6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$CMS$q$, 207, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b17cb33e-88ec-4a90-a49e-1ba15fca71cb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba1e26ba-4573-4e22-a55a-4786e0233908', $q$CMS$q$, 208, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba1e26ba-4573-4e22-a55a-4786e0233908')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba2afed9-4dd0-452e-8365-2334d0c54742', $q$CMS$q$, 209, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba2afed9-4dd0-452e-8365-2334d0c54742')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$CMS$q$, 210, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe036b27-0ca6-4aa1-8287-c9d8dafd6b57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$CMS$q$, 211, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '392c0dc0-952f-4089-9489-2c63d22bd5a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$CMS$q$, 212, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97866dd0-6dea-4e55-a594-ffa15a710dc6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$CMS$q$, 213, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8c59b52-b5c2-4b4d-9425-6cc9d93670f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$CMS$q$, 214, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfc00fd3-6190-4930-b4d3-4453015d69ed')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$CMS$q$, 215, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7206e3a-e992-4f4e-b237-ddd3af5fbec1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$CMS$q$, 216, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$CMS$q$, 217, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$CMS$q$, 218, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '08338430-d0a4-4361-b6b5-4d22262c823c', $q$CMS$q$, 219, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08338430-d0a4-4361-b6b5-4d22262c823c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$CMS$q$, 220, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64642ef0-b3ed-44e3-9e65-2ef843fbfc7e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$CMS$q$, 221, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eaf343b7-68ce-48ea-8f63-afd6f23421df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b894fce3-7970-4562-8f82-502c745c7472', $q$CMS$q$, 222, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b894fce3-7970-4562-8f82-502c745c7472')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd7da54f6-2b64-440b-9f41-a831adbd9e11', $q$CMS$q$, 223, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7da54f6-2b64-440b-9f41-a831adbd9e11')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$CRM$q$, 225, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '925db15a-65f7-4d4f-bb9d-cd05222b869f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$CRM$q$, 226, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb776dbd-be66-4afc-b3df-cfd58e6b6dd3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0e2f15fa-8304-4251-896f-4956273cb503', $q$Databases$q$, 227, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0e2f15fa-8304-4251-896f-4956273cb503')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Databases$q$, 228, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b8c7210-2173-4e7a-95b0-7458564b09fd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Databases$q$, 229, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Databases$q$, 230, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e940e3d2-e870-4b3e-819f-28d10c4d7db4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Databases$q$, 231, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d81dd7e-c136-40e4-8989-d72a34c9daf3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Databases$q$, 232, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b2320603-ad1f-48d1-a744-9445e8269225', $q$Databases$q$, 233, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2320603-ad1f-48d1-a744-9445e8269225')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd09c518a-e080-4d5d-83f0-8565089486cf', $q$Databases$q$, 234, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd09c518a-e080-4d5d-83f0-8565089486cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd9436d03-14e1-4e93-969b-27951c8697e7', $q$Databases$q$, 235, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd9436d03-14e1-4e93-969b-27951c8697e7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Databases$q$, 236, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a77d14f1-cb26-4d11-9d26-6fc0a6e26e61')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Network Utilities$q$, 237, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Network Utilities$q$, 238, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68da8924-7233-4187-b3c7-8e5486ea5ee0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Network Utilities$q$, 239, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff61bcc5-91e7-4059-9a0b-4ca89539d8cb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '08450324-4200-4667-af14-f12d8180794b', $q$Network Utilities$q$, 240, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08450324-4200-4667-af14-f12d8180794b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '324e805f-15ca-4f08-af33-49fee415253c', $q$Network Utilities$q$, 241, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '324e805f-15ca-4f08-af33-49fee415253c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Document Management$q$, 242, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Document Management$q$, 243, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc56b3f3-f4c5-4009-b322-e2f5719481b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Document Management$q$, 244, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff47afbc-51e2-479e-9cbb-45a5ec96314e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Document Management$q$, 245, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '993944af-a2d6-42bb-a3a0-2b1c8a4c460d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7407b9cd-1500-4f27-a02b-adda67302c80', $q$Document Management$q$, 246, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7407b9cd-1500-4f27-a02b-adda67302c80')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Document Management$q$, 247, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b160eec3-7dec-4749-aa87-4cbf8e786590')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95db99cc-d2cd-4227-a213-282aa828ef80', $q$E-book Management$q$, 248, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95db99cc-d2cd-4227-a213-282aa828ef80')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e99368f-6adc-431d-9ed6-588c0d07395e', $q$E-book Management$q$, 249, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e99368f-6adc-431d-9ed6-588c0d07395e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '298368f7-68f8-4264-b78c-a684a417a0b3', $q$E-book Management$q$, 250, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '298368f7-68f8-4264-b78c-a684a417a0b3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$E-book Management$q$, 251, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e4a075d-f88d-4c7c-b3da-ff99a7d73884')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$E-book Management$q$, 252, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45a5beb8-a950-4bc0-908e-c7d7b3bef34a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '002172fd-e41e-488b-88d6-f387f92abea3', $q$E-book Management$q$, 253, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '002172fd-e41e-488b-88d6-f387f92abea3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Library Software$q$, 254, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac2da229-e50c-4b42-a614-0213a13fd14e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Library Software$q$, 255, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99b70ad3-9af0-4ac2-9da3-d697947ef658')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5e577d8-a36b-4321-96a7-960980e7373b', $q$Library Software$q$, 256, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5e577d8-a36b-4321-96a7-960980e7373b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Library Software$q$, 257, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b860b3a-7f1c-4237-9c04-9f584f03194c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '014ca794-6131-4f44-a025-a0ff78da3c46', $q$Library Software$q$, 258, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '014ca794-6131-4f44-a025-a0ff78da3c46')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Library Software$q$, 259, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f31da656-5abb-4ac5-8a10-1c4937d3ecce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Library Software$q$, 260, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a72c0059-3aea-470f-b7ae-d8605c64dfda')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Library Software$q$, 261, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6642f7be-b54a-4974-8b1c-50cd8c2c2785')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Library Software$q$, 262, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea0dd7b0-e3e8-4424-afc9-75a3c6224c09')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$E-commerce$q$, 263, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$E-commerce$q$, 264, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69b58e37-645a-40d2-a5a2-c859a6b2c481')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$E-commerce$q$, 265, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0cb0a80b-0a80-4999-85e6-81d72d140ab9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$E-commerce$q$, 267, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa18bfe8-dba3-4e07-9d0c-7fd408d29121')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$E-commerce$q$, 268, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '73e6abda-a9cd-47e5-b644-042f92c64ac5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3dd97986-493e-470c-90a6-4ef415e3a585', $q$E-commerce$q$, 269, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3dd97986-493e-470c-90a6-4ef415e3a585')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Feed Readers$q$, 270, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3476f2a-8c51-4b81-9db1-f7d876d3be6b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Feed Readers$q$, 271, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e8f44a2-732d-4807-a318-25a5ce7d982d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Feed Readers$q$, 272, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '98aaa86f-78de-4ac7-a8a6-37ad046c4363')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1030679b-2caa-4c26-9774-5521af246bfb', $q$Feed Readers$q$, 273, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1030679b-2caa-4c26-9774-5521af246bfb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Feed Readers$q$, 274, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '126ce4f2-e1c8-43fc-b77f-37c96ff7806a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '70519451-7711-4cb1-9596-53310b5b53d4', $q$Feed Readers$q$, 275, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70519451-7711-4cb1-9596-53310b5b53d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Feed Readers$q$, 276, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Feed Readers$q$, 277, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b8dd75e-cb27-4973-af45-0de6a657268d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Feed Readers$q$, 278, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97ffdc76-9598-495d-a32e-3ec8c21cde65')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Feed Readers$q$, 279, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c279c42d-acd3-443e-8e69-69c91b4a2455')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Feed Readers$q$, 280, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f00ab228-25cf-4d37-82c5-5df4bbab3062')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd3359f3-5c52-465c-94cd-46d304141c29', $q$Feed Readers$q$, 281, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd3359f3-5c52-465c-94cd-46d304141c29')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Feed Readers$q$, 282, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd63cd81e-6805-4383-b257-12cd36fa4b4c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$File Management$q$, 283, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9f2a9ff-f6e9-415b-8ffe-221f389239e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$File Management$q$, 284, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '89ceb22c-3639-45b9-b003-00aa1f289c00', $q$File Management$q$, 285, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89ceb22c-3639-45b9-b003-00aa1f289c00')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$File Management$q$, 286, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5f2b023-ad94-4d73-8138-8c4e2d679679')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c5146704-2de4-4305-9ffc-65de453586a7', $q$File Management$q$, 287, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5146704-2de4-4305-9ffc-65de453586a7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$File Management$q$, 288, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$File Management$q$, 289, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd43ef06f-bad4-42e0-8b7a-9c651d64b167')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$File Management$q$, 290, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '592933ba-3f90-4b7b-9d93-73fb6b1fd373')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$File Management$q$, 291, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Cloud Storage$q$, 292, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38a2e613-81b8-4dd1-a50b-c900db574bb3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Cloud Storage$q$, 293, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$File Sharing$q$, 294, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2656ef1b-64da-4cfd-a088-8db929a97a0a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a4888a56-3678-4b59-b919-440fd6bf1847', $q$File Sharing$q$, 295, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4888a56-3678-4b59-b919-440fd6bf1847')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$File Sharing$q$, 296, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cb48bdf-2a61-44e4-8397-27e42d5d763d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$File Sharing$q$, 297, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7196ce6f-7454-4ae5-8a10-7ac77752c856')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae1278c1-c356-40cb-b81c-795513168fe4', $q$File Sharing$q$, 298, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae1278c1-c356-40cb-b81c-795513168fe4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$File Sharing$q$, 299, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae67381f-84b3-429f-9ba2-4dc9e646db97')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$File Sharing$q$, 300, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e4812bd-f938-4e90-be82-f06e39de6ab3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b886551b-23de-40d7-8f48-7bb6d59c286b', $q$File Sharing$q$, 301, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b886551b-23de-40d7-8f48-7bb6d59c286b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$File Sharing$q$, 302, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffae92bf-f4f5-40c4-b5cb-88cc30edd135')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$File Sharing$q$, 303, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d7aacfb-24f7-4b69-a710-ff2942eeaaa7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7eb54f85-fa53-45b8-9643-952ef361763c', $q$File Sharing$q$, 304, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7eb54f85-fa53-45b8-9643-952ef361763c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '84a38488-775c-4325-9b1d-4639474c2773', $q$File Sharing$q$, 305, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84a38488-775c-4325-9b1d-4639474c2773')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$File Sharing$q$, 306, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '991a14b4-c72d-4cf5-87f7-81f3fc26205a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05360a62-d1a4-4432-b898-08dd0ad1189d', $q$File Sharing$q$, 307, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05360a62-d1a4-4432-b898-08dd0ad1189d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee29016b-e8bd-48bb-949d-e74570770e58', $q$File Sharing$q$, 308, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee29016b-e8bd-48bb-949d-e74570770e58')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$File Management$q$, 309, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$File Management$q$, 310, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a25838b-7398-4938-8fa5-7b5fcd9080f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7970f696-afb2-4a60-a110-66287a0c9216', $q$File Management$q$, 311, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7970f696-afb2-4a60-a110-66287a0c9216')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ba9e98b-5119-4b61-bcba-6f4764974281', $q$File Management$q$, 312, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ba9e98b-5119-4b61-bcba-6f4764974281')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '00400667-6209-4172-b7aa-b8106d654692', $q$File Management$q$, 313, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00400667-6209-4172-b7aa-b8106d654692')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a912766-4254-41da-82e0-c0807adcbbb5', $q$File Management$q$, 314, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a912766-4254-41da-82e0-c0807adcbbb5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$File Management$q$, 315, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7790e8ea-c240-4ee6-9b40-8da31a143d62')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$File Management$q$, 316, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$File Management$q$, 317, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f583e3e-2f7f-4949-b806-41aa6c8365bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Gaming Software$q$, 318, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Gaming Software$q$, 319, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'acb4633f-9c12-4fe7-abe7-4e2c008d1d04')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Gaming Software$q$, 320, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '384faab2-7aa8-4e95-8df9-454c72ae8bb2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Gaming Software$q$, 321, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c79fd2a4-de89-4e02-bf96-2e51b3747f3b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Gaming Software$q$, 322, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '77a26385-9077-48ad-bcca-92dcc22cef2e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Gaming Software$q$, 323, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a0efe36-6967-41a8-8703-57fdd1450a58')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Gaming Software$q$, 324, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb496915-ab02-4433-8bfc-70ec1fc91a9c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Gaming Software$q$, 325, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae510c8a-18ad-492c-8df9-432190e35f9d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Gaming Software$q$, 326, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59de2787-72b5-4f39-9d09-b260b1994aa6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Gaming Software$q$, 327, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Gaming Software$q$, 328, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd0b0ec4-080c-44f8-8cca-2ceddee81151')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Gaming Software$q$, 329, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b3e2e73-ff9d-46eb-852d-a3b455445f8b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Gaming Software$q$, 330, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Gaming Software$q$, 331, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5950887b-56e9-4a05-b6d2-f57b3d882853')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Gaming Software$q$, 332, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27d05620-43c3-4522-a6b6-5ae2a23a50b9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Gaming Software$q$, 333, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Gaming Software$q$, 334, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f50961f-98ec-4271-b1ef-2f486257a4a5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Gaming Software$q$, 335, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebf3f796-8c8b-4d07-a8cf-8d19e32204e3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Gaming Software$q$, 336, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '615af08e-8dd3-4316-8837-e9ead4f24aa4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b2362d6f-46ea-441d-ab8b-269f62578937', $q$Gaming Software$q$, 337, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2362d6f-46ea-441d-ab8b-269f62578937')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fa9fa04e-02dc-4476-8e37-077443604250', $q$Gaming Software$q$, 338, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa9fa04e-02dc-4476-8e37-077443604250')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '39827ac6-8122-4689-9464-0147ac338943', $q$Gaming Software$q$, 339, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39827ac6-8122-4689-9464-0147ac338943')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '55f67bf7-283b-46a3-a504-fefc5445313f', $q$Gaming Software$q$, 340, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '55f67bf7-283b-46a3-a504-fefc5445313f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Gaming Software$q$, 341, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0575e08f-1ac0-4b93-bd8d-6102a19fd89c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Gaming Software$q$, 342, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'daea352e-0ee8-41c6-a46e-47f6922604f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '27cd08d4-3907-484c-bde4-d06e726c6674', $q$Gaming Software$q$, 343, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27cd08d4-3907-484c-bde4-d06e726c6674')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Gaming Software$q$, 344, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Gaming Software$q$, 345, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '082de0e2-a5b9-4328-a2b9-bb364605a75a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Genealogy Software$q$, 346, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd31d369-2e60-4849-9a2b-8481c41a9d08')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a671332-0a6d-44a2-a483-911ca563acab', $q$Genealogy Software$q$, 347, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a671332-0a6d-44a2-a483-911ca563acab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eed15499-677d-4aec-b709-b24744a436e5', $q$Genealogy Software$q$, 348, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eed15499-677d-4aec-b709-b24744a436e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Genealogy Software$q$, 349, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b34c93e2-f29b-45a6-8b23-284d2b2cdca9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Genealogy Software$q$, 350, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61b1b0a8-fc36-4a65-86e4-2a1059a7c262')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$AI & Agents$q$, 351, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$AI & Agents$q$, 352, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '15d61a4f-9e28-4299-9ecb-c1c0998fc971')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '78732199-bee3-492f-a014-b27c713b3691', $q$AI & Agents$q$, 353, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78732199-bee3-492f-a014-b27c713b3691')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$AI & Agents$q$, 354, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9428b91f-6588-4b7f-9850-7d2b5813f72a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$AI & Agents$q$, 355, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fdeb2872-5b58-466b-b859-445bc95577f4', $q$Collaboration Software$q$, 356, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdeb2872-5b58-466b-b859-445bc95577f4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Collaboration Software$q$, 357, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c831cf1-d2a5-44c9-9cea-c5206afcba70')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Collaboration Software$q$, 358, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '36a13fec-4212-4e84-87b2-11cac8bee967', $q$Collaboration Software$q$, 359, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36a13fec-4212-4e84-87b2-11cac8bee967')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Collaboration Software$q$, 360, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08388501-9b47-462d-b036-ddaf4b02c5a5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e78263bf-152d-483f-a33a-9b78428215b6', $q$Collaboration Software$q$, 361, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e78263bf-152d-483f-a33a-9b78428215b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '75c612e3-c807-4326-9997-c8d5eb872687', $q$Collaboration Software$q$, 362, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75c612e3-c807-4326-9997-c8d5eb872687')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '02606861-acdd-47b6-b630-9860c5848608', $q$Collaboration Software$q$, 363, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02606861-acdd-47b6-b630-9860c5848608')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Collaboration Software$q$, 364, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c574afd-be4a-449c-adfa-0158130d6f1d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Collaboration Software$q$, 365, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13d8e1cf-dc46-4ceb-a3df-aaf2719813b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Collaboration Software$q$, 366, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fac8e051-0c40-4179-bbbd-8363f2ad6985')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Health & Fitness Software$q$, 367, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ef40ba1-79b2-4345-9ec2-bc2a4731b77e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Health & Fitness Software$q$, 368, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2325b7f-fda2-40f8-adc4-5f3940ce498f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Health & Fitness Software$q$, 369, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a73a78a-9eb5-44c7-beb9-2f36900d5602')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '183473d1-eb82-4807-95c3-e4a1c525575e', $q$Health & Fitness Software$q$, 370, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '183473d1-eb82-4807-95c3-e4a1c525575e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Health & Fitness Software$q$, 371, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c05a9b7-fdb5-409f-8a14-64eb71fbdace')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Health & Fitness Software$q$, 372, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa9d2774-9a4d-4792-8ad7-4de1b095e3bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$HR Software$q$, 373, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '079c889d-8df9-4612-92ff-bb745bc64902', $q$IoT Software$q$, 374, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '079c889d-8df9-4612-92ff-bb745bc64902')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$IoT Software$q$, 375, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5acefb5-8215-460f-9c6a-0a3d1e382f7e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$IoT Software$q$, 376, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bbf9b79-3028-47ee-bd1d-05dbaf8b833d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$IoT Software$q$, 377, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c12bd7ea-536c-4be0-9ac5-7f0daa0d7911')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$IoT Software$q$, 378, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ae3dedf-781d-4eba-bac7-7d80412bd2db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$IoT Software$q$, 379, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82491f2c-b6b1-4919-82ea-838eafd86db9', $q$IoT Software$q$, 380, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82491f2c-b6b1-4919-82ea-838eafd86db9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$IoT Software$q$, 381, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'caf4aea6-fd20-4af6-9d16-4a5cbc4d2503')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '040370f5-8835-4009-88cd-4a1d8b345969', $q$IoT Software$q$, 382, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '040370f5-8835-4009-88cd-4a1d8b345969')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$IoT Software$q$, 383, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1493d3f-721d-4cee-8c01-f904dc3274ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$IoT Software$q$, 384, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00ff6895-5fbd-49c5-9a5f-500fdaab2761')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$IoT Software$q$, 385, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86bb955c-8712-45a0-8f45-aeab54c99a6f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '985dacad-07a6-451c-b58a-1273bc999b4c', $q$IoT Software$q$, 386, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '985dacad-07a6-451c-b58a-1273bc999b4c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a231e16-9bac-4260-965f-8748c267e354', $q$IoT Software$q$, 387, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a231e16-9bac-4260-965f-8748c267e354')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$IoT Software$q$, 388, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8e405b1d-8563-4f77-89f4-97e61f455d64', $q$IoT Software$q$, 389, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e405b1d-8563-4f77-89f4-97e61f455d64')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$IoT Software$q$, 390, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3732b36-1f7f-4598-84f0-2ab858cfea63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Inventory Management$q$, 391, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c31deb25-5ad3-4424-a471-a168e2a0264c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Inventory Management$q$, 392, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edf1831f-3d22-4a14-9dc1-185e22d2141d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '17bcec27-a728-457f-9bcf-8278ac304f04', $q$Inventory Management$q$, 393, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17bcec27-a728-457f-9bcf-8278ac304f04')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Inventory Management$q$, 394, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ecc3f02-c0cd-49b1-9080-12b8eb327cb3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Inventory Management$q$, 395, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5643f8fa-5baa-4b88-b21e-5e0c97a9a43a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Inventory Management$q$, 396, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22f25c2f-1b4c-48c2-90e3-6d5df186e020')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4af91cc7-bff6-4870-8966-384ef1477386', $q$Inventory Management$q$, 397, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4af91cc7-bff6-4870-8966-384ef1477386')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Knowledge Management$q$, 398, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Knowledge Management$q$, 399, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c69e1506-7e03-4ddc-b000-d2233369bdcb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e674cd08-a074-41e5-a462-469391a5b739', $q$Learning Management$q$, 401, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e674cd08-a074-41e5-a462-469391a5b739')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e95356b-e091-45fd-baab-10b9302b101c', $q$Learning Management$q$, 402, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e95356b-e091-45fd-baab-10b9302b101c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Learning Management$q$, 403, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23a978e7-3e1a-4d34-b4db-5a37d2dff05c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Learning Management$q$, 404, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4cbf934b-aea7-4a55-98f6-4e21939c1ec3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Learning Management$q$, 405, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bc4665f4-feb7-4c9e-a25a-245306d04d1f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Learning Management$q$, 406, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '455123f9-8dc8-466a-b9ac-7b565c629ede')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '128ae277-f9ab-42e4-8593-e90d754504e5', $q$Learning Management$q$, 408, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '128ae277-f9ab-42e4-8593-e90d754504e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Learning Management$q$, 409, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a2781d6d-0be8-4b83-b404-3a5b91254b15')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Learning Management$q$, 410, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21d33fd5-20b2-4b49-8ccd-579b0f9edba6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9bf9becd-f896-4366-81eb-031d10afdd43', $q$Learning Management$q$, 411, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9bf9becd-f896-4366-81eb-031d10afdd43')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54383e70-4d96-4382-b653-361b0eb6367d', $q$Learning Management$q$, 412, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54383e70-4d96-4382-b653-361b0eb6367d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Manufacturing Software$q$, 413, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Manufacturing Software$q$, 414, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e77b193d-a129-4b8a-ad01-cfd44b2a8850')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Manufacturing Software$q$, 415, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '439efd18-8520-4a40-8b29-fb1b7b9c33f9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6a6419f3-298f-4290-865a-3d302e88068a', $q$Manufacturing Software$q$, 416, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a6419f3-298f-4290-865a-3d302e88068a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Manufacturing Software$q$, 417, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ded501a2-3874-4feb-b810-f1dff8c8fb1d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Manufacturing Software$q$, 418, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33fedead-cbf1-426b-aefe-c1f89bb34b01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Mapping & GIS$q$, 419, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af972f5d-442a-4182-b478-b2ab2783c080', $q$Mapping & GIS$q$, 420, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af972f5d-442a-4182-b478-b2ab2783c080')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Mapping & GIS$q$, 421, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b11a993-2f55-40d0-abfa-c3ac9710bd48')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Mapping & GIS$q$, 422, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a06850cf-38ac-4eb8-ba1c-a0710d10ee23')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48148d92-39dd-4402-8645-08c7801fdbd5', $q$Mapping & GIS$q$, 423, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48148d92-39dd-4402-8645-08c7801fdbd5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Mapping & GIS$q$, 424, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86baafbf-f9bc-4449-a7f2-056ec61dfb90')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Mapping & GIS$q$, 425, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bc74d5c2-961f-4a99-a34b-c92eee310096')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Mapping & GIS$q$, 426, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57200a8f-f3cf-4f52-8aed-098c07fbd667')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Mapping & GIS$q$, 427, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f8129e3-98ab-4d78-94b2-3a35a0efb279')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '60df7045-6dba-4088-8dad-1316174aa0df', $q$Mapping & GIS$q$, 428, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60df7045-6dba-4088-8dad-1316174aa0df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Mapping & GIS$q$, 429, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74308889-bf28-4f84-8e8e-f6ebecc1b93a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Mapping & GIS$q$, 430, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd1da66a-312f-432a-8e37-1dc816cc5520')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Media Management$q$, 431, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0608cdcb-8ede-4cee-a620-9cc6d15af341')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Media Management$q$, 432, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95c108e4-15cb-4703-b18c-02fcb91adb45')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '83b24c52-88dd-4d43-8826-92e123f63cae', $q$Media Management$q$, 433, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83b24c52-88dd-4d43-8826-92e123f63cae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Media Management$q$, 434, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffe78cc3-84d8-4e34-88df-15226b1e5736')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Media Management$q$, 435, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63b21fd2-9266-4e94-acfa-f6a9f0e85347')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Media Management$q$, 436, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'faf3dbd9-cf17-44f0-87da-3ad94eaa9671')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Media Management$q$, 437, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'effcc65a-35ca-4139-bbe4-ff1e95fd6c80')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Media Management$q$, 438, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Media Management$q$, 439, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27408a9d-fa62-429f-be90-8c7e77ed1deb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Media Management$q$, 440, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ee38403-9c79-4f01-b843-b92c0873dc50')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Audio Streaming$q$, 441, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Audio Streaming$q$, 442, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b3278d1-8d02-4f74-81f9-c990fdd076fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd508cac6-6459-4054-ae69-1f4088c41400', $q$Audio Streaming$q$, 443, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd508cac6-6459-4054-ae69-1f4088c41400')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Audio Streaming$q$, 444, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afe3197a-f0df-4980-b89c-90bb6be2715d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Audio Streaming$q$, 445, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80afb5c8-0281-4cec-9c4b-b2b6bf20335e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Audio Streaming$q$, 446, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5843c8b6-d28f-4688-bb58-9b9b806ffe66')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Audio Streaming$q$, 447, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6be73240-b846-4480-b296-99aefc7411ce', $q$Audio Streaming$q$, 448, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6be73240-b846-4480-b296-99aefc7411ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Audio Streaming$q$, 449, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c94279f7-118b-4aae-a54e-6cce37b4a7f3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Audio Streaming$q$, 450, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e04290f0-461c-4d34-99c8-53dd4fc5a339')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '85c3b235-223c-45ae-bc99-db8243a2c741', $q$Audio Streaming$q$, 451, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85c3b235-223c-45ae-bc99-db8243a2c741')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Audio Streaming$q$, 452, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20d0dcea-e515-425a-9158-96cea2e7f443', $q$Media Streaming$q$, 453, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20d0dcea-e515-425a-9158-96cea2e7f443')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Media Streaming$q$, 454, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1fd3a23c-84e4-4c6b-bd89-e880123d495c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Media Streaming$q$, 455, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '160ef825-4aa7-47be-8ed9-f30810cb8ba2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Media Streaming$q$, 456, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Media Streaming$q$, 457, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f15ae2d8-b82f-4e7b-b033-07c65a5c2617')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Media Streaming$q$, 458, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f4959893-76cd-46a8-ac09-5ec52854907c', $q$Media Streaming$q$, 459, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4959893-76cd-46a8-ac09-5ec52854907c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Media Streaming$q$, 460, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bd17012-c4b3-4edc-a6fb-45ecafd92bb2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Media Streaming$q$, 461, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1269899d-d0a4-4fea-afe2-1530e36e1f6f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Media Streaming$q$, 462, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7fcb3565-0b7e-4173-967c-63ee940c83a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Media Streaming$q$, 463, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Video Streaming$q$, 464, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3b942d1-643e-4d8c-b830-41cfe23c130e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4e301513-c3b6-4e23-8121-6625186cf446', $q$Video Streaming$q$, 465, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e301513-c3b6-4e23-8121-6625186cf446')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Video Streaming$q$, 466, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afaa3312-5d01-48a5-af22-141fd2ad264f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a8479085-b069-4122-84f4-d7d97ae020d3', $q$Utilities$q$, 467, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8479085-b069-4122-84f4-d7d97ae020d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Utilities$q$, 468, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Utilities$q$, 469, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a871d31-fa92-435d-8be7-8639d7f2476f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1f86602f-2198-4b4a-ae20-0793534244a7', $q$Utilities$q$, 470, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f86602f-2198-4b4a-ae20-0793534244a7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Utilities$q$, 471, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0fe96227-1d6d-4bd6-83ce-4ceea48aafd2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Utilities$q$, 472, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '49e87fbd-548a-4c83-b5b3-b84d439ae13c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Utilities$q$, 473, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03502625-329e-43e5-b9a4-c57308f6f0a3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Utilities$q$, 474, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '854f8d2c-af4c-48f6-b7f6-07a0687b0ff0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Utilities$q$, 475, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cbb55d0e-101f-4a0d-851d-02e7d9feca7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '16f675b3-a2df-4104-8242-9d861140e8cf', $q$Utilities$q$, 476, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16f675b3-a2df-4104-8242-9d861140e8cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Utilities$q$, 477, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90850fdb-68e2-47bf-bb23-ea2ccb2848e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Utilities$q$, 478, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c66c0bf-66e6-4947-82a4-244a69ecb504')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Utilities$q$, 479, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0a11055-ce1c-48de-8c3b-a99cd8a998eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '959b9d2f-85ba-483f-9122-54acf02a036f', $q$Utilities$q$, 480, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '959b9d2f-85ba-483f-9122-54acf02a036f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Utilities$q$, 481, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae515eae-68cb-450f-8fad-3f3174591ee1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Utilities$q$, 482, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cca6ce71-65f3-480e-80b7-a4723f4b0866')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c742a777-74f7-4981-aabd-5b21669059f3', $q$Utilities$q$, 483, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c742a777-74f7-4981-aabd-5b21669059f3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Utilities$q$, 484, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '917d6a1d-804c-4ce5-b0e0-d9db22f252c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '349b9202-524b-41fb-ba14-33f80aa672b7', $q$Utilities$q$, 485, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '349b9202-524b-41fb-ba14-33f80aa672b7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '270d9194-a92c-41d2-84b2-40be25395e12', $q$Utilities$q$, 486, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '270d9194-a92c-41d2-84b2-40be25395e12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f23f15f9-2364-493f-94fb-df321638df83', $q$Utilities$q$, 487, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f23f15f9-2364-493f-94fb-df321638df83')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Utilities$q$, 488, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9197c5d-03b9-4574-a2ba-90f4d26880a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Utilities$q$, 489, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea56c01c-6b17-4ccc-b7b7-0f3ee6227368')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Utilities$q$, 490, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Utilities$q$, 491, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f47d23ca-0f56-4a32-b7b9-20cfb7465b77')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Utilities$q$, 492, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Utilities$q$, 493, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '324cb4c8-ccb6-493d-82c4-2a69fa15670f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Utilities$q$, 494, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd83a1349-8ab9-4eea-8c4f-73b628234bab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Utilities$q$, 495, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff286dd5-38ce-4dba-930e-50e4da2c4d62')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Utilities$q$, 496, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '537f4377-d765-4451-9d22-d3ae543d7b4e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Utilities$q$, 497, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f61c5d6-c000-4e54-918d-cc68123a94de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e449918-7518-479f-8208-8ee3735b2652', $q$Utilities$q$, 498, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e449918-7518-479f-8208-8ee3735b2652')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Utilities$q$, 499, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bab3c6db-9b5a-484e-b9f3-7c8e256e957e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1c713be1-b714-409c-be08-f7969e107f24', $q$Utilities$q$, 500, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v6$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c713be1-b714-409c-be08-f7969e107f24')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('21d33c94-55de-4a2a-a6a5-45f0099564e0', $q$Analytics$q$, 1, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Analytics$q$, 6, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('5017ecef-eeac-41d4-87fc-cca911bb4e30', $q$Analytics$q$, 11, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3c70ee2d-b30a-457c-abbc-1172ad14a91d', $q$Analytics$q$, 12, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('33dae73d-17f7-499b-8dd5-21323e77ee01', $q$Analytics$q$, 14, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('9fff7050-4742-4d9d-90c3-b117262e1fcf', $q$Document Management$q$, 21, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ea9bc5c8-40c1-49f7-8e54-f0816195bf57', $q$Document Management$q$, 22, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e8f32075-0ef5-42f6-8b94-a8c3c8544c46', $q$Document Management$q$, 23, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('eb3daa84-88c9-499e-95e5-0b30eb01de90', $q$Document Management$q$, 27, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('4dbc9062-8847-4d09-ad79-21686e6afd30', $q$Document Management$q$, 28, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0e1a3b50-0d7b-473f-98ec-f11907a0a5a9', $q$Workflow Automation$q$, 29, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ac4cf7c0-028b-4c2e-ba11-afcc0b9a7533', $q$Workflow Automation$q$, 30, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('244c73b2-067b-49f8-9f82-b83dd0e0dfce', $q$Workflow Automation$q$, 31, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d9fe50ed-7854-4eab-b7e5-09d6879e58b8', $q$Workflow Automation$q$, 32, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('65a38524-812b-4ba7-9eff-27f973a0e40d', $q$Workflow Automation$q$, 33, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c39707a3-e756-48c8-929c-f10fe278ae92', $q$Workflow Automation$q$, 35, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c6b68bfb-e7f4-4aa7-b7c2-1fa1787822c7', $q$Workflow Automation$q$, 40, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('245c9bbd-59a4-47bd-b20c-befa7fb09e7b', $q$Workflow Automation$q$, 42, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('bc8fccda-7ef7-46c8-b43c-4e90a16c558c', $q$Workflow Automation$q$, 43, 9, 8, 8, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8635b016-4fe2-4047-a9bd-0d1adce0aa1b', $q$Blogging Platforms$q$, 45, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('280aa268-3174-4380-8d4f-ab00eb9ac2f7', $q$Blogging Platforms$q$, 46, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0f3533a6-b675-46c9-b835-af562ae15087', $q$Blogging Platforms$q$, 49, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Scheduling$q$, 54, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('cb305b30-042c-4afd-9644-7a70d5644c21', $q$Scheduling$q$, 55, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c907b9e7-a5f5-46c0-a8d3-cce0044adb42', $q$Scheduling$q$, 56, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('51ea1f9e-aff0-454a-b76c-ee99eb846f9c', $q$Scheduling$q$, 57, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0e9b4d40-09bf-428c-bae2-5b8bc5c02646', $q$Scheduling$q$, 58, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('7b5ab72f-cd65-4878-a433-6f7658fc65a4', $q$Bookmark Management$q$, 59, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8741e733-7b13-489c-8696-9d50fbf35b42', $q$CMS$q$, 224, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a4b8ce3e-bd25-4482-8847-63041b2784ea', $q$E-commerce$q$, 266, 8, 8, 7, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2db842ea-f8cf-4398-9294-2de09ec16c62', $q$Learning Management$q$, 400, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('da3ec484-b729-46bf-a035-975b4975e2d9', $q$Learning Management$q$, 407, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v6$q$)
ON CONFLICT (tool_id) DO NOTHING;

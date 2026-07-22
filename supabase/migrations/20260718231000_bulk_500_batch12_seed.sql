-- Bulk import gappsy-500-2026-07-18-batch12: 479 new commercial-SaaS tools,
-- landed as status='needs_review', noindex=true, sitemap_eligible=false.
-- Invisible to the public site until a separate editorial-enrichment pass
-- reviews and publishes each one (same pattern as prior bulk-import batches).

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b8bdf64-831a-4991-928c-9915966c425d', $q$3cols$q$, $q$3Cols$q$, $q$https://3cols.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b8bdf64-831a-4991-928c-9915966c425d', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b8bdf64-831a-4991-928c-9915966c425d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a6a3a09-2391-4c68-b426-c1902814f2f3', $q$abby$q$, $q$Abby$q$, $q$https://www.tryabby.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a6a3a09-2391-4c68-b426-c1902814f2f3', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a6a3a09-2391-4c68-b426-c1902814f2f3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53160125-bbda-43d5-ad5c-c1b8f9543567', $q$actiona$q$, $q$Actiona$q$, $q$https://wiki.actiona.tools/doku.php?id=:en:start$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53160125-bbda-43d5-ad5c-c1b8f9543567', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53160125-bbda-43d5-ad5c-c1b8f9543567')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d6d4025-1392-4d58-abe6-a85b1348c75f', $q$acunote-com$q$, $q$acunote.com$q$, $q$https://www.acunote.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d6d4025-1392-4d58-abe6-a85b1348c75f', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d6d4025-1392-4d58-abe6-a85b1348c75f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e6a61cb-8d49-4bab-8df7-e193fdb5828d', $q$akqa$q$, $q$AKQA$q$, $q$https://www.akqa.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e6a61cb-8d49-4bab-8df7-e193fdb5828d', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e6a61cb-8d49-4bab-8df7-e193fdb5828d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e730f7fb-ce8a-45ee-a2f2-2805eba89d8f', $q$alarm-clock$q$, $q$Alarm Clock$q$, $q$https://alarm-clock-applet.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e730f7fb-ce8a-45ee-a2f2-2805eba89d8f', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e730f7fb-ce8a-45ee-a2f2-2805eba89d8f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d5640da9-382e-4276-8f92-15cece528e99', $q$apiflash$q$, $q$ApiFlash$q$, $q$https://apiflash.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd5640da9-382e-4276-8f92-15cece528e99', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5640da9-382e-4276-8f92-15cece528e99')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3cf5327c-c0a8-404f-bf69-3fc340045642', $q$apify$q$, $q$Apify$q$, $q$https://www.apify.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3cf5327c-c0a8-404f-bf69-3fc340045642', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cf5327c-c0a8-404f-bf69-3fc340045642')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ee06b5a-cfc6-443e-9faf-49c4155189d8', $q$appinvento$q$, $q$Appinvento$q$, $q$https://appinvento.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ee06b5a-cfc6-443e-9faf-49c4155189d8', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ee06b5a-cfc6-443e-9faf-49c4155189d8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('02bbdfd7-d18b-4f67-8b9f-b53d3c6c8de0', $q$argos$q$, $q$Argos$q$, $q$https://argos-ci.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '02bbdfd7-d18b-4f67-8b9f-b53d3c6c8de0', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02bbdfd7-d18b-4f67-8b9f-b53d3c6c8de0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4b3800ea-87aa-41a1-a18e-912e02481106', $q$asgardeo-io$q$, $q$asgardeo.io$q$, $q$https://wso2.com/asgardeo$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4b3800ea-87aa-41a1-a18e-912e02481106', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b3800ea-87aa-41a1-a18e-912e02481106')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b930705-cfc0-4768-aaaa-2e63acbd6095', $q$aspect$q$, $q$Aspect$q$, $q$https://aspect.bildhuus.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b930705-cfc0-4768-aaaa-2e63acbd6095', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b930705-cfc0-4768-aaaa-2e63acbd6095')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('07218b04-d5e0-4c15-b183-87a769bfbbc2', $q$asus$q$, $q$ASUS$q$, $q$https://www.asus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '07218b04-d5e0-4c15-b183-87a769bfbbc2', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07218b04-d5e0-4c15-b183-87a769bfbbc2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5fa95c96-0cfd-470a-beb9-f4dd6e02c8a7', $q$authgear$q$, $q$Authgear$q$, $q$https://www.authgear.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5fa95c96-0cfd-470a-beb9-f4dd6e02c8a7', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5fa95c96-0cfd-470a-beb9-f4dd6e02c8a7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb5c1462-f100-411d-80a6-5e607484818f', $q$authpass$q$, $q$AuthPass$q$, $q$https://authpass.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb5c1462-f100-411d-80a6-5e607484818f', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb5c1462-f100-411d-80a6-5e607484818f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ce7d7abb-965e-47fa-a6cd-0327c7df9079', $q$authress$q$, $q$Authress$q$, $q$https://authress.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ce7d7abb-965e-47fa-a6cd-0327c7df9079', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce7d7abb-965e-47fa-a6cd-0327c7df9079')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e1766994-68c6-4c8b-afda-889f3aaad6f4', $q$authy$q$, $q$Authy$q$, $q$https://authy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e1766994-68c6-4c8b-afda-889f3aaad6f4', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1766994-68c6-4c8b-afda-889f3aaad6f4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2187636d-868e-49ce-876d-d8589525294e', $q$avatier$q$, $q$Avatier$q$, $q$https://avatier.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2187636d-868e-49ce-876d-d8589525294e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2187636d-868e-49ce-876d-d8589525294e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f081d77d-6e8f-4442-9eac-bfe94b79c0c1', $q$avo$q$, $q$Avo$q$, $q$https://avo.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f081d77d-6e8f-4442-9eac-bfe94b79c0c1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f081d77d-6e8f-4442-9eac-bfe94b79c0c1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b8ac237-4025-433b-86e2-003f6116e259', $q$backlog$q$, $q$Backlog$q$, $q$https://backlog.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b8ac237-4025-433b-86e2-003f6116e259', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b8ac237-4025-433b-86e2-003f6116e259')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e68d6b56-cd53-4fcd-896a-94f7affcdd1d', $q$beanstalkapp-com$q$, $q$beanstalkapp.com$q$, $q$https://beanstalkapp.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e68d6b56-cd53-4fcd-896a-94f7affcdd1d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e68d6b56-cd53-4fcd-896a-94f7affcdd1d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('102885a9-d27e-4d24-8bcd-26a67c8bc64f', $q$bearer$q$, $q$Bearer$q$, $q$https://www.bearer.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '102885a9-d27e-4d24-8bcd-26a67c8bc64f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '102885a9-d27e-4d24-8bcd-26a67c8bc64f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8f1c9f3c-0bbc-4447-8e8b-6308460bfc72', $q$bitrise-io$q$, $q$bitrise.io$q$, $q$https://www.bitrise.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8f1c9f3c-0bbc-4447-8e8b-6308460bfc72', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f1c9f3c-0bbc-4447-8e8b-6308460bfc72')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a3ab281c-0f57-4323-9e90-a3ab6bc9ea68', $q$bitrix24-com$q$, $q$bitrix24.com$q$, $q$https://www.bitrix24.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a3ab281c-0f57-4323-9e90-a3ab6bc9ea68', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a3ab281c-0f57-4323-9e90-a3ab6bc9ea68')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c469c6a-792c-487e-9146-9bc65b73f1e9', $q$bookmarkos-com$q$, $q$BookmarkOS.com$q$, $q$https://bookmarkos.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c469c6a-792c-487e-9146-9bc65b73f1e9', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c469c6a-792c-487e-9146-9bc65b73f1e9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('013fc84f-ffdf-4d76-8166-cf81a411c2e8', $q$braid$q$, $q$Braid$q$, $q$https://www.braidchat.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '013fc84f-ffdf-4d76-8166-cf81a411c2e8', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '013fc84f-ffdf-4d76-8166-cf81a411c2e8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a9a0c72-ca4d-45e7-aa81-ed7298617704', $q$breaktimer$q$, $q$BreakTimer$q$, $q$https://breaktimer.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a9a0c72-ca4d-45e7-aa81-ed7298617704', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a9a0c72-ca4d-45e7-aa81-ed7298617704')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87792455-0657-4911-a33e-05d6b447ecc1', $q$bugbug$q$, $q$BugBug$q$, $q$https://bugbug.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87792455-0657-4911-a33e-05d6b447ecc1', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87792455-0657-4911-a33e-05d6b447ecc1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d05a8911-94c8-4ded-9bc6-afc628a354e8', $q$bugcrowd$q$, $q$Bugcrowd$q$, $q$https://www.bugcrowd.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd05a8911-94c8-4ded-9bc6-afc628a354e8', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd05a8911-94c8-4ded-9bc6-afc628a354e8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a80a5e8-cb8b-4a90-830c-9ea5c7c7d5fc', $q$cacoo-com$q$, $q$cacoo.com$q$, $q$https://cacoo.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a80a5e8-cb8b-4a90-830c-9ea5c7c7d5fc', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a80a5e8-cb8b-4a90-830c-9ea5c7c7d5fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a56e0bb-0bcb-44be-944e-9e4b11bb4539', $q$calcurse$q$, $q$calcurse$q$, $q$https://calcurse.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a56e0bb-0bcb-44be-944e-9e4b11bb4539', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a56e0bb-0bcb-44be-944e-9e4b11bb4539')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('50dc8852-061d-48ca-aa66-b546734efaad', $q$cally-com$q$, $q$cally.com$q$, $q$https://cally.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '50dc8852-061d-48ca-aa66-b546734efaad', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50dc8852-061d-48ca-aa66-b546734efaad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bfa13736-5cdf-4dab-aa42-a840ea9719c5', $q$castle$q$, $q$Castle$q$, $q$https://castle.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bfa13736-5cdf-4dab-aa42-a840ea9719c5', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfa13736-5cdf-4dab-aa42-a840ea9719c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('03bcdece-1a8b-480d-947b-5ad1dede17d0', $q$certkit$q$, $q$CertKit$q$, $q$https://www.certkit.io/certificate-management$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '03bcdece-1a8b-480d-947b-5ad1dede17d0', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03bcdece-1a8b-480d-947b-5ad1dede17d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fcad01b3-73c7-478c-a0d9-f7183b4b6e39', $q$certobserver-ct-search$q$, $q$CertObserver CT Search$q$, $q$https://certobserver.com/ct-search$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fcad01b3-73c7-478c-a0d9-f7183b4b6e39', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fcad01b3-73c7-478c-a0d9-f7183b4b6e39')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6e2cffb0-5e91-4ff6-82cc-3ff414a58b5b', $q$ciphercloud$q$, $q$CipherCloud$q$, $q$https://ciphercloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6e2cffb0-5e91-4ff6-82cc-3ff414a58b5b', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e2cffb0-5e91-4ff6-82cc-3ff414a58b5b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86118475-1a9c-4a70-9c22-14996f8563a8', $q$cloud-66$q$, $q$Cloud 66$q$, $q$https://www.cloud66.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86118475-1a9c-4a70-9c22-14996f8563a8', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86118475-1a9c-4a70-9c22-14996f8563a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0fcbe957-d0e4-46b4-87eb-14e727ae4ab2', $q$cloud-iam$q$, $q$Cloud-IAM$q$, $q$https://www.cloud-iam.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0fcbe957-d0e4-46b4-87eb-14e727ae4ab2', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0fcbe957-d0e4-46b4-87eb-14e727ae4ab2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('469f4b55-236e-4e3e-b3d2-684fd59843f2', $q$cloudcraft$q$, $q$Cloudcraft$q$, $q$https://cloudcraft.co/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '469f4b55-236e-4e3e-b3d2-684fd59843f2', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '469f4b55-236e-4e3e-b3d2-684fd59843f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('93c7c717-34b9-4b7a-a2a6-54c9b04b63db', $q$cmder$q$, $q$Cmder$q$, $q$https://cmder.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '93c7c717-34b9-4b7a-a2a6-54c9b04b63db', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '93c7c717-34b9-4b7a-a2a6-54c9b04b63db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8538d67b-ef8f-47c5-95ac-808d9107a1d3', $q$cocalc-com$q$, $q$cocalc.com$q$, $q$https://cocalc.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8538d67b-ef8f-47c5-95ac-808d9107a1d3', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8538d67b-ef8f-47c5-95ac-808d9107a1d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f478ddc4-f63a-48a1-bc0d-6d01460ea3f7', $q$codspeed$q$, $q$CodSpeed$q$, $q$https://codspeed.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f478ddc4-f63a-48a1-bc0d-6d01460ea3f7', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f478ddc4-f63a-48a1-bc0d-6d01460ea3f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('72113a07-d836-42b2-bc28-ca8584b4dde2', $q$collective-health$q$, $q$Collective Health$q$, $q$https://collectivehealth.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '72113a07-d836-42b2-bc28-ca8584b4dde2', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72113a07-d836-42b2-bc28-ca8584b4dde2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('03b82cf8-538f-4100-a6b7-2a0c8edae0bb', $q$colortokens$q$, $q$ColorTokens$q$, $q$https://colortokens.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '03b82cf8-538f-4100-a6b7-2a0c8edae0bb', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03b82cf8-538f-4100-a6b7-2a0c8edae0bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('24680a77-6673-4532-875d-be234e171239', $q$corgea$q$, $q$Corgea$q$, $q$https://corgea.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '24680a77-6673-4532-875d-be234e171239', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24680a77-6673-4532-875d-be234e171239')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('761c6882-76cc-4899-8894-6e19fcd03196', $q$coupler$q$, $q$Coupler$q$, $q$https://www.coupler.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '761c6882-76cc-4899-8894-6e19fcd03196', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '761c6882-76cc-4899-8894-6e19fcd03196')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c784f807-986f-42ed-bef7-f3172bf29eb6', $q$craftmypdf$q$, $q$CraftMyPDF$q$, $q$https://craftmypdf.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c784f807-986f-42ed-bef7-f3172bf29eb6', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c784f807-986f-42ed-bef7-f3172bf29eb6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d920caf-40c5-4430-b55f-21f70eb9a658', $q$crossftp$q$, $q$CrossFTP$q$, $q$https://www.crossftp.com/ftp-client.htm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d920caf-40c5-4430-b55f-21f70eb9a658', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d920caf-40c5-4430-b55f-21f70eb9a658')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('34cca3da-0b47-4c2e-891f-b5da7f4f9768', $q$crosswork$q$, $q$Crosswork$q$, $q$https://crosswork.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '34cca3da-0b47-4c2e-891f-b5da7f4f9768', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34cca3da-0b47-4c2e-891f-b5da7f4f9768')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('058989b4-a238-4856-bca0-68e31443678d', $q$crowdin-com$q$, $q$crowdin.com$q$, $q$https://crowdin.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '058989b4-a238-4856-bca0-68e31443678d', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '058989b4-a238-4856-bca0-68e31443678d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cdca3933-c58c-427d-9060-e2df06cbc53b', $q$cruise-automation$q$, $q$Cruise Automation$q$, $q$https://www.getcruise.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cdca3933-c58c-427d-9060-e2df06cbc53b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdca3933-c58c-427d-9060-e2df06cbc53b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9f13fc9b-f365-42fd-bc19-797a2d893bee', $q$crypteron-com$q$, $q$crypteron.com$q$, $q$https://www.crypteron.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9f13fc9b-f365-42fd-bc19-797a2d893bee', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f13fc9b-f365-42fd-bc19-797a2d893bee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2eea72c4-2de1-4425-96b0-110333386a22', $q$cybercube$q$, $q$CyberCube$q$, $q$https://www.cybcube.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2eea72c4-2de1-4425-96b0-110333386a22', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2eea72c4-2de1-4425-96b0-110333386a22')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a544388-740c-4cd7-b1e4-2fa282b5fd60', $q$cyberghost$q$, $q$CyberGhost$q$, $q$https://www.cyberghostvpn.com/en_US/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a544388-740c-4cd7-b1e4-2fa282b5fd60', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a544388-740c-4cd7-b1e4-2fa282b5fd60')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8cf8b19c-724e-4ace-adfc-195869faf40e', $q$cypress-io$q$, $q$cypress.io$q$, $q$https://www.cypress.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8cf8b19c-724e-4ace-adfc-195869faf40e', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8cf8b19c-724e-4ace-adfc-195869faf40e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b23a4173-cab6-4af5-bc43-b6e1a4f6c10b', $q$dappling-network$q$, $q$dAppling Network$q$, $q$https://www.dappling.network/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b23a4173-cab6-4af5-bc43-b6e1a4f6c10b', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b23a4173-cab6-4af5-bc43-b6e1a4f6c10b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c9031180-f3be-4ace-8d4c-cae03b1b7546', $q$data-miner$q$, $q$Data Miner$q$, $q$https://dataminer.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c9031180-f3be-4ace-8d4c-cae03b1b7546', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9031180-f3be-4ace-8d4c-cae03b1b7546')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e23e4ddb-c07a-4b99-a76f-d5c1db4f834b', $q$datree$q$, $q$Datree$q$, $q$https://www.datree.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e23e4ddb-c07a-4b99-a76f-d5c1db4f834b', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e23e4ddb-c07a-4b99-a76f-d5c1db4f834b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d1ba060-3047-48d5-afa1-eeea9a7bc1b6', $q$deepnote$q$, $q$Deepnote$q$, $q$https://deepnote.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d1ba060-3047-48d5-afa1-eeea9a7bc1b6', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d1ba060-3047-48d5-afa1-eeea9a7bc1b6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8c41222b-5f6e-473c-a1b3-a9e81f36d413', $q$deepsource$q$, $q$DeepSource$q$, $q$https://deepsource.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8c41222b-5f6e-473c-a1b3-a9e81f36d413', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c41222b-5f6e-473c-a1b3-a9e81f36d413')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab2080fd-f85c-4771-9fec-f4565b55bd54', $q$dependabot$q$, $q$Dependabot$q$, $q$https://dependabot.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab2080fd-f85c-4771-9fec-f4565b55bd54', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab2080fd-f85c-4771-9fec-f4565b55bd54')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7e3cf46-e5b2-4863-9ade-036bce7d9b8f', $q$dhiwise$q$, $q$DhiWise$q$, $q$https://www.dhiwise.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7e3cf46-e5b2-4863-9ade-036bce7d9b8f', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7e3cf46-e5b2-4863-9ade-036bce7d9b8f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af5d862b-9847-4d20-957d-64acefd83518', $q$diawi$q$, $q$Diawi$q$, $q$https://www.diawi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af5d862b-9847-4d20-957d-64acefd83518', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af5d862b-9847-4d20-957d-64acefd83518')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('add33646-6e6f-450c-a421-d83289070027', $q$dj-checkup$q$, $q$DJ Checkup$q$, $q$https://djcheckup.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'add33646-6e6f-450c-a421-d83289070027', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'add33646-6e6f-450c-a421-d83289070027')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8978ee71-fc74-45e5-9243-9c12f0bc3e4f', $q$dolphin-emulator$q$, $q$Dolphin Emulator$q$, $q$https://dolphin-emu.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8978ee71-fc74-45e5-9243-9c12f0bc3e4f', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8978ee71-fc74-45e5-9243-9c12f0bc3e4f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f3066964-4fea-4cce-aa97-8021d4f0f689', $q$easyretro-io$q$, $q$easyretro.io$q$, $q$https://www.easyretro.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f3066964-4fea-4cce-aa97-8021d4f0f689', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3066964-4fea-4cce-aa97-8021d4f0f689')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e67ec8f4-6724-499d-9797-c7ebe1606608', $q$egnyte$q$, $q$Egnyte$q$, $q$https://egnyte.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e67ec8f4-6724-499d-9797-c7ebe1606608', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e67ec8f4-6724-499d-9797-c7ebe1606608')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('79bad209-25a9-4a60-98d0-485f1b1a2841', $q$elmah-io$q$, $q$elmah.io$q$, $q$https://elmah.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '79bad209-25a9-4a60-98d0-485f1b1a2841', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79bad209-25a9-4a60-98d0-485f1b1a2841')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7a4144c-9250-4e27-8225-6d51fe352728', $q$ensilo$q$, $q$enSilo$q$, $q$https://www.ensilo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7a4144c-9250-4e27-8225-6d51fe352728', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7a4144c-9250-4e27-8225-6d51fe352728')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('84defde8-30fb-4853-abab-9a3911edb937', $q$espanso$q$, $q$espanso$q$, $q$https://espanso.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '84defde8-30fb-4853-abab-9a3911edb937', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84defde8-30fb-4853-abab-9a3911edb937')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c4faeff-bed1-4349-8cda-e64e27eec5ee', $q$export-sdk$q$, $q$Export SDK$q$, $q$https://exportsdk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c4faeff-bed1-4349-8cda-e64e27eec5ee', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c4faeff-bed1-4349-8cda-e64e27eec5ee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3f537593-6d7c-4b78-86d2-c1672ef47681', $q$feedback-fish$q$, $q$feedback.fish$q$, $q$https://feedback.fish/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3f537593-6d7c-4b78-86d2-c1672ef47681', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f537593-6d7c-4b78-86d2-c1672ef47681')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af818b41-34b2-4c68-b4b7-4a8e04f0d55d', $q$fibo$q$, $q$Fibo$q$, $q$https://fibo.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af818b41-34b2-4c68-b4b7-4a8e04f0d55d', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af818b41-34b2-4c68-b4b7-4a8e04f0d55d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ff9a9a3-b2e1-403c-8100-fc3d62544385', $q$fizzy$q$, $q$Fizzy$q$, $q$https://www.fizzy.do/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ff9a9a3-b2e1-403c-8100-fc3d62544385', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ff9a9a3-b2e1-403c-8100-fc3d62544385')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e131f632-aef1-4d07-9f48-39a7d238f759', $q$flareget$q$, $q$Flareget$q$, $q$https://flareget.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e131f632-aef1-4d07-9f48-39a7d238f759', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e131f632-aef1-4d07-9f48-39a7d238f759')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2fd93906-89ed-4e5b-9f9f-996fc3781562', $q$flat-social$q$, $q$flat.social$q$, $q$https://flat.social$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2fd93906-89ed-4e5b-9f9f-996fc3781562', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2fd93906-89ed-4e5b-9f9f-996fc3781562')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('209a03e8-4fda-4aba-8d79-da1fbf027843', $q$flightcontrol-dev$q$, $q$flightcontrol.dev$q$, $q$https://flightcontrol.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '209a03e8-4fda-4aba-8d79-da1fbf027843', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '209a03e8-4fda-4aba-8d79-da1fbf027843')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0201f850-3011-4af7-8a82-ff28d5bf2e3a', $q$flutlab$q$, $q$FlutLab$q$, $q$https://flutlab.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0201f850-3011-4af7-8a82-ff28d5bf2e3a', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0201f850-3011-4af7-8a82-ff28d5bf2e3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7cd2a382-2f81-4c15-941b-fd980d28c49d', $q$forcepoint$q$, $q$Forcepoint$q$, $q$https://forcepoint.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7cd2a382-2f81-4c15-941b-fd980d28c49d', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cd2a382-2f81-4c15-941b-fd980d28c49d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2c22dc4-f4b5-4ab1-bcbb-f5b904529873', $q$form-taxi$q$, $q$Form.taxi$q$, $q$https://form.taxi/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2c22dc4-f4b5-4ab1-bcbb-f5b904529873', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2c22dc4-f4b5-4ab1-bcbb-f5b904529873')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b571b9db-5d28-4112-8049-1a0fe4c15252', $q$formester-com$q$, $q$Formester.com$q$, $q$https://formester.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b571b9db-5d28-4112-8049-1a0fe4c15252', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b571b9db-5d28-4112-8049-1a0fe4c15252')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86817617-ca40-4c41-a22b-0863e32d3658', $q$formsubmit-co$q$, $q$Formsubmit.co$q$, $q$https://formsubmit.co/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86817617-ca40-4c41-a22b-0863e32d3658', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86817617-ca40-4c41-a22b-0863e32d3658')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82f9a84b-bc9a-4a0c-9dea-9a6347c72776', $q$formware-io$q$, $q$Formware.io$q$, $q$https://formware.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82f9a84b-bc9a-4a0c-9dea-9a6347c72776', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82f9a84b-bc9a-4a0c-9dea-9a6347c72776')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d65fb00c-ad19-4f0a-8b33-f9ac43976e3e', $q$framagit-org$q$, $q$framagit.org$q$, $q$https://framagit.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd65fb00c-ad19-4f0a-8b33-f9ac43976e3e', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd65fb00c-ad19-4f0a-8b33-f9ac43976e3e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('03d8556c-a3e1-4b1e-8a76-275a9375a80c', $q$front-app$q$, $q$Front App$q$, $q$https://frontapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '03d8556c-a3e1-4b1e-8a76-275a9375a80c', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03d8556c-a3e1-4b1e-8a76-275a9375a80c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ba593b7-0ee2-4846-88c4-e2c9ca1d3205', $q$gemfury$q$, $q$Gemfury$q$, $q$https://gemfury.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ba593b7-0ee2-4846-88c4-e2c9ca1d3205', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ba593b7-0ee2-4846-88c4-e2c9ca1d3205')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b2465ba3-344b-4364-87d4-76ce0f4b144a', $q$geoapify-com$q$, $q$geoapify.com$q$, $q$https://www.geoapify.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b2465ba3-344b-4364-87d4-76ce0f4b144a', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2465ba3-344b-4364-87d4-76ce0f4b144a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e6141b46-6897-4c35-a618-11aaf2be5837', $q$getpantry-cloud$q$, $q$getpantry.cloud$q$, $q$https://getpantry.cloud/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e6141b46-6897-4c35-a618-11aaf2be5837', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e6141b46-6897-4c35-a618-11aaf2be5837')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2142ad9d-a04b-4c5b-bacc-45bed496cf5d', $q$getupdraft$q$, $q$GetUpdraft$q$, $q$https://www.getupdraft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2142ad9d-a04b-4c5b-bacc-45bed496cf5d', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2142ad9d-a04b-4c5b-bacc-45bed496cf5d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fdf264f7-9752-40b5-856a-6476de3a93e0', $q$getvm$q$, $q$GetVM$q$, $q$https://getvm.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fdf264f7-9752-40b5-856a-6476de3a93e0', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdf264f7-9752-40b5-856a-6476de3a93e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c7495c4-59e5-4771-bb6e-c2212b69cd13', $q$gforge$q$, $q$GForge$q$, $q$https://gforge.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c7495c4-59e5-4771-bb6e-c2212b69cd13', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c7495c4-59e5-4771-bb6e-c2212b69cd13')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('62d3a99f-29bc-49cb-a2ce-73d3ccc0fee5', $q$gitter-im$q$, $q$gitter.im$q$, $q$https://gitter.im/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '62d3a99f-29bc-49cb-a2ce-73d3ccc0fee5', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62d3a99f-29bc-49cb-a2ce-73d3ccc0fee5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('597b04d8-38e0-4572-8798-edf05d2ff472', $q$glasswire$q$, $q$GlassWire$q$, $q$https://www.glasswire.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '597b04d8-38e0-4572-8798-edf05d2ff472', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '597b04d8-38e0-4572-8798-edf05d2ff472')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e1588d34-f389-45e0-85f9-0e65b5a51697', $q$gleek-io$q$, $q$gleek.io$q$, $q$https://www.gleek.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e1588d34-f389-45e0-85f9-0e65b5a51697', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1588d34-f389-45e0-85f9-0e65b5a51697')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a9d57005-8254-4a8e-8077-bb74382f7b08', $q$gliffy$q$, $q$Gliffy$q$, $q$https://www.gliffy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a9d57005-8254-4a8e-8077-bb74382f7b08', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9d57005-8254-4a8e-8077-bb74382f7b08')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('04d47a13-4e28-47c6-9386-caeef8fc0bcb', $q$gnome-pomodoro$q$, $q$GNOME Pomodoro$q$, $q$https://gnomepomodoro.org/#download$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '04d47a13-4e28-47c6-9386-caeef8fc0bcb', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04d47a13-4e28-47c6-9386-caeef8fc0bcb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('738aa639-77be-4b29-87f3-cede23f9ba93', $q$gokanban-io$q$, $q$gokanban.io$q$, $q$https://gokanban.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '738aa639-77be-4b29-87f3-cede23f9ba93', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '738aa639-77be-4b29-87f3-cede23f9ba93')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fbedb31e-d390-4d41-9711-e4e1d51b04ec', $q$goreportcard-com$q$, $q$goreportcard.com$q$, $q$https://goreportcard.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fbedb31e-d390-4d41-9711-e4e1d51b04ec', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbedb31e-d390-4d41-9711-e4e1d51b04ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc78dec6-f940-49ca-8259-882392fa4093', $q$graphcomment$q$, $q$GraphComment$q$, $q$https://graphcomment.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc78dec6-f940-49ca-8259-882392fa4093', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc78dec6-f940-49ca-8259-882392fa4093')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('50a352e4-985f-48db-9f9e-5065ee565808', $q$hackmd-io$q$, $q$Hackmd.io$q$, $q$https://hackmd.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '50a352e4-985f-48db-9f9e-5065ee565808', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50a352e4-985f-48db-9f9e-5065ee565808')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2f3d1d83-a890-48a4-8c87-6cda18bb9362', $q$hewlett-packard-enterprise$q$, $q$Hewlett-Packard Enterprise$q$, $q$https://hpe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2f3d1d83-a890-48a4-8c87-6cda18bb9362', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f3d1d83-a890-48a4-8c87-6cda18bb9362')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e8085152-0783-4b48-96b8-0608bf7280d0', $q$heyretro$q$, $q$HeyRetro$q$, $q$https://heyretro.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e8085152-0783-4b48-96b8-0608bf7280d0', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8085152-0783-4b48-96b8-0608bf7280d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13c2f5a9-1d2a-4498-82bb-fd6ed55fac49', $q$heyspace$q$, $q$HeySpace$q$, $q$https://hey.space$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13c2f5a9-1d2a-4498-82bb-fd6ed55fac49', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13c2f5a9-1d2a-4498-82bb-fd6ed55fac49')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d6001483-4357-4718-ae77-d7db5b66e0bc', $q$himitsushell$q$, $q$HimitsuShell$q$, $q$https://himitsushell.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd6001483-4357-4718-ae77-d7db5b66e0bc', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6001483-4357-4718-ae77-d7db5b66e0bc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a5c14ef-a08d-4371-a90d-5b3c61c41f59', $q$holberton-school$q$, $q$Holberton School$q$, $q$https://www.holbertonschool.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a5c14ef-a08d-4371-a90d-5b3c61c41f59', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a5c14ef-a08d-4371-a90d-5b3c61c41f59')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9ca783cc-294e-4bf4-a7ba-f0d5b9b4421e', $q$holistic-dev$q$, $q$holistic.dev$q$, $q$https://holistic.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9ca783cc-294e-4bf4-a7ba-f0d5b9b4421e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ca783cc-294e-4bf4-a7ba-f0d5b9b4421e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6fe67406-3aad-4feb-9e90-67fbdffd2ac4', $q$hostedscan-com$q$, $q$hostedscan.com$q$, $q$https://hostedscan.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6fe67406-3aad-4feb-9e90-67fbdffd2ac4', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fe67406-3aad-4feb-9e90-67fbdffd2ac4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e3dce97-5ea9-4efc-9157-82bbdf39bfa9', $q$hygger$q$, $q$Hygger$q$, $q$https://hygger.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e3dce97-5ea9-4efc-9157-82bbdf39bfa9', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e3dce97-5ea9-4efc-9157-82bbdf39bfa9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae8d08ab-76ed-473d-8096-f916fc9cf6ff', $q$hypertune$q$, $q$Hypertune$q$, $q$https://www.hypertune.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae8d08ab-76ed-473d-8096-f916fc9cf6ff', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae8d08ab-76ed-473d-8096-f916fc9cf6ff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a7aa3a7b-159a-4b76-bdd1-3de59ada0bff', $q$imperva$q$, $q$Imperva$q$, $q$https://imperva.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a7aa3a7b-159a-4b76-bdd1-3de59ada0bff', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a7aa3a7b-159a-4b76-bdd1-3de59ada0bff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('18267b78-6fc1-4fa7-a394-95efc8e74c48', $q$intensedebate$q$, $q$IntenseDebate$q$, $q$https://intensedebate.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '18267b78-6fc1-4fa7-a394-95efc8e74c48', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18267b78-6fc1-4fa7-a394-95efc8e74c48')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a17a6da7-ed22-4353-bd96-969a20fe454f', $q$internet-nl$q$, $q$Internet.nl$q$, $q$https://internet.nl$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a17a6da7-ed22-4353-bd96-969a20fe454f', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a17a6da7-ed22-4353-bd96-969a20fe454f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('113bd5ad-324e-4157-9957-8f45c5d3706c', $q$jitpack-io$q$, $q$jitpack.io$q$, $q$https://jitpack.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '113bd5ad-324e-4157-9957-8f45c5d3706c', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '113bd5ad-324e-4157-9957-8f45c5d3706c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd20ac12-b9fa-4d81-b3b3-6b99f5c436a8', $q$juniper-networks$q$, $q$Juniper Networks$q$, $q$https://juniper.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd20ac12-b9fa-4d81-b3b3-6b99f5c436a8', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd20ac12-b9fa-4d81-b3b3-6b99f5c436a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('24d2232e-ed4e-4f5a-924d-a5d4ca9d36c7', $q$kanbanflow-com$q$, $q$kanbanflow.com$q$, $q$https://kanbanflow.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '24d2232e-ed4e-4f5a-924d-a5d4ca9d36c7', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24d2232e-ed4e-4f5a-924d-a5d4ca9d36c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d6f9d53-7eab-42fb-9863-0383df58a4e1', $q$kanbantool-com$q$, $q$kanbantool.com$q$, $q$https://kanbantool.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d6f9d53-7eab-42fb-9863-0383df58a4e1', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d6f9d53-7eab-42fb-9863-0383df58a4e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b6427ca2-a163-4b31-8bc3-60b8e9bc495e', $q$karuna-health$q$, $q$Karuna Health$q$, $q$https://www.meetkaruna.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b6427ca2-a163-4b31-8bc3-60b8e9bc495e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6427ca2-a163-4b31-8bc3-60b8e9bc495e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1f4142b-0887-4e0a-9a7e-75024fa8b64c', $q$keploy$q$, $q$Keploy$q$, $q$https://keploy.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1f4142b-0887-4e0a-9a7e-75024fa8b64c', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1f4142b-0887-4e0a-9a7e-75024fa8b64c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bc5b1125-e4c5-4c3e-952c-4408d9b8fb76', $q$keypirinha$q$, $q$Keypirinha$q$, $q$https://keypirinha.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bc5b1125-e4c5-4c3e-952c-4408d9b8fb76', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bc5b1125-e4c5-4c3e-952c-4408d9b8fb76')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('351f1b54-7237-4d8c-8fd6-3d0707dd48ba', $q$kintone$q$, $q$Kintone$q$, $q$https://kintone.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '351f1b54-7237-4d8c-8fd6-3d0707dd48ba', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '351f1b54-7237-4d8c-8fd6-3d0707dd48ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95fce2e8-6e9f-420c-aac6-60ee6f2dcbcd', $q$kitemaker-co$q$, $q$Kitemaker.co$q$, $q$https://kitemaker.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95fce2e8-6e9f-420c-aac6-60ee6f2dcbcd', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95fce2e8-6e9f-420c-aac6-60ee6f2dcbcd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3fdc00ab-4a10-4aa2-9b49-af7c49379c68', $q$kiter-app$q$, $q$Kiter.app$q$, $q$https://www.kiter.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3fdc00ab-4a10-4aa2-9b49-af7c49379c68', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fdc00ab-4a10-4aa2-9b49-af7c49379c68')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d7228e5e-4c17-4381-abb7-5ef309160e53', $q$kogiqa$q$, $q$kogiQA$q$, $q$https://kogiqa.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd7228e5e-4c17-4381-abb7-5ef309160e53', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7228e5e-4c17-4381-abb7-5ef309160e53')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('736b5ad2-aaa6-431e-90bc-e57046195e30', $q$kunobi$q$, $q$Kunobi$q$, $q$https://kunobi.ninja$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '736b5ad2-aaa6-431e-90bc-e57046195e30', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '736b5ad2-aaa6-431e-90bc-e57046195e30')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e9790ca-6b69-480b-b8ec-b63c43ab419e', $q$kwes-io$q$, $q$Kwes.io$q$, $q$https://kwes.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e9790ca-6b69-480b-b8ec-b63c43ab419e', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e9790ca-6b69-480b-b8ec-b63c43ab419e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('db52fc9b-fba7-4f14-a760-d19378a74970', $q$letsencrypt-org$q$, $q$letsencrypt.org$q$, $q$https://letsencrypt.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'db52fc9b-fba7-4f14-a760-d19378a74970', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db52fc9b-fba7-4f14-a760-d19378a74970')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b650bdd1-9652-40a2-9e91-f19c7e073c20', $q$linkinize$q$, $q$Linkinize$q$, $q$https://linkinize.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b650bdd1-9652-40a2-9e91-f19c7e073c20', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b650bdd1-9652-40a2-9e91-f19c7e073c20')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('52572350-af84-4a5a-a1ee-2ea0dd353e63', $q$linkok-com$q$, $q$linkok.com$q$, $q$https://linkok.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '52572350-af84-4a5a-a1ee-2ea0dd353e63', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52572350-af84-4a5a-a1ee-2ea0dd353e63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c22e490-8a88-4117-be76-6a9d8fb25682', $q$loadly$q$, $q$Loadly$q$, $q$https://loadly.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c22e490-8a88-4117-be76-6a9d8fb25682', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c22e490-8a88-4117-be76-6a9d8fb25682')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ac46b818-4ea6-4e3d-a558-0c0c85cfd0c3', $q$localhero-ai$q$, $q$Localhero.ai$q$, $q$https://localhero.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ac46b818-4ea6-4e3d-a558-0c0c85cfd0c3', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac46b818-4ea6-4e3d-a558-0c0c85cfd0c3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e3cf415-978d-4d31-a80e-1c9a11ba85f8', $q$localops$q$, $q$LocalOps$q$, $q$https://localops.co/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e3cf415-978d-4d31-a80e-1c9a11ba85f8', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e3cf415-978d-4d31-a80e-1c9a11ba85f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b389c8bc-baeb-45ce-b30e-fcd51950ca7d', $q$lockitbot$q$, $q$Lockitbot$q$, $q$https://www.lockitbot.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b389c8bc-baeb-45ce-b30e-fcd51950ca7d', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b389c8bc-baeb-45ce-b30e-fcd51950ca7d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e4501940-691c-48d0-8d76-0373da4753e8', $q$loco$q$, $q$Loco$q$, $q$https://localise.biz/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e4501940-691c-48d0-8d76-0373da4753e8', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4501940-691c-48d0-8d76-0373da4753e8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20f469fc-f80f-4d9d-b5ab-7c69fcb5dc42', $q$loginllama$q$, $q$LoginLlama$q$, $q$https://loginllama.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20f469fc-f80f-4d9d-b5ab-7c69fcb5dc42', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20f469fc-f80f-4d9d-b5ab-7c69fcb5dc42')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('19001f4b-7efa-4a1f-961e-39fa56173d96', $q$logintc-com$q$, $q$logintc.com$q$, $q$https://www.logintc.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '19001f4b-7efa-4a1f-961e-39fa56173d96', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19001f4b-7efa-4a1f-961e-39fa56173d96')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('333bb459-322b-4108-891e-527ab9b2e7a8', $q$logtail-com$q$, $q$logtail.com$q$, $q$https://logtail.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '333bb459-322b-4108-891e-527ab9b2e7a8', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '333bb459-322b-4108-891e-527ab9b2e7a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af4b660c-ac0c-4de0-af44-a2adb08784df', $q$marvelapp-com$q$, $q$marvelapp.com$q$, $q$https://marvelapp.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af4b660c-ac0c-4de0-af44-a2adb08784df', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af4b660c-ac0c-4de0-af44-a2adb08784df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('045b7486-ea4c-48b6-a24e-1adae754d9c7', $q$meetbackdrops$q$, $q$MeetBackdrops$q$, $q$https://meetbackdrops.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '045b7486-ea4c-48b6-a24e-1adae754d9c7', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '045b7486-ea4c-48b6-a24e-1adae754d9c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a0fda2a-ca3a-4988-93be-a6bc112b19c5', $q$meistertask$q$, $q$MeisterTask$q$, $q$https://www.meistertask.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a0fda2a-ca3a-4988-93be-a6bc112b19c5', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a0fda2a-ca3a-4988-93be-a6bc112b19c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6093c1a8-43c2-4ae9-b8a5-f3e4c6bd083a', $q$mentor-graphics$q$, $q$Mentor Graphics$q$, $q$https://mentor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6093c1a8-43c2-4ae9-b8a5-f3e4c6bd083a', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6093c1a8-43c2-4ae9-b8a5-f3e4c6bd083a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f54e28f-47bf-4acb-ae48-01d83136a03d', $q$mergify$q$, $q$Mergify$q$, $q$https://mergify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f54e28f-47bf-4acb-ae48-01d83136a03d', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f54e28f-47bf-4acb-ae48-01d83136a03d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f07e4d7-d2b7-4cae-a924-7bdedde2ed23', $q$metalama$q$, $q$Metalama$q$, $q$https://www.postsharp.net/metalama$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f07e4d7-d2b7-4cae-a924-7bdedde2ed23', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f07e4d7-d2b7-4cae-a924-7bdedde2ed23')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f06f8037-d994-4905-af33-9a92fd22fd99', $q$meterian-io$q$, $q$meterian.io$q$, $q$https://www.meterian.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f06f8037-d994-4905-af33-9a92fd22fd99', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f06f8037-d994-4905-af33-9a92fd22fd99')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f71a0335-85ba-4841-8725-2cee9b76ed2c', $q$method$q$, $q$Method$q$, $q$https://www.method.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f71a0335-85ba-4841-8725-2cee9b76ed2c', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f71a0335-85ba-4841-8725-2cee9b76ed2c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ada2f7f-b679-45cf-9fc0-b4ac5467524c', $q$meuscrum$q$, $q$MeuScrum$q$, $q$https://www.meuscrum.com/en$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ada2f7f-b679-45cf-9fc0-b4ac5467524c', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ada2f7f-b679-45cf-9fc0-b4ac5467524c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7e081f3a-49a1-47aa-94f9-86ebf8bb6847', $q$miles$q$, $q$Miles$q$, $q$https://getmiles.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7e081f3a-49a1-47aa-94f9-86ebf8bb6847', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e081f3a-49a1-47aa-94f9-86ebf8bb6847')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b3f02d9-5021-48e0-9fe0-b3217e77da89', $q$mockapi$q$, $q$MockAPI$q$, $q$https://www.mockapi.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b3f02d9-5021-48e0-9fe0-b3217e77da89', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b3f02d9-5021-48e0-9fe0-b3217e77da89')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7523aa51-201a-44ff-82f5-134670673245', $q$mocko-dev$q$, $q$Mocko.dev$q$, $q$https://mocko.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7523aa51-201a-44ff-82f5-134670673245', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7523aa51-201a-44ff-82f5-134670673245')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d84b5c3a-4651-43da-9336-83a420f91910', $q$mojoauth$q$, $q$MojoAuth$q$, $q$https://mojoauth.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd84b5c3a-4651-43da-9336-83a420f91910', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd84b5c3a-4651-43da-9336-83a420f91910')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fc59a52c-24d7-4754-90f1-7d253f205d66', $q$mozilla-observatory$q$, $q$Mozilla Observatory$q$, $q$https://observatory.mozilla.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fc59a52c-24d7-4754-90f1-7d253f205d66', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc59a52c-24d7-4754-90f1-7d253f205d66')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c349b4be-d057-4a15-a94c-322f57dc4bea', $q$netspring$q$, $q$NetSpring$q$, $q$https://netspring.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c349b4be-d057-4a15-a94c-322f57dc4bea', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c349b4be-d057-4a15-a94c-322f57dc4bea')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06264022-6d7e-4bff-8e25-aa7138edf671', $q$nuance-communications$q$, $q$Nuance Communications$q$, $q$https://www.nuance.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06264022-6d7e-4bff-8e25-aa7138edf671', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06264022-6d7e-4bff-8e25-aa7138edf671')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ccb013b0-9aa7-47f4-89f9-531f5c02a8a8', $q$nx-cloud$q$, $q$Nx Cloud$q$, $q$https://nx.dev/ci$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ccb013b0-9aa7-47f4-89f9-531f5c02a8a8', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ccb013b0-9aa7-47f4-89f9-531f5c02a8a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cf0a5a8c-0ff2-4ff3-98e3-b6518dad226e', $q$one-medical$q$, $q$One Medical$q$, $q$https://onemedical.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cf0a5a8c-0ff2-4ff3-98e3-b6518dad226e', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf0a5a8c-0ff2-4ff3-98e3-b6518dad226e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('58dde317-3088-4494-9137-389b0c9d57a1', $q$onedrive$q$, $q$OneDrive$q$, $q$https://onedrive.live.com/about/en-us/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '58dde317-3088-4494-9137-389b0c9d57a1', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '58dde317-3088-4494-9137-389b0c9d57a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e0d112b-bcb6-4cff-97ce-11ff3d9cc069', $q$onlineinterview-io$q$, $q$OnlineInterview.io$q$, $q$https://onlineinterview.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e0d112b-bcb6-4cff-97ce-11ff3d9cc069', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e0d112b-bcb6-4cff-97ce-11ff3d9cc069')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('591873df-75d7-4992-9d3f-3591232df243', $q$pageclip$q$, $q$Pageclip$q$, $q$https://pageclip.co/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '591873df-75d7-4992-9d3f-3591232df243', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '591873df-75d7-4992-9d3f-3591232df243')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f840b23b-0bcb-4964-8d2f-7d3df75ce009', $q$palantir$q$, $q$Palantir$q$, $q$https://palantir.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f840b23b-0bcb-4964-8d2f-7d3df75ce009', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f840b23b-0bcb-4964-8d2f-7d3df75ce009')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0639acb-df64-4a48-bd2d-0268abf40c8b', $q$paraio-com$q$, $q$paraio.com$q$, $q$https://paraio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0639acb-df64-4a48-bd2d-0268abf40c8b', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0639acb-df64-4a48-bd2d-0268abf40c8b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c44a10e-d266-407e-b2a7-22cd51860188', $q$paste-sh$q$, $q$paste.sh$q$, $q$https://paste.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c44a10e-d266-407e-b2a7-22cd51860188', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c44a10e-d266-407e-b2a7-22cd51860188')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11627e6f-6ecb-473e-810f-35655c9258d7', $q$pdf-api-io$q$, $q$PDF-API.io$q$, $q$https://pdf-api.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11627e6f-6ecb-473e-810f-35655c9258d7', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11627e6f-6ecb-473e-810f-35655c9258d7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('92114073-26a6-4a32-a1aa-d6037cb66457', $q$pendulums$q$, $q$Pendulums$q$, $q$https://pendulums.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '92114073-26a6-4a32-a1aa-d6037cb66457', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '92114073-26a6-4a32-a1aa-d6037cb66457')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe1d6721-0cc5-4fe4-8c41-59c58732f381', $q$phantomjscloud$q$, $q$PhantomJsCloud$q$, $q$https://PhantomJsCloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe1d6721-0cc5-4fe4-8c41-59c58732f381', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe1d6721-0cc5-4fe4-8c41-59c58732f381')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cf0ad87f-7de0-4b33-bcaa-2a120425aece', $q$planitpoker-com$q$, $q$planitpoker.com$q$, $q$https://www.planitpoker.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cf0ad87f-7de0-4b33-bcaa-2a120425aece', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf0ad87f-7de0-4b33-bcaa-2a120425aece')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0427f3ad-91e1-4cfa-9f91-91da0743275f', $q$point-poker$q$, $q$point.poker$q$, $q$https://www.point.poker/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0427f3ad-91e1-4cfa-9f91-91da0743275f', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0427f3ad-91e1-4cfa-9f91-91da0743275f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20198396-e326-420c-9462-72f91e4b8ce2', $q$popsugar$q$, $q$POPSUGAR$q$, $q$https://popsugar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20198396-e326-420c-9462-72f91e4b8ce2', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20198396-e326-420c-9462-72f91e4b8ce2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('240f3a45-e897-41e9-aad2-3d77e1931e06', $q$projectlocker-com$q$, $q$projectlocker.com$q$, $q$https://projectlocker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '240f3a45-e897-41e9-aad2-3d77e1931e06', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '240f3a45-e897-41e9-aad2-3d77e1931e06')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cfd71545-36cb-42e2-9017-b9687ad8cc3a', $q$proxy$q$, $q$Proxy$q$, $q$https://www.proxy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cfd71545-36cb-42e2-9017-b9687ad8cc3a', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfd71545-36cb-42e2-9017-b9687ad8cc3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d1068a9-691d-4b74-98f2-7610046835dc', $q$pulse-red$q$, $q$Pulse.red$q$, $q$https://pulse.red$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d1068a9-691d-4b74-98f2-7610046835dc', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d1068a9-691d-4b74-98f2-7610046835dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('80095f65-c002-4465-97d1-73184e551d57', $q$pumble$q$, $q$Pumble$q$, $q$https://pumble.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '80095f65-c002-4465-97d1-73184e551d57', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80095f65-c002-4465-97d1-73184e551d57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('692b256b-f0c2-4498-ac42-7f543a2f2ab7', $q$pyup-io$q$, $q$pyup.io$q$, $q$https://pyup.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '692b256b-f0c2-4498-ac42-7f543a2f2ab7', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '692b256b-f0c2-4498-ac42-7f543a2f2ab7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c4498445-7753-45a9-9b91-ffc58aae2bb6', $q$qadium$q$, $q$Qadium$q$, $q$https://qadium.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c4498445-7753-45a9-9b91-ffc58aae2bb6', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4498445-7753-45a9-9b91-ffc58aae2bb6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a4300961-3a6f-46ba-abb0-4bc38e4bf748', $q$qualys-com$q$, $q$qualys.com$q$, $q$https://www.qualys.com/community-edition$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a4300961-3a6f-46ba-abb0-4bc38e4bf748', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4300961-3a6f-46ba-abb0-4bc38e4bf748')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0e80cf9a-084e-43ec-8c67-769a55c2bf47', $q$quidlo-timesheets$q$, $q$Quidlo Timesheets$q$, $q$https://www.quidlo.com/timesheets$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0e80cf9a-084e-43ec-8c67-769a55c2bf47', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0e80cf9a-084e-43ec-8c67-769a55c2bf47')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2487f39d-c50a-4d74-8ee6-46945d6befa9', $q$raindrop-io$q$, $q$Raindrop.io$q$, $q$https://raindrop.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2487f39d-c50a-4d74-8ee6-46945d6befa9', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2487f39d-c50a-4d74-8ee6-46945d6befa9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54925f17-8f27-4c15-9946-89bbfaca14ca', $q$reactflow-com$q$, $q$Reactflow.com$q$, $q$https://www.reactflow.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54925f17-8f27-4c15-9946-89bbfaca14ca', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54925f17-8f27-4c15-9946-89bbfaca14ca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82e24521-63a4-431d-a793-30cca2952e18', $q$repoforge$q$, $q$RepoForge$q$, $q$https://repoforge.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82e24521-63a4-431d-a793-30cca2952e18', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82e24521-63a4-431d-a793-30cca2952e18')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('841155ed-f385-46da-a652-f4a80cc90b12', $q$requestly$q$, $q$Requestly$q$, $q$https://requestly.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '841155ed-f385-46da-a652-f4a80cc90b12', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '841155ed-f385-46da-a652-f4a80cc90b12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e57e48b5-bb61-4332-b76f-41703d29d5de', $q$rightfeature$q$, $q$RightFeature$q$, $q$https://rightfeature.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e57e48b5-bb61-4332-b76f-41703d29d5de', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e57e48b5-bb61-4332-b76f-41703d29d5de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87f79a83-91fb-45b3-b1bf-4449b7e67dbe', $q$roblox$q$, $q$Roblox$q$, $q$https://roblox.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87f79a83-91fb-45b3-b1bf-4449b7e67dbe', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87f79a83-91fb-45b3-b1bf-4449b7e67dbe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e6c44e3e-ce55-4a52-92ba-114711a986ba', $q$robusta-dev$q$, $q$robusta.dev$q$, $q$https://home.robusta.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e6c44e3e-ce55-4a52-92ba-114711a986ba', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e6c44e3e-ce55-4a52-92ba-114711a986ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa67d433-3617-42c1-91e2-1b63b1f60d3f', $q$row-zero$q$, $q$Row Zero$q$, $q$https://rowzero.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa67d433-3617-42c1-91e2-1b63b1f60d3f', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa67d433-3617-42c1-91e2-1b63b1f60d3f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('302ee8d4-b426-4e4b-8767-20ccf73e66b1', $q$ruttl-com$q$, $q$ruttl.com$q$, $q$https://ruttl.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '302ee8d4-b426-4e4b-8767-20ccf73e66b1', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '302ee8d4-b426-4e4b-8767-20ccf73e66b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5698a301-a4c2-4998-a672-3ff90d3075ae', $q$savannah-gnu-org$q$, $q$savannah.gnu.org$q$, $q$https://savannah.gnu.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5698a301-a4c2-4998-a672-3ff90d3075ae', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5698a301-a4c2-4998-a672-3ff90d3075ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8eb0557c-7938-411d-b11e-592e76a74f81', $q$savannah-nongnu-org$q$, $q$savannah.nongnu.org$q$, $q$https://savannah.nongnu.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8eb0557c-7938-411d-b11e-592e76a74f81', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8eb0557c-7938-411d-b11e-592e76a74f81')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('68731bc6-ab93-4222-94e1-ab68561068b1', $q$say-media$q$, $q$Say Media$q$, $q$https://saymedia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '68731bc6-ab93-4222-94e1-ab68561068b1', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68731bc6-ab93-4222-94e1-ab68561068b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cc3438ce-debf-4510-952a-f231aceebe38', $q$scalable-press$q$, $q$Scalable Press$q$, $q$https://scalablepress.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cc3438ce-debf-4510-952a-f231aceebe38', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc3438ce-debf-4510-952a-f231aceebe38')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b439a3a3-4c0f-4eeb-b891-e61c771d54d3', $q$scrapingant$q$, $q$ScrapingAnt$q$, $q$https://scrapingant.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b439a3a3-4c0f-4eeb-b891-e61c771d54d3', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b439a3a3-4c0f-4eeb-b891-e61c771d54d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d85aee5d-1350-410e-ab4d-950eefa1b766', $q$screen-sharing-via-browser$q$, $q$Screen Sharing via Browser$q$, $q$https://screensharing.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd85aee5d-1350-410e-ab4d-950eefa1b766', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd85aee5d-1350-410e-ab4d-950eefa1b766')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('564fef64-54da-4d24-9a17-ca6edbc89912', $q$scrumfast$q$, $q$ScrumFast$q$, $q$https://www.scrumfast.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '564fef64-54da-4d24-9a17-ca6edbc89912', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '564fef64-54da-4d24-9a17-ca6edbc89912')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee0deada-dada-46df-9559-8cd0763d2555', $q$seagate$q$, $q$Seagate$q$, $q$https://seagate.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee0deada-dada-46df-9559-8cd0763d2555', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee0deada-dada-46df-9559-8cd0763d2555')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('637010bd-f6b1-467e-baba-50e40c6f0b75', $q$shake$q$, $q$Shake$q$, $q$https://www.shakebugs.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '637010bd-f6b1-467e-baba-50e40c6f0b75', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '637010bd-f6b1-467e-baba-50e40c6f0b75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ab03513-b8b5-434b-909d-f789380d5ac8', $q$shields-io$q$, $q$shields.io$q$, $q$https://shields.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ab03513-b8b5-434b-909d-f789380d5ac8', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ab03513-b8b5-434b-909d-f789380d5ac8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b847a4ac-3162-4463-836f-bc2f85bf1121', $q$sift-science$q$, $q$Sift Science$q$, $q$https://siftscience.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b847a4ac-3162-4463-836f-bc2f85bf1121', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b847a4ac-3162-4463-836f-bc2f85bf1121')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e9f380d-ae25-452b-a110-45f4c70bc778', $q$sikkerkey$q$, $q$SikkerKey$q$, $q$https://sikkerkey.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e9f380d-ae25-452b-a110-45f4c70bc778', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e9f380d-ae25-452b-a110-45f4c70bc778')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c50fbea-482e-4e8e-9005-c2a1e0696f25', $q$simplepdf-eu$q$, $q$SimplePDF.eu$q$, $q$https://simplepdf.eu/embed$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c50fbea-482e-4e8e-9005-c2a1e0696f25', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c50fbea-482e-4e8e-9005-c2a1e0696f25')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('90a2f873-65ba-4099-82ba-1fec36113906', $q$sitedots$q$, $q$SiteDots$q$, $q$https://sitedots.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '90a2f873-65ba-4099-82ba-1fec36113906', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90a2f873-65ba-4099-82ba-1fec36113906')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('035bd7d9-5d54-4d8d-96c1-5b255ceccf5c', $q$slashnext$q$, $q$SlashNext$q$, $q$https://slashnext.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '035bd7d9-5d54-4d8d-96c1-5b255ceccf5c', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '035bd7d9-5d54-4d8d-96c1-5b255ceccf5c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e634e0f9-e82e-42e8-89be-614b673d4def', $q$slingsite$q$, $q$SlingSite$q$, $q$https://slingsite.github.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e634e0f9-e82e-42e8-89be-614b673d4def', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e634e0f9-e82e-42e8-89be-614b673d4def')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('70d2df16-5bb1-4ffe-88b3-42f287c03773', $q$smart-grow-vault$q$, $q$Smart Grow Vault$q$, $q$https://vault.smart-grow.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '70d2df16-5bb1-4ffe-88b3-42f287c03773', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70d2df16-5bb1-4ffe-88b3-42f287c03773')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8c503cab-b1d1-4c40-9d52-2ebbb10efb84', $q$snippets-uilicious-com$q$, $q$snippets.uilicious.com$q$, $q$https://snippets.uilicious.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8c503cab-b1d1-4c40-9d52-2ebbb10efb84', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c503cab-b1d1-4c40-9d52-2ebbb10efb84')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea4d98c0-c66b-49a6-a6c5-71df48bdf219', $q$spacedrive$q$, $q$Spacedrive$q$, $q$https://www.spacedrive.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea4d98c0-c66b-49a6-a6c5-71df48bdf219', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea4d98c0-c66b-49a6-a6c5-71df48bdf219')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b1a890b-fd11-4e58-aa86-706ef55319fa', $q$spacelift$q$, $q$Spacelift$q$, $q$https://spacelift.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b1a890b-fd11-4e58-aa86-706ef55319fa', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b1a890b-fd11-4e58-aa86-706ef55319fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d3b37429-4da6-4337-8b4b-6b61bec4b14e', $q$sqreen$q$, $q$Sqreen$q$, $q$https://sqreen.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd3b37429-4da6-4337-8b4b-6b61bec4b14e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3b37429-4da6-4337-8b4b-6b61bec4b14e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('16e0df85-238f-4225-af64-692c2dc57ac7', $q$ssllabs-com$q$, $q$ssllabs.com$q$, $q$https://www.ssllabs.com/ssltest/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '16e0df85-238f-4225-af64-692c2dc57ac7', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16e0df85-238f-4225-af64-692c2dc57ac7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0b41d4c-bda0-4c43-ab8e-1e7c4478f443', $q$stack-auth$q$, $q$Stack Auth$q$, $q$https://stack-auth.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0b41d4c-bda0-4c43-ab8e-1e7c4478f443', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0b41d4c-bda0-4c43-ab8e-1e7c4478f443')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b40b2206-cc82-4ad8-81ed-8847bc349c45', $q$stackby$q$, $q$StackBy$q$, $q$https://stackby.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b40b2206-cc82-4ad8-81ed-8847bc349c45', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b40b2206-cc82-4ad8-81ed-8847bc349c45')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea411e6c-115a-494b-8044-bc795c616cef', $q$statuspile$q$, $q$StatusPile$q$, $q$https://www.statuspile.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea411e6c-115a-494b-8044-bc795c616cef', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea411e6c-115a-494b-8044-bc795c616cef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d607c78d-c9b9-4d96-8b8e-1c2d8dfb3f6e', $q$sublime-text$q$, $q$Sublime Text$q$, $q$https://www.sublimetext.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd607c78d-c9b9-4d96-8b8e-1c2d8dfb3f6e', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd607c78d-c9b9-4d96-8b8e-1c2d8dfb3f6e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4bbf0402-f7f3-45d6-af50-1da6ee8209de', $q$sucuri-sitecheck$q$, $q$Sucuri SiteCheck$q$, $q$https://sitecheck.sucuri.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4bbf0402-f7f3-45d6-af50-1da6ee8209de', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bbf0402-f7f3-45d6-af50-1da6ee8209de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('503a2524-8656-43b9-b0a0-1448898e6234', $q$synopsys$q$, $q$Synopsys$q$, $q$https://synopsys.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '503a2524-8656-43b9-b0a0-1448898e6234', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '503a2524-8656-43b9-b0a0-1448898e6234')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bcc51210-dc15-43f7-b1db-6dda5c83ce24', $q$tanium$q$, $q$Tanium$q$, $q$https://tanium.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bcc51210-dc15-43f7-b1db-6dda5c83ce24', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bcc51210-dc15-43f7-b1db-6dda5c83ce24')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b7d888ce-f938-4082-9ee0-40ce4ed29c3d', $q$teamcamp$q$, $q$Teamcamp$q$, $q$https://www.teamcamp.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b7d888ce-f938-4082-9ee0-40ce4ed29c3d', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7d888ce-f938-4082-9ee0-40ce4ed29c3d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d3175013-5232-40d1-a380-4cea71b3a172', $q$teaminal$q$, $q$Teaminal$q$, $q$https://www.teaminal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd3175013-5232-40d1-a380-4cea71b3a172', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3175013-5232-40d1-a380-4cea71b3a172')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f17b5189-c996-493c-ae66-6307f8752fad', $q$telegram$q$, $q$Telegram$q$, $q$https://telegram.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f17b5189-c996-493c-ae66-6307f8752fad', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f17b5189-c996-493c-ae66-6307f8752fad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e645f72c-ddb7-4256-ab83-223852dee2b0', $q$teleretro-com$q$, $q$teleretro.com$q$, $q$https://www.teleretro.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e645f72c-ddb7-4256-ab83-223852dee2b0', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e645f72c-ddb7-4256-ab83-223852dee2b0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dbb4a802-ce7e-41d0-8a7b-d8d943656887', $q$tesults-com$q$, $q$tesults.com$q$, $q$https://www.tesults.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dbb4a802-ce7e-41d0-8a7b-d8d943656887', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dbb4a802-ce7e-41d0-8a7b-d8d943656887')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99be8b3e-ec4c-479e-8bca-fab263c8c636', $q$thinkhr$q$, $q$ThinkHR$q$, $q$https://thinkhr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99be8b3e-ec4c-479e-8bca-fab263c8c636', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99be8b3e-ec4c-479e-8bca-fab263c8c636')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e26aaa1b-36a2-4599-a86a-1f7bc77bc485', $q$thredup$q$, $q$thredUP$q$, $q$https://thredup.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e26aaa1b-36a2-4599-a86a-1f7bc77bc485', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e26aaa1b-36a2-4599-a86a-1f7bc77bc485')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('beb2df74-1044-46c3-b33f-6c18bd090b46', $q$todolist$q$, $q$ToDoList$q$, $q$https://abstractspoon.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'beb2df74-1044-46c3-b33f-6c18bd090b46', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'beb2df74-1044-46c3-b33f-6c18bd090b46')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4b590cea-8362-4dbd-88c1-a9ba4d2e4481', $q$toggl$q$, $q$Toggl$q$, $q$https://toggl.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4b590cea-8362-4dbd-88c1-a9ba4d2e4481', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b590cea-8362-4dbd-88c1-a9ba4d2e4481')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('082a1746-ce22-4c33-af61-48af20dc0bfe', $q$tortoisegit$q$, $q$TortoiseGit$q$, $q$https://tortoisegit.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '082a1746-ce22-4c33-af61-48af20dc0bfe', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '082a1746-ce22-4c33-af61-48af20dc0bfe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('79bd8bd8-1c81-4978-9acc-591467903f0c', $q$transfernow$q$, $q$transfernow$q$, $q$https://www.transfernow.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '79bd8bd8-1c81-4978-9acc-591467903f0c', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79bd8bd8-1c81-4978-9acc-591467903f0c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ea43ede-7a2b-4738-9cab-5dfc37926351', $q$tugboat$q$, $q$Tugboat$q$, $q$https://tugboat.qa$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ea43ede-7a2b-4738-9cab-5dfc37926351', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ea43ede-7a2b-4738-9cab-5dfc37926351')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('64ec94a8-846f-4ada-918c-714c6b17e8f7', $q$turnitin$q$, $q$turnitin$q$, $q$https://turnitin.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '64ec94a8-846f-4ada-918c-714c6b17e8f7', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64ec94a8-846f-4ada-918c-714c6b17e8f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('60891efc-478a-4a81-bdb5-e0bfc9be60d2', $q$unchecky$q$, $q$UnChecky$q$, $q$https://unchecky.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '60891efc-478a-4a81-bdb5-e0bfc9be60d2', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60891efc-478a-4a81-bdb5-e0bfc9be60d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e980dd07-f715-4a50-85af-445870608447', $q$userforge-com$q$, $q$userforge.com$q$, $q$https://userforge.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e980dd07-f715-4a50-85af-445870608447', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e980dd07-f715-4a50-85af-445870608447')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb5390f2-4b33-422e-98a3-665cac7cf48c', $q$utterances$q$, $q$Utterances$q$, $q$https://utteranc.es/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb5390f2-4b33-422e-98a3-665cac7cf48c', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb5390f2-4b33-422e-98a3-665cac7cf48c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f52c8cdb-db41-4ace-a4f8-21db788e40b2', $q$uxtweak-com$q$, $q$UXtweak.com$q$, $q$https://www.uxtweak.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f52c8cdb-db41-4ace-a4f8-21db788e40b2', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f52c8cdb-db41-4ace-a4f8-21db788e40b2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e34cb9a8-b0fd-44e1-87c3-f3ec02302181', $q$verkada$q$, $q$Verkada$q$, $q$https://verkada.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e34cb9a8-b0fd-44e1-87c3-f3ec02302181', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e34cb9a8-b0fd-44e1-87c3-f3ec02302181')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('df1fca81-ca75-49df-a877-3729e7bec6e0', $q$vidhook$q$, $q$Vidhook$q$, $q$https://vidhook.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'df1fca81-ca75-49df-a877-3729e7bec6e0', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df1fca81-ca75-49df-a877-3729e7bec6e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('81bb4d16-e344-4ffd-afd6-8b69ade13d02', $q$viglink$q$, $q$VigLink$q$, $q$https://www.viglink.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '81bb4d16-e344-4ffd-afd6-8b69ade13d02', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81bb4d16-e344-4ffd-afd6-8b69ade13d02')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a12d344-640d-49f8-9a03-5fe54e6321e0', $q$virgil-security$q$, $q$Virgil Security$q$, $q$https://virgilsecurity.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a12d344-640d-49f8-9a03-5fe54e6321e0', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a12d344-640d-49f8-9a03-5fe54e6321e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0ae4dc53-5ebd-4e63-9b1e-9dd7f80ad036', $q$visual-debug$q$, $q$Visual Debug$q$, $q$https://visualdebug.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0ae4dc53-5ebd-4e63-9b1e-9dd7f80ad036', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ae4dc53-5ebd-4e63-9b1e-9dd7f80ad036')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f048d872-103b-4fe2-8514-833b0d858f20', $q$wave-terminal$q$, $q$Wave Terminal$q$, $q$https://waveterm.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f048d872-103b-4fe2-8514-833b0d858f20', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f048d872-103b-4fe2-8514-833b0d858f20')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('83140b75-6025-471c-a71c-75574e30699b', $q$webex$q$, $q$Webex$q$, $q$https://www.webex.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '83140b75-6025-471c-a71c-75574e30699b', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83140b75-6025-471c-a71c-75574e30699b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('16611a9e-f4a3-4e26-af21-0d761056810e', $q$webscraping-ai$q$, $q$WebScraping.AI$q$, $q$https://webscraping.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '16611a9e-f4a3-4e26-af21-0d761056810e', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16611a9e-f4a3-4e26-af21-0d761056810e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d4bb11aa-8ca1-4c40-9208-2d2adf301a93', $q$webvizio$q$, $q$Webvizio$q$, $q$https://webvizio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd4bb11aa-8ca1-4c40-9208-2d2adf301a93', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4bb11aa-8ca1-4c40-9208-2d2adf301a93')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b29cb40-ed61-4d7f-8a5c-ea72b2926e8f', $q$what-is-my-ip$q$, $q$What Is My IP$q$, $q$https://whatismyip.help$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b29cb40-ed61-4d7f-8a5c-ea72b2926e8f', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b29cb40-ed61-4d7f-8a5c-ea72b2926e8f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0b897de-c74c-4bb6-b36e-ec51f4033cfb', $q$wikifactory$q$, $q$Wikifactory$q$, $q$https://wikifactory.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0b897de-c74c-4bb6-b36e-ec51f4033cfb', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0b897de-c74c-4bb6-b36e-ec51f4033cfb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('59d73145-b5b1-4d6a-8ccf-96af978ead1e', $q$wormhole$q$, $q$Wormhole$q$, $q$https://wormhole.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '59d73145-b5b1-4d6a-8ccf-96af978ead1e', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59d73145-b5b1-4d6a-8ccf-96af978ead1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dd81574e-2fed-4f14-94c6-a9b815978d9e', $q$wox$q$, $q$Wox$q$, $q$http://wox-launcher.github.io/Wox/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dd81574e-2fed-4f14-94c6-a9b815978d9e', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd81574e-2fed-4f14-94c6-a9b815978d9e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a87007c7-cce3-498a-b42f-ef7cf6664faf', $q$wundergraph$q$, $q$WunderGraph$q$, $q$https://cloud.wundergraph.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a87007c7-cce3-498a-b42f-ef7cf6664faf', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a87007c7-cce3-498a-b42f-ef7cf6664faf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('52c2bbf8-68d2-4bad-a579-0800e6e261c5', $q$yodiz$q$, $q$Yodiz$q$, $q$https://www.yodiz.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '52c2bbf8-68d2-4bad-a579-0800e6e261c5', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52c2bbf8-68d2-4bad-a579-0800e6e261c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a78d5c61-f86f-4708-9d32-f11bafe3187e', $q$yodlee$q$, $q$Yodlee$q$, $q$https://yodlee.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a78d5c61-f86f-4708-9d32-f11bafe3187e', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a78d5c61-f86f-4708-9d32-f11bafe3187e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8790a9de-f073-433e-b2a0-af96699e2d19', $q$zenhub-com$q$, $q$zenhub.com$q$, $q$https://www.zenhub.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8790a9de-f073-433e-b2a0-af96699e2d19', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8790a9de-f073-433e-b2a0-af96699e2d19')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b0192ca-eebc-4524-8485-6bbe550c7521', $q$zenkit-com$q$, $q$zenkit.com$q$, $q$https://zenkit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b0192ca-eebc-4524-8485-6bbe550c7521', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b0192ca-eebc-4524-8485-6bbe550c7521')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b6d2a5fc-107d-43e3-839c-c10fd321d4c9', $q$zeplin$q$, $q$Zeplin$q$, $q$https://zeplin.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b6d2a5fc-107d-43e3-839c-c10fd321d4c9', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6d2a5fc-107d-43e3-839c-c10fd321d4c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3466af92-0802-4781-96a2-9e4a6b602d98', $q$zume-pizza$q$, $q$Zume Pizza$q$, $q$https://zumepizza.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3466af92-0802-4781-96a2-9e4a6b602d98', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3466af92-0802-4781-96a2-9e4a6b602d98')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48a3fa14-e9a4-4e32-8c76-deae9cbdc39d', $q$zuplo$q$, $q$Zuplo$q$, $q$https://zuplo.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48a3fa14-e9a4-4e32-8c76-deae9cbdc39d', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48a3fa14-e9a4-4e32-8c76-deae9cbdc39d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f6d592e-573c-4bf8-a2a8-9b49d9c69d60', $q$1984-is$q$, $q$1984.is$q$, $q$https://www.1984.is/product/freedns/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f6d592e-573c-4bf8-a2a8-9b49d9c69d60', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f6d592e-573c-4bf8-a2a8-9b49d9c69d60')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0cd08476-3295-4d37-9113-84262b137477', $q$3scale$q$, $q$3scale$q$, $q$https://3scale.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0cd08476-3295-4d37-9113-84262b137477', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0cd08476-3295-4d37-9113-84262b137477')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c66d452a-24bd-4e71-85bc-2f571df6fb1a', $q$4everland$q$, $q$4EVERLAND$q$, $q$https://www.4everland.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c66d452a-24bd-4e71-85bc-2f571df6fb1a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c66d452a-24bd-4e71-85bc-2f571df6fb1a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e13176ec-5dc4-46d6-8405-aefa773736c7', $q$airware$q$, $q$Airware$q$, $q$https://www.airware.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e13176ec-5dc4-46d6-8405-aefa773736c7', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e13176ec-5dc4-46d6-8405-aefa773736c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d64d310b-54e4-46b5-a522-34cc40a10b19', $q$alphaai$q$, $q$AlphaAI$q$, $q$https://alphai.io/developers$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd64d310b-54e4-46b5-a522-34cc40a10b19', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd64d310b-54e4-46b5-a522-34cc40a10b19')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe6fcb84-394f-4f51-a04f-2c92e13be0ff', $q$apiary-io$q$, $q$apiary.io$q$, $q$https://apiary.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe6fcb84-394f-4f51-a04f-2c92e13be0ff', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe6fcb84-394f-4f51-a04f-2c92e13be0ff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('61fb3126-8cea-457f-af00-c5f81886e90b', $q$apiverve$q$, $q$APIVerve$q$, $q$https://apiverve.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '61fb3126-8cea-457f-af00-c5f81886e90b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61fb3126-8cea-457f-af00-c5f81886e90b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b25e6074-563e-41e0-815c-ac0cbe553e43', $q$app-annie$q$, $q$App Annie$q$, $q$https://appannie.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b25e6074-563e-41e0-815c-ac0cbe553e43', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b25e6074-563e-41e0-815c-ac0cbe553e43')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a9e4e60-1478-4c66-ba47-4737776f5a67', $q$appetize$q$, $q$Appetize$q$, $q$https://appetize.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a9e4e60-1478-4c66-ba47-4737776f5a67', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a9e4e60-1478-4c66-ba47-4737776f5a67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a3b93d43-f4fd-486d-8042-5176de12bfc8', $q$appfit$q$, $q$AppFit$q$, $q$https://appfit.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a3b93d43-f4fd-486d-8042-5176de12bfc8', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a3b93d43-f4fd-486d-8042-5176de12bfc8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a8173be0-5b10-42d2-bf34-283e137e165e', $q$back4app-com$q$, $q$back4app.com$q$, $q$https://www.back4app.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a8173be0-5b10-42d2-bf34-283e137e165e', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8173be0-5b10-42d2-bf34-283e137e165e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('64d33f3f-8232-479c-8b76-920a41e078aa', $q$bastet$q$, $q$Bastet$q$, $q$https://fph.altervista.org/prog/bastet.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '64d33f3f-8232-479c-8b76-920a41e078aa', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64d33f3f-8232-479c-8b76-920a41e078aa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('55d740dd-2254-4c1c-adfd-339116158e4d', $q$bibisco$q$, $q$Bibisco$q$, $q$https://www.bibisco.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '55d740dd-2254-4c1c-adfd-339116158e4d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '55d740dd-2254-4c1c-adfd-339116158e4d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('72139aca-13e9-4d88-b8c5-a9f005b0c308', $q$birst$q$, $q$Birst$q$, $q$https://www.birst.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '72139aca-13e9-4d88-b8c5-a9f005b0c308', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72139aca-13e9-4d88-b8c5-a9f005b0c308')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a95891a-9b70-49b6-9aa5-aacb25ea2e3e', $q$bluefish$q$, $q$Bluefish$q$, $q$https://bluefish.openoffice.nl/index.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a95891a-9b70-49b6-9aa5-aacb25ea2e3e', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a95891a-9b70-49b6-9aa5-aacb25ea2e3e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8271070-c366-4c01-8ea4-620c98e6c346', $q$bomi-player$q$, $q$Bomi Player$q$, $q$https://bomi-player.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8271070-c366-4c01-8ea4-620c98e6c346', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8271070-c366-4c01-8ea4-620c98e6c346')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65ebe3ad-b990-475e-b5d4-1e5a41eeb74f', $q$bup$q$, $q$bup$q$, $q$https://bup.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65ebe3ad-b990-475e-b5d4-1e5a41eeb74f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65ebe3ad-b990-475e-b5d4-1e5a41eeb74f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('24333a6e-35b8-419f-bbea-18407263c49d', $q$calendarific$q$, $q$Calendarific$q$, $q$https://calendarific.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '24333a6e-35b8-419f-bbea-18407263c49d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24333a6e-35b8-419f-bbea-18407263c49d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23d1542d-9141-41d6-88c7-b79591f12235', $q$canopy$q$, $q$Canopy$q$, $q$https://www.canopyapi.co/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23d1542d-9141-41d6-88c7-b79591f12235', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23d1542d-9141-41d6-88c7-b79591f12235')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('19a8ede5-4cfd-4432-ac47-ccee90c264f0', $q$carapi-dev$q$, $q$CarAPI.dev$q$, $q$https://carapi.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '19a8ede5-4cfd-4432-ac47-ccee90c264f0', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19a8ede5-4cfd-4432-ac47-ccee90c264f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('df7c1207-498a-4536-a1a8-48b58d36965d', $q$celluloid$q$, $q$Celluloid$q$, $q$https://celluloid-player.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'df7c1207-498a-4536-a1a8-48b58d36965d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df7c1207-498a-4536-a1a8-48b58d36965d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5f4c56e8-3617-49c1-a970-6222e4223356', $q$cinelerra-cv$q$, $q$Cinelerra-cv$q$, $q$http://cinelerra-cv.wikidot.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5f4c56e8-3617-49c1-a970-6222e4223356', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f4c56e8-3617-49c1-a970-6222e4223356')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0cdf00f-2c31-4275-8460-3d2350e5cdd9', $q$cinnamon$q$, $q$Cinnamon$q$, $q$https://projects.linuxmint.com/cinnamon/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0cdf00f-2c31-4275-8460-3d2350e5cdd9', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0cdf00f-2c31-4275-8460-3d2350e5cdd9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0f3be02e-1282-4521-8595-0409429ece35', $q$clapper$q$, $q$Clapper$q$, $q$https://rafostar.github.io/clapper/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0f3be02e-1282-4521-8595-0409429ece35', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f3be02e-1282-4521-8595-0409429ece35')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e668d85-99d2-416e-9dd4-3b54eb399c0d', $q$clicky$q$, $q$Clicky$q$, $q$https://clicky.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e668d85-99d2-416e-9dd4-3b54eb399c0d', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e668d85-99d2-416e-9dd4-3b54eb399c0d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0189a1f5-a99e-48bb-8a88-9f97971e7210', $q$cloudmersive$q$, $q$Cloudmersive$q$, $q$https://cloudmersive.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0189a1f5-a99e-48bb-8a88-9f97971e7210', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0189a1f5-a99e-48bb-8a88-9f97971e7210')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fac6626b-f7c1-4156-a37d-fe37a53cbd46', $q$codeac-io$q$, $q$Codeac.io$q$, $q$https://www.codeac.io/infrastructure-as-code.html?ref=free-for-dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fac6626b-f7c1-4156-a37d-fe37a53cbd46', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fac6626b-f7c1-4156-a37d-fe37a53cbd46')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5d3384a3-5c53-49c6-8ec6-4333404223d5', $q$codecov-io$q$, $q$codecov.io$q$, $q$https://codecov.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5d3384a3-5c53-49c6-8ec6-4333404223d5', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d3384a3-5c53-49c6-8ec6-4333404223d5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f94f585b-eadc-4fdf-9b77-2326d9c9c55b', $q$codefactor$q$, $q$CodeFactor$q$, $q$https://www.codefactor.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f94f585b-eadc-4fdf-9b77-2326d9c9c55b', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f94f585b-eadc-4fdf-9b77-2326d9c9c55b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bfd8be2c-7448-4197-adc5-f0d9a4f5a67c', $q$commerce-layer$q$, $q$Commerce Layer$q$, $q$https://commercelayer.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bfd8be2c-7448-4197-adc5-f0d9a4f5a67c', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfd8be2c-7448-4197-adc5-f0d9a4f5a67c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('828ccb91-4556-45c0-86bd-d17dd4c415b4', $q$compare-json$q$, $q$Compare JSON$q$, $q$https://comparejson.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '828ccb91-4556-45c0-86bd-d17dd4c415b4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '828ccb91-4556-45c0-86bd-d17dd4c415b4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2440fb35-39af-47b6-a7a4-97190468c891', $q$cosmic$q$, $q$Cosmic$q$, $q$https://www.cosmicjs.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2440fb35-39af-47b6-a7a4-97190468c891', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2440fb35-39af-47b6-a7a4-97190468c891')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('665d4b24-214c-42c9-8e28-6289920470fa', $q$country-state-city-microservice-api$q$, $q$Country-State-City Microservice API$q$, $q$https://country-state-city.rebuscando.info/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '665d4b24-214c-42c9-8e28-6289920470fa', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '665d4b24-214c-42c9-8e28-6289920470fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bd425dfc-b461-44c1-bcf3-b8b5f9f0b081', $q$coveralls-io$q$, $q$coveralls.io$q$, $q$https://coveralls.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bd425dfc-b461-44c1-bcf3-b8b5f9f0b081', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd425dfc-b461-44c1-bcf3-b8b5f9f0b081')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('09c0ebfb-d0a2-4afe-98b2-2e0cb6ae6a5e', $q$credit-mapping$q$, $q$credit mapping$q$, $q$https://docs.geekflare.com/api/api-credit-mapping$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '09c0ebfb-d0a2-4afe-98b2-2e0cb6ae6a5e', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09c0ebfb-d0a2-4afe-98b2-2e0cb6ae6a5e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('97e6cc22-43d3-4386-8b9d-15da156d79ef', $q$curlhub$q$, $q$CurlHub$q$, $q$https://curlhub.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '97e6cc22-43d3-4386-8b9d-15da156d79ef', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97e6cc22-43d3-4386-8b9d-15da156d79ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2bd90e0-5e3f-4755-9bdf-dba19c114207', $q$currencyscoop$q$, $q$CurrencyScoop$q$, $q$https://currencyscoop.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2bd90e0-5e3f-4755-9bdf-dba19c114207', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2bd90e0-5e3f-4755-9bdf-dba19c114207')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('801fe2d5-0a0e-4153-b330-c3eb6d4148a9', $q$customjs$q$, $q$CustomJS$q$, $q$https://www.customjs.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '801fe2d5-0a0e-4153-b330-c3eb6d4148a9', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '801fe2d5-0a0e-4153-b330-c3eb6d4148a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b73f5754-ca55-4c7c-b69e-ff5322f97d7c', $q$data-rescue$q$, $q$Data Rescue$q$, $q$https://www.prosofteng.com/windows-data-recovery$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b73f5754-ca55-4c7c-b69e-ff5322f97d7c', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b73f5754-ca55-4c7c-b69e-ff5322f97d7c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e4f5320d-cddc-4978-9d9b-313e103e6317', $q$datastax$q$, $q$DataStax$q$, $q$https://datastax.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e4f5320d-cddc-4978-9d9b-313e103e6317', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4f5320d-cddc-4978-9d9b-313e103e6317')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d6a4341-49d8-4a1b-9b5e-70a2ea24b656', $q$deepar$q$, $q$DeepAR$q$, $q$https://developer.deepar.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d6a4341-49d8-4a1b-9b5e-70a2ea24b656', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d6a4341-49d8-4a1b-9b5e-70a2ea24b656')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('91718068-9940-489c-9896-6e5ee8e8b8eb', $q$deepscan-io$q$, $q$deepscan.io$q$, $q$https://deepscan.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '91718068-9940-489c-9896-6e5ee8e8b8eb', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '91718068-9940-489c-9896-6e5ee8e8b8eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a131b2f2-4df1-4a4f-a5c4-c14de369223f', $q$deployment-io$q$, $q$deployment.io$q$, $q$https://deployment.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a131b2f2-4df1-4a4f-a5c4-c14de369223f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a131b2f2-4df1-4a4f-a5c4-c14de369223f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('519c027f-68f3-41a3-9fbf-fe00690530d1', $q$devhub$q$, $q$DevHub$q$, $q$https://devhubapp.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '519c027f-68f3-41a3-9fbf-fe00690530d1', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '519c027f-68f3-41a3-9fbf-fe00690530d1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('70a9679d-497c-429f-b84e-ded1939e3998', $q$difftext$q$, $q$DiffText$q$, $q$https://difftext.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '70a9679d-497c-429f-b84e-ded1939e3998', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70a9679d-497c-429f-b84e-ded1939e3998')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('22f4ae28-a5a6-4290-9270-007dc55a2fb8', $q$digikam$q$, $q$Digikam$q$, $q$https://www.digikam.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '22f4ae28-a5a6-4290-9270-007dc55a2fb8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22f4ae28-a5a6-4290-9270-007dc55a2fb8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('07ef96e0-6ec3-4cdf-9ebc-274fd2a1fc52', $q$disease-sh$q$, $q$Disease.sh$q$, $q$https://disease.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '07ef96e0-6ec3-4cdf-9ebc-274fd2a1fc52', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07ef96e0-6ec3-4cdf-9ebc-274fd2a1fc52')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('38db83d5-1cfb-46a5-8302-6f0504792d1b', $q$distrobox$q$, $q$Distrobox$q$, $q$https://distrobox.it/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '38db83d5-1cfb-46a5-8302-6f0504792d1b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38db83d5-1cfb-46a5-8302-6f0504792d1b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('030d0852-3dbf-4adb-8c3c-a409fec4ef57', $q$docpenny$q$, $q$DocPenny$q$, $q$https://docpenny.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '030d0852-3dbf-4adb-8c3c-a409fec4ef57', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '030d0852-3dbf-4adb-8c3c-a409fec4ef57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1f5e2cdf-d242-4eda-8515-d36ab57bcf2c', $q$doczilla$q$, $q$Doczilla$q$, $q$https://www.doczilla.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1f5e2cdf-d242-4eda-8515-d36ab57bcf2c', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f5e2cdf-d242-4eda-8515-d36ab57bcf2c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06bbbde8-3637-4b7d-9ecd-4b57ec11b09a', $q$doppio$q$, $q$Doppio$q$, $q$https://doppio.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06bbbde8-3637-4b7d-9ecd-4b57ec11b09a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06bbbde8-3637-4b7d-9ecd-4b57ec11b09a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b37af3ea-5e5a-4245-80e2-3e606661a190', $q$dwh-dev$q$, $q$Dwh.dev$q$, $q$https://dwh.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b37af3ea-5e5a-4245-80e2-3e606661a190', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b37af3ea-5e5a-4245-80e2-3e606661a190')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cfb00697-ef0e-41c5-bcfe-c935eb1a1686', $q$dynamicdocs$q$, $q$DynamicDocs$q$, $q$https://advicement.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cfb00697-ef0e-41c5-bcfe-c935eb1a1686', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfb00697-ef0e-41c5-bcfe-c935eb1a1686')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f977ab97-d043-4a6a-8ce3-4fb8bb341718', $q$earnings-feed$q$, $q$Earnings Feed$q$, $q$https://earningsfeed.com/api$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f977ab97-d043-4a6a-8ce3-4fb8bb341718', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f977ab97-d043-4a6a-8ce3-4fb8bb341718')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cccc5611-7a21-495a-a110-a4f527e7cb31', $q$embed-ly$q$, $q$embed.ly$q$, $q$https://embed.ly/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cccc5611-7a21-495a-a110-a4f527e7cb31', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cccc5611-7a21-495a-a110-a4f527e7cb31')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a1915ba-4f7e-4b7a-a966-62a12559798f', $q$emqx-serverless$q$, $q$EMQX Serverless$q$, $q$https://www.emqx.com/en/cloud/serverless-mqtt$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a1915ba-4f7e-4b7a-a966-62a12559798f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a1915ba-4f7e-4b7a-a966-62a12559798f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c03a4b23-df0e-40cf-b339-8908c4617161', $q$epic-games$q$, $q$Epic Games$q$, $q$https://www.epicgames.com/store/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c03a4b23-df0e-40cf-b339-8908c4617161', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c03a4b23-df0e-40cf-b339-8908c4617161')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f61d8a4c-600b-4429-90b1-331036e6b6d9', $q$everystep-automation-com$q$, $q$everystep-automation.com$q$, $q$https://www.everystep-automation.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f61d8a4c-600b-4429-90b1-331036e6b6d9', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f61d8a4c-600b-4429-90b1-331036e6b6d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('291ba572-4afd-4ce5-9c3c-882a1ce496fa', $q$extendsclass$q$, $q$ExtendsClass$q$, $q$https://extendsclass.com/rest-client-online.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '291ba572-4afd-4ce5-9c3c-882a1ce496fa', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '291ba572-4afd-4ce5-9c3c-882a1ce496fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('84b78359-31d2-4ad8-8080-2f6c25cac662', $q$file-io$q$, $q$file.io$q$, $q$https://www.file.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '84b78359-31d2-4ad8-8080-2f6c25cac662', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84b78359-31d2-4ad8-8080-2f6c25cac662')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f4c772c3-c947-4718-9c25-1a5f00eb816c', $q$financial-data$q$, $q$Financial Data$q$, $q$https://financialdata.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f4c772c3-c947-4718-9c25-1a5f00eb816c', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4c772c3-c947-4718-9c25-1a5f00eb816c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d7304551-558e-4e49-a47b-12448990ffcb', $q$fork$q$, $q$Fork$q$, $q$https://git-fork.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd7304551-558e-4e49-a47b-12448990ffcb', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7304551-558e-4e49-a47b-12448990ffcb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('35b6ab82-b731-469e-9b33-b0d1c7274df5', $q$formatjsononline-com$q$, $q$FormatJSONOnline.com$q$, $q$https://formatjsononline.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '35b6ab82-b731-469e-9b33-b0d1c7274df5', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35b6ab82-b731-469e-9b33-b0d1c7274df5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('319fcc1c-a0c5-4265-a41d-9cde6355ce73', $q$formats$q$, $q$formats$q$, $q$https://about.ipaddress.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '319fcc1c-a0c5-4265-a41d-9cde6355ce73', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '319fcc1c-a0c5-4265-a41d-9cde6355ce73')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4843b38f-5bc7-4463-b49d-62eee70ab6d4', $q$foursquare$q$, $q$Foursquare$q$, $q$https://developer.foursquare.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4843b38f-5bc7-4463-b49d-62eee70ab6d4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4843b38f-5bc7-4463-b49d-62eee70ab6d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dde0be9a-3191-4c90-b60e-9e55c0a8d7dd', $q$geekflare-api$q$, $q$Geekflare API$q$, $q$https://geekflare.com/api/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dde0be9a-3191-4c90-b60e-9e55c0a8d7dd', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dde0be9a-3191-4c90-b60e-9e55c0a8d7dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4ef3e410-d43b-47d6-9c06-be4a84de8bca', $q$geocod-io$q$, $q$geocod.io$q$, $q$https://www.geocod.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4ef3e410-d43b-47d6-9c06-be4a84de8bca', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ef3e410-d43b-47d6-9c06-be4a84de8bca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5b4723d9-6d65-4fa7-bf73-3bebd82869cd', $q$geocodify-com$q$, $q$geocodify.com$q$, $q$https://geocodify.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5b4723d9-6d65-4fa7-bf73-3bebd82869cd', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b4723d9-6d65-4fa7-bf73-3bebd82869cd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4db5a7b5-2610-40da-840d-42c1cd5ae47f', $q$geolocated-io$q$, $q$Geolocated.io$q$, $q$https://geolocated.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4db5a7b5-2610-40da-840d-42c1cd5ae47f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4db5a7b5-2610-40da-840d-42c1cd5ae47f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('63d53ee0-fc80-45e7-9be8-ab7da81da07b', $q$gerrithub-io$q$, $q$gerrithub.io$q$, $q$https://review.gerrithub.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '63d53ee0-fc80-45e7-9be8-ab7da81da07b', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63d53ee0-fc80-45e7-9be8-ab7da81da07b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b908f67e-42a8-43cb-be34-623b92897152', $q$getinsights-io$q$, $q$getinsights.io$q$, $q$https://getinsights.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b908f67e-42a8-43cb-be34-623b92897152', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b908f67e-42a8-43cb-be34-623b92897152')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b25f0d0f-eb29-4a87-a5ca-cf877a636848', $q$gisto$q$, $q$Gisto$q$, $q$https://www.gistoapp.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b25f0d0f-eb29-4a87-a5ca-cf877a636848', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b25f0d0f-eb29-4a87-a5ca-cf877a636848')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('52216857-5472-47c7-ad5b-88c9d35c5248', $q$git-extensions$q$, $q$Git Extensions$q$, $q$https://gitextensions.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '52216857-5472-47c7-ad5b-88c9d35c5248', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52216857-5472-47c7-ad5b-88c9d35c5248')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea006d36-3cbe-4a24-9761-71e77fa35917', $q$gitcola$q$, $q$GitCola$q$, $q$https://git-cola.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea006d36-3cbe-4a24-9761-71e77fa35917', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea006d36-3cbe-4a24-9761-71e77fa35917')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a144945d-958c-49e1-91ef-3e4dcb9ec9c4', $q$gitkraken$q$, $q$GitKraken$q$, $q$https://www.gitkraken.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a144945d-958c-49e1-91ef-3e4dcb9ec9c4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a144945d-958c-49e1-91ef-3e4dcb9ec9c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5fb048d-9163-434f-9b6d-6cb0aaa0f717', $q$gittyup$q$, $q$Gittyup$q$, $q$https://murmele.github.io/Gittyup/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5fb048d-9163-434f-9b6d-6cb0aaa0f717', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5fb048d-9163-434f-9b6d-6cb0aaa0f717')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d45eec54-b7d9-448a-b6af-4a0f7da0b6b2', $q$gizmo-analytics$q$, $q$Gizmo Analytics$q$, $q$https://gizmoanalytics.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd45eec54-b7d9-448a-b6af-4a0f7da0b6b2', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd45eec54-b7d9-448a-b6af-4a0f7da0b6b2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5916cb63-ce01-4903-b3c2-e6e6e1decb35', $q$gnome-terminal$q$, $q$GNOME Terminal$q$, $q$https://help.gnome.org/users/gnome-terminal/stable/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5916cb63-ce01-4903-b3c2-e6e6e1decb35', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5916cb63-ce01-4903-b3c2-e6e6e1decb35')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('64da1de2-d7c1-4509-9dab-a49efb0d5680', $q$gofile-io$q$, $q$GoFile.io$q$, $q$https://gofile.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '64da1de2-d7c1-4509-9dab-a49efb0d5680', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64da1de2-d7c1-4509-9dab-a49efb0d5680')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2df6e9c0-a7cf-41c8-b070-48f7d596543f', $q$gridlastic-com$q$, $q$gridlastic.com$q$, $q$https://www.gridlastic.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2df6e9c0-a7cf-41c8-b070-48f7d596543f', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2df6e9c0-a7cf-41c8-b070-48f7d596543f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb56d917-0780-4247-b58b-9a2442ec62e8', $q$growthx$q$, $q$GrowthX$q$, $q$https://growthx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb56d917-0780-4247-b58b-9a2442ec62e8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb56d917-0780-4247-b58b-9a2442ec62e8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c457be31-ef87-43d3-b435-4ed953d6af55', $q$gtmetrix-com$q$, $q$gtmetrix.com$q$, $q$https://gtmetrix.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c457be31-ef87-43d3-b435-4ed953d6af55', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c457be31-ef87-43d3-b435-4ed953d6af55')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('568547ff-59ab-4b3b-ae92-b49ca5b36ead', $q$guake$q$, $q$Guake$q$, $q$http://guake.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '568547ff-59ab-4b3b-ae92-b49ca5b36ead', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '568547ff-59ab-4b3b-ae92-b49ca5b36ead')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53a92cf2-b633-4b01-8ba1-b758e49deaff', $q$here$q$, $q$here$q$, $q$https://developer.here.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53a92cf2-b633-4b01-8ba1-b758e49deaff', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53a92cf2-b633-4b01-8ba1-b758e49deaff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ee2ba62-d76a-42c9-ad46-c197ae0f9deb', $q$hook0$q$, $q$Hook0$q$, $q$https://www.hook0.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ee2ba62-d76a-42c9-ad46-c197ae0f9deb', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ee2ba62-d76a-42c9-ad46-c197ae0f9deb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bb3fa9c2-85cf-40fe-915a-88448c893e60', $q$houndci-com$q$, $q$houndci.com$q$, $q$https://houndci.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bb3fa9c2-85cf-40fe-915a-88448c893e60', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb3fa9c2-85cf-40fe-915a-88448c893e60')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7dbd0f3c-596e-4e86-a42f-bfd823d5b139', $q$hs-ping$q$, $q$HS Ping$q$, $q$https://hsping.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7dbd0f3c-596e-4e86-a42f-bfd823d5b139', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7dbd0f3c-596e-4e86-a42f-bfd823d5b139')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed646919-3729-41de-8039-78b18451affb', $q$http-toolkit$q$, $q$HTTP Toolkit$q$, $q$https://httptoolkit.tech$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed646919-3729-41de-8039-78b18451affb', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed646919-3729-41de-8039-78b18451affb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c602b31-3f54-464f-aea3-7b2143386e53', $q$hyper$q$, $q$Hyper$q$, $q$https://hyper.is/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c602b31-3f54-464f-aea3-7b2143386e53', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c602b31-3f54-464f-aea3-7b2143386e53')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6dc07e0d-c11e-493c-a649-122c63e3798c', $q$imgen$q$, $q$imgen$q$, $q$https://www.jitbit.com/imgen/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6dc07e0d-c11e-493c-a649-122c63e3798c', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6dc07e0d-c11e-493c-a649-122c63e3798c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a0f4514-dc8e-4173-a3f0-2148c9bf5106', $q$ip-geolocation$q$, $q$IP Geolocation$q$, $q$https://ipgeolocation.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a0f4514-dc8e-4173-a3f0-2148c9bf5106', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a0f4514-dc8e-4173-a3f0-2148c9bf5106')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('657a21c6-b6ec-42fe-93db-a7f365fe4a7e', $q$ip-geolocation-api-by-ipwho-org$q$, $q$IP Geolocation API by ipwho.org$q$, $q$https://ipwho.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '657a21c6-b6ec-42fe-93db-a7f365fe4a7e', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '657a21c6-b6ec-42fe-93db-a7f365fe4a7e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4d747c16-4721-4657-99a8-0dc41180c9a3', $q$ip-api$q$, $q$ip-api$q$, $q$https://ip-api.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4d747c16-4721-4657-99a8-0dc41180c9a3', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d747c16-4721-4657-99a8-0dc41180c9a3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd655f72-ed29-4ca9-9edf-a675f2df3adc', $q$ip-city$q$, $q$IP.City$q$, $q$https://ip.city$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd655f72-ed29-4ca9-9edf-a675f2df3adc', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd655f72-ed29-4ca9-9edf-a675f2df3adc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f30b8958-caeb-4e4e-a179-13f1f4909856', $q$ip2geo-dev$q$, $q$ip2geo.dev$q$, $q$https://ip2geo.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f30b8958-caeb-4e4e-a179-13f1f4909856', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f30b8958-caeb-4e4e-a179-13f1f4909856')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d83506a4-1ccc-402c-8638-dab44d9ceb4d', $q$ipaddress-sh$q$, $q$ipaddress.sh$q$, $q$https://ipaddress.sh$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd83506a4-1ccc-402c-8638-dab44d9ceb4d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd83506a4-1ccc-402c-8638-dab44d9ceb4d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('525ea99b-ef17-48ee-8ad4-9105820b467e', $q$ipapi$q$, $q$ipapi$q$, $q$https://ipapi.co/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '525ea99b-ef17-48ee-8ad4-9105820b467e', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '525ea99b-ef17-48ee-8ad4-9105820b467e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d105a102-fc6c-4e6b-b019-dde7162d2ea7', $q$ipapi-is$q$, $q$ipapi.is$q$, $q$https://ipapi.is/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd105a102-fc6c-4e6b-b019-dde7162d2ea7', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd105a102-fc6c-4e6b-b019-dde7162d2ea7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('daf5292b-6ddf-4ae6-8b4f-6c389e0c9ea1', $q$ipbase-com$q$, $q$ipbase.com$q$, $q$https://ipbase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'daf5292b-6ddf-4ae6-8b4f-6c389e0c9ea1', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'daf5292b-6ddf-4ae6-8b4f-6c389e0c9ea1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a77fb19-5b49-4c17-a20c-6013b66fe0a8', $q$iptrace$q$, $q$IPTrace$q$, $q$https://iptrace.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a77fb19-5b49-4c17-a20c-6013b66fe0a8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a77fb19-5b49-4c17-a20c-6013b66fe0a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9cef2a32-16d3-4cd1-872e-bbb90a9252d3', $q$jam$q$, $q$Jam$q$, $q$https://jam.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9cef2a32-16d3-4cd1-872e-bbb90a9252d3', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9cef2a32-16d3-4cd1-872e-bbb90a9252d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d4e9ad4-01ed-4801-b978-a245ef2960cf', $q$jdoodle$q$, $q$JDoodle$q$, $q$https://www.jdoodle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d4e9ad4-01ed-4801-b978-a245ef2960cf', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d4e9ad4-01ed-4801-b978-a245ef2960cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a4f10253-9413-4df5-a5d7-092ebb486319', $q$json-to-table$q$, $q$JSON to Table$q$, $q$https://jsontotable.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a4f10253-9413-4df5-a5d7-092ebb486319', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4f10253-9413-4df5-a5d7-092ebb486319')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7b21f07-d36b-4daa-883f-01c5e88181c2', $q$jsongrid$q$, $q$JSONGrid$q$, $q$https://jsongrid.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7b21f07-d36b-4daa-883f-01c5e88181c2', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7b21f07-d36b-4daa-883f-01c5e88181c2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a1ebb23-6bf9-4afd-86cf-c407afe1c1ef', $q$jsoning$q$, $q$JSONing$q$, $q$https://jsoning.com/api/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a1ebb23-6bf9-4afd-86cf-c407afe1c1ef', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a1ebb23-6bf9-4afd-86cf-c407afe1c1ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2501044-0af6-4598-b440-dc01bd18018b', $q$katalon-com$q$, $q$katalon.com$q$, $q$https://katalon.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2501044-0af6-4598-b440-dc01bd18018b', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2501044-0af6-4598-b440-dc01bd18018b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('218fc64f-21b9-48f0-98b2-9884440f8b27', $q$kentik$q$, $q$Kentik$q$, $q$https://www.kentik.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '218fc64f-21b9-48f0-98b2-9884440f8b27', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '218fc64f-21b9-48f0-98b2-9884440f8b27')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb96d805-d6f8-47d2-a49e-b95e1020601a', $q$kitty$q$, $q$Kitty$q$, $q$https://www.9bis.net/kitty/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb96d805-d6f8-47d2-a49e-b95e1020601a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb96d805-d6f8-47d2-a49e-b95e1020601a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95a972b4-6ef8-4cb6-aab0-4b90cae8a006', $q$kreya$q$, $q$Kreya$q$, $q$https://kreya.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95a972b4-6ef8-4cb6-aab0-4b90cae8a006', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95a972b4-6ef8-4cb6-aab0-4b90cae8a006')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13ae85ad-d43a-4512-8758-4938edcda85b', $q$latlng$q$, $q$LatLng$q$, $q$https://www.latlng.work$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13ae85ad-d43a-4512-8758-4938edcda85b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13ae85ad-d43a-4512-8758-4938edcda85b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c9e369c9-8969-4676-96dd-6dcf36073247', $q$lazarus$q$, $q$Lazarus$q$, $q$https://www.lazarus-ide.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c9e369c9-8969-4676-96dd-6dcf36073247', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9e369c9-8969-4676-96dd-6dcf36073247')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0858c0fe-cad7-4f72-a0c3-231ffb5b5169', $q$leancloud$q$, $q$LeanCloud$q$, $q$https://leancloud.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0858c0fe-cad7-4f72-a0c3-231ffb5b5169', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0858c0fe-cad7-4f72-a0c3-231ffb5b5169')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fbe64c69-2519-4d4d-a8ac-db1fed67dbd4', $q$loadmill-com$q$, $q$loadmill.com$q$, $q$https://www.loadmill.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fbe64c69-2519-4d4d-a8ac-db1fed67dbd4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbe64c69-2519-4d4d-a8ac-db1fed67dbd4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b6eec7f4-416b-488a-8e21-08d33b576b04', $q$locationiq-com$q$, $q$locationiq.com$q$, $q$https://locationiq.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b6eec7f4-416b-488a-8e21-08d33b576b04', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6eec7f4-416b-488a-8e21-08d33b576b04')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('132c1320-c9c3-4fd0-b346-df9bf518abe8', $q$logo-dev$q$, $q$Logo.dev$q$, $q$https://www.logo.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '132c1320-c9c3-4fd0-b346-df9bf518abe8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '132c1320-c9c3-4fd0-b346-df9bf518abe8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('91aa183d-cbad-4603-9d32-b7c725dd445d', $q$logspot$q$, $q$LogSpot$q$, $q$https://logspot.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '91aa183d-cbad-4603-9d32-b7c725dd445d', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '91aa183d-cbad-4603-9d32-b7c725dd445d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de48aadb-0846-4b49-a702-038b453551e2', $q$lost-pixel-com$q$, $q$lost-pixel.com$q$, $q$https://lost-pixel.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de48aadb-0846-4b49-a702-038b453551e2', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de48aadb-0846-4b49-a702-038b453551e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2e1f9828-804c-49f5-8c8d-5c9e6f92b1c4', $q$mashery$q$, $q$Mashery$q$, $q$https://www.mashery.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2e1f9828-804c-49f5-8c8d-5c9e6f92b1c4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2e1f9828-804c-49f5-8c8d-5c9e6f92b1c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0cac4e36-1e3d-46d5-b6d5-5f4a6ae19ac9', $q$maverick-capital$q$, $q$Maverick Capital$q$, $q$https://maverickventures.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0cac4e36-1e3d-46d5-b6d5-5f4a6ae19ac9', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0cac4e36-1e3d-46d5-b6d5-5f4a6ae19ac9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cbffc64d-061f-4327-afe2-5751890ec08b', $q$meld$q$, $q$Meld$q$, $q$https://meldmerge.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cbffc64d-061f-4327-afe2-5751890ec08b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cbffc64d-061f-4327-afe2-5751890ec08b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6e2c2798-2f0d-49c6-95d5-d9bc4fa18762', $q$memcachier$q$, $q$MemCachier$q$, $q$https://www.memcachier.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6e2c2798-2f0d-49c6-95d5-d9bc4fa18762', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e2c2798-2f0d-49c6-95d5-d9bc4fa18762')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8df81e1-b454-46d6-a810-ce6d56bfc7c0', $q$memsql$q$, $q$MemSQL$q$, $q$https://www.memsql.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8df81e1-b454-46d6-a810-ce6d56bfc7c0', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8df81e1-b454-46d6-a810-ce6d56bfc7c0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('32becab4-413c-4199-910d-3d48e998a7c6', $q$micro-jaymock$q$, $q$micro-jaymock$q$, $q$https://micro-jaymock.now.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '32becab4-413c-4199-910d-3d48e998a7c6', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32becab4-413c-4199-910d-3d48e998a7c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ad3873ed-1f48-4664-806c-4262011f9e17', $q$microlink-io$q$, $q$microlink.io$q$, $q$https://microlink.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ad3873ed-1f48-4664-806c-4262011f9e17', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad3873ed-1f48-4664-806c-4262011f9e17')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('37ee81f5-99b8-47c4-90cb-7ba1d4c7034d', $q$mirin$q$, $q$Mirin$q$, $q$https://mirin.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '37ee81f5-99b8-47c4-90cb-7ba1d4c7034d', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37ee81f5-99b8-47c4-90cb-7ba1d4c7034d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9ae86df0-ccc6-4db7-a3a5-250094d37112', $q$mobaxterm$q$, $q$MobaXterm$q$, $q$https://mobaxterm.mobatek.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9ae86df0-ccc6-4db7-a3a5-250094d37112', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ae86df0-ccc6-4db7-a3a5-250094d37112')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11723921-04a3-4319-bf2c-42136fdd6126', $q$mockable-io$q$, $q$mockable.io$q$, $q$https://www.mockable.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11723921-04a3-4319-bf2c-42136fdd6126', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11723921-04a3-4319-bf2c-42136fdd6126')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c77281b3-51b7-49bc-bc87-1122bfa07008', $q$mockfly$q$, $q$Mockfly$q$, $q$https://www.mockfly.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c77281b3-51b7-49bc-bc87-1122bfa07008', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c77281b3-51b7-49bc-bc87-1122bfa07008')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a6e8ff55-dc46-48b8-8925-cf607ade8a51', $q$mocklets$q$, $q$Mocklets$q$, $q$https://mocklets.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a6e8ff55-dc46-48b8-8925-cf607ade8a51', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6e8ff55-dc46-48b8-8925-cf607ade8a51')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9195a714-41ac-461a-ae6b-25c3b07348ec', $q$mode-analytics$q$, $q$Mode Analytics$q$, $q$https://modeanalytics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9195a714-41ac-461a-ae6b-25c3b07348ec', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9195a714-41ac-461a-ae6b-25c3b07348ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('64061a5f-8c24-4cd5-b9a9-4584d34cdce7', $q$moesif$q$, $q$Moesif$q$, $q$https://www.moesif.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '64061a5f-8c24-4cd5-b9a9-4584d34cdce7', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64061a5f-8c24-4cd5-b9a9-4584d34cdce7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b9ce2772-887c-400a-b1ba-2a658d807825', $q$moonlight$q$, $q$Moonlight$q$, $q$https://moonlightwork.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b9ce2772-887c-400a-b1ba-2a658d807825', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9ce2772-887c-400a-b1ba-2a658d807825')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bfe0dbd8-1025-4a56-bb48-467bdc41f2c0', $q$mpv$q$, $q$mpv$q$, $q$https://mpv.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bfe0dbd8-1025-4a56-bb48-467bdc41f2c0', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfe0dbd8-1025-4a56-bb48-467bdc41f2c0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cf744450-32b7-45e7-8891-03a0adca9476', $q$mtputty$q$, $q$MTPuTTY$q$, $q$https://ttyplus.com/multi-tabbed-putty/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cf744450-32b7-45e7-8891-03a0adca9476', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf744450-32b7-45e7-8891-03a0adca9476')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('80a0d096-7630-4dc6-b1bb-d774b748e7c9', $q$multi-exit-ip-address-checker$q$, $q$Multi-Exit IP Address Checker$q$, $q$https://ip.alstra.ca/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '80a0d096-7630-4dc6-b1bb-d774b748e7c9', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80a0d096-7630-4dc6-b1bb-d774b748e7c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5828746b-46dd-42d9-a386-b259b6fcba7b', $q$musicbrainz-picard$q$, $q$MusicBrainz Picard$q$, $q$https://picard.musicbrainz.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5828746b-46dd-42d9-a386-b259b6fcba7b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5828746b-46dd-42d9-a386-b259b6fcba7b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5ec50bd9-95ae-4433-8d9a-f9f8630ed1a7', $q$mux$q$, $q$Mux$q$, $q$https://mux.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5ec50bd9-95ae-4433-8d9a-f9f8630ed1a7', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ec50bd9-95ae-4433-8d9a-f9f8630ed1a7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e248dec1-ed15-4f67-9509-633b474d1c4f', $q$neo4j-aura$q$, $q$Neo4j Aura$q$, $q$https://neo4j.com/cloud/aura/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e248dec1-ed15-4f67-9509-633b474d1c4f', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e248dec1-ed15-4f67-9509-633b474d1c4f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e85d1e8c-862c-434a-af90-6aa32838109e', $q$neovim$q$, $q$Neovim$q$, $q$https://neovim.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e85d1e8c-862c-434a-af90-6aa32838109e', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e85d1e8c-862c-434a-af90-6aa32838109e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('676509af-beb4-48b6-9abe-b457a7889dcc', $q$nepfin$q$, $q$NepFin$q$, $q$https://www.nepfin.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '676509af-beb4-48b6-9abe-b457a7889dcc', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '676509af-beb4-48b6-9abe-b457a7889dcc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('019191ba-026d-4e54-8492-dc52034a6db9', $q$netbeans-ide$q$, $q$NetBeans IDE$q$, $q$https://netbeans.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '019191ba-026d-4e54-8492-dc52034a6db9', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '019191ba-026d-4e54-8492-dc52034a6db9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('85a52d59-e1d8-4048-a8a6-6d19944ea9f5', $q$news-api$q$, $q$News API$q$, $q$https://newsapi.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '85a52d59-e1d8-4048-a8a6-6d19944ea9f5', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85a52d59-e1d8-4048-a8a6-6d19944ea9f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e20ab785-b993-4db4-8a06-900b6a25a70f', $q$numlookupapi-com$q$, $q$numlookupapi.com$q$, $q$https://numlookupapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e20ab785-b993-4db4-8a06-900b6a25a70f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e20ab785-b993-4db4-8a06-900b6a25a70f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f3b1d096-0814-47f7-ba6a-0f36140d498e', $q$numverify$q$, $q$numverify$q$, $q$https://numverify.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f3b1d096-0814-47f7-ba6a-0f36140d498e', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3b1d096-0814-47f7-ba6a-0f36140d498e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('01d230ae-2a86-4f59-80d1-059f0eb95672', $q$nuna$q$, $q$Nuna$q$, $q$https://www.nuna.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '01d230ae-2a86-4f59-80d1-059f0eb95672', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01d230ae-2a86-4f59-80d1-059f0eb95672')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ead195fc-8695-4a01-ba30-5d721894f024', $q$ocr-space$q$, $q$OCR.Space$q$, $q$https://ocr.space/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ead195fc-8695-4a01-ba30-5d721894f024', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ead195fc-8695-4a01-ba30-5d721894f024')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1fc3feb9-ca36-4ded-a948-5d6d4664247d', $q$openapi3-designer$q$, $q$OpenAPI3 Designer$q$, $q$https://openapidesigner.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1fc3feb9-ca36-4ded-a948-5d6d4664247d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1fc3feb9-ca36-4ded-a948-5d6d4664247d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26b4d5a7-8a6a-4c3e-a83f-14ec7778255f', $q$opencagedata-com$q$, $q$opencagedata.com$q$, $q$https://opencagedata.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26b4d5a7-8a6a-4c3e-a83f-14ec7778255f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26b4d5a7-8a6a-4c3e-a83f-14ec7778255f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('181b96ea-2254-4755-a203-f253cbe106f6', $q$pagegym-com$q$, $q$pagegym.com$q$, $q$https://pagegym.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '181b96ea-2254-4755-a203-f253cbe106f6', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '181b96ea-2254-4755-a203-f253cbe106f6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('92914b91-31c5-4192-828b-7cdffa72bfbe', $q$pdfbolt$q$, $q$PDFBolt$q$, $q$https://pdfbolt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '92914b91-31c5-4192-828b-7cdffa72bfbe', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '92914b91-31c5-4192-828b-7cdffa72bfbe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb27631e-e1af-4777-97ec-6e09928fc2db', $q$pdfgear$q$, $q$PDFGear$q$, $q$https://www.pdfgear.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb27631e-e1af-4777-97ec-6e09928fc2db', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb27631e-e1af-4777-97ec-6e09928fc2db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb51290e-5dae-49b4-a3d5-f4c73b4d6dd3', $q$pdfmonkey$q$, $q$PDFMonkey$q$, $q$https://www.pdfmonkey.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb51290e-5dae-49b4-a3d5-f4c73b4d6dd3', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb51290e-5dae-49b4-a3d5-f4c73b4d6dd3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('036161bc-b784-4383-a98b-a5b7d5bcb6a7', $q$periscope-data$q$, $q$Periscope Data$q$, $q$https://www.periscopedata.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '036161bc-b784-4383-a98b-a5b7d5bcb6a7', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '036161bc-b784-4383-a98b-a5b7d5bcb6a7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a8e9c6c3-2ef1-4666-8c58-17ddc22e756b', $q$pinata-ipfs$q$, $q$Pinata IPFS$q$, $q$https://pinata.cloud$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a8e9c6c3-2ef1-4666-8c58-17ddc22e756b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8e9c6c3-2ef1-4666-8c58-17ddc22e756b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bca47845-ab54-4a9c-9e46-b7174f915bb5', $q$potplayer$q$, $q$PotPlayer$q$, $q$https://potplayer.daum.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bca47845-ab54-4a9c-9e46-b7174f915bb5', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bca47845-ab54-4a9c-9e46-b7174f915bb5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8f3b3a9-3cbb-4b55-b910-b4f70844b522', $q$power-bi$q$, $q$Power BI$q$, $q$https://powerbi.microsoft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8f3b3a9-3cbb-4b55-b910-b4f70844b522', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8f3b3a9-3cbb-4b55-b910-b4f70844b522')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('906340df-a792-4c8a-a94f-b826b5eafc75', $q$proxmint-geoip$q$, $q$Proxmint GeoIP$q$, $q$https://proxmint.com/tools/ip-lookup$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '906340df-a792-4c8a-a94f-b826b5eafc75', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '906340df-a792-4c8a-a94f-b826b5eafc75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('21419e4a-d9ac-4943-bfbf-d9637e571e3a', $q$proxysentry$q$, $q$ProxySentry$q$, $q$https://proxysentry.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '21419e4a-d9ac-4943-bfbf-d9637e571e3a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21419e4a-d9ac-4943-bfbf-d9637e571e3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2515767c-ee29-4773-b058-d7dfdc0e8692', $q$putty$q$, $q$PuTTY$q$, $q$https://www.chiark.greenend.org.uk/~sgtatham/putty/download.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2515767c-ee29-4773-b058-d7dfdc0e8692', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2515767c-ee29-4773-b058-d7dfdc0e8692')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('109137a6-d73f-421d-890e-83f4080f3d67', $q$qoddi$q$, $q$Qoddi$q$, $q$https://qoddi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '109137a6-d73f-421d-890e-83f4080f3d67', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '109137a6-d73f-421d-890e-83f4080f3d67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6db0b943-799c-4439-a53b-0fbec9d1a6fb', $q$qrtracer$q$, $q$QRtracer$q$, $q$https://qrtracer.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6db0b943-799c-4439-a53b-0fbec9d1a6fb', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6db0b943-799c-4439-a53b-0fbec9d1a6fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3d1842ea-1d57-4789-a426-2bcea2956086', $q$rapidapi$q$, $q$RapidAPI$q$, $q$https://rapidapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3d1842ea-1d57-4789-a426-2bcea2956086', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d1842ea-1d57-4789-a426-2bcea2956086')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('43fac0c6-b389-4278-93de-945194b6d68d', $q$reducto$q$, $q$Reducto$q$, $q$https://reducto.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '43fac0c6-b389-4278-93de-945194b6d68d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43fac0c6-b389-4278-93de-945194b6d68d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b7a5f619-af18-4147-bd7b-89073f4344ac', $q$repohistory$q$, $q$Repohistory$q$, $q$https://repohistory.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b7a5f619-af18-4147-bd7b-89073f4344ac', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7a5f619-af18-4147-bd7b-89073f4344ac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a6a3d64-3311-45ac-b994-c91028e3f624', $q$resmush-it$q$, $q$resmush.it$q$, $q$https://resmush.it$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a6a3d64-3311-45ac-b994-c91028e3f624', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a6a3d64-3311-45ac-b994-c91028e3f624')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('170f07c2-95bf-46cc-b22d-d020b3c3f4e6', $q$robohash$q$, $q$ROBOHASH$q$, $q$https://robohash.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '170f07c2-95bf-46cc-b22d-d020b3c3f4e6', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '170f07c2-95bf-46cc-b22d-d020b3c3f4e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d55362b-f77e-4770-9ebd-5262f7fd1bbd', $q$rollgate$q$, $q$Rollgate$q$, $q$https://rollgate.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d55362b-f77e-4770-9ebd-5262f7fd1bbd', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d55362b-f77e-4770-9ebd-5262f7fd1bbd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fc29e9aa-79b8-4f2a-b6b0-4ad8e835c56d', $q$rxvt$q$, $q$RXVT$q$, $q$https://rxvt.sourceforge.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fc29e9aa-79b8-4f2a-b6b0-4ad8e835c56d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc29e9aa-79b8-4f2a-b6b0-4ad8e835c56d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2778b54-b657-4fb4-afbe-7897c55ec79a', $q$rxvt-unicode$q$, $q$rxvt-unicode$q$, $q$http://software.schmorp.de/pkg/rxvt-unicode.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2778b54-b657-4fb4-afbe-7897c55ec79a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2778b54-b657-4fb4-afbe-7897c55ec79a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('495ad0e8-41af-44b8-a959-f25a3e5ade8a', $q$screenshot-scout$q$, $q$Screenshot Scout$q$, $q$https://screenshotscout.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '495ad0e8-41af-44b8-a959-f25a3e5ade8a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '495ad0e8-41af-44b8-a959-f25a3e5ade8a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8f993c88-da0b-4b0c-9e73-a4e0a8fc27c0', $q$screenshotbase-com$q$, $q$screenshotbase.com$q$, $q$https://screenshotbase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8f993c88-da0b-4b0c-9e73-a4e0a8fc27c0', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f993c88-da0b-4b0c-9e73-a4e0a8fc27c0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('97e29495-70f0-47b8-880a-00cd37d76e7e', $q$screenshotlayer-com$q$, $q$screenshotlayer.com$q$, $q$https://screenshotlayer.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '97e29495-70f0-47b8-880a-00cd37d76e7e', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97e29495-70f0-47b8-880a-00cd37d76e7e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('09dc6cc9-cc2b-4a3f-8251-c7ead61223b8', $q$screenshotmachine-com$q$, $q$screenshotmachine.com$q$, $q$https://www.screenshotmachine.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '09dc6cc9-cc2b-4a3f-8251-c7ead61223b8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09dc6cc9-cc2b-4a3f-8251-c7ead61223b8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13e8b8b6-b8a4-4e10-83b1-091eb345c83d', $q$screentogif$q$, $q$ScreenToGif$q$, $q$https://www.screentogif.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13e8b8b6-b8a4-4e10-83b1-091eb345c83d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13e8b8b6-b8a4-4e10-83b1-091eb345c83d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a99b012-e61d-4112-b6fe-3e91837379e4', $q$seline$q$, $q$Seline$q$, $q$https://seline.so$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a99b012-e61d-4112-b6fe-3e91837379e4', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a99b012-e61d-4112-b6fe-3e91837379e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('93e64cc7-4486-466d-9e19-12571f952f80', $q$shutter-encoder$q$, $q$Shutter Encoder$q$, $q$https://www.shutterencoder.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '93e64cc7-4486-466d-9e19-12571f952f80', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '93e64cc7-4486-466d-9e19-12571f952f80')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dfd1b3b9-3f3a-449a-96cd-8b268dc20ff7', $q$sight-machine$q$, $q$Sight Machine$q$, $q$https://sightmachine.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dfd1b3b9-3f3a-449a-96cd-8b268dc20ff7', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dfd1b3b9-3f3a-449a-96cd-8b268dc20ff7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0df4806-e2ae-4a1e-9f15-9690e5c49c90', $q$simplescraper$q$, $q$Simplescraper$q$, $q$https://simplescraper.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0df4806-e2ae-4a1e-9f15-9690e5c49c90', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0df4806-e2ae-4a1e-9f15-9690e5c49c90')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9068b1b2-ffa5-4dab-a335-18c5ba603b84', $q$slalom-consulting$q$, $q$Slalom Consulting$q$, $q$https://slalom.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9068b1b2-ffa5-4dab-a335-18c5ba603b84', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9068b1b2-ffa5-4dab-a335-18c5ba603b84')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48f72749-0789-444f-8c3a-cb2c9ef9948d', $q$smartcar-api$q$, $q$Smartcar API$q$, $q$https://smartcar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48f72749-0789-444f-8c3a-cb2c9ef9948d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48f72749-0789-444f-8c3a-cb2c9ef9948d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a152094-6011-4d9f-98ad-4789bbc373e4', $q$smartparse$q$, $q$SmartParse$q$, $q$https://smartparse.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a152094-6011-4d9f-98ad-4789bbc373e4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a152094-6011-4d9f-98ad-4789bbc373e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d76ea8ce-e4b5-44ab-af8f-e28f6a424ecf', $q$snapapi$q$, $q$SnapAPI$q$, $q$https://snapapi.pics$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd76ea8ce-e4b5-44ab-af8f-e28f6a424ecf', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd76ea8ce-e4b5-44ab-af8f-e28f6a424ecf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b25a355-1634-420d-9c8f-22ffa5b51e99', $q$sofodata$q$, $q$Sofodata$q$, $q$https://www.sofodata.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b25a355-1634-420d-9c8f-22ffa5b51e99', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b25a355-1634-420d-9c8f-22ffa5b51e99')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7759b53c-4c9a-44a4-bfc4-30367adc7652', $q$sourcetree$q$, $q$SourceTree$q$, $q$https://www.sourcetreeapp.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7759b53c-4c9a-44a4-bfc4-30367adc7652', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7759b53c-4c9a-44a4-bfc4-30367adc7652')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f5d63905-753a-44cf-9f63-d2d9237f4458', $q$st$q$, $q$st$q$, $q$https://st.suckless.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f5d63905-753a-44cf-9f63-d2d9237f4458', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5d63905-753a-44cf-9f63-d2d9237f4458')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cc12996b-7c7f-460d-9b3d-e57824f439db', $q$stackshare$q$, $q$Stackshare$q$, $q$https://stackshare.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cc12996b-7c7f-460d-9b3d-e57824f439db', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc12996b-7c7f-460d-9b3d-e57824f439db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23b8b809-0b66-40a2-96d8-fd6025ca0918', $q$stadiamaps-com$q$, $q$stadiamaps.com$q$, $q$https://stadiamaps.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23b8b809-0b66-40a2-96d8-fd6025ca0918', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23b8b809-0b66-40a2-96d8-fd6025ca0918')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('36743b0b-c813-412a-a5b8-300e9008f8be', $q$statcounter$q$, $q$StatCounter$q$, $q$https://statcounter.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '36743b0b-c813-412a-a5b8-300e9008f8be', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36743b0b-c813-412a-a5b8-300e9008f8be')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65365c90-e90c-40ef-8335-9c314efcc81a', $q$stellate$q$, $q$Stellate$q$, $q$https://stellate.co/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65365c90-e90c-40ef-8335-9c314efcc81a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65365c90-e90c-40ef-8335-9c314efcc81a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('12643058-7883-4167-ad94-1a205d430fb0', $q$streamshare$q$, $q$Streamshare$q$, $q$https://streamshare.wireway.ch$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '12643058-7883-4167-ad94-1a205d430fb0', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '12643058-7883-4167-ad94-1a205d430fb0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a8ec909-0330-4a11-9331-cc8f51c9356d', $q$superfeedr-com$q$, $q$superfeedr.com$q$, $q$https://superfeedr.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a8ec909-0330-4a11-9331-cc8f51c9356d', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a8ec909-0330-4a11-9331-cc8f51c9356d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d449e4f-11e8-4aed-906d-1db93e6279d4', $q$switchboard-software$q$, $q$Switchboard Software$q$, $q$https://switchboard-software.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d449e4f-11e8-4aed-906d-1db93e6279d4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d449e4f-11e8-4aed-906d-1db93e6279d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('01de5ae7-f006-47a2-a19e-101ab26172e3', $q$tabby$q$, $q$Tabby$q$, $q$https://tabby.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '01de5ae7-f006-47a2-a19e-101ab26172e3', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01de5ae7-f006-47a2-a19e-101ab26172e3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d0b6d9d-9d92-40c9-b660-b5fc060d55ae', $q$talix$q$, $q$Talix$q$, $q$https://www.talix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d0b6d9d-9d92-40c9-b660-b5fc060d55ae', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d0b6d9d-9d92-40c9-b660-b5fc060d55ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('02e76c4c-f8e5-4e4a-910f-a6931e9f7f52', $q$tavily-ai$q$, $q$Tavily AI$q$, $q$https://tavily.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '02e76c4c-f8e5-4e4a-910f-a6931e9f7f52', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02e76c4c-f8e5-4e4a-910f-a6931e9f7f52')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('16fe8e88-f867-4c0f-a193-43d61775248c', $q$templatefox$q$, $q$TemplateFox$q$, $q$https://pdftemplateapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '16fe8e88-f867-4c0f-a193-43d61775248c', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16fe8e88-f867-4c0f-a193-43d61775248c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d51b103f-c910-401c-843f-9ae945fbeffe', $q$terminology$q$, $q$Terminology$q$, $q$https://www.enlightenment.org/about-terminology$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd51b103f-c910-401c-843f-9ae945fbeffe', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd51b103f-c910-401c-843f-9ae945fbeffe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7e880184-e045-43cc-8ffd-46d78db8a165', $q$the-ip-api$q$, $q$The IP API$q$, $q$https://theipapi.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7e880184-e045-43cc-8ffd-46d78db8a165', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e880184-e045-43cc-8ffd-46d78db8a165')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be637e69-9a3f-47cb-847b-bb9187fc3a23', $q$tilix$q$, $q$Tilix$q$, $q$https://gnunn1.github.io/tilix-web/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be637e69-9a3f-47cb-847b-bb9187fc3a23', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be637e69-9a3f-47cb-847b-bb9187fc3a23')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8abbf5a0-6e7d-4a53-b94b-75d2b0dda37a', $q$tinymce$q$, $q$TinyMCE$q$, $q$https://www.tiny.cloud$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8abbf5a0-6e7d-4a53-b94b-75d2b0dda37a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8abbf5a0-6e7d-4a53-b94b-75d2b0dda37a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4b1f3ab7-fa41-4979-a5de-528c73740661', $q$tinypng-com$q$, $q$tinypng.com$q$, $q$https://tinypng.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4b1f3ab7-fa41-4979-a5de-528c73740661', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b1f3ab7-fa41-4979-a5de-528c73740661')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13424dbf-3828-4a0f-a93c-8a05c97ac792', $q$toggled-dev$q$, $q$Toggled.dev$q$, $q$https://www.toggled.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13424dbf-3828-4a0f-a93c-8a05c97ac792', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13424dbf-3828-4a0f-a93c-8a05c97ac792')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('731ccad9-3cae-4c70-8893-3245a46be96a', $q$tower$q$, $q$Tower$q$, $q$https://www.git-tower.com/windows$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '731ccad9-3cae-4c70-8893-3245a46be96a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '731ccad9-3cae-4c70-8893-3245a46be96a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('47872217-890e-429c-9c5f-8afc9725fccc', $q$transloadit-com$q$, $q$transloadit.com$q$, $q$https://transloadit.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '47872217-890e-429c-9c5f-8afc9725fccc', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47872217-890e-429c-9c5f-8afc9725fccc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('daeb7cad-c938-40ea-b529-ad1cb7be5ece', $q$triplepoint-capital$q$, $q$TriplePoint Capital$q$, $q$https://triplepointcapital.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'daeb7cad-c938-40ea-b529-ad1cb7be5ece', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'daeb7cad-c938-40ea-b529-ad1cb7be5ece')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7bd554b-4c6f-49bc-8dd2-d05a191150d6', $q$twicpics-com$q$, $q$twicpics.com$q$, $q$https://www.twicpics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7bd554b-4c6f-49bc-8dd2-d05a191150d6', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7bd554b-4c6f-49bc-8dd2-d05a191150d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('31e079ba-79ee-4573-b9ba-9153199de71b', $q$typewhisper$q$, $q$TypeWhisper$q$, $q$https://www.typewhisper.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '31e079ba-79ee-4573-b9ba-9153199de71b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31e079ba-79ee-4573-b9ba-9153199de71b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e84c541c-4ae7-412f-ac31-d7e8ce39dbd4', $q$usabilityhub-com$q$, $q$usabilityhub.com$q$, $q$https://usabilityhub.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e84c541c-4ae7-412f-ac31-d7e8ce39dbd4', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e84c541c-4ae7-412f-ac31-d7e8ce39dbd4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('74bf94cd-f96e-4ad7-b344-53376a9bf5a1', $q$vatcheckapi-com$q$, $q$vatcheckapi.com$q$, $q$https://vatcheckapi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '74bf94cd-f96e-4ad7-b344-53376a9bf5a1', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74bf94cd-f96e-4ad7-b344-53376a9bf5a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('46b3c74c-ed96-4afb-b9f4-1c8dbcdab67a', $q$vatnode$q$, $q$vatnode$q$, $q$https://vatnode.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '46b3c74c-ed96-4afb-b9f4-1c8dbcdab67a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46b3c74c-ed96-4afb-b9f4-1c8dbcdab67a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28ae002a-491c-4053-88eb-6da54ea6d9ec', $q$velocity$q$, $q$Velocity$q$, $q$https://velocity.silverlakesoftware.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28ae002a-491c-4053-88eb-6da54ea6d9ec', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28ae002a-491c-4053-88eb-6da54ea6d9ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea79af72-f19d-40b5-9379-97a91e11128b', $q$veriphone$q$, $q$veriphone$q$, $q$https://veriphone.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea79af72-f19d-40b5-9379-97a91e11128b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea79af72-f19d-40b5-9379-97a91e11128b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13dd573f-5883-41a2-a369-6ff8b9c9c227', $q$visidata$q$, $q$Visidata$q$, $q$https://visidata.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13dd573f-5883-41a2-a369-6ff8b9c9c227', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13dd573f-5883-41a2-a369-6ff8b9c9c227')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4359bc3c-fb99-4ce0-b280-b5583b3fc97d', $q$visual-studio$q$, $q$Visual Studio$q$, $q$https://www.visualstudio.com/vs/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4359bc3c-fb99-4ce0-b280-b5583b3fc97d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4359bc3c-fb99-4ce0-b280-b5583b3fc97d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('619ffceb-1cb7-4c55-a003-3fc72a7c3096', $q$waiverstevie-com$q$, $q$WaiverStevie.com$q$, $q$https://waiverstevie.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '619ffceb-1cb7-4c55-a003-3fc72a7c3096', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '619ffceb-1cb7-4c55-a003-3fc72a7c3096')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eae1dc90-cef0-417c-bad5-6077b5abd867', $q$wezterm$q$, $q$WezTerm$q$, $q$https://wezfurlong.org/wezterm/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eae1dc90-cef0-417c-bad5-6077b5abd867', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eae1dc90-cef0-417c-bad5-6077b5abd867')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('60ecdbb3-026f-46c8-8fbb-a3d64cc69e45', $q$wolfram-com$q$, $q$wolfram.com$q$, $q$https://wolfram.com/language/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '60ecdbb3-026f-46c8-8fbb-a3d64cc69e45', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60ecdbb3-026f-46c8-8fbb-a3d64cc69e45')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb427278-a35a-468d-8ab3-46f9fcc883c7', $q$wrapapi-com$q$, $q$wrapapi.com$q$, $q$https://wrapapi.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb427278-a35a-468d-8ab3-46f9fcc883c7', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb427278-a35a-468d-8ab3-46f9fcc883c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d621bcc-8c34-404f-bc60-4b88cee00545', $q$xampp$q$, $q$Xampp$q$, $q$https://www.apachefriends.org/index.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d621bcc-8c34-404f-bc60-4b88cee00545', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d621bcc-8c34-404f-bc60-4b88cee00545')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('617316e9-ef7d-400a-a332-4d7f996fdf71', $q$yepcode$q$, $q$YepCode$q$, $q$https://yepcode.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '617316e9-ef7d-400a-a332-4d7f996fdf71', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '617316e9-ef7d-400a-a332-4d7f996fdf71')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('34252a29-96a8-41b9-8ce1-61184214fba9', $q$zed$q$, $q$Zed$q$, $q$https://zed.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '34252a29-96a8-41b9-8ce1-61184214fba9', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34252a29-96a8-41b9-8ce1-61184214fba9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c4bb62cc-1f77-4dd1-8444-f5a81fcbb61c', $q$zellij$q$, $q$Zellij$q$, $q$https://zellij.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c4bb62cc-1f77-4dd1-8444-f5a81fcbb61c', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4bb62cc-1f77-4dd1-8444-f5a81fcbb61c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dcf7fa96-758a-45de-adab-575adc66fc68', $q$zendrive$q$, $q$Zendrive$q$, $q$https://www.zendrive.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dcf7fa96-758a-45de-adab-575adc66fc68', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dcf7fa96-758a-45de-adab-575adc66fc68')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0648d840-cb83-4fbb-87f5-182dd65119e7', $q$zignal-labs$q$, $q$Zignal Labs$q$, $q$https://zignallabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0648d840-cb83-4fbb-87f5-182dd65119e7', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0648d840-cb83-4fbb-87f5-182dd65119e7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f94c2e1a-2eca-4820-be0f-59c97ae41fc8', $q$zip-codes$q$, $q$Zip-Codes$q$, $q$https://www.zip-codes.com/api/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f94c2e1a-2eca-4820-be0f-59c97ae41fc8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f94c2e1a-2eca-4820-be0f-59c97ae41fc8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d481b67-9b46-46d5-8c38-b53e157d6970', $q$zipcodebase$q$, $q$Zipcodebase$q$, $q$https://zipcodebase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d481b67-9b46-46d5-8c38-b53e157d6970', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d481b67-9b46-46d5-8c38-b53e157d6970')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eae5001f-c0c4-47f9-9501-820db04c142d', $q$zipcodestack$q$, $q$Zipcodestack$q$, $q$https://zipcodestack.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eae5001f-c0c4-47f9-9501-820db04c142d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eae5001f-c0c4-47f9-9501-820db04c142d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a932e98c-7ec9-47b4-8298-6f90b629e062', $q$adobe$q$, $q$Adobe$q$, $q$https://www.adobe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a932e98c-7ec9-47b4-8298-6f90b629e062', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a932e98c-7ec9-47b4-8298-6f90b629e062')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('31c5f2a3-74be-40d5-bb8e-e8a6c432a3f9', $q$microsoft-office$q$, $q$Microsoft Office$q$, $q$https://www.office.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '31c5f2a3-74be-40d5-bb8e-e8a6c432a3f9', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31c5f2a3-74be-40d5-bb8e-e8a6c432a3f9')
ON CONFLICT DO NOTHING;


-- Strategic metadata — one row per list entry (new tool or matched existing).
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3b8bdf64-831a-4991-928c-9915966c425d', $q$Project Management$q$, 1, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b8bdf64-831a-4991-928c-9915966c425d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a6a3a09-2391-4c68-b426-c1902814f2f3', $q$Automation$q$, 2, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a6a3a09-2391-4c68-b426-c1902814f2f3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '53160125-bbda-43d5-ad5c-c1b8f9543567', $q$Project Management$q$, 3, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53160125-bbda-43d5-ad5c-c1b8f9543567')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d6d4025-1392-4d58-abe6-a85b1348c75f', $q$Project Management$q$, 4, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d6d4025-1392-4d58-abe6-a85b1348c75f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e6a61cb-8d49-4bab-8df7-e193fdb5828d', $q$HR Software$q$, 5, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e6a61cb-8d49-4bab-8df7-e193fdb5828d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e730f7fb-ce8a-45ee-a2f2-2805eba89d8f', $q$Project Management$q$, 6, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e730f7fb-ce8a-45ee-a2f2-2805eba89d8f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd5640da9-382e-4276-8f92-15cece528e99', $q$HR Software$q$, 7, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5640da9-382e-4276-8f92-15cece528e99')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3cf5327c-c0a8-404f-bf69-3fc340045642', $q$Automation$q$, 8, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cf5327c-c0a8-404f-bf69-3fc340045642')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ee06b5a-cfc6-443e-9faf-49c4155189d8', $q$HR Software$q$, 9, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ee06b5a-cfc6-443e-9faf-49c4155189d8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '02bbdfd7-d18b-4f67-8b9f-b53d3c6c8de0', $q$Project Management$q$, 10, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02bbdfd7-d18b-4f67-8b9f-b53d3c6c8de0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4b3800ea-87aa-41a1-a18e-912e02481106', $q$Security & Identity$q$, 11, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b3800ea-87aa-41a1-a18e-912e02481106')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7b930705-cfc0-4768-aaaa-2e63acbd6095', $q$HR Software$q$, 12, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b930705-cfc0-4768-aaaa-2e63acbd6095')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '07218b04-d5e0-4c15-b183-87a769bfbbc2', $q$HR Software$q$, 13, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07218b04-d5e0-4c15-b183-87a769bfbbc2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5fa95c96-0cfd-470a-beb9-f4dd6e02c8a7', $q$Security & Identity$q$, 14, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5fa95c96-0cfd-470a-beb9-f4dd6e02c8a7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb5c1462-f100-411d-80a6-5e607484818f', $q$Forms & Surveys$q$, 15, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb5c1462-f100-411d-80a6-5e607484818f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ce7d7abb-965e-47fa-a6cd-0327c7df9079', $q$Security & Identity$q$, 16, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ce7d7abb-965e-47fa-a6cd-0327c7df9079')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e1766994-68c6-4c8b-afda-889f3aaad6f4', $q$Security & Identity$q$, 17, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1766994-68c6-4c8b-afda-889f3aaad6f4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2187636d-868e-49ce-876d-d8589525294e', $q$Security & Identity$q$, 18, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2187636d-868e-49ce-876d-d8589525294e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f081d77d-6e8f-4442-9eac-bfe94b79c0c1', $q$Automation$q$, 19, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f081d77d-6e8f-4442-9eac-bfe94b79c0c1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b8ac237-4025-433b-86e2-003f6116e259', $q$Project Management$q$, 20, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b8ac237-4025-433b-86e2-003f6116e259')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e68d6b56-cd53-4fcd-896a-94f7affcdd1d', $q$Automation$q$, 21, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e68d6b56-cd53-4fcd-896a-94f7affcdd1d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '102885a9-d27e-4d24-8bcd-26a67c8bc64f', $q$Automation$q$, 22, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '102885a9-d27e-4d24-8bcd-26a67c8bc64f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8f1c9f3c-0bbc-4447-8e8b-6308460bfc72', $q$Project Management$q$, 23, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f1c9f3c-0bbc-4447-8e8b-6308460bfc72')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a3ab281c-0f57-4323-9e90-a3ab6bc9ea68', $q$Project Management$q$, 24, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a3ab281c-0f57-4323-9e90-a3ab6bc9ea68')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c469c6a-792c-487e-9146-9bc65b73f1e9', $q$Project Management$q$, 25, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c469c6a-792c-487e-9146-9bc65b73f1e9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '013fc84f-ffdf-4d76-8166-cf81a411c2e8', $q$Project Management$q$, 26, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '013fc84f-ffdf-4d76-8166-cf81a411c2e8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a9a0c72-ca4d-45e7-aa81-ed7298617704', $q$Project Management$q$, 27, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a9a0c72-ca4d-45e7-aa81-ed7298617704')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '87792455-0657-4911-a33e-05d6b447ecc1', $q$Automation$q$, 28, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87792455-0657-4911-a33e-05d6b447ecc1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd05a8911-94c8-4ded-9bc6-afc628a354e8', $q$Security & Identity$q$, 29, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd05a8911-94c8-4ded-9bc6-afc628a354e8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a80a5e8-cb8b-4a90-830c-9ea5c7c7d5fc', $q$Project Management$q$, 30, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a80a5e8-cb8b-4a90-830c-9ea5c7c7d5fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a56e0bb-0bcb-44be-944e-9e4b11bb4539', $q$Project Management$q$, 31, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a56e0bb-0bcb-44be-944e-9e4b11bb4539')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '50dc8852-061d-48ca-aa66-b546734efaad', $q$Project Management$q$, 32, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50dc8852-061d-48ca-aa66-b546734efaad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bfa13736-5cdf-4dab-aa42-a840ea9719c5', $q$Security & Identity$q$, 33, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfa13736-5cdf-4dab-aa42-a840ea9719c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '03bcdece-1a8b-480d-947b-5ad1dede17d0', $q$Security & Identity$q$, 34, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03bcdece-1a8b-480d-947b-5ad1dede17d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fcad01b3-73c7-478c-a0d9-f7183b4b6e39', $q$Security & Identity$q$, 35, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fcad01b3-73c7-478c-a0d9-f7183b4b6e39')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6e2cffb0-5e91-4ff6-82cc-3ff414a58b5b', $q$Security & Identity$q$, 37, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e2cffb0-5e91-4ff6-82cc-3ff414a58b5b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86118475-1a9c-4a70-9c22-14996f8563a8', $q$Project Management$q$, 39, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86118475-1a9c-4a70-9c22-14996f8563a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0fcbe957-d0e4-46b4-87eb-14e727ae4ab2', $q$Security & Identity$q$, 40, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0fcbe957-d0e4-46b4-87eb-14e727ae4ab2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '469f4b55-236e-4e3e-b3d2-684fd59843f2', $q$Project Management$q$, 41, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '469f4b55-236e-4e3e-b3d2-684fd59843f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '93c7c717-34b9-4b7a-a2a6-54c9b04b63db', $q$Automation$q$, 42, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '93c7c717-34b9-4b7a-a2a6-54c9b04b63db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8538d67b-ef8f-47c5-95ac-808d9107a1d3', $q$Project Management$q$, 43, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8538d67b-ef8f-47c5-95ac-808d9107a1d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f478ddc4-f63a-48a1-bc0d-6d01460ea3f7', $q$Project Management$q$, 44, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f478ddc4-f63a-48a1-bc0d-6d01460ea3f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '72113a07-d836-42b2-bc28-ca8584b4dde2', $q$HR Software$q$, 45, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72113a07-d836-42b2-bc28-ca8584b4dde2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '03b82cf8-538f-4100-a6b7-2a0c8edae0bb', $q$Security & Identity$q$, 46, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03b82cf8-538f-4100-a6b7-2a0c8edae0bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '24680a77-6673-4532-875d-be234e171239', $q$Security & Identity$q$, 47, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24680a77-6673-4532-875d-be234e171239')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '761c6882-76cc-4899-8894-6e19fcd03196', $q$Automation$q$, 48, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '761c6882-76cc-4899-8894-6e19fcd03196')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c784f807-986f-42ed-bef7-f3172bf29eb6', $q$HR Software$q$, 49, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c784f807-986f-42ed-bef7-f3172bf29eb6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d920caf-40c5-4430-b55f-21f70eb9a658', $q$Project Management$q$, 50, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d920caf-40c5-4430-b55f-21f70eb9a658')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '34cca3da-0b47-4c2e-891f-b5da7f4f9768', $q$Project Management$q$, 51, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34cca3da-0b47-4c2e-891f-b5da7f4f9768')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '058989b4-a238-4856-bca0-68e31443678d', $q$Project Management$q$, 52, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '058989b4-a238-4856-bca0-68e31443678d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cdca3933-c58c-427d-9060-e2df06cbc53b', $q$Automation$q$, 53, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cdca3933-c58c-427d-9060-e2df06cbc53b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9f13fc9b-f365-42fd-bc19-797a2d893bee', $q$Security & Identity$q$, 54, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f13fc9b-f365-42fd-bc19-797a2d893bee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2eea72c4-2de1-4425-96b0-110333386a22', $q$Security & Identity$q$, 55, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2eea72c4-2de1-4425-96b0-110333386a22')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a544388-740c-4cd7-b1e4-2fa282b5fd60', $q$Security & Identity$q$, 56, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a544388-740c-4cd7-b1e4-2fa282b5fd60')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8cf8b19c-724e-4ace-adfc-195869faf40e', $q$Project Management$q$, 57, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8cf8b19c-724e-4ace-adfc-195869faf40e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b23a4173-cab6-4af5-bc43-b6e1a4f6c10b', $q$Security & Identity$q$, 58, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b23a4173-cab6-4af5-bc43-b6e1a4f6c10b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c9031180-f3be-4ace-8d4c-cae03b1b7546', $q$HR Software$q$, 59, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9031180-f3be-4ace-8d4c-cae03b1b7546')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e23e4ddb-c07a-4b99-a76f-d5c1db4f834b', $q$Security & Identity$q$, 60, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e23e4ddb-c07a-4b99-a76f-d5c1db4f834b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d1ba060-3047-48d5-afa1-eeea9a7bc1b6', $q$Project Management$q$, 61, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d1ba060-3047-48d5-afa1-eeea9a7bc1b6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8c41222b-5f6e-473c-a1b3-a9e81f36d413', $q$Security & Identity$q$, 62, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c41222b-5f6e-473c-a1b3-a9e81f36d413')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ab2080fd-f85c-4771-9fec-f4565b55bd54', $q$Security & Identity$q$, 63, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab2080fd-f85c-4771-9fec-f4565b55bd54')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7e3cf46-e5b2-4863-9ade-036bce7d9b8f', $q$Automation$q$, 64, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7e3cf46-e5b2-4863-9ade-036bce7d9b8f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af5d862b-9847-4d20-957d-64acefd83518', $q$Forms & Surveys$q$, 65, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af5d862b-9847-4d20-957d-64acefd83518')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'add33646-6e6f-450c-a421-d83289070027', $q$Security & Identity$q$, 68, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'add33646-6e6f-450c-a421-d83289070027')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8978ee71-fc74-45e5-9243-9c12f0bc3e4f', $q$Forms & Surveys$q$, 69, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8978ee71-fc74-45e5-9243-9c12f0bc3e4f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f3066964-4fea-4cce-aa97-8021d4f0f689', $q$HR Software$q$, 70, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3066964-4fea-4cce-aa97-8021d4f0f689')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e67ec8f4-6724-499d-9797-c7ebe1606608', $q$HR Software$q$, 71, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e67ec8f4-6724-499d-9797-c7ebe1606608')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '79bad209-25a9-4a60-98d0-485f1b1a2841', $q$Project Management$q$, 72, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79bad209-25a9-4a60-98d0-485f1b1a2841')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7a4144c-9250-4e27-8225-6d51fe352728', $q$Security & Identity$q$, 73, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7a4144c-9250-4e27-8225-6d51fe352728')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '84defde8-30fb-4853-abab-9a3911edb937', $q$Automation$q$, 74, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84defde8-30fb-4853-abab-9a3911edb937')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c4faeff-bed1-4349-8cda-e64e27eec5ee', $q$HR Software$q$, 76, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c4faeff-bed1-4349-8cda-e64e27eec5ee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3f537593-6d7c-4b78-86d2-c1672ef47681', $q$Forms & Surveys$q$, 77, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f537593-6d7c-4b78-86d2-c1672ef47681')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af818b41-34b2-4c68-b4b7-4a8e04f0d55d', $q$Project Management$q$, 78, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af818b41-34b2-4c68-b4b7-4a8e04f0d55d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ff9a9a3-b2e1-403c-8100-fc3d62544385', $q$Project Management$q$, 79, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ff9a9a3-b2e1-403c-8100-fc3d62544385')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e131f632-aef1-4d07-9f48-39a7d238f759', $q$HR Software$q$, 80, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e131f632-aef1-4d07-9f48-39a7d238f759')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2fd93906-89ed-4e5b-9f9f-996fc3781562', $q$Project Management$q$, 81, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2fd93906-89ed-4e5b-9f9f-996fc3781562')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '209a03e8-4fda-4aba-8d79-da1fbf027843', $q$HR Software$q$, 82, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '209a03e8-4fda-4aba-8d79-da1fbf027843')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0201f850-3011-4af7-8a82-ff28d5bf2e3a', $q$Project Management$q$, 84, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0201f850-3011-4af7-8a82-ff28d5bf2e3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7cd2a382-2f81-4c15-941b-fd980d28c49d', $q$Security & Identity$q$, 85, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cd2a382-2f81-4c15-941b-fd980d28c49d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd2c22dc4-f4b5-4ab1-bcbb-f5b904529873', $q$Forms & Surveys$q$, 86, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2c22dc4-f4b5-4ab1-bcbb-f5b904529873')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b571b9db-5d28-4112-8049-1a0fe4c15252', $q$Forms & Surveys$q$, 87, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b571b9db-5d28-4112-8049-1a0fe4c15252')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86817617-ca40-4c41-a22b-0863e32d3658', $q$Forms & Surveys$q$, 88, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86817617-ca40-4c41-a22b-0863e32d3658')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82f9a84b-bc9a-4a0c-9dea-9a6347c72776', $q$Forms & Surveys$q$, 89, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82f9a84b-bc9a-4a0c-9dea-9a6347c72776')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd65fb00c-ad19-4f0a-8b33-f9ac43976e3e', $q$Project Management$q$, 90, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd65fb00c-ad19-4f0a-8b33-f9ac43976e3e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '03d8556c-a3e1-4b1e-8a76-275a9375a80c', $q$Project Management$q$, 92, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03d8556c-a3e1-4b1e-8a76-275a9375a80c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ba593b7-0ee2-4846-88c4-e2c9ca1d3205', $q$Project Management$q$, 93, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ba593b7-0ee2-4846-88c4-e2c9ca1d3205')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b2465ba3-344b-4364-87d4-76ce0f4b144a', $q$HR Software$q$, 94, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2465ba3-344b-4364-87d4-76ce0f4b144a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e6141b46-6897-4c35-a618-11aaf2be5837', $q$Project Management$q$, 95, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e6141b46-6897-4c35-a618-11aaf2be5837')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2142ad9d-a04b-4c5b-bacc-45bed496cf5d', $q$HR Software$q$, 96, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2142ad9d-a04b-4c5b-bacc-45bed496cf5d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fdf264f7-9752-40b5-856a-6476de3a93e0', $q$HR Software$q$, 97, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fdf264f7-9752-40b5-856a-6476de3a93e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c7495c4-59e5-4771-bb6e-c2212b69cd13', $q$Project Management$q$, 98, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c7495c4-59e5-4771-bb6e-c2212b69cd13')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '62d3a99f-29bc-49cb-a2ce-73d3ccc0fee5', $q$Project Management$q$, 99, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62d3a99f-29bc-49cb-a2ce-73d3ccc0fee5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '597b04d8-38e0-4572-8798-edf05d2ff472', $q$Security & Identity$q$, 100, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '597b04d8-38e0-4572-8798-edf05d2ff472')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e1588d34-f389-45e0-85f9-0e65b5a51697', $q$Project Management$q$, 101, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e1588d34-f389-45e0-85f9-0e65b5a51697')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a9d57005-8254-4a8e-8077-bb74382f7b08', $q$Project Management$q$, 102, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9d57005-8254-4a8e-8077-bb74382f7b08')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '04d47a13-4e28-47c6-9386-caeef8fc0bcb', $q$Project Management$q$, 103, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04d47a13-4e28-47c6-9386-caeef8fc0bcb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '738aa639-77be-4b29-87f3-cede23f9ba93', $q$Project Management$q$, 104, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '738aa639-77be-4b29-87f3-cede23f9ba93')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fbedb31e-d390-4d41-9711-e4e1d51b04ec', $q$Project Management$q$, 105, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbedb31e-d390-4d41-9711-e4e1d51b04ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc78dec6-f940-49ca-8259-882392fa4093', $q$Forms & Surveys$q$, 106, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc78dec6-f940-49ca-8259-882392fa4093')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '50a352e4-985f-48db-9f9e-5065ee565808', $q$Project Management$q$, 108, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50a352e4-985f-48db-9f9e-5065ee565808')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2f3d1d83-a890-48a4-8c87-6cda18bb9362', $q$HR Software$q$, 109, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f3d1d83-a890-48a4-8c87-6cda18bb9362')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e8085152-0783-4b48-96b8-0608bf7280d0', $q$Project Management$q$, 110, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8085152-0783-4b48-96b8-0608bf7280d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13c2f5a9-1d2a-4498-82bb-fd6ed55fac49', $q$Project Management$q$, 111, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13c2f5a9-1d2a-4498-82bb-fd6ed55fac49')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd6001483-4357-4718-ae77-d7db5b66e0bc', $q$Security & Identity$q$, 112, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6001483-4357-4718-ae77-d7db5b66e0bc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a5c14ef-a08d-4371-a90d-5b3c61c41f59', $q$Project Management$q$, 113, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a5c14ef-a08d-4371-a90d-5b3c61c41f59')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9ca783cc-294e-4bf4-a7ba-f0d5b9b4421e', $q$Security & Identity$q$, 114, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ca783cc-294e-4bf4-a7ba-f0d5b9b4421e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6fe67406-3aad-4feb-9e90-67fbdffd2ac4', $q$Security & Identity$q$, 115, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fe67406-3aad-4feb-9e90-67fbdffd2ac4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e3dce97-5ea9-4efc-9157-82bbdf39bfa9', $q$Project Management$q$, 116, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e3dce97-5ea9-4efc-9157-82bbdf39bfa9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae8d08ab-76ed-473d-8096-f916fc9cf6ff', $q$HR Software$q$, 117, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae8d08ab-76ed-473d-8096-f916fc9cf6ff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a7aa3a7b-159a-4b76-bdd1-3de59ada0bff', $q$Security & Identity$q$, 118, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a7aa3a7b-159a-4b76-bdd1-3de59ada0bff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '18267b78-6fc1-4fa7-a394-95efc8e74c48', $q$Forms & Surveys$q$, 119, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18267b78-6fc1-4fa7-a394-95efc8e74c48')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a17a6da7-ed22-4353-bd96-969a20fe454f', $q$Security & Identity$q$, 120, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a17a6da7-ed22-4353-bd96-969a20fe454f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '113bd5ad-324e-4157-9957-8f45c5d3706c', $q$Project Management$q$, 122, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '113bd5ad-324e-4157-9957-8f45c5d3706c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fd20ac12-b9fa-4d81-b3b3-6b99f5c436a8', $q$Security & Identity$q$, 123, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd20ac12-b9fa-4d81-b3b3-6b99f5c436a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '24d2232e-ed4e-4f5a-924d-a5d4ca9d36c7', $q$Project Management$q$, 124, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24d2232e-ed4e-4f5a-924d-a5d4ca9d36c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0d6f9d53-7eab-42fb-9863-0383df58a4e1', $q$Project Management$q$, 125, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d6f9d53-7eab-42fb-9863-0383df58a4e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b6427ca2-a163-4b31-8bc3-60b8e9bc495e', $q$Automation$q$, 126, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6427ca2-a163-4b31-8bc3-60b8e9bc495e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a1f4142b-0887-4e0a-9a7e-75024fa8b64c', $q$Project Management$q$, 127, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1f4142b-0887-4e0a-9a7e-75024fa8b64c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bc5b1125-e4c5-4c3e-952c-4408d9b8fb76', $q$HR Software$q$, 128, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bc5b1125-e4c5-4c3e-952c-4408d9b8fb76')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '351f1b54-7237-4d8c-8fd6-3d0707dd48ba', $q$Automation$q$, 129, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '351f1b54-7237-4d8c-8fd6-3d0707dd48ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95fce2e8-6e9f-420c-aac6-60ee6f2dcbcd', $q$HR Software$q$, 130, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95fce2e8-6e9f-420c-aac6-60ee6f2dcbcd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3fdc00ab-4a10-4aa2-9b49-af7c49379c68', $q$HR Software$q$, 131, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fdc00ab-4a10-4aa2-9b49-af7c49379c68')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd7228e5e-4c17-4381-abb7-5ef309160e53', $q$Automation$q$, 132, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7228e5e-4c17-4381-abb7-5ef309160e53')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '736b5ad2-aaa6-431e-90bc-e57046195e30', $q$Automation$q$, 133, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '736b5ad2-aaa6-431e-90bc-e57046195e30')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8e9790ca-6b69-480b-b8ec-b63c43ab419e', $q$Forms & Surveys$q$, 134, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e9790ca-6b69-480b-b8ec-b63c43ab419e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'db52fc9b-fba7-4f14-a760-d19378a74970', $q$Security & Identity$q$, 135, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db52fc9b-fba7-4f14-a760-d19378a74970')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b650bdd1-9652-40a2-9e91-f19c7e073c20', $q$Project Management$q$, 137, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b650bdd1-9652-40a2-9e91-f19c7e073c20')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '52572350-af84-4a5a-a1ee-2ea0dd353e63', $q$Project Management$q$, 138, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52572350-af84-4a5a-a1ee-2ea0dd353e63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c22e490-8a88-4117-be76-6a9d8fb25682', $q$Forms & Surveys$q$, 139, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c22e490-8a88-4117-be76-6a9d8fb25682')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ac46b818-4ea6-4e3d-a558-0c0c85cfd0c3', $q$Project Management$q$, 140, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac46b818-4ea6-4e3d-a558-0c0c85cfd0c3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1e3cf415-978d-4d31-a80e-1c9a11ba85f8', $q$Automation$q$, 141, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e3cf415-978d-4d31-a80e-1c9a11ba85f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b389c8bc-baeb-45ce-b30e-fcd51950ca7d', $q$Project Management$q$, 142, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b389c8bc-baeb-45ce-b30e-fcd51950ca7d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e4501940-691c-48d0-8d76-0373da4753e8', $q$Project Management$q$, 143, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4501940-691c-48d0-8d76-0373da4753e8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20f469fc-f80f-4d9d-b5ab-7c69fcb5dc42', $q$Security & Identity$q$, 144, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20f469fc-f80f-4d9d-b5ab-7c69fcb5dc42')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '19001f4b-7efa-4a1f-961e-39fa56173d96', $q$Security & Identity$q$, 145, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19001f4b-7efa-4a1f-961e-39fa56173d96')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '333bb459-322b-4108-891e-527ab9b2e7a8', $q$HR Software$q$, 146, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '333bb459-322b-4108-891e-527ab9b2e7a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af4b660c-ac0c-4de0-af44-a2adb08784df', $q$Project Management$q$, 147, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af4b660c-ac0c-4de0-af44-a2adb08784df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '045b7486-ea4c-48b6-a24e-1adae754d9c7', $q$Project Management$q$, 149, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '045b7486-ea4c-48b6-a24e-1adae754d9c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a0fda2a-ca3a-4988-93be-a6bc112b19c5', $q$Project Management$q$, 150, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a0fda2a-ca3a-4988-93be-a6bc112b19c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6093c1a8-43c2-4ae9-b8a5-f3e4c6bd083a', $q$Automation$q$, 151, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6093c1a8-43c2-4ae9-b8a5-f3e4c6bd083a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f54e28f-47bf-4acb-ae48-01d83136a03d', $q$Automation$q$, 152, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f54e28f-47bf-4acb-ae48-01d83136a03d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f07e4d7-d2b7-4cae-a924-7bdedde2ed23', $q$HR Software$q$, 153, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f07e4d7-d2b7-4cae-a924-7bdedde2ed23')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f06f8037-d994-4905-af33-9a92fd22fd99', $q$Security & Identity$q$, 154, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f06f8037-d994-4905-af33-9a92fd22fd99')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f71a0335-85ba-4841-8725-2cee9b76ed2c', $q$HR Software$q$, 155, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f71a0335-85ba-4841-8725-2cee9b76ed2c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ada2f7f-b679-45cf-9fc0-b4ac5467524c', $q$Project Management$q$, 156, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ada2f7f-b679-45cf-9fc0-b4ac5467524c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7e081f3a-49a1-47aa-94f9-86ebf8bb6847', $q$Forms & Surveys$q$, 157, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e081f3a-49a1-47aa-94f9-86ebf8bb6847')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8b3f02d9-5021-48e0-9fe0-b3217e77da89', $q$Project Management$q$, 158, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b3f02d9-5021-48e0-9fe0-b3217e77da89')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7523aa51-201a-44ff-82f5-134670673245', $q$Automation$q$, 159, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7523aa51-201a-44ff-82f5-134670673245')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd84b5c3a-4651-43da-9336-83a420f91910', $q$Security & Identity$q$, 160, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd84b5c3a-4651-43da-9336-83a420f91910')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fc59a52c-24d7-4754-90f1-7d253f205d66', $q$Security & Identity$q$, 161, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc59a52c-24d7-4754-90f1-7d253f205d66')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c349b4be-d057-4a15-a94c-322f57dc4bea', $q$HR Software$q$, 162, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c349b4be-d057-4a15-a94c-322f57dc4bea')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06264022-6d7e-4bff-8e25-aa7138edf671', $q$Automation$q$, 163, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06264022-6d7e-4bff-8e25-aa7138edf671')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ccb013b0-9aa7-47f4-89f9-531f5c02a8a8', $q$Project Management$q$, 164, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ccb013b0-9aa7-47f4-89f9-531f5c02a8a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cf0a5a8c-0ff2-4ff3-98e3-b6518dad226e', $q$HR Software$q$, 165, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf0a5a8c-0ff2-4ff3-98e3-b6518dad226e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '58dde317-3088-4494-9137-389b0c9d57a1', $q$Project Management$q$, 166, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '58dde317-3088-4494-9137-389b0c9d57a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e0d112b-bcb6-4cff-97ce-11ff3d9cc069', $q$Project Management$q$, 167, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e0d112b-bcb6-4cff-97ce-11ff3d9cc069')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '591873df-75d7-4992-9d3f-3591232df243', $q$Forms & Surveys$q$, 168, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '591873df-75d7-4992-9d3f-3591232df243')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f840b23b-0bcb-4964-8d2f-7d3df75ce009', $q$Forms & Surveys$q$, 169, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f840b23b-0bcb-4964-8d2f-7d3df75ce009')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0639acb-df64-4a48-bd2d-0268abf40c8b', $q$Security & Identity$q$, 170, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0639acb-df64-4a48-bd2d-0268abf40c8b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c44a10e-d266-407e-b2a7-22cd51860188', $q$Project Management$q$, 171, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c44a10e-d266-407e-b2a7-22cd51860188')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11627e6f-6ecb-473e-810f-35655c9258d7', $q$Automation$q$, 172, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11627e6f-6ecb-473e-810f-35655c9258d7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '92114073-26a6-4a32-a1aa-d6037cb66457', $q$Project Management$q$, 173, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '92114073-26a6-4a32-a1aa-d6037cb66457')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe1d6721-0cc5-4fe4-8c41-59c58732f381', $q$Automation$q$, 174, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe1d6721-0cc5-4fe4-8c41-59c58732f381')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cf0ad87f-7de0-4b33-bcaa-2a120425aece', $q$Project Management$q$, 175, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf0ad87f-7de0-4b33-bcaa-2a120425aece')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0427f3ad-91e1-4cfa-9f91-91da0743275f', $q$Project Management$q$, 176, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0427f3ad-91e1-4cfa-9f91-91da0743275f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20198396-e326-420c-9462-72f91e4b8ce2', $q$HR Software$q$, 177, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20198396-e326-420c-9462-72f91e4b8ce2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '240f3a45-e897-41e9-aad2-3d77e1931e06', $q$Project Management$q$, 178, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '240f3a45-e897-41e9-aad2-3d77e1931e06')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cfd71545-36cb-42e2-9017-b9687ad8cc3a', $q$Security & Identity$q$, 179, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfd71545-36cb-42e2-9017-b9687ad8cc3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0d1068a9-691d-4b74-98f2-7610046835dc', $q$Project Management$q$, 180, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d1068a9-691d-4b74-98f2-7610046835dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '80095f65-c002-4465-97d1-73184e551d57', $q$Project Management$q$, 181, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80095f65-c002-4465-97d1-73184e551d57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '692b256b-f0c2-4498-ac42-7f543a2f2ab7', $q$Security & Identity$q$, 182, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '692b256b-f0c2-4498-ac42-7f543a2f2ab7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c4498445-7753-45a9-9b91-ffc58aae2bb6', $q$Security & Identity$q$, 183, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4498445-7753-45a9-9b91-ffc58aae2bb6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a4300961-3a6f-46ba-abb0-4bc38e4bf748', $q$Security & Identity$q$, 184, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4300961-3a6f-46ba-abb0-4bc38e4bf748')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0e80cf9a-084e-43ec-8c67-769a55c2bf47', $q$Project Management$q$, 185, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0e80cf9a-084e-43ec-8c67-769a55c2bf47')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2487f39d-c50a-4d74-8ee6-46945d6befa9', $q$Project Management$q$, 186, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2487f39d-c50a-4d74-8ee6-46945d6befa9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54925f17-8f27-4c15-9946-89bbfaca14ca', $q$HR Software$q$, 187, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54925f17-8f27-4c15-9946-89bbfaca14ca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82e24521-63a4-431d-a793-30cca2952e18', $q$Project Management$q$, 188, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82e24521-63a4-431d-a793-30cca2952e18')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '841155ed-f385-46da-a652-f4a80cc90b12', $q$HR Software$q$, 189, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '841155ed-f385-46da-a652-f4a80cc90b12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e57e48b5-bb61-4332-b76f-41703d29d5de', $q$Project Management$q$, 190, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e57e48b5-bb61-4332-b76f-41703d29d5de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '87f79a83-91fb-45b3-b1bf-4449b7e67dbe', $q$HR Software$q$, 191, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87f79a83-91fb-45b3-b1bf-4449b7e67dbe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e6c44e3e-ce55-4a52-92ba-114711a986ba', $q$Automation$q$, 192, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e6c44e3e-ce55-4a52-92ba-114711a986ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aa67d433-3617-42c1-91e2-1b63b1f60d3f', $q$HR Software$q$, 193, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa67d433-3617-42c1-91e2-1b63b1f60d3f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '302ee8d4-b426-4e4b-8767-20ccf73e66b1', $q$Project Management$q$, 194, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '302ee8d4-b426-4e4b-8767-20ccf73e66b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5698a301-a4c2-4998-a672-3ff90d3075ae', $q$Project Management$q$, 195, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5698a301-a4c2-4998-a672-3ff90d3075ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8eb0557c-7938-411d-b11e-592e76a74f81', $q$Project Management$q$, 196, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8eb0557c-7938-411d-b11e-592e76a74f81')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '68731bc6-ab93-4222-94e1-ab68561068b1', $q$HR Software$q$, 197, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68731bc6-ab93-4222-94e1-ab68561068b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cc3438ce-debf-4510-952a-f231aceebe38', $q$HR Software$q$, 198, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc3438ce-debf-4510-952a-f231aceebe38')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b439a3a3-4c0f-4eeb-b891-e61c771d54d3', $q$HR Software$q$, 199, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b439a3a3-4c0f-4eeb-b891-e61c771d54d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd85aee5d-1350-410e-ab4d-950eefa1b766', $q$Project Management$q$, 200, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd85aee5d-1350-410e-ab4d-950eefa1b766')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '564fef64-54da-4d24-9a17-ca6edbc89912', $q$Project Management$q$, 201, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '564fef64-54da-4d24-9a17-ca6edbc89912')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee0deada-dada-46df-9559-8cd0763d2555', $q$HR Software$q$, 202, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee0deada-dada-46df-9559-8cd0763d2555')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '637010bd-f6b1-467e-baba-50e40c6f0b75', $q$Project Management$q$, 203, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '637010bd-f6b1-467e-baba-50e40c6f0b75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ab03513-b8b5-434b-909d-f789380d5ac8', $q$Project Management$q$, 204, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ab03513-b8b5-434b-909d-f789380d5ac8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b847a4ac-3162-4463-836f-bc2f85bf1121', $q$HR Software$q$, 206, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b847a4ac-3162-4463-836f-bc2f85bf1121')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e9f380d-ae25-452b-a110-45f4c70bc778', $q$Security & Identity$q$, 207, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e9f380d-ae25-452b-a110-45f4c70bc778')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c50fbea-482e-4e8e-9005-c2a1e0696f25', $q$HR Software$q$, 208, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c50fbea-482e-4e8e-9005-c2a1e0696f25')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '90a2f873-65ba-4099-82ba-1fec36113906', $q$Project Management$q$, 209, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90a2f873-65ba-4099-82ba-1fec36113906')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '035bd7d9-5d54-4d8d-96c1-5b255ceccf5c', $q$Automation$q$, 211, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '035bd7d9-5d54-4d8d-96c1-5b255ceccf5c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e634e0f9-e82e-42e8-89be-614b673d4def', $q$HR Software$q$, 212, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e634e0f9-e82e-42e8-89be-614b673d4def')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '70d2df16-5bb1-4ffe-88b3-42f287c03773', $q$Security & Identity$q$, 213, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70d2df16-5bb1-4ffe-88b3-42f287c03773')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8c503cab-b1d1-4c40-9d52-2ebbb10efb84', $q$HR Software$q$, 214, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c503cab-b1d1-4c40-9d52-2ebbb10efb84')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea4d98c0-c66b-49a6-a6c5-71df48bdf219', $q$Automation$q$, 215, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea4d98c0-c66b-49a6-a6c5-71df48bdf219')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b1a890b-fd11-4e58-aa86-706ef55319fa', $q$Project Management$q$, 216, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b1a890b-fd11-4e58-aa86-706ef55319fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd3b37429-4da6-4337-8b4b-6b61bec4b14e', $q$Security & Identity$q$, 217, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3b37429-4da6-4337-8b4b-6b61bec4b14e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '16e0df85-238f-4225-af64-692c2dc57ac7', $q$Security & Identity$q$, 218, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16e0df85-238f-4225-af64-692c2dc57ac7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f0b41d4c-bda0-4c43-ab8e-1e7c4478f443', $q$Security & Identity$q$, 219, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0b41d4c-bda0-4c43-ab8e-1e7c4478f443')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b40b2206-cc82-4ad8-81ed-8847bc349c45', $q$Automation$q$, 220, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b40b2206-cc82-4ad8-81ed-8847bc349c45')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea411e6c-115a-494b-8044-bc795c616cef', $q$Project Management$q$, 221, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea411e6c-115a-494b-8044-bc795c616cef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd607c78d-c9b9-4d96-8b8e-1c2d8dfb3f6e', $q$Project Management$q$, 222, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd607c78d-c9b9-4d96-8b8e-1c2d8dfb3f6e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4bbf0402-f7f3-45d6-af50-1da6ee8209de', $q$Security & Identity$q$, 223, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bbf0402-f7f3-45d6-af50-1da6ee8209de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '503a2524-8656-43b9-b0a0-1448898e6234', $q$Security & Identity$q$, 224, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '503a2524-8656-43b9-b0a0-1448898e6234')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bcc51210-dc15-43f7-b1db-6dda5c83ce24', $q$Security & Identity$q$, 225, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bcc51210-dc15-43f7-b1db-6dda5c83ce24')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b7d888ce-f938-4082-9ee0-40ce4ed29c3d', $q$Project Management$q$, 226, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7d888ce-f938-4082-9ee0-40ce4ed29c3d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd3175013-5232-40d1-a380-4cea71b3a172', $q$Project Management$q$, 227, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3175013-5232-40d1-a380-4cea71b3a172')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f17b5189-c996-493c-ae66-6307f8752fad', $q$Project Management$q$, 228, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f17b5189-c996-493c-ae66-6307f8752fad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e645f72c-ddb7-4256-ab83-223852dee2b0', $q$HR Software$q$, 229, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e645f72c-ddb7-4256-ab83-223852dee2b0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dbb4a802-ce7e-41d0-8a7b-d8d943656887', $q$Project Management$q$, 230, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dbb4a802-ce7e-41d0-8a7b-d8d943656887')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99be8b3e-ec4c-479e-8bca-fab263c8c636', $q$HR Software$q$, 231, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99be8b3e-ec4c-479e-8bca-fab263c8c636')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e26aaa1b-36a2-4599-a86a-1f7bc77bc485', $q$HR Software$q$, 232, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e26aaa1b-36a2-4599-a86a-1f7bc77bc485')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'beb2df74-1044-46c3-b33f-6c18bd090b46', $q$Project Management$q$, 234, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'beb2df74-1044-46c3-b33f-6c18bd090b46')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4b590cea-8362-4dbd-88c1-a9ba4d2e4481', $q$Project Management$q$, 235, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b590cea-8362-4dbd-88c1-a9ba4d2e4481')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '082a1746-ce22-4c33-af61-48af20dc0bfe', $q$Automation$q$, 236, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '082a1746-ce22-4c33-af61-48af20dc0bfe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '79bd8bd8-1c81-4978-9acc-591467903f0c', $q$Project Management$q$, 237, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '79bd8bd8-1c81-4978-9acc-591467903f0c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ea43ede-7a2b-4738-9cab-5dfc37926351', $q$Project Management$q$, 238, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ea43ede-7a2b-4738-9cab-5dfc37926351')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '64ec94a8-846f-4ada-918c-714c6b17e8f7', $q$Forms & Surveys$q$, 239, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64ec94a8-846f-4ada-918c-714c6b17e8f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '60891efc-478a-4a81-bdb5-e0bfc9be60d2', $q$Security & Identity$q$, 240, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60891efc-478a-4a81-bdb5-e0bfc9be60d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e980dd07-f715-4a50-85af-445870608447', $q$Project Management$q$, 241, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e980dd07-f715-4a50-85af-445870608447')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb5390f2-4b33-422e-98a3-665cac7cf48c', $q$Forms & Surveys$q$, 242, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb5390f2-4b33-422e-98a3-665cac7cf48c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f52c8cdb-db41-4ace-a4f8-21db788e40b2', $q$Project Management$q$, 243, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f52c8cdb-db41-4ace-a4f8-21db788e40b2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e34cb9a8-b0fd-44e1-87c3-f3ec02302181', $q$Security & Identity$q$, 244, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e34cb9a8-b0fd-44e1-87c3-f3ec02302181')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'df1fca81-ca75-49df-a877-3729e7bec6e0', $q$Forms & Surveys$q$, 245, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df1fca81-ca75-49df-a877-3729e7bec6e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '81bb4d16-e344-4ffd-afd6-8b69ade13d02', $q$Automation$q$, 246, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81bb4d16-e344-4ffd-afd6-8b69ade13d02')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a12d344-640d-49f8-9a03-5fe54e6321e0', $q$Security & Identity$q$, 247, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a12d344-640d-49f8-9a03-5fe54e6321e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0ae4dc53-5ebd-4e63-9b1e-9dd7f80ad036', $q$Project Management$q$, 248, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ae4dc53-5ebd-4e63-9b1e-9dd7f80ad036')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f048d872-103b-4fe2-8514-833b0d858f20', $q$Automation$q$, 249, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f048d872-103b-4fe2-8514-833b0d858f20')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '83140b75-6025-471c-a71c-75574e30699b', $q$Project Management$q$, 250, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83140b75-6025-471c-a71c-75574e30699b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '16611a9e-f4a3-4e26-af21-0d761056810e', $q$HR Software$q$, 251, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16611a9e-f4a3-4e26-af21-0d761056810e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd4bb11aa-8ca1-4c40-9208-2d2adf301a93', $q$Project Management$q$, 252, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4bb11aa-8ca1-4c40-9208-2d2adf301a93')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b29cb40-ed61-4d7f-8a5c-ea72b2926e8f', $q$HR Software$q$, 253, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b29cb40-ed61-4d7f-8a5c-ea72b2926e8f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f0b897de-c74c-4bb6-b36e-ec51f4033cfb', $q$Project Management$q$, 254, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0b897de-c74c-4bb6-b36e-ec51f4033cfb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '59d73145-b5b1-4d6a-8ccf-96af978ead1e', $q$Project Management$q$, 256, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59d73145-b5b1-4d6a-8ccf-96af978ead1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dd81574e-2fed-4f14-94c6-a9b815978d9e', $q$Automation$q$, 257, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd81574e-2fed-4f14-94c6-a9b815978d9e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a87007c7-cce3-498a-b42f-ef7cf6664faf', $q$Project Management$q$, 258, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a87007c7-cce3-498a-b42f-ef7cf6664faf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '52c2bbf8-68d2-4bad-a579-0800e6e261c5', $q$Project Management$q$, 259, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52c2bbf8-68d2-4bad-a579-0800e6e261c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a78d5c61-f86f-4708-9d32-f11bafe3187e', $q$HR Software$q$, 260, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a78d5c61-f86f-4708-9d32-f11bafe3187e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8790a9de-f073-433e-b2a0-af96699e2d19', $q$Project Management$q$, 261, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8790a9de-f073-433e-b2a0-af96699e2d19')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b0192ca-eebc-4524-8485-6bbe550c7521', $q$Project Management$q$, 262, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b0192ca-eebc-4524-8485-6bbe550c7521')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b6d2a5fc-107d-43e3-839c-c10fd321d4c9', $q$Project Management$q$, 263, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6d2a5fc-107d-43e3-839c-c10fd321d4c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3466af92-0802-4781-96a2-9e4a6b602d98', $q$HR Software$q$, 264, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3466af92-0802-4781-96a2-9e4a6b602d98')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48a3fa14-e9a4-4e32-8c76-deae9cbdc39d', $q$Security & Identity$q$, 265, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48a3fa14-e9a4-4e32-8c76-deae9cbdc39d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f6d592e-573c-4bf8-a2a8-9b49d9c69d60', $q$Developer Platform$q$, 266, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f6d592e-573c-4bf8-a2a8-9b49d9c69d60')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0cd08476-3295-4d37-9113-84262b137477', $q$Developer Platform$q$, 267, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0cd08476-3295-4d37-9113-84262b137477')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c66d452a-24bd-4e71-85bc-2f571df6fb1a', $q$Developer Platform$q$, 268, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c66d452a-24bd-4e71-85bc-2f571df6fb1a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e13176ec-5dc4-46d6-8405-aefa773736c7', $q$Analytics$q$, 269, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e13176ec-5dc4-46d6-8405-aefa773736c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd64d310b-54e4-46b5-a522-34cc40a10b19', $q$Developer Platform$q$, 270, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd64d310b-54e4-46b5-a522-34cc40a10b19')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe6fcb84-394f-4f51-a04f-2c92e13be0ff', $q$Developer Platform$q$, 271, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe6fcb84-394f-4f51-a04f-2c92e13be0ff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '61fb3126-8cea-457f-af00-c5f81886e90b', $q$Developer Platform$q$, 272, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61fb3126-8cea-457f-af00-c5f81886e90b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b25e6074-563e-41e0-815c-ac0cbe553e43', $q$Analytics$q$, 273, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b25e6074-563e-41e0-815c-ac0cbe553e43')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a9e4e60-1478-4c66-ba47-4737776f5a67', $q$Testing & QA$q$, 274, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a9e4e60-1478-4c66-ba47-4737776f5a67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a3b93d43-f4fd-486d-8042-5176de12bfc8', $q$Analytics$q$, 275, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a3b93d43-f4fd-486d-8042-5176de12bfc8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a8173be0-5b10-42d2-bf34-283e137e165e', $q$Developer Platform$q$, 276, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8173be0-5b10-42d2-bf34-283e137e165e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '64d33f3f-8232-479c-8b76-920a41e078aa', $q$Developer Platform$q$, 277, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64d33f3f-8232-479c-8b76-920a41e078aa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '55d740dd-2254-4c1c-adfd-339116158e4d', $q$Developer Platform$q$, 278, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '55d740dd-2254-4c1c-adfd-339116158e4d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '72139aca-13e9-4d88-b8c5-a9f005b0c308', $q$Analytics$q$, 279, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72139aca-13e9-4d88-b8c5-a9f005b0c308')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4a95891a-9b70-49b6-9aa5-aacb25ea2e3e', $q$Developer Platform$q$, 280, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a95891a-9b70-49b6-9aa5-aacb25ea2e3e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8271070-c366-4c01-8ea4-620c98e6c346', $q$Developer Platform$q$, 281, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8271070-c366-4c01-8ea4-620c98e6c346')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '65ebe3ad-b990-475e-b5d4-1e5a41eeb74f', $q$Developer Platform$q$, 282, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65ebe3ad-b990-475e-b5d4-1e5a41eeb74f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '24333a6e-35b8-419f-bbea-18407263c49d', $q$Developer Platform$q$, 283, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24333a6e-35b8-419f-bbea-18407263c49d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '23d1542d-9141-41d6-88c7-b79591f12235', $q$Developer Platform$q$, 284, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23d1542d-9141-41d6-88c7-b79591f12235')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '19a8ede5-4cfd-4432-ac47-ccee90c264f0', $q$Developer Platform$q$, 285, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19a8ede5-4cfd-4432-ac47-ccee90c264f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'df7c1207-498a-4536-a1a8-48b58d36965d', $q$Developer Platform$q$, 286, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df7c1207-498a-4536-a1a8-48b58d36965d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5f4c56e8-3617-49c1-a970-6222e4223356', $q$Developer Platform$q$, 287, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f4c56e8-3617-49c1-a970-6222e4223356')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0cdf00f-2c31-4275-8460-3d2350e5cdd9', $q$Developer Platform$q$, 288, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0cdf00f-2c31-4275-8460-3d2350e5cdd9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0f3be02e-1282-4521-8595-0409429ece35', $q$Developer Platform$q$, 289, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0f3be02e-1282-4521-8595-0409429ece35')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e668d85-99d2-416e-9dd4-3b54eb399c0d', $q$Analytics$q$, 290, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e668d85-99d2-416e-9dd4-3b54eb399c0d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0189a1f5-a99e-48bb-8a88-9f97971e7210', $q$Developer Platform$q$, 291, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0189a1f5-a99e-48bb-8a88-9f97971e7210')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fac6626b-f7c1-4156-a37d-fe37a53cbd46', $q$Testing & QA$q$, 292, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fac6626b-f7c1-4156-a37d-fe37a53cbd46')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5d3384a3-5c53-49c6-8ec6-4333404223d5', $q$Testing & QA$q$, 293, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d3384a3-5c53-49c6-8ec6-4333404223d5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f94f585b-eadc-4fdf-9b77-2326d9c9c55b', $q$Testing & QA$q$, 294, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f94f585b-eadc-4fdf-9b77-2326d9c9c55b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bfd8be2c-7448-4197-adc5-f0d9a4f5a67c', $q$Developer Platform$q$, 295, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfd8be2c-7448-4197-adc5-f0d9a4f5a67c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '828ccb91-4556-45c0-86bd-d17dd4c415b4', $q$Developer Platform$q$, 296, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '828ccb91-4556-45c0-86bd-d17dd4c415b4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2440fb35-39af-47b6-a7a4-97190468c891', $q$Developer Platform$q$, 297, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2440fb35-39af-47b6-a7a4-97190468c891')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '665d4b24-214c-42c9-8e28-6289920470fa', $q$Developer Platform$q$, 298, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '665d4b24-214c-42c9-8e28-6289920470fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bd425dfc-b461-44c1-bcf3-b8b5f9f0b081', $q$Testing & QA$q$, 299, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd425dfc-b461-44c1-bcf3-b8b5f9f0b081')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '09c0ebfb-d0a2-4afe-98b2-2e0cb6ae6a5e', $q$Developer Platform$q$, 300, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09c0ebfb-d0a2-4afe-98b2-2e0cb6ae6a5e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '97e6cc22-43d3-4386-8b9d-15da156d79ef', $q$Developer Platform$q$, 301, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97e6cc22-43d3-4386-8b9d-15da156d79ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd2bd90e0-5e3f-4755-9bdf-dba19c114207', $q$Developer Platform$q$, 302, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2bd90e0-5e3f-4755-9bdf-dba19c114207')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '801fe2d5-0a0e-4153-b330-c3eb6d4148a9', $q$Developer Platform$q$, 303, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '801fe2d5-0a0e-4153-b330-c3eb6d4148a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b73f5754-ca55-4c7c-b69e-ff5322f97d7c', $q$Developer Platform$q$, 304, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b73f5754-ca55-4c7c-b69e-ff5322f97d7c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e4f5320d-cddc-4978-9d9b-313e103e6317', $q$Developer Platform$q$, 306, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4f5320d-cddc-4978-9d9b-313e103e6317')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d6a4341-49d8-4a1b-9b5e-70a2ea24b656', $q$Developer Platform$q$, 308, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d6a4341-49d8-4a1b-9b5e-70a2ea24b656')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '91718068-9940-489c-9896-6e5ee8e8b8eb', $q$Testing & QA$q$, 309, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '91718068-9940-489c-9896-6e5ee8e8b8eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a131b2f2-4df1-4a4f-a5c4-c14de369223f', $q$Developer Platform$q$, 310, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a131b2f2-4df1-4a4f-a5c4-c14de369223f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '519c027f-68f3-41a3-9fbf-fe00690530d1', $q$Developer Platform$q$, 311, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '519c027f-68f3-41a3-9fbf-fe00690530d1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '70a9679d-497c-429f-b84e-ded1939e3998', $q$Testing & QA$q$, 312, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '70a9679d-497c-429f-b84e-ded1939e3998')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '22f4ae28-a5a6-4290-9270-007dc55a2fb8', $q$Developer Platform$q$, 313, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22f4ae28-a5a6-4290-9270-007dc55a2fb8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '07ef96e0-6ec3-4cdf-9ebc-274fd2a1fc52', $q$Developer Platform$q$, 314, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07ef96e0-6ec3-4cdf-9ebc-274fd2a1fc52')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '38db83d5-1cfb-46a5-8302-6f0504792d1b', $q$Developer Platform$q$, 315, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38db83d5-1cfb-46a5-8302-6f0504792d1b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '030d0852-3dbf-4adb-8c3c-a409fec4ef57', $q$Developer Platform$q$, 316, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '030d0852-3dbf-4adb-8c3c-a409fec4ef57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1f5e2cdf-d242-4eda-8515-d36ab57bcf2c', $q$Developer Platform$q$, 317, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f5e2cdf-d242-4eda-8515-d36ab57bcf2c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06bbbde8-3637-4b7d-9ecd-4b57ec11b09a', $q$Developer Platform$q$, 318, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06bbbde8-3637-4b7d-9ecd-4b57ec11b09a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b37af3ea-5e5a-4245-80e2-3e606661a190', $q$Analytics$q$, 319, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b37af3ea-5e5a-4245-80e2-3e606661a190')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cfb00697-ef0e-41c5-bcfe-c935eb1a1686', $q$Developer Platform$q$, 320, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfb00697-ef0e-41c5-bcfe-c935eb1a1686')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f977ab97-d043-4a6a-8ce3-4fb8bb341718', $q$Developer Platform$q$, 321, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f977ab97-d043-4a6a-8ce3-4fb8bb341718')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cccc5611-7a21-495a-a110-a4f527e7cb31', $q$Developer Platform$q$, 322, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cccc5611-7a21-495a-a110-a4f527e7cb31')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a1915ba-4f7e-4b7a-a966-62a12559798f', $q$Developer Platform$q$, 323, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a1915ba-4f7e-4b7a-a966-62a12559798f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c03a4b23-df0e-40cf-b339-8908c4617161', $q$Developer Platform$q$, 324, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c03a4b23-df0e-40cf-b339-8908c4617161')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f61d8a4c-600b-4429-90b1-331036e6b6d9', $q$Testing & QA$q$, 325, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f61d8a4c-600b-4429-90b1-331036e6b6d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '291ba572-4afd-4ce5-9c3c-882a1ce496fa', $q$Developer Platform$q$, 326, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '291ba572-4afd-4ce5-9c3c-882a1ce496fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '84b78359-31d2-4ad8-8080-2f6c25cac662', $q$Developer Platform$q$, 327, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84b78359-31d2-4ad8-8080-2f6c25cac662')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f4c772c3-c947-4718-9c25-1a5f00eb816c', $q$Developer Platform$q$, 328, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f4c772c3-c947-4718-9c25-1a5f00eb816c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd7304551-558e-4e49-a47b-12448990ffcb', $q$Developer Platform$q$, 329, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd7304551-558e-4e49-a47b-12448990ffcb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '35b6ab82-b731-469e-9b33-b0d1c7274df5', $q$Developer Platform$q$, 330, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35b6ab82-b731-469e-9b33-b0d1c7274df5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '319fcc1c-a0c5-4265-a41d-9cde6355ce73', $q$Developer Platform$q$, 331, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '319fcc1c-a0c5-4265-a41d-9cde6355ce73')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4843b38f-5bc7-4463-b49d-62eee70ab6d4', $q$Developer Platform$q$, 332, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4843b38f-5bc7-4463-b49d-62eee70ab6d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dde0be9a-3191-4c90-b60e-9e55c0a8d7dd', $q$Developer Platform$q$, 333, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dde0be9a-3191-4c90-b60e-9e55c0a8d7dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4ef3e410-d43b-47d6-9c06-be4a84de8bca', $q$Developer Platform$q$, 334, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ef3e410-d43b-47d6-9c06-be4a84de8bca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5b4723d9-6d65-4fa7-bf73-3bebd82869cd', $q$Developer Platform$q$, 335, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b4723d9-6d65-4fa7-bf73-3bebd82869cd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4db5a7b5-2610-40da-840d-42c1cd5ae47f', $q$Developer Platform$q$, 336, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4db5a7b5-2610-40da-840d-42c1cd5ae47f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '63d53ee0-fc80-45e7-9be8-ab7da81da07b', $q$Testing & QA$q$, 337, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63d53ee0-fc80-45e7-9be8-ab7da81da07b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b908f67e-42a8-43cb-be34-623b92897152', $q$Analytics$q$, 338, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b908f67e-42a8-43cb-be34-623b92897152')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b25f0d0f-eb29-4a87-a5ca-cf877a636848', $q$Developer Platform$q$, 339, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b25f0d0f-eb29-4a87-a5ca-cf877a636848')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '52216857-5472-47c7-ad5b-88c9d35c5248', $q$Developer Platform$q$, 340, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52216857-5472-47c7-ad5b-88c9d35c5248')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea006d36-3cbe-4a24-9761-71e77fa35917', $q$Developer Platform$q$, 341, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea006d36-3cbe-4a24-9761-71e77fa35917')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a144945d-958c-49e1-91ef-3e4dcb9ec9c4', $q$Developer Platform$q$, 342, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a144945d-958c-49e1-91ef-3e4dcb9ec9c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5fb048d-9163-434f-9b6d-6cb0aaa0f717', $q$Developer Platform$q$, 343, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5fb048d-9163-434f-9b6d-6cb0aaa0f717')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd45eec54-b7d9-448a-b6af-4a0f7da0b6b2', $q$Analytics$q$, 344, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd45eec54-b7d9-448a-b6af-4a0f7da0b6b2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5916cb63-ce01-4903-b3c2-e6e6e1decb35', $q$Developer Platform$q$, 345, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5916cb63-ce01-4903-b3c2-e6e6e1decb35')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '64da1de2-d7c1-4509-9dab-a49efb0d5680', $q$Developer Platform$q$, 346, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64da1de2-d7c1-4509-9dab-a49efb0d5680')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2df6e9c0-a7cf-41c8-b070-48f7d596543f', $q$Testing & QA$q$, 347, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2df6e9c0-a7cf-41c8-b070-48f7d596543f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eb56d917-0780-4247-b58b-9a2442ec62e8', $q$Developer Platform$q$, 348, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb56d917-0780-4247-b58b-9a2442ec62e8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c457be31-ef87-43d3-b435-4ed953d6af55', $q$Testing & QA$q$, 349, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c457be31-ef87-43d3-b435-4ed953d6af55')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '568547ff-59ab-4b3b-ae92-b49ca5b36ead', $q$Developer Platform$q$, 350, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '568547ff-59ab-4b3b-ae92-b49ca5b36ead')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '53a92cf2-b633-4b01-8ba1-b758e49deaff', $q$Developer Platform$q$, 351, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53a92cf2-b633-4b01-8ba1-b758e49deaff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ee2ba62-d76a-42c9-ad46-c197ae0f9deb', $q$Developer Platform$q$, 352, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ee2ba62-d76a-42c9-ad46-c197ae0f9deb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bb3fa9c2-85cf-40fe-915a-88448c893e60', $q$Testing & QA$q$, 353, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb3fa9c2-85cf-40fe-915a-88448c893e60')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7dbd0f3c-596e-4e86-a42f-bfd823d5b139', $q$Developer Platform$q$, 354, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7dbd0f3c-596e-4e86-a42f-bfd823d5b139')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed646919-3729-41de-8039-78b18451affb', $q$Developer Platform$q$, 355, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed646919-3729-41de-8039-78b18451affb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c602b31-3f54-464f-aea3-7b2143386e53', $q$Developer Platform$q$, 356, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c602b31-3f54-464f-aea3-7b2143386e53')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6dc07e0d-c11e-493c-a649-122c63e3798c', $q$Developer Platform$q$, 357, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6dc07e0d-c11e-493c-a649-122c63e3798c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a0f4514-dc8e-4173-a3f0-2148c9bf5106', $q$Developer Platform$q$, 358, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a0f4514-dc8e-4173-a3f0-2148c9bf5106')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '657a21c6-b6ec-42fe-93db-a7f365fe4a7e', $q$Developer Platform$q$, 359, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '657a21c6-b6ec-42fe-93db-a7f365fe4a7e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4d747c16-4721-4657-99a8-0dc41180c9a3', $q$Developer Platform$q$, 360, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d747c16-4721-4657-99a8-0dc41180c9a3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fd655f72-ed29-4ca9-9edf-a675f2df3adc', $q$Developer Platform$q$, 361, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd655f72-ed29-4ca9-9edf-a675f2df3adc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f30b8958-caeb-4e4e-a179-13f1f4909856', $q$Developer Platform$q$, 362, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f30b8958-caeb-4e4e-a179-13f1f4909856')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd83506a4-1ccc-402c-8638-dab44d9ceb4d', $q$Developer Platform$q$, 363, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd83506a4-1ccc-402c-8638-dab44d9ceb4d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '525ea99b-ef17-48ee-8ad4-9105820b467e', $q$Developer Platform$q$, 364, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '525ea99b-ef17-48ee-8ad4-9105820b467e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd105a102-fc6c-4e6b-b019-dde7162d2ea7', $q$Developer Platform$q$, 365, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd105a102-fc6c-4e6b-b019-dde7162d2ea7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'daf5292b-6ddf-4ae6-8b4f-6c389e0c9ea1', $q$Developer Platform$q$, 366, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'daf5292b-6ddf-4ae6-8b4f-6c389e0c9ea1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4a77fb19-5b49-4c17-a20c-6013b66fe0a8', $q$Developer Platform$q$, 367, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a77fb19-5b49-4c17-a20c-6013b66fe0a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9cef2a32-16d3-4cd1-872e-bbb90a9252d3', $q$Developer Platform$q$, 368, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9cef2a32-16d3-4cd1-872e-bbb90a9252d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8d4e9ad4-01ed-4801-b978-a245ef2960cf', $q$Developer Platform$q$, 369, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d4e9ad4-01ed-4801-b978-a245ef2960cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a4f10253-9413-4df5-a5d7-092ebb486319', $q$Developer Platform$q$, 370, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4f10253-9413-4df5-a5d7-092ebb486319')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7b21f07-d36b-4daa-883f-01c5e88181c2', $q$Developer Platform$q$, 371, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7b21f07-d36b-4daa-883f-01c5e88181c2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a1ebb23-6bf9-4afd-86cf-c407afe1c1ef', $q$Developer Platform$q$, 372, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a1ebb23-6bf9-4afd-86cf-c407afe1c1ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd2501044-0af6-4598-b440-dc01bd18018b', $q$Testing & QA$q$, 373, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2501044-0af6-4598-b440-dc01bd18018b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '218fc64f-21b9-48f0-98b2-9884440f8b27', $q$Analytics$q$, 374, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '218fc64f-21b9-48f0-98b2-9884440f8b27')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eb96d805-d6f8-47d2-a49e-b95e1020601a', $q$Developer Platform$q$, 375, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb96d805-d6f8-47d2-a49e-b95e1020601a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95a972b4-6ef8-4cb6-aab0-4b90cae8a006', $q$Developer Platform$q$, 376, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95a972b4-6ef8-4cb6-aab0-4b90cae8a006')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13ae85ad-d43a-4512-8758-4938edcda85b', $q$Developer Platform$q$, 377, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13ae85ad-d43a-4512-8758-4938edcda85b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c9e369c9-8969-4676-96dd-6dcf36073247', $q$Developer Platform$q$, 378, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9e369c9-8969-4676-96dd-6dcf36073247')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0858c0fe-cad7-4f72-a0c3-231ffb5b5169', $q$Developer Platform$q$, 379, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0858c0fe-cad7-4f72-a0c3-231ffb5b5169')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fbe64c69-2519-4d4d-a8ac-db1fed67dbd4', $q$Developer Platform$q$, 380, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbe64c69-2519-4d4d-a8ac-db1fed67dbd4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b6eec7f4-416b-488a-8e21-08d33b576b04', $q$Developer Platform$q$, 381, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6eec7f4-416b-488a-8e21-08d33b576b04')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '132c1320-c9c3-4fd0-b346-df9bf518abe8', $q$Developer Platform$q$, 382, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '132c1320-c9c3-4fd0-b346-df9bf518abe8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '91aa183d-cbad-4603-9d32-b7c725dd445d', $q$Analytics$q$, 383, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '91aa183d-cbad-4603-9d32-b7c725dd445d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de48aadb-0846-4b49-a702-038b453551e2', $q$Testing & QA$q$, 384, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de48aadb-0846-4b49-a702-038b453551e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2e1f9828-804c-49f5-8c8d-5c9e6f92b1c4', $q$Developer Platform$q$, 385, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2e1f9828-804c-49f5-8c8d-5c9e6f92b1c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0cac4e36-1e3d-46d5-b6d5-5f4a6ae19ac9', $q$Developer Platform$q$, 386, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0cac4e36-1e3d-46d5-b6d5-5f4a6ae19ac9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cbffc64d-061f-4327-afe2-5751890ec08b', $q$Developer Platform$q$, 387, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cbffc64d-061f-4327-afe2-5751890ec08b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6e2c2798-2f0d-49c6-95d5-d9bc4fa18762', $q$Analytics$q$, 388, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e2c2798-2f0d-49c6-95d5-d9bc4fa18762')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8df81e1-b454-46d6-a810-ce6d56bfc7c0', $q$Analytics$q$, 389, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8df81e1-b454-46d6-a810-ce6d56bfc7c0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '32becab4-413c-4199-910d-3d48e998a7c6', $q$Developer Platform$q$, 390, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32becab4-413c-4199-910d-3d48e998a7c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ad3873ed-1f48-4664-806c-4262011f9e17', $q$Developer Platform$q$, 391, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad3873ed-1f48-4664-806c-4262011f9e17')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '37ee81f5-99b8-47c4-90cb-7ba1d4c7034d', $q$Analytics$q$, 392, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37ee81f5-99b8-47c4-90cb-7ba1d4c7034d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9ae86df0-ccc6-4db7-a3a5-250094d37112', $q$Developer Platform$q$, 393, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ae86df0-ccc6-4db7-a3a5-250094d37112')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11723921-04a3-4319-bf2c-42136fdd6126', $q$Developer Platform$q$, 394, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11723921-04a3-4319-bf2c-42136fdd6126')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c77281b3-51b7-49bc-bc87-1122bfa07008', $q$Developer Platform$q$, 395, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c77281b3-51b7-49bc-bc87-1122bfa07008')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a6e8ff55-dc46-48b8-8925-cf607ade8a51', $q$Developer Platform$q$, 396, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6e8ff55-dc46-48b8-8925-cf607ade8a51')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9195a714-41ac-461a-ae6b-25c3b07348ec', $q$Analytics$q$, 397, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9195a714-41ac-461a-ae6b-25c3b07348ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '64061a5f-8c24-4cd5-b9a9-4584d34cdce7', $q$Analytics$q$, 398, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64061a5f-8c24-4cd5-b9a9-4584d34cdce7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b9ce2772-887c-400a-b1ba-2a658d807825', $q$Developer Platform$q$, 399, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9ce2772-887c-400a-b1ba-2a658d807825')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bfe0dbd8-1025-4a56-bb48-467bdc41f2c0', $q$Developer Platform$q$, 400, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfe0dbd8-1025-4a56-bb48-467bdc41f2c0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cf744450-32b7-45e7-8891-03a0adca9476', $q$Developer Platform$q$, 401, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf744450-32b7-45e7-8891-03a0adca9476')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '80a0d096-7630-4dc6-b1bb-d774b748e7c9', $q$Developer Platform$q$, 402, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80a0d096-7630-4dc6-b1bb-d774b748e7c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5828746b-46dd-42d9-a386-b259b6fcba7b', $q$Developer Platform$q$, 403, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5828746b-46dd-42d9-a386-b259b6fcba7b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5ec50bd9-95ae-4433-8d9a-f9f8630ed1a7', $q$Developer Platform$q$, 404, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ec50bd9-95ae-4433-8d9a-f9f8630ed1a7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e248dec1-ed15-4f67-9509-633b474d1c4f', $q$Analytics$q$, 405, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e248dec1-ed15-4f67-9509-633b474d1c4f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e85d1e8c-862c-434a-af90-6aa32838109e', $q$Developer Platform$q$, 406, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e85d1e8c-862c-434a-af90-6aa32838109e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '676509af-beb4-48b6-9abe-b457a7889dcc', $q$Developer Platform$q$, 407, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '676509af-beb4-48b6-9abe-b457a7889dcc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '019191ba-026d-4e54-8492-dc52034a6db9', $q$Developer Platform$q$, 408, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '019191ba-026d-4e54-8492-dc52034a6db9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '85a52d59-e1d8-4048-a8a6-6d19944ea9f5', $q$Developer Platform$q$, 409, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85a52d59-e1d8-4048-a8a6-6d19944ea9f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e20ab785-b993-4db4-8a06-900b6a25a70f', $q$Developer Platform$q$, 410, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e20ab785-b993-4db4-8a06-900b6a25a70f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f3b1d096-0814-47f7-ba6a-0f36140d498e', $q$Developer Platform$q$, 411, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f3b1d096-0814-47f7-ba6a-0f36140d498e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '01d230ae-2a86-4f59-80d1-059f0eb95672', $q$Analytics$q$, 412, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01d230ae-2a86-4f59-80d1-059f0eb95672')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ead195fc-8695-4a01-ba30-5d721894f024', $q$Developer Platform$q$, 413, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ead195fc-8695-4a01-ba30-5d721894f024')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1fc3feb9-ca36-4ded-a948-5d6d4664247d', $q$Developer Platform$q$, 414, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1fc3feb9-ca36-4ded-a948-5d6d4664247d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '26b4d5a7-8a6a-4c3e-a83f-14ec7778255f', $q$Developer Platform$q$, 415, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26b4d5a7-8a6a-4c3e-a83f-14ec7778255f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '181b96ea-2254-4755-a203-f253cbe106f6', $q$Testing & QA$q$, 416, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '181b96ea-2254-4755-a203-f253cbe106f6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '92914b91-31c5-4192-828b-7cdffa72bfbe', $q$Developer Platform$q$, 417, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '92914b91-31c5-4192-828b-7cdffa72bfbe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fb27631e-e1af-4777-97ec-6e09928fc2db', $q$Developer Platform$q$, 418, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb27631e-e1af-4777-97ec-6e09928fc2db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eb51290e-5dae-49b4-a3d5-f4c73b4d6dd3', $q$Developer Platform$q$, 419, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb51290e-5dae-49b4-a3d5-f4c73b4d6dd3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '036161bc-b784-4383-a98b-a5b7d5bcb6a7', $q$Analytics$q$, 420, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '036161bc-b784-4383-a98b-a5b7d5bcb6a7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a8e9c6c3-2ef1-4666-8c58-17ddc22e756b', $q$Developer Platform$q$, 421, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8e9c6c3-2ef1-4666-8c58-17ddc22e756b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bca47845-ab54-4a9c-9e46-b7174f915bb5', $q$Developer Platform$q$, 422, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bca47845-ab54-4a9c-9e46-b7174f915bb5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8f3b3a9-3cbb-4b55-b910-b4f70844b522', $q$Analytics$q$, 423, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8f3b3a9-3cbb-4b55-b910-b4f70844b522')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '906340df-a792-4c8a-a94f-b826b5eafc75', $q$Developer Platform$q$, 424, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '906340df-a792-4c8a-a94f-b826b5eafc75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '21419e4a-d9ac-4943-bfbf-d9637e571e3a', $q$Developer Platform$q$, 425, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21419e4a-d9ac-4943-bfbf-d9637e571e3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2515767c-ee29-4773-b058-d7dfdc0e8692', $q$Developer Platform$q$, 426, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2515767c-ee29-4773-b058-d7dfdc0e8692')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '109137a6-d73f-421d-890e-83f4080f3d67', $q$Developer Platform$q$, 427, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '109137a6-d73f-421d-890e-83f4080f3d67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6db0b943-799c-4439-a53b-0fbec9d1a6fb', $q$Analytics$q$, 428, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6db0b943-799c-4439-a53b-0fbec9d1a6fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3d1842ea-1d57-4789-a426-2bcea2956086', $q$Developer Platform$q$, 429, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d1842ea-1d57-4789-a426-2bcea2956086')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '43fac0c6-b389-4278-93de-945194b6d68d', $q$Developer Platform$q$, 430, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43fac0c6-b389-4278-93de-945194b6d68d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b7a5f619-af18-4147-bd7b-89073f4344ac', $q$Analytics$q$, 431, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7a5f619-af18-4147-bd7b-89073f4344ac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a6a3d64-3311-45ac-b994-c91028e3f624', $q$Developer Platform$q$, 432, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a6a3d64-3311-45ac-b994-c91028e3f624')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '170f07c2-95bf-46cc-b22d-d020b3c3f4e6', $q$Developer Platform$q$, 433, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '170f07c2-95bf-46cc-b22d-d020b3c3f4e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d55362b-f77e-4770-9ebd-5262f7fd1bbd', $q$Developer Platform$q$, 434, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d55362b-f77e-4770-9ebd-5262f7fd1bbd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fc29e9aa-79b8-4f2a-b6b0-4ad8e835c56d', $q$Developer Platform$q$, 435, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc29e9aa-79b8-4f2a-b6b0-4ad8e835c56d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd2778b54-b657-4fb4-afbe-7897c55ec79a', $q$Developer Platform$q$, 436, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2778b54-b657-4fb4-afbe-7897c55ec79a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '495ad0e8-41af-44b8-a959-f25a3e5ade8a', $q$Developer Platform$q$, 437, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '495ad0e8-41af-44b8-a959-f25a3e5ade8a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8f993c88-da0b-4b0c-9e73-a4e0a8fc27c0', $q$Developer Platform$q$, 438, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f993c88-da0b-4b0c-9e73-a4e0a8fc27c0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '97e29495-70f0-47b8-880a-00cd37d76e7e', $q$Developer Platform$q$, 439, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '97e29495-70f0-47b8-880a-00cd37d76e7e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '09dc6cc9-cc2b-4a3f-8251-c7ead61223b8', $q$Developer Platform$q$, 440, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '09dc6cc9-cc2b-4a3f-8251-c7ead61223b8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13e8b8b6-b8a4-4e10-83b1-091eb345c83d', $q$Developer Platform$q$, 441, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13e8b8b6-b8a4-4e10-83b1-091eb345c83d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a99b012-e61d-4112-b6fe-3e91837379e4', $q$Analytics$q$, 442, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a99b012-e61d-4112-b6fe-3e91837379e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '93e64cc7-4486-466d-9e19-12571f952f80', $q$Developer Platform$q$, 443, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '93e64cc7-4486-466d-9e19-12571f952f80')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dfd1b3b9-3f3a-449a-96cd-8b268dc20ff7', $q$Analytics$q$, 444, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dfd1b3b9-3f3a-449a-96cd-8b268dc20ff7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0df4806-e2ae-4a1e-9f15-9690e5c49c90', $q$Developer Platform$q$, 445, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0df4806-e2ae-4a1e-9f15-9690e5c49c90')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9068b1b2-ffa5-4dab-a335-18c5ba603b84', $q$Analytics$q$, 446, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9068b1b2-ffa5-4dab-a335-18c5ba603b84')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48f72749-0789-444f-8c3a-cb2c9ef9948d', $q$Developer Platform$q$, 447, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48f72749-0789-444f-8c3a-cb2c9ef9948d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a152094-6011-4d9f-98ad-4789bbc373e4', $q$Developer Platform$q$, 448, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a152094-6011-4d9f-98ad-4789bbc373e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd76ea8ce-e4b5-44ab-af8f-e28f6a424ecf', $q$Developer Platform$q$, 449, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd76ea8ce-e4b5-44ab-af8f-e28f6a424ecf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7b25a355-1634-420d-9c8f-22ffa5b51e99', $q$Developer Platform$q$, 450, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b25a355-1634-420d-9c8f-22ffa5b51e99')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7759b53c-4c9a-44a4-bfc4-30367adc7652', $q$Developer Platform$q$, 451, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7759b53c-4c9a-44a4-bfc4-30367adc7652')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f5d63905-753a-44cf-9f63-d2d9237f4458', $q$Developer Platform$q$, 452, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5d63905-753a-44cf-9f63-d2d9237f4458')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cc12996b-7c7f-460d-9b3d-e57824f439db', $q$Developer Platform$q$, 453, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc12996b-7c7f-460d-9b3d-e57824f439db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '23b8b809-0b66-40a2-96d8-fd6025ca0918', $q$Developer Platform$q$, 454, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23b8b809-0b66-40a2-96d8-fd6025ca0918')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '36743b0b-c813-412a-a5b8-300e9008f8be', $q$Analytics$q$, 455, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36743b0b-c813-412a-a5b8-300e9008f8be')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '65365c90-e90c-40ef-8335-9c314efcc81a', $q$Developer Platform$q$, 456, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65365c90-e90c-40ef-8335-9c314efcc81a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '12643058-7883-4167-ad94-1a205d430fb0', $q$Developer Platform$q$, 457, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '12643058-7883-4167-ad94-1a205d430fb0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a8ec909-0330-4a11-9331-cc8f51c9356d', $q$Analytics$q$, 458, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a8ec909-0330-4a11-9331-cc8f51c9356d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7d449e4f-11e8-4aed-906d-1db93e6279d4', $q$Developer Platform$q$, 459, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d449e4f-11e8-4aed-906d-1db93e6279d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '01de5ae7-f006-47a2-a19e-101ab26172e3', $q$Developer Platform$q$, 460, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01de5ae7-f006-47a2-a19e-101ab26172e3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d0b6d9d-9d92-40c9-b660-b5fc060d55ae', $q$Analytics$q$, 462, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d0b6d9d-9d92-40c9-b660-b5fc060d55ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '02e76c4c-f8e5-4e4a-910f-a6931e9f7f52', $q$Developer Platform$q$, 463, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02e76c4c-f8e5-4e4a-910f-a6931e9f7f52')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '16fe8e88-f867-4c0f-a193-43d61775248c', $q$Developer Platform$q$, 464, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16fe8e88-f867-4c0f-a193-43d61775248c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd51b103f-c910-401c-843f-9ae945fbeffe', $q$Developer Platform$q$, 465, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd51b103f-c910-401c-843f-9ae945fbeffe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7e880184-e045-43cc-8ffd-46d78db8a165', $q$Developer Platform$q$, 466, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e880184-e045-43cc-8ffd-46d78db8a165')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be637e69-9a3f-47cb-847b-bb9187fc3a23', $q$Developer Platform$q$, 467, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be637e69-9a3f-47cb-847b-bb9187fc3a23')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8abbf5a0-6e7d-4a53-b94b-75d2b0dda37a', $q$Developer Platform$q$, 468, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8abbf5a0-6e7d-4a53-b94b-75d2b0dda37a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4b1f3ab7-fa41-4979-a5de-528c73740661', $q$Developer Platform$q$, 469, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b1f3ab7-fa41-4979-a5de-528c73740661')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13424dbf-3828-4a0f-a93c-8a05c97ac792', $q$Analytics$q$, 470, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13424dbf-3828-4a0f-a93c-8a05c97ac792')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '731ccad9-3cae-4c70-8893-3245a46be96a', $q$Developer Platform$q$, 471, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '731ccad9-3cae-4c70-8893-3245a46be96a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '47872217-890e-429c-9c5f-8afc9725fccc', $q$Developer Platform$q$, 472, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47872217-890e-429c-9c5f-8afc9725fccc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'daeb7cad-c938-40ea-b529-ad1cb7be5ece', $q$Developer Platform$q$, 473, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'daeb7cad-c938-40ea-b529-ad1cb7be5ece')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7bd554b-4c6f-49bc-8dd2-d05a191150d6', $q$Developer Platform$q$, 474, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7bd554b-4c6f-49bc-8dd2-d05a191150d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '31e079ba-79ee-4573-b9ba-9153199de71b', $q$Developer Platform$q$, 475, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31e079ba-79ee-4573-b9ba-9153199de71b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e84c541c-4ae7-412f-ac31-d7e8ce39dbd4', $q$Analytics$q$, 476, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e84c541c-4ae7-412f-ac31-d7e8ce39dbd4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '74bf94cd-f96e-4ad7-b344-53376a9bf5a1', $q$Developer Platform$q$, 477, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74bf94cd-f96e-4ad7-b344-53376a9bf5a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '46b3c74c-ed96-4afb-b9f4-1c8dbcdab67a', $q$Developer Platform$q$, 478, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '46b3c74c-ed96-4afb-b9f4-1c8dbcdab67a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28ae002a-491c-4053-88eb-6da54ea6d9ec', $q$Developer Platform$q$, 479, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28ae002a-491c-4053-88eb-6da54ea6d9ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea79af72-f19d-40b5-9379-97a91e11128b', $q$Developer Platform$q$, 480, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea79af72-f19d-40b5-9379-97a91e11128b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13dd573f-5883-41a2-a369-6ff8b9c9c227', $q$Developer Platform$q$, 481, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13dd573f-5883-41a2-a369-6ff8b9c9c227')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4359bc3c-fb99-4ce0-b280-b5583b3fc97d', $q$Developer Platform$q$, 482, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4359bc3c-fb99-4ce0-b280-b5583b3fc97d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '619ffceb-1cb7-4c55-a003-3fc72a7c3096', $q$Developer Platform$q$, 483, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '619ffceb-1cb7-4c55-a003-3fc72a7c3096')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eae1dc90-cef0-417c-bad5-6077b5abd867', $q$Developer Platform$q$, 484, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eae1dc90-cef0-417c-bad5-6077b5abd867')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '60ecdbb3-026f-46c8-8fbb-a3d64cc69e45', $q$Developer Platform$q$, 485, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60ecdbb3-026f-46c8-8fbb-a3d64cc69e45')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fb427278-a35a-468d-8ab3-46f9fcc883c7', $q$Developer Platform$q$, 486, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb427278-a35a-468d-8ab3-46f9fcc883c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0d621bcc-8c34-404f-bc60-4b88cee00545', $q$Developer Platform$q$, 487, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d621bcc-8c34-404f-bc60-4b88cee00545')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '617316e9-ef7d-400a-a332-4d7f996fdf71', $q$Developer Platform$q$, 488, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '617316e9-ef7d-400a-a332-4d7f996fdf71')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '34252a29-96a8-41b9-8ce1-61184214fba9', $q$Developer Platform$q$, 489, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34252a29-96a8-41b9-8ce1-61184214fba9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c4bb62cc-1f77-4dd1-8444-f5a81fcbb61c', $q$Developer Platform$q$, 490, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4bb62cc-1f77-4dd1-8444-f5a81fcbb61c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dcf7fa96-758a-45de-adab-575adc66fc68', $q$Analytics$q$, 491, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dcf7fa96-758a-45de-adab-575adc66fc68')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0648d840-cb83-4fbb-87f5-182dd65119e7', $q$Analytics$q$, 492, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0648d840-cb83-4fbb-87f5-182dd65119e7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f94c2e1a-2eca-4820-be0f-59c97ae41fc8', $q$Developer Platform$q$, 493, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f94c2e1a-2eca-4820-be0f-59c97ae41fc8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d481b67-9b46-46d5-8c38-b53e157d6970', $q$Developer Platform$q$, 494, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d481b67-9b46-46d5-8c38-b53e157d6970')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eae5001f-c0c4-47f9-9501-820db04c142d', $q$Developer Platform$q$, 495, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eae5001f-c0c4-47f9-9501-820db04c142d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a932e98c-7ec9-47b4-8298-6f90b629e062', $q$HR Software$q$, 496, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a932e98c-7ec9-47b4-8298-6f90b629e062')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '31c5f2a3-74be-40d5-bb8e-e8a6c432a3f9', $q$Project Management$q$, 499, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch12$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31c5f2a3-74be-40d5-bb8e-e8a6c432a3f9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d9e0aeb4-501a-4642-a40a-1a439d823b46', $q$Project Management$q$, 36, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('727ce456-3ada-4396-a467-30164d11f40e', $q$Project Management$q$, 38, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ba98f35c-82a6-4687-8668-be82a6c21e8d', $q$HR Software$q$, 66, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8b1dea31-abbd-42cc-a4cd-5b6154e0b8f7', $q$Project Management$q$, 67, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('332223c1-f22b-409b-9580-2d82c4edda08', $q$Project Management$q$, 75, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('63f1ca5a-4d50-4646-ab82-bd9bd346c967', $q$Project Management$q$, 83, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b5ae9c91-1ca9-4659-9b00-8decefc6bfbb', $q$Project Management$q$, 91, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('fbffcaa4-b264-4a87-bd4b-d1c6cc1e9c14', $q$HR Software$q$, 107, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('924c5694-cfb7-4b06-9d9d-b00e1afadb31', $q$HR Software$q$, 121, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e762d0b5-3f6a-4165-89d8-5d2a4889217d', $q$Project Management$q$, 136, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('85b65232-2caf-4969-998f-22b6d54fd447', $q$Project Management$q$, 148, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Project Management$q$, 205, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('6f5cfb69-7744-41fa-9d0f-ef4e3662eb1d', $q$Project Management$q$, 210, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('031d68c5-af3a-4399-8fac-121f0a02a529', $q$HR Software$q$, 233, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8b71f7fc-c26a-419f-a1fe-0de98471da7f', $q$HR Software$q$, 255, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2e3ae148-915e-4e17-8568-b7b871d77ebd', $q$Analytics$q$, 305, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3122bcbc-f848-4a5b-bdd0-2fdc1ab47f3e', $q$Developer Platform$q$, 307, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3420577a-4640-4828-a64b-5afe612e65be', $q$Analytics$q$, 461, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('bd2fce1d-50cd-44a2-927e-39cfe30406dd', $q$Project Management$q$, 497, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b89d9029-ae3f-4881-beeb-41c427d2ace5', $q$Project Management$q$, 498, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('38ae237b-78e7-4604-8a45-6bc26a5f678f', $q$Project Management$q$, 500, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch12$q$)
ON CONFLICT (tool_id) DO NOTHING;

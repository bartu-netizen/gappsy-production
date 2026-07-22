-- Bulk import gappsy-500-2026-07-18-batch10: 262 new commercial-SaaS tools,
-- landed as status='needs_review', noindex=true, sitemap_eligible=false.
-- Invisible to the public site until a separate editorial-enrichment pass
-- reviews and publishes each one (same pattern as prior bulk-import batches).

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8dd2ba58-481a-4ed0-846c-96234a88944e', $q$6sense$q$, $q$6sense$q$, $q$https://6sense.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8dd2ba58-481a-4ed0-846c-96234a88944e', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8dd2ba58-481a-4ed0-846c-96234a88944e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6a44f136-f19c-4182-b5b0-576361abb642', $q$adcreative-ai$q$, $q$AdCreative.ai$q$, $q$https://www.adcreative.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6a44f136-f19c-4182-b5b0-576361abb642', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a44f136-f19c-4182-b5b0-576361abb642')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('14315019-5fc0-4f79-b27c-b60ee1c1017e', $q$affinity$q$, $q$Affinity$q$, $q$https://www.affinity.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '14315019-5fc0-4f79-b27c-b60ee1c1017e', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '14315019-5fc0-4f79-b27c-b60ee1c1017e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('524ae882-aec6-47f8-a972-c700382a2639', $q$airbase$q$, $q$Airbase$q$, $q$https://www.airbase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '524ae882-aec6-47f8-a972-c700382a2639', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '524ae882-aec6-47f8-a972-c700382a2639')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d2d9200-cb3b-477c-8688-3bf69c524630', $q$aiseo$q$, $q$AISEO$q$, $q$https://aiseo.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d2d9200-cb3b-477c-8688-3bf69c524630', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d2d9200-cb3b-477c-8688-3bf69c524630')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6906a776-e829-4a03-b205-0bf214aeeca0', $q$appfolio-property-manager$q$, $q$AppFolio Property Manager$q$, $q$https://www.appfolio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6906a776-e829-4a03-b205-0bf214aeeca0', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6906a776-e829-4a03-b205-0bf214aeeca0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1635aea1-58d7-4783-be12-99aed0d3646f', $q$arcads$q$, $q$Arcads$q$, $q$https://www.arcads.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1635aea1-58d7-4783-be12-99aed0d3646f', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1635aea1-58d7-4783-be12-99aed0d3646f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('69678cd0-36bc-465c-ad49-76349776fb26', $q$avail$q$, $q$Avail$q$, $q$https://www.avail.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '69678cd0-36bc-465c-ad49-76349776fb26', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69678cd0-36bc-465c-ad49-76349776fb26')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d3de63cc-8964-42d0-a306-17d133456303', $q$bloomreach$q$, $q$Bloomreach$q$, $q$https://www.bloomreach.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd3de63cc-8964-42d0-a306-17d133456303', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3de63cc-8964-42d0-a306-17d133456303')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3d6c369-5ccc-4a69-87aa-439e03e26dda', $q$bold-commerce$q$, $q$Bold Commerce$q$, $q$https://boldcommerce.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3d6c369-5ccc-4a69-87aa-439e03e26dda', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3d6c369-5ccc-4a69-87aa-439e03e26dda')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53b2251d-a2da-49a6-a689-f00f2dbe1418', $q$buildium$q$, $q$Buildium$q$, $q$https://www.buildium.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53b2251d-a2da-49a6-a689-f00f2dbe1418', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53b2251d-a2da-49a6-a689-f00f2dbe1418')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('85b579b1-50a2-45ad-9e3b-d15e5d306869', $q$casetext$q$, $q$Casetext$q$, $q$https://casetext.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '85b579b1-50a2-45ad-9e3b-d15e5d306869', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85b579b1-50a2-45ad-9e3b-d15e5d306869')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a2641553-2df4-4aff-b662-314b0dddc12d', $q$catalyst$q$, $q$Catalyst$q$, $q$https://catalyst.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a2641553-2df4-4aff-b662-314b0dddc12d', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a2641553-2df4-4aff-b662-314b0dddc12d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d4223752-ad10-4cc5-a3d4-de58751958ab', $q$clearbit$q$, $q$Clearbit$q$, $q$https://clearbit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd4223752-ad10-4cc5-a3d4-de58751958ab', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4223752-ad10-4cc5-a3d4-de58751958ab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9c7ba411-899c-4dfb-9d1f-691a7d81b93d', $q$closerscopy$q$, $q$ClosersCopy$q$, $q$https://www.closerscopy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9c7ba411-899c-4dfb-9d1f-691a7d81b93d', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9c7ba411-899c-4dfb-9d1f-691a7d81b93d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f5e768d1-6625-4f4e-bbf1-87bc0cb982ae', $q$cloudbeds$q$, $q$Cloudbeds$q$, $q$https://www.cloudbeds.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f5e768d1-6625-4f4e-bbf1-87bc0cb982ae', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5e768d1-6625-4f4e-bbf1-87bc0cb982ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23d28c3b-3aa3-40e9-b0fb-cf38992ebbdb', $q$contentbot$q$, $q$ContentBot$q$, $q$https://contentbot.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23d28c3b-3aa3-40e9-b0fb-cf38992ebbdb', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23d28c3b-3aa3-40e9-b0fb-cf38992ebbdb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82e40996-2042-4195-bace-52a95dd90735', $q$contentshake-ai$q$, $q$ContentShake AI$q$, $q$https://www.semrush.com/contentshake$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82e40996-2042-4195-bace-52a95dd90735', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82e40996-2042-4195-bace-52a95dd90735')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6f6b7427-2a25-47de-809a-0cbf1f53a717', $q$copyleaks$q$, $q$Copyleaks$q$, $q$https://copyleaks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6f6b7427-2a25-47de-809a-0cbf1f53a717', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f6b7427-2a25-47de-809a-0cbf1f53a717')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d6a4690-35a5-4b47-a9ca-4b2b9ea1548a', $q$creatify$q$, $q$Creatify$q$, $q$https://creatify.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d6a4690-35a5-4b47-a9ca-4b2b9ea1548a', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d6a4690-35a5-4b47-a9ca-4b2b9ea1548a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4eef98d3-69ee-49d3-93c3-a7bc9c063dc3', $q$describely$q$, $q$Describely$q$, $q$https://describely.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4eef98d3-69ee-49d3-93c3-a7bc9c063dc3', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4eef98d3-69ee-49d3-93c3-a7bc9c063dc3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f0530d9-d1bc-42cd-8f00-ce342cdd88d1', $q$divvy$q$, $q$Divvy$q$, $q$https://www.bill.com/product/spend-and-expense$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f0530d9-d1bc-42cd-8f00-ce342cdd88d1', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f0530d9-d1bc-42cd-8f00-ce342cdd88d1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5b15ed7-255d-4f91-8e6c-6c67f71428d7', $q$doorloop$q$, $q$DoorLoop$q$, $q$https://www.doorloop.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5b15ed7-255d-4f91-8e6c-6c67f71428d7', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5b15ed7-255d-4f91-8e6c-6c67f71428d7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c4ea9a4-4992-4f02-b8d7-e3da4139e169', $q$draftbit$q$, $q$Draftbit$q$, $q$https://draftbit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c4ea9a4-4992-4f02-b8d7-e3da4139e169', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c4ea9a4-4992-4f02-b8d7-e3da4139e169')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9964e565-857e-4ee7-925b-752ec0fea495', $q$evenup$q$, $q$EvenUp$q$, $q$https://www.evenuplaw.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9964e565-857e-4ee7-925b-752ec0fea495', 'cbb8f474-10a1-499b-a7ac-241ca988e960', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9964e565-857e-4ee7-925b-752ec0fea495')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05aef092-d67f-4398-8b00-14ff018e0bee', $q$everafter$q$, $q$EverAfter$q$, $q$https://www.everafter.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05aef092-d67f-4398-8b00-14ff018e0bee', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05aef092-d67f-4398-8b00-14ff018e0bee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f5d272e9-1fcb-4d5c-86bd-95f432c29528', $q$fieldedge$q$, $q$FieldEdge$q$, $q$https://fieldedge.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f5d272e9-1fcb-4d5c-86bd-95f432c29528', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5d272e9-1fcb-4d5c-86bd-95f432c29528')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e79d8de7-523b-4c87-ac5c-cc3ea76ff728', $q$flutterflow$q$, $q$FlutterFlow$q$, $q$https://flutterflow.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e79d8de7-523b-4c87-ac5c-cc3ea76ff728', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e79d8de7-523b-4c87-ac5c-cc3ea76ff728')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8116156-99b7-47fd-989f-45ac2d3d4e2e', $q$fyle$q$, $q$Fyle$q$, $q$https://www.fylehq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8116156-99b7-47fd-989f-45ac2d3d4e2e', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8116156-99b7-47fd-989f-45ac2d3d4e2e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('30aed65f-4b56-4660-901e-c19bc730f726', $q$gempages$q$, $q$GemPages$q$, $q$https://gempages.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '30aed65f-4b56-4660-901e-c19bc730f726', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '30aed65f-4b56-4660-901e-c19bc730f726')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('329b08bd-1cbd-465c-ae14-00059aae4d0f', $q$growave$q$, $q$Growave$q$, $q$https://www.growave.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '329b08bd-1cbd-465c-ae14-00059aae4d0f', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '329b08bd-1cbd-465c-ae14-00059aae4d0f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d22c97eb-5df8-42d9-9994-9dda98d843be', $q$guesty$q$, $q$Guesty$q$, $q$https://www.guesty.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd22c97eb-5df8-42d9-9994-9dda98d843be', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd22c97eb-5df8-42d9-9994-9dda98d843be')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23f4e892-59ef-4f2b-9320-8942be697042', $q$hemingway-editor$q$, $q$Hemingway Editor$q$, $q$https://hemingwayapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23f4e892-59ef-4f2b-9320-8942be697042', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23f4e892-59ef-4f2b-9320-8942be697042')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a6377a5b-eab8-4d69-b903-e5f206d8e84c', $q$hemlane$q$, $q$Hemlane$q$, $q$https://www.hemlane.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a6377a5b-eab8-4d69-b903-e5f206d8e84c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6377a5b-eab8-4d69-b903-e5f206d8e84c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc876223-7069-4e68-b3fa-80ae824b787a', $q$hostaway$q$, $q$Hostaway$q$, $q$https://www.hostaway.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc876223-7069-4e68-b3fa-80ae824b787a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc876223-7069-4e68-b3fa-80ae824b787a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a9691e7b-f28e-47d1-8793-656f035bed3c', $q$judge-me$q$, $q$Judge.me$q$, $q$https://judge.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a9691e7b-f28e-47d1-8793-656f035bed3c', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9691e7b-f28e-47d1-8793-656f035bed3c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65bb0999-6ba4-486b-a6d7-eef35772c57c', $q$kickserv$q$, $q$Kickserv$q$, $q$https://www.kickserv.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65bb0999-6ba4-486b-a6d7-eef35772c57c', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65bb0999-6ba4-486b-a6d7-eef35772c57c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e9700263-1aca-4a9c-99fc-37deba81964e', $q$lex$q$, $q$Lex$q$, $q$https://lex.page$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e9700263-1aca-4a9c-99fc-37deba81964e', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9700263-1aca-4a9c-99fc-37deba81964e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f5c253ed-d823-4895-ad9e-8fb4fce7de0c', $q$liquidplanner$q$, $q$LiquidPlanner$q$, $q$https://www.liquidplanner.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f5c253ed-d823-4895-ad9e-8fb4fce7de0c', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5c253ed-d823-4895-ad9e-8fb4fce7de0c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('052abf0b-5ae7-4b86-985a-849e9c131982', $q$little-hotelier$q$, $q$Little Hotelier$q$, $q$https://www.littlehotelier.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '052abf0b-5ae7-4b86-985a-849e9c131982', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '052abf0b-5ae7-4b86-985a-849e9c131982')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b5c0ae0e-ad89-4f51-9111-703ff9c60f0a', $q$lodgify$q$, $q$Lodgify$q$, $q$https://www.lodgify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b5c0ae0e-ad89-4f51-9111-703ff9c60f0a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5c0ae0e-ad89-4f51-9111-703ff9c60f0a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ce18086-6ea1-4099-af5b-933e8efb1259', $q$loox$q$, $q$Loox$q$, $q$https://loox.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ce18086-6ea1-4099-af5b-933e8efb1259', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ce18086-6ea1-4099-af5b-933e8efb1259')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b4df044-30c0-4597-bc4f-168a30350b9f', $q$madgicx$q$, $q$Madgicx$q$, $q$https://madgicx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b4df044-30c0-4597-bc4f-168a30350b9f', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b4df044-30c0-4597-bc4f-168a30350b9f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8e92145-63cb-4bbb-8266-20dd75b50684', $q$mews$q$, $q$Mews$q$, $q$https://www.mews.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8e92145-63cb-4bbb-8266-20dd75b50684', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8e92145-63cb-4bbb-8266-20dd75b50684')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d12a7932-99b2-42a9-ac0f-16f1ed4e64f2', $q$mixmax$q$, $q$Mixmax$q$, $q$https://www.mixmax.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd12a7932-99b2-42a9-ac0f-16f1ed4e64f2', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd12a7932-99b2-42a9-ac0f-16f1ed4e64f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28ccef2b-9eed-4c82-ae67-c15e4edf047f', $q$narrato$q$, $q$Narrato$q$, $q$https://narrato.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28ccef2b-9eed-4c82-ae67-c15e4edf047f', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28ccef2b-9eed-4c82-ae67-c15e4edf047f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('004d2c08-4d11-4a52-ae95-430a24e68297', $q$noodl$q$, $q$Noodl$q$, $q$https://www.noodl.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '004d2c08-4d11-4a52-ae95-430a24e68297', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '004d2c08-4d11-4a52-ae95-430a24e68297')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('36bef685-5dc7-4055-b82a-d23d633f376b', $q$okendo$q$, $q$Okendo$q$, $q$https://www.okendo.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '36bef685-5dc7-4055-b82a-d23d633f376b', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36bef685-5dc7-4055-b82a-d23d633f376b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('156b15da-7c8d-4636-a925-46921ae07bdd', $q$optmyzr$q$, $q$Optmyzr$q$, $q$https://www.optmyzr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '156b15da-7c8d-4636-a925-46921ae07bdd', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '156b15da-7c8d-4636-a925-46921ae07bdd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('96b5f07e-0bdd-4acd-9f55-7df88f3561de', $q$pagefly$q$, $q$PageFly$q$, $q$https://pagefly.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '96b5f07e-0bdd-4acd-9f55-7df88f3561de', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96b5f07e-0bdd-4acd-9f55-7df88f3561de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('749f6990-0988-4693-846a-af89c0cdd594', $q$paperpal$q$, $q$Paperpal$q$, $q$https://paperpal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '749f6990-0988-4693-846a-af89c0cdd594', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '749f6990-0988-4693-846a-af89c0cdd594')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b82a03aa-f1f0-413d-a7c2-5b374e0caa2e', $q$pencil$q$, $q$Pencil$q$, $q$https://www.trypencil.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b82a03aa-f1f0-413d-a7c2-5b374e0caa2e', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b82a03aa-f1f0-413d-a7c2-5b374e0caa2e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6f48fc56-db84-4d3c-9df8-c242833c50c3', $q$pictory$q$, $q$Pictory$q$, $q$https://pictory.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6f48fc56-db84-4d3c-9df8-c242833c50c3', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f48fc56-db84-4d3c-9df8-c242833c50c3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0c1c32d-3dc8-4228-b992-80fa58ced855', $q$propertyware$q$, $q$Propertyware$q$, $q$https://www.propertyware.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0c1c32d-3dc8-4228-b992-80fa58ced855', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0c1c32d-3dc8-4228-b992-80fa58ced855')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a3f771ca-7bae-4f1f-9205-de1e6a64da19', $q$ranktracker$q$, $q$Ranktracker$q$, $q$https://www.ranktracker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a3f771ca-7bae-4f1f-9205-de1e6a64da19', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a3f771ca-7bae-4f1f-9205-de1e6a64da19')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('090513e5-3588-4978-90e9-6bdfea17be26', $q$raven-tools$q$, $q$Raven Tools$q$, $q$https://raventools.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '090513e5-3588-4978-90e9-6bdfea17be26', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '090513e5-3588-4978-90e9-6bdfea17be26')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca296685-d2bd-4ebd-94fa-263bfafabb9c', $q$rent-manager$q$, $q$Rent Manager$q$, $q$https://www.rentmanager.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca296685-d2bd-4ebd-94fa-263bfafabb9c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca296685-d2bd-4ebd-94fa-263bfafabb9c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4811dd51-9e11-4450-b1ad-0a151e73df9c', $q$replo$q$, $q$Replo$q$, $q$https://www.replo.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4811dd51-9e11-4450-b1ad-0a151e73df9c', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4811dd51-9e11-4450-b1ad-0a151e73df9c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b22eec21-293c-42bd-b807-af31d7d25277', $q$revealbot$q$, $q$Revealbot$q$, $q$https://revealbot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b22eec21-293c-42bd-b807-af31d7d25277', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b22eec21-293c-42bd-b807-af31d7d25277')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4ee27d7f-5956-4845-ab04-d7f73b50fe7b', $q$revenue-grid$q$, $q$Revenue Grid$q$, $q$https://revenuegrid.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4ee27d7f-5956-4845-ab04-d7f73b50fe7b', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ee27d7f-5956-4845-ab04-d7f73b50fe7b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb4c1349-3ea5-4ade-8e27-c520e0587c82', $q$rms-cloud$q$, $q$RMS Cloud$q$, $q$https://www.rmscloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb4c1349-3ea5-4ade-8e27-c520e0587c82', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb4c1349-3ea5-4ade-8e27-c520e0587c82')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3bd77eae-40c2-4252-9cd7-38b915eef5c4', $q$rydoo$q$, $q$Rydoo$q$, $q$https://www.rydoo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3bd77eae-40c2-4252-9cd7-38b915eef5c4', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bd77eae-40c2-4252-9cd7-38b915eef5c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1faf72f1-07db-4edb-b0b8-1d81a93d18fa', $q$sap-concur$q$, $q$SAP Concur$q$, $q$https://www.concur.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1faf72f1-07db-4edb-b0b8-1d81a93d18fa', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1faf72f1-07db-4edb-b0b8-1d81a93d18fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7e36f95-84dd-4455-85d5-d47426a46c1c', $q$secureframe$q$, $q$Secureframe$q$, $q$https://secureframe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7e36f95-84dd-4455-85d5-d47426a46c1c', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7e36f95-84dd-4455-85d5-d47426a46c1c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('768fff41-d355-478b-be68-713045fc9a64', $q$sendlane$q$, $q$Sendlane$q$, $q$https://www.sendlane.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '768fff41-d355-478b-be68-713045fc9a64', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '768fff41-d355-478b-be68-713045fc9a64')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06d1ec9b-2606-4cb2-8f6e-9b1a7bbc7385', $q$service-fusion$q$, $q$Service Fusion$q$, $q$https://www.servicefusion.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06d1ec9b-2606-4cb2-8f6e-9b1a7bbc7385', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06d1ec9b-2606-4cb2-8f6e-9b1a7bbc7385')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5815ac81-15cc-4a99-9b4b-6ee6b455fc20', $q$servicem8$q$, $q$ServiceM8$q$, $q$https://www.servicem8.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5815ac81-15cc-4a99-9b4b-6ee6b455fc20', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5815ac81-15cc-4a99-9b4b-6ee6b455fc20')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87666664-2c53-46fa-a364-f66e5fc73699', $q$shogun$q$, $q$Shogun$q$, $q$https://getshogun.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87666664-2c53-46fa-a364-f66e5fc73699', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87666664-2c53-46fa-a364-f66e5fc73699')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a4f59d7b-22f3-4651-83c5-1ef2be39d561', $q$simpro$q$, $q$Simpro$q$, $q$https://www.simprogroup.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a4f59d7b-22f3-4651-83c5-1ef2be39d561', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4f59d7b-22f3-4651-83c5-1ef2be39d561')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7379ca7a-1799-48c2-ad91-f95ac8a5d44a', $q$sistrix$q$, $q$SISTRIX$q$, $q$https://www.sistrix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7379ca7a-1799-48c2-ad91-f95ac8a5d44a', 'dcf3351f-33ea-4990-890c-54f75749375f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7379ca7a-1799-48c2-ad91-f95ac8a5d44a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('52458d05-8717-48f5-86d1-82657bc6b73c', $q$siteminder$q$, $q$SiteMinder$q$, $q$https://www.siteminder.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '52458d05-8717-48f5-86d1-82657bc6b73c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52458d05-8717-48f5-86d1-82657bc6b73c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('986e2ed9-aa7c-4773-a8b4-eff9b3073acc', $q$stamped$q$, $q$Stamped$q$, $q$https://stamped.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '986e2ed9-aa7c-4773-a8b4-eff9b3073acc', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '986e2ed9-aa7c-4773-a8b4-eff9b3073acc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('157cf0db-5d35-4b66-be84-eb1e3a83c275', $q$tenantcloud$q$, $q$TenantCloud$q$, $q$https://www.tenantcloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '157cf0db-5d35-4b66-be84-eb1e3a83c275', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '157cf0db-5d35-4b66-be84-eb1e3a83c275')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4f0716ee-d34d-41a6-b93a-e4726482363c', $q$thunkable$q$, $q$Thunkable$q$, $q$https://thunkable.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4f0716ee-d34d-41a6-b93a-e4726482363c', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f0716ee-d34d-41a6-b93a-e4726482363c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3d6729f9-da2e-4701-b9b0-94d125d8724f', $q$trinka$q$, $q$Trinka$q$, $q$https://www.trinka.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3d6729f9-da2e-4701-b9b0-94d125d8724f', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d6729f9-da2e-4701-b9b0-94d125d8724f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ae2f926-10af-48fb-8b25-2c5c215ae206', $q$turbotenant$q$, $q$TurboTenant$q$, $q$https://www.turbotenant.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ae2f926-10af-48fb-8b25-2c5c215ae206', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ae2f926-10af-48fb-8b25-2c5c215ae206')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f0b2bf4b-3d1d-43a6-afe1-642d4e801c38', $q$undetectable-ai$q$, $q$Undetectable AI$q$, $q$https://undetectable.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f0b2bf4b-3d1d-43a6-afe1-642d4e801c38', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0b2bf4b-3d1d-43a6-afe1-642d4e801c38')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6443678c-663b-4bf6-b1c8-5645ddeae48b', $q$vidyo-ai$q$, $q$Vidyo.ai$q$, $q$https://vidyo.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6443678c-663b-4bf6-b1c8-5645ddeae48b', '416dd216-7249-453d-aab6-64bfff311070', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6443678c-663b-4bf6-b1c8-5645ddeae48b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cf344238-e3b9-426b-af71-7522632c5feb', $q$winston-ai$q$, $q$Winston AI$q$, $q$https://gowinston.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cf344238-e3b9-426b-af71-7522632c5feb', '6266a2b8-2173-40d6-9a07-e8a7906a8845', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf344238-e3b9-426b-af71-7522632c5feb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('25f60fc9-d59c-455d-8081-05e6a4cd7f6f', $q$wordstream$q$, $q$WordStream$q$, $q$https://www.wordstream.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '25f60fc9-d59c-455d-8081-05e6a4cd7f6f', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25f60fc9-d59c-455d-8081-05e6a4cd7f6f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('931bd167-e821-48d8-8380-64059b8835a2', $q$workiz$q$, $q$Workiz$q$, $q$https://www.workiz.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '931bd167-e821-48d8-8380-64059b8835a2', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '931bd167-e821-48d8-8380-64059b8835a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc546393-34d6-416a-80bf-2e874bcaf168', $q$workzone$q$, $q$Workzone$q$, $q$https://www.workzone.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc546393-34d6-416a-80bf-2e874bcaf168', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc546393-34d6-416a-80bf-2e874bcaf168')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('59baa082-ba8c-4a5d-8249-89b94dae0e82', $q$yesware$q$, $q$Yesware$q$, $q$https://www.yesware.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '59baa082-ba8c-4a5d-8249-89b94dae0e82', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59baa082-ba8c-4a5d-8249-89b94dae0e82')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0203800f-bffe-4139-8919-c5466800c971', $q$yotpo$q$, $q$Yotpo$q$, $q$https://www.yotpo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0203800f-bffe-4139-8919-c5466800c971', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0203800f-bffe-4139-8919-c5466800c971')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('327d1ac7-d2d5-4c9f-85cd-79a59dd1b3a9', $q$123formbuilder$q$, $q$123FormBuilder$q$, $q$https://www.123formbuilder.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '327d1ac7-d2d5-4c9f-85cd-79a59dd1b3a9', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '327d1ac7-d2d5-4c9f-85cd-79a59dd1b3a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54a8da3e-0766-4538-be06-7648eb552e9a', $q$360learning$q$, $q$360Learning$q$, $q$https://360learning.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54a8da3e-0766-4538-be06-7648eb552e9a', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54a8da3e-0766-4538-be06-7648eb552e9a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eaff9b0a-92d0-49bc-91fb-3894c0e5779b', $q$ab-tasty$q$, $q$AB Tasty$q$, $q$https://www.abtasty.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eaff9b0a-92d0-49bc-91fb-3894c0e5779b', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eaff9b0a-92d0-49bc-91fb-3894c0e5779b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae54ef19-4ee9-49ce-8b0c-384fc84052de', $q$absorb-lms$q$, $q$Absorb LMS$q$, $q$https://www.absorblms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae54ef19-4ee9-49ce-8b0c-384fc84052de', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae54ef19-4ee9-49ce-8b0c-384fc84052de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dfa0f576-375e-4664-990f-e7cd76855a08', $q$accelo$q$, $q$Accelo$q$, $q$https://www.accelo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dfa0f576-375e-4664-990f-e7cd76855a08', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dfa0f576-375e-4664-990f-e7cd76855a08')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('22872790-a987-4220-a685-a1406d4edc47', $q$acumatica$q$, $q$Acumatica$q$, $q$https://www.acumatica.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '22872790-a987-4220-a685-a1406d4edc47', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22872790-a987-4220-a685-a1406d4edc47')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0f94252-e1f1-4d15-abce-ea3adad314b7', $q$ada$q$, $q$Ada$q$, $q$https://www.ada.cx$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0f94252-e1f1-4d15-abce-ea3adad314b7', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0f94252-e1f1-4d15-abce-ea3adad314b7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fc3cb5d8-f800-4692-a2ad-71a9bdd7d007', $q$aftership$q$, $q$AfterShip$q$, $q$https://www.aftership.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fc3cb5d8-f800-4692-a2ad-71a9bdd7d007', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc3cb5d8-f800-4692-a2ad-71a9bdd7d007')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b672821a-3f06-4f69-b3b2-0aae182ebd03', $q$anaplan$q$, $q$Anaplan$q$, $q$https://www.anaplan.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b672821a-3f06-4f69-b3b2-0aae182ebd03', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b672821a-3f06-4f69-b3b2-0aae182ebd03')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c90beb73-0c05-43b5-baf8-d47ca83e4b79', $q$appointy$q$, $q$Appointy$q$, $q$https://www.appointy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c90beb73-0c05-43b5-baf8-d47ca83e4b79', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c90beb73-0c05-43b5-baf8-d47ca83e4b79')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af325440-f24d-415b-86fc-e363e0fc59ca', $q$athenahealth$q$, $q$Athenahealth$q$, $q$https://www.athenahealth.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af325440-f24d-415b-86fc-e363e0fc59ca', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af325440-f24d-415b-86fc-e363e0fc59ca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3a31c54-d19f-4a2e-adc4-375900fa68b7', $q$backendless$q$, $q$Backendless$q$, $q$https://backendless.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3a31c54-d19f-4a2e-adc4-375900fa68b7', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3a31c54-d19f-4a2e-adc4-375900fa68b7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('25a76d30-e9e5-4707-ae76-35af527f1879', $q$betterworks$q$, $q$Betterworks$q$, $q$https://www.betterworks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '25a76d30-e9e5-4707-ae76-35af527f1879', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25a76d30-e9e5-4707-ae76-35af527f1879')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99f95582-8095-46a0-a546-880d2a0bcb62', $q$blackline$q$, $q$BlackLine$q$, $q$https://www.blackline.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99f95582-8095-46a0-a546-880d2a0bcb62', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99f95582-8095-46a0-a546-880d2a0bcb62')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('94fee371-6714-4f7a-a8ee-03a30c276f45', $q$bonsai$q$, $q$Bonsai$q$, $q$https://www.hellobonsai.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '94fee371-6714-4f7a-a8ee-03a30c276f45', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94fee371-6714-4f7a-a8ee-03a30c276f45')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5d45fb22-c16b-4b91-8bcb-5b311cde202a', $q$boomi$q$, $q$Boomi$q$, $q$https://boomi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5d45fb22-c16b-4b91-8bcb-5b311cde202a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d45fb22-c16b-4b91-8bcb-5b311cde202a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee9e60e6-fd49-41dd-ae05-b695af663b00', $q$boulevard$q$, $q$Boulevard$q$, $q$https://www.joinblvd.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee9e60e6-fd49-41dd-ae05-b695af663b00', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee9e60e6-fd49-41dd-ae05-b695af663b00')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86cbeea9-002c-4ee6-ae4c-9a957a0ddac5', $q$budibase-cloud$q$, $q$Budibase Cloud$q$, $q$https://budibase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86cbeea9-002c-4ee6-ae4c-9a957a0ddac5', 'f4f58d93-7bea-4938-9a48-5a8cc459591b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86cbeea9-002c-4ee6-ae4c-9a957a0ddac5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e063344-e609-433a-9c54-6d9b0ceaf1e0', $q$celigo$q$, $q$Celigo$q$, $q$https://www.celigo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e063344-e609-433a-9c54-6d9b0ceaf1e0', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e063344-e609-433a-9c54-6d9b0ceaf1e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d428ad87-dc2f-4000-8cbf-2f859842c0e2', $q$census$q$, $q$Census$q$, $q$https://www.getcensus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd428ad87-dc2f-4000-8cbf-2f859842c0e2', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd428ad87-dc2f-4000-8cbf-2f859842c0e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d61bfdb3-920c-4a0f-9ee2-5e1066ab4fad', $q$chartbeat$q$, $q$Chartbeat$q$, $q$https://chartbeat.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd61bfdb3-920c-4a0f-9ee2-5e1066ab4fad', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd61bfdb3-920c-4a0f-9ee2-5e1066ab4fad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5c2b1120-f1c7-444d-87ab-c96a49991abc', $q$chili-piper$q$, $q$Chili Piper$q$, $q$https://www.chilipiper.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5c2b1120-f1c7-444d-87ab-c96a49991abc', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c2b1120-f1c7-444d-87ab-c96a49991abc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('78f9c872-baf1-45b9-a0fe-d001e187a972', $q$classdojo$q$, $q$ClassDojo$q$, $q$https://www.classdojo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '78f9c872-baf1-45b9-a0fe-d001e187a972', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78f9c872-baf1-45b9-a0fe-d001e187a972')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9f2f4160-624b-4573-9f86-316924a90bef', $q$cloudtalk$q$, $q$CloudTalk$q$, $q$https://www.cloudtalk.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9f2f4160-624b-4573-9f86-316924a90bef', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f2f4160-624b-4573-9f86-316924a90bef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('173b9abf-1695-418b-96a2-735fde0cda14', $q$codacy$q$, $q$Codacy$q$, $q$https://www.codacy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '173b9abf-1695-418b-96a2-735fde0cda14', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '173b9abf-1695-418b-96a2-735fde0cda14')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1edb4549-4d70-4db9-a9f9-dcc4a4151402', $q$codesignal$q$, $q$CodeSignal$q$, $q$https://codesignal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1edb4549-4d70-4db9-a9f9-dcc4a4151402', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1edb4549-4d70-4db9-a9f9-dcc4a4151402')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e322b3d3-fb73-45a5-98a5-5284be52351d', $q$codility$q$, $q$Codility$q$, $q$https://www.codility.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e322b3d3-fb73-45a5-98a5-5284be52351d', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e322b3d3-fb73-45a5-98a5-5284be52351d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fbc45f6f-61ff-4a56-8a88-553e2c604be1', $q$constructor$q$, $q$Constructor$q$, $q$https://constructor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fbc45f6f-61ff-4a56-8a88-553e2c604be1', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbc45f6f-61ff-4a56-8a88-553e2c604be1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('400be7d4-2ff0-47ef-96d7-c97fc4aff7be', $q$cookieyes$q$, $q$CookieYes$q$, $q$https://www.cookieyes.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '400be7d4-2ff0-47ef-96d7-c97fc4aff7be', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '400be7d4-2ff0-47ef-96d7-c97fc4aff7be')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8949c855-f2b6-4ce4-b770-a4d05cadf7c6', $q$copilot$q$, $q$Copilot$q$, $q$https://www.copilot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8949c855-f2b6-4ce4-b770-a4d05cadf7c6', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8949c855-f2b6-4ce4-b770-a4d05cadf7c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('74afdfd8-b2c8-49d3-8b9d-145cd93aa5a1', $q$creately$q$, $q$Creately$q$, $q$https://creately.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '74afdfd8-b2c8-49d3-8b9d-145cd93aa5a1', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74afdfd8-b2c8-49d3-8b9d-145cd93aa5a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('50912d95-2ffb-46de-bdc0-da4eb0a6a3c9', $q$dashlane-business$q$, $q$Dashlane Business$q$, $q$https://www.dashlane.com/business$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '50912d95-2ffb-46de-bdc0-da4eb0a6a3c9', 'b865921b-9127-4f50-9377-584609fe2f7f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50912d95-2ffb-46de-bdc0-da4eb0a6a3c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7cd459cb-9bf9-45a9-9105-17da32253787', $q$datarails$q$, $q$Datarails$q$, $q$https://www.datarails.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7cd459cb-9bf9-45a9-9105-17da32253787', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cd459cb-9bf9-45a9-9105-17da32253787')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('989b057a-3a25-45d0-886f-0dfbbf8724f9', $q$decagon$q$, $q$Decagon$q$, $q$https://decagon.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '989b057a-3a25-45d0-886f-0dfbbf8724f9', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '989b057a-3a25-45d0-886f-0dfbbf8724f9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('751de747-e59a-4a4f-82cc-9e75fc14d118', $q$delighted$q$, $q$Delighted$q$, $q$https://delighted.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '751de747-e59a-4a4f-82cc-9e75fc14d118', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '751de747-e59a-4a4f-82cc-9e75fc14d118')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cad93e21-035b-4876-9d6b-8c917f65846f', $q$demandbase$q$, $q$Demandbase$q$, $q$https://www.demandbase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cad93e21-035b-4876-9d6b-8c917f65846f', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cad93e21-035b-4876-9d6b-8c917f65846f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a7d5935-ab40-4369-840b-8cd680464d05', $q$docebo$q$, $q$Docebo$q$, $q$https://www.docebo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a7d5935-ab40-4369-840b-8cd680464d05', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a7d5935-ab40-4369-840b-8cd680464d05')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('864de397-cf7c-4d8c-8d27-85bcd76039ea', $q$dock$q$, $q$Dock$q$, $q$https://www.dock.us$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '864de397-cf7c-4d8c-8d27-85bcd76039ea', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '864de397-cf7c-4d8c-8d27-85bcd76039ea')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76653393-82e6-41a9-b9fd-ed278d2da3d1', $q$doxy-me$q$, $q$Doxy.me$q$, $q$https://doxy.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76653393-82e6-41a9-b9fd-ed278d2da3d1', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76653393-82e6-41a9-b9fd-ed278d2da3d1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3be9dea4-5020-45da-b088-3b9b31932217', $q$dreamdata$q$, $q$Dreamdata$q$, $q$https://dreamdata.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3be9dea4-5020-45da-b088-3b9b31932217', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3be9dea4-5020-45da-b088-3b9b31932217')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5f9bc23-0abf-4ab3-8c4c-ac391f493df0', $q$dubsado$q$, $q$Dubsado$q$, $q$https://www.dubsado.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5f9bc23-0abf-4ab3-8c4c-ac391f493df0', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5f9bc23-0abf-4ab3-8c4c-ac391f493df0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('85fcfd1c-f469-4e9e-a497-205462724789', $q$dynamic-yield$q$, $q$Dynamic Yield$q$, $q$https://www.dynamicyield.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '85fcfd1c-f469-4e9e-a497-205462724789', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85fcfd1c-f469-4e9e-a497-205462724789')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ec33e38-86c5-4762-9e67-3bef4048b02a', $q$dynatrace$q$, $q$Dynatrace$q$, $q$https://www.dynatrace.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ec33e38-86c5-4762-9e67-3bef4048b02a', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ec33e38-86c5-4762-9e67-3bef4048b02a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e8d823a0-b22e-4385-96b5-f88df641c52c', $q$easyship$q$, $q$Easyship$q$, $q$https://www.easyship.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e8d823a0-b22e-4385-96b5-f88df641c52c', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8d823a0-b22e-4385-96b5-f88df641c52c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f75017d1-bf1a-4acf-8077-da4b211736fc', $q$eightfold-ai$q$, $q$Eightfold AI$q$, $q$https://eightfold.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f75017d1-bf1a-4acf-8077-da4b211736fc', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f75017d1-bf1a-4acf-8077-da4b211736fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('afb847b8-c762-444f-98fb-17970c5fa87e', $q$emaint$q$, $q$eMaint$q$, $q$https://www.emaint.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'afb847b8-c762-444f-98fb-17970c5fa87e', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afb847b8-c762-444f-98fb-17970c5fa87e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4b64abe9-ea99-45d2-bfce-9d5987e1bc53', $q$emarsys$q$, $q$Emarsys$q$, $q$https://emarsys.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4b64abe9-ea99-45d2-bfce-9d5987e1bc53', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b64abe9-ea99-45d2-bfce-9d5987e1bc53')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('feed860d-e4e3-4e28-a456-2e2876d5af6a', $q$eppo$q$, $q$Eppo$q$, $q$https://www.geteppo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'feed860d-e4e3-4e28-a456-2e2876d5af6a', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'feed860d-e4e3-4e28-a456-2e2876d5af6a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('815e566a-853d-40b6-b0a5-b988d5fe9bb5', $q$fieldwire$q$, $q$Fieldwire$q$, $q$https://www.fieldwire.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '815e566a-853d-40b6-b0a5-b988d5fe9bb5', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '815e566a-853d-40b6-b0a5-b988d5fe9bb5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e8e6fbb0-84de-4898-9fb4-1b9e50a47a81', $q$figjam$q$, $q$FigJam$q$, $q$https://www.figma.com/figjam$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e8e6fbb0-84de-4898-9fb4-1b9e50a47a81', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8e6fbb0-84de-4898-9fb4-1b9e50a47a81')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2f8601df-006c-40ef-98a3-dc9ce90cfbd6', $q$fiix$q$, $q$Fiix$q$, $q$https://fiixsoftware.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2f8601df-006c-40ef-98a3-dc9ce90cfbd6', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f8601df-006c-40ef-98a3-dc9ce90cfbd6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('649377ce-c8aa-4836-886c-34d3dbfbbe21', $q$firehydrant$q$, $q$FireHydrant$q$, $q$https://firehydrant.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '649377ce-c8aa-4836-886c-34d3dbfbbe21', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '649377ce-c8aa-4836-886c-34d3dbfbbe21')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d13d59c0-75a5-40e6-8d41-775ee94b6e2c', $q$five9$q$, $q$Five9$q$, $q$https://www.five9.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd13d59c0-75a5-40e6-8d41-775ee94b6e2c', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd13d59c0-75a5-40e6-8d41-775ee94b6e2c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('04148c06-e073-497a-9242-ba1713b96172', $q$floqast$q$, $q$FloQast$q$, $q$https://floqast.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '04148c06-e073-497a-9242-ba1713b96172', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04148c06-e073-497a-9242-ba1713b96172')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('74275364-7fa1-4c34-bb85-7dc84558d7f8', $q$forethought$q$, $q$Forethought$q$, $q$https://forethought.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '74275364-7fa1-4c34-bb85-7dc84558d7f8', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74275364-7fa1-4c34-bb85-7dc84558d7f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3eb40f24-a649-43a3-aefd-4f702fab7d4c', $q$formsite$q$, $q$Formsite$q$, $q$https://www.formsite.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3eb40f24-a649-43a3-aefd-4f702fab7d4c', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3eb40f24-a649-43a3-aefd-4f702fab7d4c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28b8aaae-94ce-4e47-a7c2-b8b67363c412', $q$freeagent$q$, $q$FreeAgent$q$, $q$https://www.freeagent.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28b8aaae-94ce-4e47-a7c2-b8b67363c412', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28b8aaae-94ce-4e47-a7c2-b8b67363c412')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('60722222-c933-447b-8222-e5897c23a55a', $q$fresha$q$, $q$Fresha$q$, $q$https://www.fresha.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '60722222-c933-447b-8222-e5897c23a55a', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60722222-c933-447b-8222-e5897c23a55a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3bc99339-b5d1-4442-a8e8-d7c6081cb008', $q$funnel$q$, $q$Funnel$q$, $q$https://funnel.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3bc99339-b5d1-4442-a8e8-d7c6081cb008', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bc99339-b5d1-4442-a8e8-d7c6081cb008')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('56a31066-ef96-42ec-9124-288a454acea5', $q$genesys-cloud-cx$q$, $q$Genesys Cloud CX$q$, $q$https://www.genesys.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '56a31066-ef96-42ec-9124-288a454acea5', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56a31066-ef96-42ec-9124-288a454acea5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f6e30306-71d8-4a60-b56c-da88f1b87f01', $q$gooddata$q$, $q$GoodData$q$, $q$https://www.gooddata.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f6e30306-71d8-4a60-b56c-da88f1b87f01', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6e30306-71d8-4a60-b56c-da88f1b87f01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48fa9b84-aaa5-4136-8696-fa272450d7e6', $q$gostudent$q$, $q$GoStudent$q$, $q$https://www.gostudent.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48fa9b84-aaa5-4136-8696-fa272450d7e6', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48fa9b84-aaa5-4136-8696-fa272450d7e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('415849b1-74d1-45d1-b2ff-e39bfd841ec1', $q$hackerrank$q$, $q$HackerRank$q$, $q$https://www.hackerrank.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '415849b1-74d1-45d1-b2ff-e39bfd841ec1', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '415849b1-74d1-45d1-b2ff-e39bfd841ec1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f9c375c2-08c7-466b-9c82-17d40f2f0187', $q$happy-returns$q$, $q$Happy Returns$q$, $q$https://happyreturns.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f9c375c2-08c7-466b-9c82-17d40f2f0187', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9c375c2-08c7-466b-9c82-17d40f2f0187')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d0a0c73-7777-4dd2-b55c-c8affd4ede42', $q$harver$q$, $q$Harver$q$, $q$https://harver.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d0a0c73-7777-4dd2-b55c-c8affd4ede42', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d0a0c73-7777-4dd2-b55c-c8affd4ede42')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c241ab3-9f53-47bb-a85c-c7c350c98fe4', $q$hevo-data$q$, $q$Hevo Data$q$, $q$https://hevodata.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c241ab3-9f53-47bb-a85c-c7c350c98fe4', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c241ab3-9f53-47bb-a85c-c7c350c98fe4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c7e7430-e49e-4521-a362-f76767c08498', $q$hex$q$, $q$Hex$q$, $q$https://hex.tech$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c7e7430-e49e-4521-a362-f76767c08498', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c7e7430-e49e-4521-a362-f76767c08498')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9df1f5ac-21b2-4154-871e-e591c9d352be', $q$highspot$q$, $q$Highspot$q$, $q$https://www.highspot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9df1f5ac-21b2-4154-871e-e591c9d352be', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9df1f5ac-21b2-4154-871e-e591c9d352be')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c95becab-0b51-4561-8b9c-e3c54c6db39a', $q$hightouch$q$, $q$Hightouch$q$, $q$https://hightouch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c95becab-0b51-4561-8b9c-e3c54c6db39a', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c95becab-0b51-4561-8b9c-e3c54c6db39a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d21b1480-ca67-461a-9e1a-d39d3ec61806', $q$hippo-cmms$q$, $q$Hippo CMMS$q$, $q$https://hippocmms.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd21b1480-ca67-461a-9e1a-d39d3ec61806', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd21b1480-ca67-461a-9e1a-d39d3ec61806')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0db12c34-7695-4ac3-9d70-d0144ed85603', $q$hockeystack$q$, $q$HockeyStack$q$, $q$https://www.hockeystack.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0db12c34-7695-4ac3-9d70-d0144ed85603', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0db12c34-7695-4ac3-9d70-d0144ed85603')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2419807-4bd4-4ed5-af99-8afa1290e67e', $q$holistics$q$, $q$Holistics$q$, $q$https://www.holistics.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2419807-4bd4-4ed5-af99-8afa1290e67e', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2419807-4bd4-4ed5-af99-8afa1290e67e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('32339d15-c754-4691-a47a-e7f4ddf6783f', $q$honeybook$q$, $q$HoneyBook$q$, $q$https://www.honeybook.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '32339d15-c754-4691-a47a-e7f4ddf6783f', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32339d15-c754-4691-a47a-e7f4ddf6783f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('052faa5f-ac3c-4098-a1ce-c5b50de588eb', $q$improvado$q$, $q$Improvado$q$, $q$https://improvado.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '052faa5f-ac3c-4098-a1ce-c5b50de588eb', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '052faa5f-ac3c-4098-a1ce-c5b50de588eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e11a3c3-d4bf-4d31-85a7-acb0708d39dc', $q$incident-io$q$, $q$Incident.io$q$, $q$https://incident.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e11a3c3-d4bf-4d31-85a7-acb0708d39dc', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e11a3c3-d4bf-4d31-85a7-acb0708d39dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('710a9bc6-dc35-42de-b43e-fc6846fa6054', $q$jirav$q$, $q$Jirav$q$, $q$https://www.jirav.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '710a9bc6-dc35-42de-b43e-fc6846fa6054', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '710a9bc6-dc35-42de-b43e-fc6846fa6054')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f16bdee7-92b9-4fa8-b7d2-d0c65303a6bf', $q$jitterbit$q$, $q$Jitterbit$q$, $q$https://www.jitterbit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f16bdee7-92b9-4fa8-b7d2-d0c65303a6bf', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f16bdee7-92b9-4fa8-b7d2-d0c65303a6bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4e617ec6-3143-4ba6-9b87-bfaba881c5b5', $q$justcall$q$, $q$JustCall$q$, $q$https://justcall.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4e617ec6-3143-4ba6-9b87-bfaba881c5b5', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e617ec6-3143-4ba6-9b87-bfaba881c5b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5bd18389-d08c-4423-9448-9b472bbcd235', $q$kantata$q$, $q$Kantata$q$, $q$https://www.kantata.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5bd18389-d08c-4423-9448-9b472bbcd235', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5bd18389-d08c-4423-9448-9b472bbcd235')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cadf7c77-2ac3-4c2f-921b-c1af05959705', $q$kashoo$q$, $q$Kashoo$q$, $q$https://www.kashoo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cadf7c77-2ac3-4c2f-921b-c1af05959705', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cadf7c77-2ac3-4c2f-921b-c1af05959705')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5a30b73-fc44-4349-818d-7aa3007ac5dc', $q$kissmetrics$q$, $q$Kissmetrics$q$, $q$https://www.kissmetrics.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5a30b73-fc44-4349-818d-7aa3007ac5dc', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5a30b73-fc44-4349-818d-7aa3007ac5dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb7c3936-cc4b-4e6a-95ed-0a4746e885b2', $q$klevu$q$, $q$Klevu$q$, $q$https://www.klevu.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb7c3936-cc4b-4e6a-95ed-0a4746e885b2', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb7c3936-cc4b-4e6a-95ed-0a4746e885b2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1f3ecb09-4287-42e2-b618-e0b4470078a8', $q$landingi$q$, $q$Landingi$q$, $q$https://landingi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1f3ecb09-4287-42e2-b618-e0b4470078a8', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f3ecb09-4287-42e2-b618-e0b4470078a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9f85701a-abcb-4093-93cd-4df45a06f69a', $q$learnupon$q$, $q$LearnUpon$q$, $q$https://www.learnupon.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9f85701a-abcb-4093-93cd-4df45a06f69a', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f85701a-abcb-4093-93cd-4df45a06f69a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b4ff542-d760-4922-9015-f5c0a6cf3137', $q$learnworlds$q$, $q$LearnWorlds$q$, $q$https://www.learnworlds.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b4ff542-d760-4922-9015-f5c0a6cf3137', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b4ff542-d760-4922-9015-f5c0a6cf3137')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8769c57b-cfb6-4aa4-b4fa-7ef9dc7a81fb', $q$limble-cmms$q$, $q$Limble CMMS$q$, $q$https://limblecmms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8769c57b-cfb6-4aa4-b4fa-7ef9dc7a81fb', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8769c57b-cfb6-4aa4-b4fa-7ef9dc7a81fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76e552d3-8ffd-447b-961c-e3146d24ab1d', $q$loop-returns$q$, $q$Loop Returns$q$, $q$https://www.loopreturns.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76e552d3-8ffd-447b-961c-e3146d24ab1d', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76e552d3-8ffd-447b-961c-e3146d24ab1d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a336025e-cea9-4313-ad75-5855aa6f0709', $q$loop-subscriptions$q$, $q$Loop Subscriptions$q$, $q$https://www.loopsubscriptions.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a336025e-cea9-4313-ad75-5855aa6f0709', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a336025e-cea9-4313-ad75-5855aa6f0709')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d672c926-6dc2-4b99-89bc-c3514fb00011', $q$lucidchart$q$, $q$Lucidchart$q$, $q$https://www.lucidchart.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd672c926-6dc2-4b99-89bc-c3514fb00011', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd672c926-6dc2-4b99-89bc-c3514fb00011')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c57df76-2bd2-4eb9-b3b1-f6b3ca15592f', $q$lyssna$q$, $q$Lyssna$q$, $q$https://www.lyssna.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c57df76-2bd2-4eb9-b3b1-f6b3ca15592f', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c57df76-2bd2-4eb9-b3b1-f6b3ca15592f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dd4c2b54-357c-408f-bdc6-53e9b9723d32', $q$mailjet$q$, $q$Mailjet$q$, $q$https://www.mailjet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dd4c2b54-357c-408f-bdc6-53e9b9723d32', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd4c2b54-357c-408f-bdc6-53e9b9723d32')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d3cef7c-92e3-4651-9aa1-1518c89a0318', $q$maintainx$q$, $q$MaintainX$q$, $q$https://www.getmaintainx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d3cef7c-92e3-4651-9aa1-1518c89a0318', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d3cef7c-92e3-4651-9aa1-1518c89a0318')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('57daabd7-81c3-4c0c-9f0a-f20ae44e80d5', $q$mindbody$q$, $q$Mindbody$q$, $q$https://www.mindbodyonline.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '57daabd7-81c3-4c0c-9f0a-f20ae44e80d5', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57daabd7-81c3-4c0c-9f0a-f20ae44e80d5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a3f2919-8df7-407d-b926-d5b2bf0626fc', $q$mode$q$, $q$Mode$q$, $q$https://mode.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a3f2919-8df7-407d-b926-d5b2bf0626fc', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a3f2919-8df7-407d-b926-d5b2bf0626fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f775c2fb-40ed-419d-936b-016c7590c6ff', $q$moodlecloud$q$, $q$MoodleCloud$q$, $q$https://moodle.com/solutions/moodlecloud$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f775c2fb-40ed-419d-936b-016c7590c6ff', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f775c2fb-40ed-419d-936b-016c7590c6ff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f8c2f91a-b11e-4e93-a84f-b020cb7e5982', $q$mosaic$q$, $q$Mosaic$q$, $q$https://www.mosaic.tech$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f8c2f91a-b11e-4e93-a84f-b020cb7e5982', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8c2f91a-b11e-4e93-a84f-b020cb7e5982')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('877346bc-cb58-405e-9691-822e936e2018', $q$moxo$q$, $q$Moxo$q$, $q$https://www.moxo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '877346bc-cb58-405e-9691-822e936e2018', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '877346bc-cb58-405e-9691-822e936e2018')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e8bf6ad6-95fb-490d-a79e-1d5a19c11679', $q$mparticle$q$, $q$mParticle$q$, $q$https://www.mparticle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e8bf6ad6-95fb-490d-a79e-1d5a19c11679', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8bf6ad6-95fb-490d-a79e-1d5a19c11679')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0152df58-2709-447a-964c-4270ea6e71ba', $q$mulesoft$q$, $q$MuleSoft$q$, $q$https://www.mulesoft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0152df58-2709-447a-964c-4270ea6e71ba', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0152df58-2709-447a-964c-4270ea6e71ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5bc1b618-a1eb-4e8d-b538-dcad46326599', $q$mural$q$, $q$Mural$q$, $q$https://www.mural.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5bc1b618-a1eb-4e8d-b538-dcad46326599', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5bc1b618-a1eb-4e8d-b538-dcad46326599')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f513a89d-983e-4174-9931-98e805499f01', $q$narvar$q$, $q$Narvar$q$, $q$https://corp.narvar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f513a89d-983e-4174-9931-98e805499f01', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f513a89d-983e-4174-9931-98e805499f01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e23f10af-2d54-454f-b679-455f09aaf906', $q$nearpod$q$, $q$Nearpod$q$, $q$https://nearpod.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e23f10af-2d54-454f-b679-455f09aaf906', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e23f10af-2d54-454f-b679-455f09aaf906')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('32fc92b6-e72e-4148-88fd-17766debda07', $q$netskope$q$, $q$Netskope$q$, $q$https://www.netskope.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '32fc92b6-e72e-4148-88fd-17766debda07', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32fc92b6-e72e-4148-88fd-17766debda07')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fcd0e455-cfb1-4289-98fb-d9a8ec646eee', $q$nordlayer$q$, $q$NordLayer$q$, $q$https://nordlayer.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fcd0e455-cfb1-4289-98fb-d9a8ec646eee', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fcd0e455-cfb1-4289-98fb-d9a8ec646eee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20dd9ab5-719a-409d-b433-2f762e215e76', $q$northbeam$q$, $q$Northbeam$q$, $q$https://www.northbeam.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20dd9ab5-719a-409d-b433-2f762e215e76', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20dd9ab5-719a-409d-b433-2f762e215e76')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('556431eb-bbeb-47e6-82b8-658da7c9a953', $q$nosto$q$, $q$Nosto$q$, $q$https://www.nosto.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '556431eb-bbeb-47e6-82b8-658da7c9a953', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '556431eb-bbeb-47e6-82b8-658da7c9a953')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1ccefb2-c4c2-4cad-b78f-69220f73f741', $q$numeric$q$, $q$Numeric$q$, $q$https://www.numeric.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1ccefb2-c4c2-4cad-b78f-69220f73f741', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1ccefb2-c4c2-4cad-b78f-69220f73f741')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('32651594-0fc7-4605-aa35-3c759bbfcb2b', $q$onetrust$q$, $q$OneTrust$q$, $q$https://www.onetrust.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '32651594-0fc7-4605-aa35-3c759bbfcb2b', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32651594-0fc7-4605-aa35-3c759bbfcb2b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('df107dea-2185-460b-bec0-27725a6c524c', $q$optimal-workshop$q$, $q$Optimal Workshop$q$, $q$https://www.optimalworkshop.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'df107dea-2185-460b-bec0-27725a6c524c', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df107dea-2185-460b-bec0-27725a6c524c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('878d1d8a-548d-4d8b-8d0f-96fd34fe8714', $q$osano$q$, $q$Osano$q$, $q$https://www.osano.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '878d1d8a-548d-4d8b-8d0f-96fd34fe8714', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '878d1d8a-548d-4d8b-8d0f-96fd34fe8714')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a730541-8b5d-4e8f-ba22-dddedc2e3ddb', $q$paradox$q$, $q$Paradox$q$, $q$https://www.paradox.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a730541-8b5d-4e8f-ba22-dddedc2e3ddb', 'a53f5a07-2813-42f7-bf0f-07d74634d3e6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a730541-8b5d-4e8f-ba22-dddedc2e3ddb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d9d03dff-3255-420c-947e-757965ecf14c', $q$parse-ly$q$, $q$Parse.ly$q$, $q$https://www.parse.ly$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd9d03dff-3255-420c-947e-757965ecf14c', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd9d03dff-3255-420c-947e-757965ecf14c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f2c0f71f-ca0d-4fe0-9275-01b2117af396', $q$paycor$q$, $q$Paycor$q$, $q$https://www.paycor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f2c0f71f-ca0d-4fe0-9275-01b2117af396', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f2c0f71f-ca0d-4fe0-9275-01b2117af396')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a5b7719-5ad7-41db-a22f-6a102a9f1851', $q$perimeter-81$q$, $q$Perimeter 81$q$, $q$https://www.perimeter81.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a5b7719-5ad7-41db-a22f-6a102a9f1851', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a5b7719-5ad7-41db-a22f-6a102a9f1851')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8a1b32e-48d4-4685-a6de-efc54624e2d0', $q$pigment$q$, $q$Pigment$q$, $q$https://www.pigment.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8a1b32e-48d4-4685-a6de-efc54624e2d0', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8a1b32e-48d4-4685-a6de-efc54624e2d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b7d4d84-67b9-465f-b981-d3669a1cab00', $q$planful$q$, $q$Planful$q$, $q$https://planful.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b7d4d84-67b9-465f-b981-d3669a1cab00', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b7d4d84-67b9-465f-b981-d3669a1cab00')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f89031ce-9684-45b9-be0f-9796b29efaf1', $q$plutio$q$, $q$Plutio$q$, $q$https://www.plutio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f89031ce-9684-45b9-be0f-9796b29efaf1', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f89031ce-9684-45b9-be0f-9796b29efaf1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6282e509-3457-4b93-8265-b748ab78d2d3', $q$polar$q$, $q$Polar$q$, $q$https://polar.sh$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6282e509-3457-4b93-8265-b748ab78d2d3', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6282e509-3457-4b93-8265-b748ab78d2d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1bd98deb-04dc-486b-8078-f1d1c5d9123f', $q$productive$q$, $q$Productive$q$, $q$https://productive.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1bd98deb-04dc-486b-8078-f1d1c5d9123f', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1bd98deb-04dc-486b-8078-f1d1c5d9123f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48a52bcd-05fa-41f5-ae5a-0871ba3cc554', $q$quizizz$q$, $q$Quizizz$q$, $q$https://quizizz.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48a52bcd-05fa-41f5-ae5a-0871ba3cc554', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48a52bcd-05fa-41f5-ae5a-0871ba3cc554')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('25c15fa2-6794-4a09-97aa-3e10ac4825d0', $q$recharge$q$, $q$Recharge$q$, $q$https://rechargepayments.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '25c15fa2-6794-4a09-97aa-3e10ac4825d0', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25c15fa2-6794-4a09-97aa-3e10ac4825d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab9588f2-1c10-4c3c-b719-fb216070c3bb', $q$returnlogic$q$, $q$ReturnLogic$q$, $q$https://www.returnlogic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab9588f2-1c10-4c3c-b719-fb216070c3bb', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab9588f2-1c10-4c3c-b719-fb216070c3bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4494fb93-4406-4841-99d6-ef4bc14b06fd', $q$rockerbox$q$, $q$Rockerbox$q$, $q$https://www.rockerbox.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4494fb93-4406-4841-99d6-ef4bc14b06fd', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4494fb93-4406-4841-99d6-ef4bc14b06fd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8cf4b452-233d-4d9a-830a-cae4d82ffe0f', $q$rollworks$q$, $q$RollWorks$q$, $q$https://www.rollworks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8cf4b452-233d-4d9a-830a-cae4d82ffe0f', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8cf4b452-233d-4d9a-830a-cae4d82ffe0f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('92a0ab78-1cc4-4730-8d44-9e2c488c4b0e', $q$rootly$q$, $q$Rootly$q$, $q$https://rootly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '92a0ab78-1cc4-4730-8d44-9e2c488c4b0e', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '92a0ab78-1cc4-4730-8d44-9e2c488c4b0e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a902f60d-e675-4d4b-9855-daa93ca4e741', $q$sage-intacct$q$, $q$Sage Intacct$q$, $q$https://www.sage.com/en-us/sage-business-cloud/intacct$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a902f60d-e675-4d4b-9855-daa93ca4e741', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a902f60d-e675-4d4b-9855-daa93ca4e741')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('55e44902-2547-422a-b09c-4d574cfc8c9a', $q$schoology$q$, $q$Schoology$q$, $q$https://www.powerschool.com/classroom/schoology-learning$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '55e44902-2547-422a-b09c-4d574cfc8c9a', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '55e44902-2547-422a-b09c-4d574cfc8c9a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7f6a8ade-225c-421f-9bcc-d905c69af995', $q$scratchpad$q$, $q$Scratchpad$q$, $q$https://www.scratchpad.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7f6a8ade-225c-421f-9bcc-d905c69af995', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f6a8ade-225c-421f-9bcc-d905c69af995')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7ce007d-cf2e-452c-8623-d5bc784a925d', $q$searchspring$q$, $q$Searchspring$q$, $q$https://searchspring.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7ce007d-cf2e-452c-8623-d5bc784a925d', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7ce007d-cf2e-452c-8623-d5bc784a925d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a37dbc0-b66a-45e5-8ad0-106ba901316f', $q$seismic$q$, $q$Seismic$q$, $q$https://seismic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a37dbc0-b66a-45e5-8ad0-106ba901316f', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a37dbc0-b66a-45e5-8ad0-106ba901316f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54c9ac1e-8b54-4235-b813-fc689d95b74a', $q$shipbob$q$, $q$ShipBob$q$, $q$https://www.shipbob.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54c9ac1e-8b54-4235-b813-fc689d95b74a', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54c9ac1e-8b54-4235-b813-fc689d95b74a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('40c8e6d6-a54e-4979-8815-394b735af5cb', $q$shippo$q$, $q$Shippo$q$, $q$https://goshippo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '40c8e6d6-a54e-4979-8815-394b735af5cb', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40c8e6d6-a54e-4979-8815-394b735af5cb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9c74bbe3-539f-4a9f-9e0a-d5299afe0145', $q$shipstation$q$, $q$ShipStation$q$, $q$https://www.shipstation.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9c74bbe3-539f-4a9f-9e0a-d5299afe0145', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9c74bbe3-539f-4a9f-9e0a-d5299afe0145')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e984c2fb-7229-42f9-a6fb-d00f2093d36d', $q$showpad$q$, $q$Showpad$q$, $q$https://www.showpad.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e984c2fb-7229-42f9-a6fb-d00f2093d36d', 'bd78e8e2-f7ca-4747-bf05-779272142da5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e984c2fb-7229-42f9-a6fb-d00f2093d36d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('059a6793-6413-4b81-a6f5-4051ea8d982a', $q$sierra$q$, $q$Sierra$q$, $q$https://sierra.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '059a6793-6413-4b81-a6f5-4051ea8d982a', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '059a6793-6413-4b81-a6f5-4051ea8d982a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ef287211-f3e9-48ed-977f-15a79f0dff44', $q$sigma-computing$q$, $q$Sigma Computing$q$, $q$https://www.sigmacomputing.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ef287211-f3e9-48ed-977f-15a79f0dff44', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef287211-f3e9-48ed-977f-15a79f0dff44')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('632c30a4-55d3-4409-96c8-76a72f24f1cf', $q$skio$q$, $q$Skio$q$, $q$https://skio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '632c30a4-55d3-4409-96c8-76a72f24f1cf', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '632c30a4-55d3-4409-96c8-76a72f24f1cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b9356b20-ff3e-43eb-8ad9-d71bbb6abb12', $q$smartsuite$q$, $q$Smartsuite$q$, $q$https://www.smartsuite.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b9356b20-ff3e-43eb-8ad9-d71bbb6abb12', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9356b20-ff3e-43eb-8ad9-d71bbb6abb12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41483103-65cc-4511-bc4b-ee5c2d514a88', $q$snaplogic$q$, $q$SnapLogic$q$, $q$https://www.snaplogic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41483103-65cc-4511-bc4b-ee5c2d514a88', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41483103-65cc-4511-bc4b-ee5c2d514a88')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('341d638b-e144-4b9b-9e2b-697048be5c92', $q$socketlabs$q$, $q$SocketLabs$q$, $q$https://www.socketlabs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '341d638b-e144-4b9b-9e2b-697048be5c92', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '341d638b-e144-4b9b-9e2b-697048be5c92')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b0f68f6-01e9-4052-b48f-9e86cac7943f', $q$sonarcloud$q$, $q$SonarCloud$q$, $q$https://sonarcloud.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b0f68f6-01e9-4052-b48f-9e86cac7943f', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b0f68f6-01e9-4052-b48f-9e86cac7943f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e81f9e1-c192-426c-990a-528a1d05bb0f', $q$split$q$, $q$Split$q$, $q$https://www.split.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e81f9e1-c192-426c-990a-528a1d05bb0f', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e81f9e1-c192-426c-990a-528a1d05bb0f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('24398c57-f20b-4c53-8411-8252f29a9d75', $q$sprig$q$, $q$Sprig$q$, $q$https://sprig.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '24398c57-f20b-4c53-8411-8252f29a9d75', '360562f5-cc67-40df-b239-2223c2508b08', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24398c57-f20b-4c53-8411-8252f29a9d75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d22443ad-ac19-4279-a9ee-99becdc96c04', $q$stitch$q$, $q$Stitch$q$, $q$https://www.stitchdata.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd22443ad-ac19-4279-a9ee-99becdc96c04', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd22443ad-ac19-4279-a9ee-99becdc96c04')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca3044b9-6273-444b-bab4-164eae1b3912', $q$suitedash$q$, $q$SuiteDash$q$, $q$https://suitedash.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca3044b9-6273-444b-bab4-164eae1b3912', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca3044b9-6273-444b-bab4-164eae1b3912')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('513bcd32-d272-413c-af04-54647f2d8ccf', $q$survicate$q$, $q$Survicate$q$, $q$https://survicate.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '513bcd32-d272-413c-af04-54647f2d8ccf', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '513bcd32-d272-413c-af04-54647f2d8ccf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8989ac7-0ad9-4ad5-a598-aa3716ef2a88', $q$swipe-pages$q$, $q$Swipe Pages$q$, $q$https://swipepages.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8989ac7-0ad9-4ad5-a598-aa3716ef2a88', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8989ac7-0ad9-4ad5-a598-aa3716ef2a88')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aaf14d5b-b5b0-4ad6-8d1a-cc790447a3fb', $q$talentlms$q$, $q$TalentLMS$q$, $q$https://www.talentlms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aaf14d5b-b5b0-4ad6-8d1a-cc790447a3fb', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aaf14d5b-b5b0-4ad6-8d1a-cc790447a3fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1635104d-8558-4a8a-9377-59ac3d5baa56', $q$talkdesk$q$, $q$Talkdesk$q$, $q$https://www.talkdesk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1635104d-8558-4a8a-9377-59ac3d5baa56', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1635104d-8558-4a8a-9377-59ac3d5baa56')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13cd7073-dbf2-42d0-8028-9cb27ab9c6d6', $q$talkwalker$q$, $q$Talkwalker$q$, $q$https://www.talkwalker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13cd7073-dbf2-42d0-8028-9cb27ab9c6d6', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13cd7073-dbf2-42d0-8028-9cb27ab9c6d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76ba1d86-95da-4bac-b6d2-d21f92c304e9', $q$teachworks$q$, $q$Teachworks$q$, $q$https://teachworks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76ba1d86-95da-4bac-b6d2-d21f92c304e9', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76ba1d86-95da-4bac-b6d2-d21f92c304e9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('18737f8c-c44b-4057-a871-fb4465ed6a0a', $q$tealium$q$, $q$Tealium$q$, $q$https://tealium.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '18737f8c-c44b-4057-a871-fb4465ed6a0a', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18737f8c-c44b-4057-a871-fb4465ed6a0a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('223c71a5-b6cb-4905-9f70-574d9f9bc8af', $q$terminus$q$, $q$Terminus$q$, $q$https://terminus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '223c71a5-b6cb-4905-9f70-574d9f9bc8af', '4ecde445-2fb0-4aa8-aaf7-61e73bf1d6d5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '223c71a5-b6cb-4905-9f70-574d9f9bc8af')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2afb871-434c-42dc-82de-1021ad1d8ac4', $q$termly$q$, $q$Termly$q$, $q$https://termly.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2afb871-434c-42dc-82de-1021ad1d8ac4', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2afb871-434c-42dc-82de-1021ad1d8ac4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a950e66-7ffc-4b83-8ac3-183aa254ec2e', $q$testgorilla$q$, $q$TestGorilla$q$, $q$https://www.testgorilla.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a950e66-7ffc-4b83-8ac3-183aa254ec2e', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a950e66-7ffc-4b83-8ac3-183aa254ec2e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('faca3beb-680a-498b-bb09-9ae519c2e0a9', $q$thoughtspot$q$, $q$ThoughtSpot$q$, $q$https://www.thoughtspot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'faca3beb-680a-498b-bb09-9ae519c2e0a9', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'faca3beb-680a-498b-bb09-9ae519c2e0a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1f8afccf-e8ad-407d-aa77-4eba5dae8e7d', $q$tooljet-cloud$q$, $q$ToolJet Cloud$q$, $q$https://www.tooljet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1f8afccf-e8ad-407d-aa77-4eba5dae8e7d', 'f4f58d93-7bea-4938-9a48-5a8cc459591b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f8afccf-e8ad-407d-aa77-4eba5dae8e7d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b0fbf5b-29c2-4f24-9d58-db28da8606fb', $q$transcend$q$, $q$Transcend$q$, $q$https://transcend.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b0fbf5b-29c2-4f24-9d58-db28da8606fb', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b0fbf5b-29c2-4f24-9d58-db28da8606fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b292c601-890e-4094-9058-d1f0720c453e', $q$travis-ci$q$, $q$Travis CI$q$, $q$https://www.travis-ci.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b292c601-890e-4094-9058-d1f0720c453e', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b292c601-890e-4094-9058-d1f0720c453e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7f352cab-bdc4-4795-9159-696405ba43ec', $q$trinet$q$, $q$TriNet$q$, $q$https://www.trinet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7f352cab-bdc4-4795-9159-696405ba43ec', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f352cab-bdc4-4795-9159-696405ba43ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d579de2-f5fd-4cce-b695-94dd73f07475', $q$triple-whale$q$, $q$Triple Whale$q$, $q$https://www.triplewhale.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d579de2-f5fd-4cce-b695-94dd73f07475', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d579de2-f5fd-4cce-b695-94dd73f07475')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8abb4e68-07aa-47d3-b94c-67246c27a367', $q$twilio-flex$q$, $q$Twilio Flex$q$, $q$https://www.twilio.com/flex$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8abb4e68-07aa-47d3-b94c-67246c27a367', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8abb4e68-07aa-47d3-b94c-67246c27a367')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7071772a-c4c1-4f50-b21d-a167f4f36c3a', $q$ultimate$q$, $q$Ultimate$q$, $q$https://www.ultimate.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7071772a-c4c1-4f50-b21d-a167f4f36c3a', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7071772a-c4c1-4f50-b21d-a167f4f36c3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a70b797c-66e9-47b6-b16a-d536e6b511bf', $q$upkeep$q$, $q$UpKeep$q$, $q$https://www.onupkeep.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a70b797c-66e9-47b6-b16a-d536e6b511bf', '40ca42a7-3ae4-46bd-a008-ded14a786c8f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a70b797c-66e9-47b6-b16a-d536e6b511bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7416111b-9380-4361-bcc9-07efc1c638dd', $q$vagaro$q$, $q$Vagaro$q$, $q$https://www.vagaro.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7416111b-9380-4361-bcc9-07efc1c638dd', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7416111b-9380-4361-bcc9-07efc1c638dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28fbaa0e-4698-4f41-9fd6-4a80bc9f22e0', $q$vena$q$, $q$Vena$q$, $q$https://www.venasolutions.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28fbaa0e-4698-4f41-9fd6-4a80bc9f22e0', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28fbaa0e-4698-4f41-9fd6-4a80bc9f22e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f7867979-6c3b-4e9c-b1de-7358343a5a3b', $q$vervoe$q$, $q$Vervoe$q$, $q$https://vervoe.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f7867979-6c3b-4e9c-b1de-7358343a5a3b', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7867979-6c3b-4e9c-b1de-7358343a5a3b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a9272287-5009-4120-bb26-743a2c3e388b', $q$vwo$q$, $q$VWO$q$, $q$https://vwo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a9272287-5009-4120-bb26-743a2c3e388b', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9272287-5009-4120-bb26-743a2c3e388b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dac530ad-b9a1-4e6d-958f-e36fbc0aee5e', $q$whimsical$q$, $q$Whimsical$q$, $q$https://whimsical.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dac530ad-b9a1-4e6d-958f-e36fbc0aee5e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dac530ad-b9a1-4e6d-958f-e36fbc0aee5e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('01d5ea65-cfa6-4646-a4a5-95d41b4e1c4c', $q$windsor-ai$q$, $q$Windsor.ai$q$, $q$https://windsor.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '01d5ea65-cfa6-4646-a4a5-95d41b4e1c4c', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01d5ea65-cfa6-4646-a4a5-95d41b4e1c4c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b7fec722-c877-4dff-8d06-1e2c28e79d01', $q$woopra$q$, $q$Woopra$q$, $q$https://www.woopra.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b7fec722-c877-4dff-8d06-1e2c28e79d01', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7fec722-c877-4dff-8d06-1e2c28e79d01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e8f3291-8805-474a-9765-cbf43ed18cf8', $q$xano$q$, $q$Xano$q$, $q$https://www.xano.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e8f3291-8805-474a-9765-cbf43ed18cf8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e8f3291-8805-474a-9765-cbf43ed18cf8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f6d13d57-a73c-4c25-bd7d-0b250e0f351f', $q$zenoti$q$, $q$Zenoti$q$, $q$https://www.zenoti.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f6d13d57-a73c-4c25-bd7d-0b250e0f351f', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6d13d57-a73c-4c25-bd7d-0b250e0f351f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('38d8271b-389d-4a5c-972d-8334f4d1f507', $q$zscaler$q$, $q$Zscaler$q$, $q$https://www.zscaler.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '38d8271b-389d-4a5c-972d-8334f4d1f507', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38d8271b-389d-4a5c-972d-8334f4d1f507')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3cd4d25e-1743-4778-9ea6-b9436a0b290f', $q$docusign-clm$q$, $q$DocuSign CLM$q$, $q$https://www.docusign.com/products/clm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3cd4d25e-1743-4778-9ea6-b9436a0b290f', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cd4d25e-1743-4778-9ea6-b9436a0b290f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('408b4a51-44c6-46e4-a026-286c555744de', $q$stripe-billing$q$, $q$Stripe Billing$q$, $q$https://stripe.com/billing$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '408b4a51-44c6-46e4-a026-286c555744de', '56436183-3549-4638-9a19-899071cdfda6', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '408b4a51-44c6-46e4-a026-286c555744de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('969013c8-45e7-4dd5-a5af-ce00c8bebe8f', $q$crowdstrike$q$, $q$CrowdStrike$q$, $q$https://www.crowdstrike.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '969013c8-45e7-4dd5-a5af-ce00c8bebe8f', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '969013c8-45e7-4dd5-a5af-ce00c8bebe8f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('50bd3bb7-d6d3-4418-956d-523512e40c34', $q$kahoot$q$, $q$Kahoot!$q$, $q$https://kahoot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '50bd3bb7-d6d3-4418-956d-523512e40c34', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50bd3bb7-d6d3-4418-956d-523512e40c34')
ON CONFLICT DO NOTHING;


-- Strategic metadata — one row per list entry (new tool or matched existing).
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8dd2ba58-481a-4ed0-846c-96234a88944e', $q$Revenue Intelligence$q$, 1, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8dd2ba58-481a-4ed0-846c-96234a88944e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6a44f136-f19c-4182-b5b0-576361abb642', $q$Advertising$q$, 4, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a44f136-f19c-4182-b5b0-576361abb642')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '14315019-5fc0-4f79-b27c-b60ee1c1017e', $q$CRM$q$, 6, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '14315019-5fc0-4f79-b27c-b60ee1c1017e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '524ae882-aec6-47f8-a972-c700382a2639', $q$Expense Management$q$, 8, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '524ae882-aec6-47f8-a972-c700382a2639')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d2d9200-cb3b-477c-8688-3bf69c524630', $q$AI & Content$q$, 9, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d2d9200-cb3b-477c-8688-3bf69c524630')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6906a776-e829-4a03-b205-0bf214aeeca0', $q$Property Management$q$, 11, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6906a776-e829-4a03-b205-0bf214aeeca0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1635aea1-58d7-4783-be12-99aed0d3646f', $q$AI Video & Creative$q$, 13, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1635aea1-58d7-4783-be12-99aed0d3646f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '69678cd0-36bc-465c-ad49-76349776fb26', $q$Property Management$q$, 15, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69678cd0-36bc-465c-ad49-76349776fb26')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd3de63cc-8964-42d0-a306-17d133456303', $q$Ecommerce$q$, 20, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3de63cc-8964-42d0-a306-17d133456303')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e3d6c369-5ccc-4a69-87aa-439e03e26dda', $q$Ecommerce$q$, 21, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3d6c369-5ccc-4a69-87aa-439e03e26dda')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '53b2251d-a2da-49a6-a689-f00f2dbe1418', $q$Property Management$q$, 27, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53b2251d-a2da-49a6-a689-f00f2dbe1418')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '85b579b1-50a2-45ad-9e3b-d15e5d306869', $q$Legal AI$q$, 29, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85b579b1-50a2-45ad-9e3b-d15e5d306869')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a2641553-2df4-4aff-b662-314b0dddc12d', $q$Customer Success$q$, 30, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a2641553-2df4-4aff-b662-314b0dddc12d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd4223752-ad10-4cc5-a3d4-de58751958ab', $q$Sales Intelligence$q$, 33, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4223752-ad10-4cc5-a3d4-de58751958ab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9c7ba411-899c-4dfb-9d1f-691a7d81b93d', $q$AI & Content$q$, 36, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9c7ba411-899c-4dfb-9d1f-691a7d81b93d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f5e768d1-6625-4f4e-bbf1-87bc0cb982ae', $q$Hospitality Software$q$, 37, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5e768d1-6625-4f4e-bbf1-87bc0cb982ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '23d28c3b-3aa3-40e9-b0fb-cf38992ebbdb', $q$AI & Content$q$, 39, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23d28c3b-3aa3-40e9-b0fb-cf38992ebbdb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82e40996-2042-4195-bace-52a95dd90735', $q$AI & Content$q$, 40, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82e40996-2042-4195-bace-52a95dd90735')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6f6b7427-2a25-47de-809a-0cbf1f53a717', $q$AI & Content$q$, 43, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f6b7427-2a25-47de-809a-0cbf1f53a717')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d6a4690-35a5-4b47-a9ca-4b2b9ea1548a', $q$AI Video & Creative$q$, 44, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d6a4690-35a5-4b47-a9ca-4b2b9ea1548a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4eef98d3-69ee-49d3-93c3-a7bc9c063dc3', $q$AI & Content$q$, 48, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4eef98d3-69ee-49d3-93c3-a7bc9c063dc3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f0530d9-d1bc-42cd-8f00-ce342cdd88d1', $q$Expense Management$q$, 49, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f0530d9-d1bc-42cd-8f00-ce342cdd88d1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5b15ed7-255d-4f91-8e6c-6c67f71428d7', $q$Property Management$q$, 50, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5b15ed7-255d-4f91-8e6c-6c67f71428d7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c4ea9a4-4992-4f02-b8d7-e3da4139e169', $q$No-Code$q$, 51, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c4ea9a4-4992-4f02-b8d7-e3da4139e169')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9964e565-857e-4ee7-925b-752ec0fea495', $q$Legal AI$q$, 53, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9964e565-857e-4ee7-925b-752ec0fea495')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05aef092-d67f-4398-8b00-14ff018e0bee', $q$Customer Success$q$, 54, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05aef092-d67f-4398-8b00-14ff018e0bee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f5d272e9-1fcb-4d5c-86bd-95f432c29528', $q$Field Service Management$q$, 57, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5d272e9-1fcb-4d5c-86bd-95f432c29528')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e79d8de7-523b-4c87-ac5c-cc3ea76ff728', $q$No-Code$q$, 58, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e79d8de7-523b-4c87-ac5c-cc3ea76ff728')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8116156-99b7-47fd-989f-45ac2d3d4e2e', $q$Expense Management$q$, 61, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8116156-99b7-47fd-989f-45ac2d3d4e2e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '30aed65f-4b56-4660-901e-c19bc730f726', $q$Ecommerce$q$, 62, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '30aed65f-4b56-4660-901e-c19bc730f726')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '329b08bd-1cbd-465c-ae14-00059aae4d0f', $q$Ecommerce Marketing$q$, 68, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '329b08bd-1cbd-465c-ae14-00059aae4d0f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd22c97eb-5df8-42d9-9994-9dda98d843be', $q$Hospitality Software$q$, 69, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd22c97eb-5df8-42d9-9994-9dda98d843be')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '23f4e892-59ef-4f2b-9320-8942be697042', $q$AI & Content$q$, 71, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23f4e892-59ef-4f2b-9320-8942be697042')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a6377a5b-eab8-4d69-b903-e5f206d8e84c', $q$Property Management$q$, 72, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6377a5b-eab8-4d69-b903-e5f206d8e84c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc876223-7069-4e68-b3fa-80ae824b787a', $q$Hospitality Software$q$, 77, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc876223-7069-4e68-b3fa-80ae824b787a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a9691e7b-f28e-47d1-8793-656f035bed3c', $q$Ecommerce Marketing$q$, 86, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9691e7b-f28e-47d1-8793-656f035bed3c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '65bb0999-6ba4-486b-a6d7-eef35772c57c', $q$Field Service Management$q$, 88, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65bb0999-6ba4-486b-a6d7-eef35772c57c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e9700263-1aca-4a9c-99fc-37deba81964e', $q$AI & Content$q$, 95, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9700263-1aca-4a9c-99fc-37deba81964e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f5c253ed-d823-4895-ad9e-8fb4fce7de0c', $q$Project Management$q$, 96, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5c253ed-d823-4895-ad9e-8fb4fce7de0c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '052abf0b-5ae7-4b86-985a-849e9c131982', $q$Hospitality Software$q$, 97, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '052abf0b-5ae7-4b86-985a-849e9c131982')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b5c0ae0e-ad89-4f51-9111-703ff9c60f0a', $q$Hospitality Software$q$, 99, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5c0ae0e-ad89-4f51-9111-703ff9c60f0a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ce18086-6ea1-4099-af5b-933e8efb1259', $q$Ecommerce Marketing$q$, 101, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ce18086-6ea1-4099-af5b-933e8efb1259')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3b4df044-30c0-4597-bc4f-168a30350b9f', $q$Advertising$q$, 102, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b4df044-30c0-4597-bc4f-168a30350b9f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8e92145-63cb-4bbb-8266-20dd75b50684', $q$Hospitality Software$q$, 108, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8e92145-63cb-4bbb-8266-20dd75b50684')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd12a7932-99b2-42a9-ac0f-16f1ed4e64f2', $q$Sales Engagement$q$, 109, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd12a7932-99b2-42a9-ac0f-16f1ed4e64f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28ccef2b-9eed-4c82-ae67-c15e4edf047f', $q$AI & Content$q$, 113, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28ccef2b-9eed-4c82-ae67-c15e4edf047f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '004d2c08-4d11-4a52-ae95-430a24e68297', $q$No-Code$q$, 116, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '004d2c08-4d11-4a52-ae95-430a24e68297')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '36bef685-5dc7-4055-b82a-d23d633f376b', $q$Ecommerce Marketing$q$, 119, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36bef685-5dc7-4055-b82a-d23d633f376b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '156b15da-7c8d-4636-a925-46921ae07bdd', $q$Advertising$q$, 122, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '156b15da-7c8d-4636-a925-46921ae07bdd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '96b5f07e-0bdd-4acd-9f55-7df88f3561de', $q$Ecommerce$q$, 125, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '96b5f07e-0bdd-4acd-9f55-7df88f3561de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '749f6990-0988-4693-846a-af89c0cdd594', $q$AI & Content$q$, 126, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '749f6990-0988-4693-846a-af89c0cdd594')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b82a03aa-f1f0-413d-a7c2-5b374e0caa2e', $q$Advertising$q$, 128, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b82a03aa-f1f0-413d-a7c2-5b374e0caa2e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6f48fc56-db84-4d3c-9df8-c242833c50c3', $q$AI Video & Creative$q$, 130, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f48fc56-db84-4d3c-9df8-c242833c50c3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a0c1c32d-3dc8-4228-b992-80fa58ced855', $q$Property Management$q$, 134, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0c1c32d-3dc8-4228-b992-80fa58ced855')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a3f771ca-7bae-4f1f-9205-de1e6a64da19', $q$SEO$q$, 139, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a3f771ca-7bae-4f1f-9205-de1e6a64da19')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '090513e5-3588-4978-90e9-6bdfea17be26', $q$SEO$q$, 140, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '090513e5-3588-4978-90e9-6bdfea17be26')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ca296685-d2bd-4ebd-94fa-263bfafabb9c', $q$Property Management$q$, 144, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca296685-d2bd-4ebd-94fa-263bfafabb9c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4811dd51-9e11-4450-b1ad-0a151e73df9c', $q$Ecommerce$q$, 145, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4811dd51-9e11-4450-b1ad-0a151e73df9c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b22eec21-293c-42bd-b807-af31d7d25277', $q$Advertising$q$, 146, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b22eec21-293c-42bd-b807-af31d7d25277')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4ee27d7f-5956-4845-ab04-d7f73b50fe7b', $q$Revenue Intelligence$q$, 147, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ee27d7f-5956-4845-ab04-d7f73b50fe7b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eb4c1349-3ea5-4ade-8e27-c520e0587c82', $q$Hospitality Software$q$, 149, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb4c1349-3ea5-4ade-8e27-c520e0587c82')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3bd77eae-40c2-4252-9cd7-38b915eef5c4', $q$Expense Management$q$, 151, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bd77eae-40c2-4252-9cd7-38b915eef5c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1faf72f1-07db-4edb-b0b8-1d81a93d18fa', $q$Expense Management$q$, 153, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1faf72f1-07db-4edb-b0b8-1d81a93d18fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7e36f95-84dd-4455-85d5-d47426a46c1c', $q$Compliance$q$, 156, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7e36f95-84dd-4455-85d5-d47426a46c1c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '768fff41-d355-478b-be68-713045fc9a64', $q$Email Marketing$q$, 158, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '768fff41-d355-478b-be68-713045fc9a64')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06d1ec9b-2606-4cb2-8f6e-9b1a7bbc7385', $q$Field Service Management$q$, 160, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06d1ec9b-2606-4cb2-8f6e-9b1a7bbc7385')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5815ac81-15cc-4a99-9b4b-6ee6b455fc20', $q$Field Service Management$q$, 161, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5815ac81-15cc-4a99-9b4b-6ee6b455fc20')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '87666664-2c53-46fa-a364-f66e5fc73699', $q$Ecommerce$q$, 163, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87666664-2c53-46fa-a364-f66e5fc73699')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a4f59d7b-22f3-4651-83c5-1ef2be39d561', $q$Field Service Management$q$, 164, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4f59d7b-22f3-4651-83c5-1ef2be39d561')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7379ca7a-1799-48c2-ad91-f95ac8a5d44a', $q$SEO$q$, 165, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7379ca7a-1799-48c2-ad91-f95ac8a5d44a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '52458d05-8717-48f5-86d1-82657bc6b73c', $q$Hospitality Software$q$, 166, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52458d05-8717-48f5-86d1-82657bc6b73c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '986e2ed9-aa7c-4773-a8b4-eff9b3073acc', $q$Ecommerce Marketing$q$, 172, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '986e2ed9-aa7c-4773-a8b4-eff9b3073acc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '157cf0db-5d35-4b66-be84-eb1e3a83c275', $q$Property Management$q$, 178, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '157cf0db-5d35-4b66-be84-eb1e3a83c275')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4f0716ee-d34d-41a6-b93a-e4726482363c', $q$No-Code$q$, 180, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4f0716ee-d34d-41a6-b93a-e4726482363c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3d6729f9-da2e-4701-b9b0-94d125d8724f', $q$AI & Content$q$, 183, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3d6729f9-da2e-4701-b9b0-94d125d8724f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ae2f926-10af-48fb-8b25-2c5c215ae206', $q$Property Management$q$, 184, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ae2f926-10af-48fb-8b25-2c5c215ae206')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f0b2bf4b-3d1d-43a6-afe1-642d4e801c38', $q$AI & Content$q$, 186, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f0b2bf4b-3d1d-43a6-afe1-642d4e801c38')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6443678c-663b-4bf6-b1c8-5645ddeae48b', $q$AI Video & Creative$q$, 187, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6443678c-663b-4bf6-b1c8-5645ddeae48b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cf344238-e3b9-426b-af71-7522632c5feb', $q$AI & Content$q$, 189, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf344238-e3b9-426b-af71-7522632c5feb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '25f60fc9-d59c-455d-8081-05e6a4cd7f6f', $q$Advertising$q$, 190, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25f60fc9-d59c-455d-8081-05e6a4cd7f6f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '931bd167-e821-48d8-8380-64059b8835a2', $q$Field Service Management$q$, 193, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '931bd167-e821-48d8-8380-64059b8835a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc546393-34d6-416a-80bf-2e874bcaf168', $q$Project Management$q$, 194, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc546393-34d6-416a-80bf-2e874bcaf168')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '59baa082-ba8c-4a5d-8249-89b94dae0e82', $q$Sales Engagement$q$, 198, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '59baa082-ba8c-4a5d-8249-89b94dae0e82')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0203800f-bffe-4139-8919-c5466800c971', $q$Ecommerce Marketing$q$, 199, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0203800f-bffe-4139-8919-c5466800c971')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '327d1ac7-d2d5-4c9f-85cd-79a59dd1b3a9', $q$Forms & Surveys$q$, 203, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '327d1ac7-d2d5-4c9f-85cd-79a59dd1b3a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54a8da3e-0766-4538-be06-7648eb552e9a', $q$Learning Management$q$, 204, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54a8da3e-0766-4538-be06-7648eb552e9a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eaff9b0a-92d0-49bc-91fb-3894c0e5779b', $q$Experimentation$q$, 205, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eaff9b0a-92d0-49bc-91fb-3894c0e5779b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae54ef19-4ee9-49ce-8b0c-384fc84052de', $q$Learning Management$q$, 206, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae54ef19-4ee9-49ce-8b0c-384fc84052de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dfa0f576-375e-4664-990f-e7cd76855a08', $q$Agency Management$q$, 207, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dfa0f576-375e-4664-990f-e7cd76855a08')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '22872790-a987-4220-a685-a1406d4edc47', $q$ERP$q$, 209, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22872790-a987-4220-a685-a1406d4edc47')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a0f94252-e1f1-4d15-abce-ea3adad314b7', $q$Customer Support AI$q$, 210, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0f94252-e1f1-4d15-abce-ea3adad314b7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fc3cb5d8-f800-4692-a2ad-71a9bdd7d007', $q$Post-Purchase$q$, 212, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc3cb5d8-f800-4692-a2ad-71a9bdd7d007')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b672821a-3f06-4f69-b3b2-0aae182ebd03', $q$FP&A$q$, 217, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b672821a-3f06-4f69-b3b2-0aae182ebd03')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c90beb73-0c05-43b5-baf8-d47ca83e4b79', $q$Scheduling$q$, 218, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c90beb73-0c05-43b5-baf8-d47ca83e4b79')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af325440-f24d-415b-86fc-e363e0fc59ca', $q$Healthcare Practice Management$q$, 220, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af325440-f24d-415b-86fc-e363e0fc59ca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e3a31c54-d19f-4a2e-adc4-375900fa68b7', $q$Backend as a Service$q$, 223, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3a31c54-d19f-4a2e-adc4-375900fa68b7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '25a76d30-e9e5-4707-ae76-35af527f1879', $q$Performance Management$q$, 226, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25a76d30-e9e5-4707-ae76-35af527f1879')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99f95582-8095-46a0-a546-880d2a0bcb62', $q$Financial Operations$q$, 228, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99f95582-8095-46a0-a546-880d2a0bcb62')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '94fee371-6714-4f7a-a8ee-03a30c276f45', $q$Freelance Management$q$, 229, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94fee371-6714-4f7a-a8ee-03a30c276f45')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5d45fb22-c16b-4b91-8bcb-5b311cde202a', $q$Integration Platform$q$, 230, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d45fb22-c16b-4b91-8bcb-5b311cde202a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee9e60e6-fd49-41dd-ae05-b695af663b00', $q$Wellness Business Software$q$, 231, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee9e60e6-fd49-41dd-ae05-b695af663b00')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86cbeea9-002c-4ee6-ae4c-9a957a0ddac5', $q$Internal Tools$q$, 234, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86cbeea9-002c-4ee6-ae4c-9a957a0ddac5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e063344-e609-433a-9c54-6d9b0ceaf1e0', $q$Integration Platform$q$, 237, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e063344-e609-433a-9c54-6d9b0ceaf1e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd428ad87-dc2f-4000-8cbf-2f859842c0e2', $q$Reverse ETL$q$, 238, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd428ad87-dc2f-4000-8cbf-2f859842c0e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd61bfdb3-920c-4a0f-9ee2-5e1066ab4fad', $q$Publishing Analytics$q$, 239, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd61bfdb3-920c-4a0f-9ee2-5e1066ab4fad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5c2b1120-f1c7-444d-87ab-c96a49991abc', $q$Scheduling$q$, 240, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c2b1120-f1c7-444d-87ab-c96a49991abc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '78f9c872-baf1-45b9-a0fe-d001e187a972', $q$Education Software$q$, 241, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '78f9c872-baf1-45b9-a0fe-d001e187a972')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9f2f4160-624b-4573-9f86-316924a90bef', $q$Contact Center$q$, 244, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f2f4160-624b-4573-9f86-316924a90bef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '173b9abf-1695-418b-96a2-735fde0cda14', $q$Code Quality$q$, 247, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '173b9abf-1695-418b-96a2-735fde0cda14')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1edb4549-4d70-4db9-a9f9-dcc4a4151402', $q$Technical Assessments$q$, 248, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1edb4549-4d70-4db9-a9f9-dcc4a4151402')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e322b3d3-fb73-45a5-98a5-5284be52351d', $q$Technical Assessments$q$, 249, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e322b3d3-fb73-45a5-98a5-5284be52351d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fbc45f6f-61ff-4a56-8a88-553e2c604be1', $q$Site Search$q$, 251, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbc45f6f-61ff-4a56-8a88-553e2c604be1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '400be7d4-2ff0-47ef-96d7-c97fc4aff7be', $q$Privacy & Compliance$q$, 252, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '400be7d4-2ff0-47ef-96d7-c97fc4aff7be')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8949c855-f2b6-4ce4-b770-a4d05cadf7c6', $q$Client Portal$q$, 253, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8949c855-f2b6-4ce4-b770-a4d05cadf7c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '74afdfd8-b2c8-49d3-8b9d-145cd93aa5a1', $q$Diagramming$q$, 254, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74afdfd8-b2c8-49d3-8b9d-145cd93aa5a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '50912d95-2ffb-46de-bdc0-da4eb0a6a3c9', $q$Password Managers$q$, 256, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50912d95-2ffb-46de-bdc0-da4eb0a6a3c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7cd459cb-9bf9-45a9-9105-17da32253787', $q$FP&A$q$, 257, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cd459cb-9bf9-45a9-9105-17da32253787')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '989b057a-3a25-45d0-886f-0dfbbf8724f9', $q$Customer Support AI$q$, 258, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '989b057a-3a25-45d0-886f-0dfbbf8724f9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '751de747-e59a-4a4f-82cc-9e75fc14d118', $q$Customer Feedback$q$, 259, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '751de747-e59a-4a4f-82cc-9e75fc14d118')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cad93e21-035b-4876-9d6b-8c917f65846f', $q$Account-Based Marketing$q$, 260, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cad93e21-035b-4876-9d6b-8c917f65846f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a7d5935-ab40-4369-840b-8cd680464d05', $q$Learning Management$q$, 263, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a7d5935-ab40-4369-840b-8cd680464d05')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '864de397-cf7c-4d8c-8d27-85bcd76039ea', $q$Sales Enablement$q$, 264, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '864de397-cf7c-4d8c-8d27-85bcd76039ea')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76653393-82e6-41a9-b9fd-ed278d2da3d1', $q$Telehealth$q$, 268, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76653393-82e6-41a9-b9fd-ed278d2da3d1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3be9dea4-5020-45da-b088-3b9b31932217', $q$B2B Attribution$q$, 270, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3be9dea4-5020-45da-b088-3b9b31932217')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5f9bc23-0abf-4ab3-8c4c-ac391f493df0', $q$Client Management$q$, 271, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5f9bc23-0abf-4ab3-8c4c-ac391f493df0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '85fcfd1c-f469-4e9e-a497-205462724789', $q$Personalization$q$, 273, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85fcfd1c-f469-4e9e-a497-205462724789')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ec33e38-86c5-4762-9e67-3bef4048b02a', $q$Observability$q$, 274, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ec33e38-86c5-4762-9e67-3bef4048b02a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e8d823a0-b22e-4385-96b5-f88df641c52c', $q$Shipping$q$, 275, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8d823a0-b22e-4385-96b5-f88df641c52c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f75017d1-bf1a-4acf-8077-da4b211736fc', $q$Talent Intelligence$q$, 276, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f75017d1-bf1a-4acf-8077-da4b211736fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'afb847b8-c762-444f-98fb-17970c5fa87e', $q$Maintenance Management$q$, 278, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'afb847b8-c762-444f-98fb-17970c5fa87e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4b64abe9-ea99-45d2-bfce-9d5987e1bc53', $q$Customer Engagement$q$, 279, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4b64abe9-ea99-45d2-bfce-9d5987e1bc53')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'feed860d-e4e3-4e28-a456-2e2876d5af6a', $q$Experimentation$q$, 280, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'feed860d-e4e3-4e28-a456-2e2876d5af6a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '815e566a-853d-40b6-b0a5-b988d5fe9bb5', $q$Construction Management$q$, 281, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '815e566a-853d-40b6-b0a5-b988d5fe9bb5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e8e6fbb0-84de-4898-9fb4-1b9e50a47a81', $q$Collaboration$q$, 282, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8e6fbb0-84de-4898-9fb4-1b9e50a47a81')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2f8601df-006c-40ef-98a3-dc9ce90cfbd6', $q$Maintenance Management$q$, 283, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f8601df-006c-40ef-98a3-dc9ce90cfbd6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '649377ce-c8aa-4836-886c-34d3dbfbbe21', $q$Incident Management$q$, 285, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '649377ce-c8aa-4836-886c-34d3dbfbbe21')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd13d59c0-75a5-40e6-8d41-775ee94b6e2c', $q$Contact Center$q$, 286, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd13d59c0-75a5-40e6-8d41-775ee94b6e2c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '04148c06-e073-497a-9242-ba1713b96172', $q$Financial Operations$q$, 288, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04148c06-e073-497a-9242-ba1713b96172')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '74275364-7fa1-4c34-bb85-7dc84558d7f8', $q$Customer Support AI$q$, 289, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74275364-7fa1-4c34-bb85-7dc84558d7f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3eb40f24-a649-43a3-aefd-4f702fab7d4c', $q$Forms & Surveys$q$, 290, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3eb40f24-a649-43a3-aefd-4f702fab7d4c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28b8aaae-94ce-4e47-a7c2-b8b67363c412', $q$Accounting$q$, 293, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28b8aaae-94ce-4e47-a7c2-b8b67363c412')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '60722222-c933-447b-8222-e5897c23a55a', $q$Wellness Business Software$q$, 294, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60722222-c933-447b-8222-e5897c23a55a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3bc99339-b5d1-4442-a8e8-d7c6081cb008', $q$Marketing Analytics$q$, 296, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bc99339-b5d1-4442-a8e8-d7c6081cb008')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '56a31066-ef96-42ec-9124-288a454acea5', $q$Contact Center$q$, 297, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '56a31066-ef96-42ec-9124-288a454acea5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f6e30306-71d8-4a60-b56c-da88f1b87f01', $q$Business Intelligence$q$, 298, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6e30306-71d8-4a60-b56c-da88f1b87f01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48fa9b84-aaa5-4136-8696-fa272450d7e6', $q$Education Software$q$, 300, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48fa9b84-aaa5-4136-8696-fa272450d7e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '415849b1-74d1-45d1-b2ff-e39bfd841ec1', $q$Technical Assessments$q$, 301, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '415849b1-74d1-45d1-b2ff-e39bfd841ec1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f9c375c2-08c7-466b-9c82-17d40f2f0187', $q$Returns Management$q$, 302, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9c375c2-08c7-466b-9c82-17d40f2f0187')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0d0a0c73-7777-4dd2-b55c-c8affd4ede42', $q$Assessments$q$, 303, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d0a0c73-7777-4dd2-b55c-c8affd4ede42')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c241ab3-9f53-47bb-a85c-c7c350c98fe4', $q$Data Integration$q$, 305, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c241ab3-9f53-47bb-a85c-c7c350c98fe4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c7e7430-e49e-4521-a362-f76767c08498', $q$Data Analytics$q$, 306, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c7e7430-e49e-4521-a362-f76767c08498')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9df1f5ac-21b2-4154-871e-e591c9d352be', $q$Sales Enablement$q$, 307, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9df1f5ac-21b2-4154-871e-e591c9d352be')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c95becab-0b51-4561-8b9c-e3c54c6db39a', $q$Reverse ETL$q$, 308, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c95becab-0b51-4561-8b9c-e3c54c6db39a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd21b1480-ca67-461a-9e1a-d39d3ec61806', $q$Maintenance Management$q$, 309, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd21b1480-ca67-461a-9e1a-d39d3ec61806')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0db12c34-7695-4ac3-9d70-d0144ed85603', $q$B2B Attribution$q$, 310, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0db12c34-7695-4ac3-9d70-d0144ed85603')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c2419807-4bd4-4ed5-af99-8afa1290e67e', $q$Business Intelligence$q$, 311, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2419807-4bd4-4ed5-af99-8afa1290e67e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '32339d15-c754-4691-a47a-e7f4ddf6783f', $q$Client Management$q$, 312, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32339d15-c754-4691-a47a-e7f4ddf6783f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '052faa5f-ac3c-4098-a1ce-c5b50de588eb', $q$Marketing Analytics$q$, 314, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '052faa5f-ac3c-4098-a1ce-c5b50de588eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1e11a3c3-d4bf-4d31-85a7-acb0708d39dc', $q$Incident Management$q$, 315, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e11a3c3-d4bf-4d31-85a7-acb0708d39dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '710a9bc6-dc35-42de-b43e-fc6846fa6054', $q$FP&A$q$, 318, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '710a9bc6-dc35-42de-b43e-fc6846fa6054')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f16bdee7-92b9-4fa8-b7d2-d0c65303a6bf', $q$Integration Platform$q$, 319, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f16bdee7-92b9-4fa8-b7d2-d0c65303a6bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4e617ec6-3143-4ba6-9b87-bfaba881c5b5', $q$Contact Center$q$, 321, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e617ec6-3143-4ba6-9b87-bfaba881c5b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5bd18389-d08c-4423-9448-9b472bbcd235', $q$Professional Services Automation$q$, 323, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5bd18389-d08c-4423-9448-9b472bbcd235')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cadf7c77-2ac3-4c2f-921b-c1af05959705', $q$Accounting$q$, 325, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cadf7c77-2ac3-4c2f-921b-c1af05959705')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5a30b73-fc44-4349-818d-7aa3007ac5dc', $q$Product Analytics$q$, 327, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5a30b73-fc44-4349-818d-7aa3007ac5dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb7c3936-cc4b-4e6a-95ed-0a4746e885b2', $q$Site Search$q$, 328, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb7c3936-cc4b-4e6a-95ed-0a4746e885b2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1f3ecb09-4287-42e2-b618-e0b4470078a8', $q$Landing Pages$q$, 329, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f3ecb09-4287-42e2-b618-e0b4470078a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9f85701a-abcb-4093-93cd-4df45a06f69a', $q$Learning Management$q$, 334, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f85701a-abcb-4093-93cd-4df45a06f69a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b4ff542-d760-4922-9015-f5c0a6cf3137', $q$Course Platforms$q$, 335, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b4ff542-d760-4922-9015-f5c0a6cf3137')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8769c57b-cfb6-4aa4-b4fa-7ef9dc7a81fb', $q$Maintenance Management$q$, 336, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8769c57b-cfb6-4aa4-b4fa-7ef9dc7a81fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76e552d3-8ffd-447b-961c-e3146d24ab1d', $q$Returns Management$q$, 339, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76e552d3-8ffd-447b-961c-e3146d24ab1d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a336025e-cea9-4313-ad75-5855aa6f0709', $q$Ecommerce Subscriptions$q$, 340, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a336025e-cea9-4313-ad75-5855aa6f0709')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd672c926-6dc2-4b99-89bc-c3514fb00011', $q$Diagramming$q$, 341, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd672c926-6dc2-4b99-89bc-c3514fb00011')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c57df76-2bd2-4eb9-b3b1-f6b3ca15592f', $q$User Research$q$, 342, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c57df76-2bd2-4eb9-b3b1-f6b3ca15592f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dd4c2b54-357c-408f-bdc6-53e9b9723d32', $q$Developer Email$q$, 343, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd4c2b54-357c-408f-bdc6-53e9b9723d32')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d3cef7c-92e3-4651-9aa1-1518c89a0318', $q$Maintenance Management$q$, 344, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d3cef7c-92e3-4651-9aa1-1518c89a0318')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '57daabd7-81c3-4c0c-9f0a-f20ae44e80d5', $q$Wellness Business Software$q$, 348, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57daabd7-81c3-4c0c-9f0a-f20ae44e80d5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a3f2919-8df7-407d-b926-d5b2bf0626fc', $q$Business Intelligence$q$, 351, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a3f2919-8df7-407d-b926-d5b2bf0626fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f775c2fb-40ed-419d-936b-016c7590c6ff', $q$Learning Management$q$, 352, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f775c2fb-40ed-419d-936b-016c7590c6ff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f8c2f91a-b11e-4e93-a84f-b020cb7e5982', $q$FP&A$q$, 353, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8c2f91a-b11e-4e93-a84f-b020cb7e5982')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '877346bc-cb58-405e-9691-822e936e2018', $q$Client Portal$q$, 354, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '877346bc-cb58-405e-9691-822e936e2018')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e8bf6ad6-95fb-490d-a79e-1d5a19c11679', $q$Customer Data Platform$q$, 355, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e8bf6ad6-95fb-490d-a79e-1d5a19c11679')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0152df58-2709-447a-964c-4270ea6e71ba', $q$Integration Platform$q$, 356, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0152df58-2709-447a-964c-4270ea6e71ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5bc1b618-a1eb-4e8d-b538-dcad46326599', $q$Collaboration$q$, 357, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5bc1b618-a1eb-4e8d-b538-dcad46326599')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f513a89d-983e-4174-9931-98e805499f01', $q$Post-Purchase$q$, 360, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f513a89d-983e-4174-9931-98e805499f01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e23f10af-2d54-454f-b679-455f09aaf906', $q$Education Software$q$, 361, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e23f10af-2d54-454f-b679-455f09aaf906')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '32fc92b6-e72e-4148-88fd-17766debda07', $q$Networking & Security$q$, 363, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32fc92b6-e72e-4148-88fd-17766debda07')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fcd0e455-cfb1-4289-98fb-d9a8ec646eee', $q$Networking & Security$q$, 364, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fcd0e455-cfb1-4289-98fb-d9a8ec646eee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20dd9ab5-719a-409d-b433-2f762e215e76', $q$Marketing Attribution$q$, 365, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20dd9ab5-719a-409d-b433-2f762e215e76')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '556431eb-bbeb-47e6-82b8-658da7c9a953', $q$Ecommerce Personalization$q$, 366, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '556431eb-bbeb-47e6-82b8-658da7c9a953')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a1ccefb2-c4c2-4cad-b78f-69220f73f741', $q$Financial Operations$q$, 368, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1ccefb2-c4c2-4cad-b78f-69220f73f741')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '32651594-0fc7-4605-aa35-3c759bbfcb2b', $q$Privacy & Compliance$q$, 369, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32651594-0fc7-4605-aa35-3c759bbfcb2b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'df107dea-2185-460b-bec0-27725a6c524c', $q$User Research$q$, 370, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df107dea-2185-460b-bec0-27725a6c524c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '878d1d8a-548d-4d8b-8d0f-96fd34fe8714', $q$Privacy & Compliance$q$, 372, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '878d1d8a-548d-4d8b-8d0f-96fd34fe8714')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a730541-8b5d-4e8f-ba22-dddedc2e3ddb', $q$Recruiting AI$q$, 375, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a730541-8b5d-4e8f-ba22-dddedc2e3ddb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd9d03dff-3255-420c-947e-757965ecf14c', $q$Publishing Analytics$q$, 376, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd9d03dff-3255-420c-947e-757965ecf14c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f2c0f71f-ca0d-4fe0-9275-01b2117af396', $q$Payroll & HR$q$, 377, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f2c0f71f-ca0d-4fe0-9275-01b2117af396')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4a5b7719-5ad7-41db-a22f-6a102a9f1851', $q$Networking & Security$q$, 379, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a5b7719-5ad7-41db-a22f-6a102a9f1851')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8a1b32e-48d4-4685-a6de-efc54624e2d0', $q$FP&A$q$, 380, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8a1b32e-48d4-4685-a6de-efc54624e2d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3b7d4d84-67b9-465f-b981-d3669a1cab00', $q$FP&A$q$, 381, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b7d4d84-67b9-465f-b981-d3669a1cab00')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f89031ce-9684-45b9-be0f-9796b29efaf1', $q$Client Management$q$, 383, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f89031ce-9684-45b9-be0f-9796b29efaf1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6282e509-3457-4b93-8265-b748ab78d2d3', $q$Merchant of Record$q$, 385, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6282e509-3457-4b93-8265-b748ab78d2d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1bd98deb-04dc-486b-8078-f1d1c5d9123f', $q$Agency Management$q$, 389, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1bd98deb-04dc-486b-8078-f1d1c5d9123f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48a52bcd-05fa-41f5-ae5a-0871ba3cc554', $q$Education Software$q$, 393, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48a52bcd-05fa-41f5-ae5a-0871ba3cc554')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '25c15fa2-6794-4a09-97aa-3e10ac4825d0', $q$Ecommerce Subscriptions$q$, 396, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25c15fa2-6794-4a09-97aa-3e10ac4825d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ab9588f2-1c10-4c3c-b719-fb216070c3bb', $q$Returns Management$q$, 399, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab9588f2-1c10-4c3c-b719-fb216070c3bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4494fb93-4406-4841-99d6-ef4bc14b06fd', $q$Marketing Attribution$q$, 401, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4494fb93-4406-4841-99d6-ef4bc14b06fd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8cf4b452-233d-4d9a-830a-cae4d82ffe0f', $q$Account-Based Marketing$q$, 402, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8cf4b452-233d-4d9a-830a-cae4d82ffe0f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '92a0ab78-1cc4-4730-8d44-9e2c488c4b0e', $q$Incident Management$q$, 403, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '92a0ab78-1cc4-4730-8d44-9e2c488c4b0e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a902f60d-e675-4d4b-9855-daa93ca4e741', $q$Accounting$q$, 405, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a902f60d-e675-4d4b-9855-daa93ca4e741')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '55e44902-2547-422a-b09c-4d574cfc8c9a', $q$Learning Management$q$, 406, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '55e44902-2547-422a-b09c-4d574cfc8c9a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7f6a8ade-225c-421f-9bcc-d905c69af995', $q$Sales Productivity$q$, 408, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f6a8ade-225c-421f-9bcc-d905c69af995')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7ce007d-cf2e-452c-8623-d5bc784a925d', $q$Site Search$q$, 409, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7ce007d-cf2e-452c-8623-d5bc784a925d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a37dbc0-b66a-45e5-8ad0-106ba901316f', $q$Sales Enablement$q$, 411, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a37dbc0-b66a-45e5-8ad0-106ba901316f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54c9ac1e-8b54-4235-b813-fc689d95b74a', $q$Fulfillment$q$, 413, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54c9ac1e-8b54-4235-b813-fc689d95b74a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '40c8e6d6-a54e-4979-8815-394b735af5cb', $q$Shipping$q$, 414, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40c8e6d6-a54e-4979-8815-394b735af5cb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9c74bbe3-539f-4a9f-9e0a-d5299afe0145', $q$Shipping$q$, 415, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9c74bbe3-539f-4a9f-9e0a-d5299afe0145')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e984c2fb-7229-42f9-a6fb-d00f2093d36d', $q$Sales Enablement$q$, 416, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e984c2fb-7229-42f9-a6fb-d00f2093d36d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '059a6793-6413-4b81-a6f5-4051ea8d982a', $q$Customer Support AI$q$, 417, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '059a6793-6413-4b81-a6f5-4051ea8d982a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ef287211-f3e9-48ed-977f-15a79f0dff44', $q$Business Intelligence$q$, 418, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef287211-f3e9-48ed-977f-15a79f0dff44')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '632c30a4-55d3-4409-96c8-76a72f24f1cf', $q$Ecommerce Subscriptions$q$, 422, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '632c30a4-55d3-4409-96c8-76a72f24f1cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b9356b20-ff3e-43eb-8ad9-d71bbb6abb12', $q$Database & Workflow$q$, 423, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9356b20-ff3e-43eb-8ad9-d71bbb6abb12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '41483103-65cc-4511-bc4b-ee5c2d514a88', $q$Integration Platform$q$, 425, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41483103-65cc-4511-bc4b-ee5c2d514a88')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '341d638b-e144-4b9b-9e2b-697048be5c92', $q$Developer Email$q$, 426, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '341d638b-e144-4b9b-9e2b-697048be5c92')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b0f68f6-01e9-4052-b48f-9e86cac7943f', $q$Code Quality$q$, 427, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b0f68f6-01e9-4052-b48f-9e86cac7943f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8e81f9e1-c192-426c-990a-528a1d05bb0f', $q$Feature Management$q$, 429, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e81f9e1-c192-426c-990a-528a1d05bb0f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '24398c57-f20b-4c53-8411-8252f29a9d75', $q$User Research$q$, 430, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24398c57-f20b-4c53-8411-8252f29a9d75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd22443ad-ac19-4279-a9ee-99becdc96c04', $q$Data Integration$q$, 431, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd22443ad-ac19-4279-a9ee-99becdc96c04')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ca3044b9-6273-444b-bab4-164eae1b3912', $q$Client Portal$q$, 432, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca3044b9-6273-444b-bab4-164eae1b3912')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '513bcd32-d272-413c-af04-54647f2d8ccf', $q$Customer Feedback$q$, 434, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '513bcd32-d272-413c-af04-54647f2d8ccf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8989ac7-0ad9-4ad5-a598-aa3716ef2a88', $q$Landing Pages$q$, 435, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8989ac7-0ad9-4ad5-a598-aa3716ef2a88')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aaf14d5b-b5b0-4ad6-8d1a-cc790447a3fb', $q$Learning Management$q$, 437, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aaf14d5b-b5b0-4ad6-8d1a-cc790447a3fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1635104d-8558-4a8a-9377-59ac3d5baa56', $q$Contact Center$q$, 438, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1635104d-8558-4a8a-9377-59ac3d5baa56')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13cd7073-dbf2-42d0-8028-9cb27ab9c6d6', $q$Social Listening$q$, 439, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13cd7073-dbf2-42d0-8028-9cb27ab9c6d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76ba1d86-95da-4bac-b6d2-d21f92c304e9', $q$Education Management$q$, 442, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76ba1d86-95da-4bac-b6d2-d21f92c304e9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '18737f8c-c44b-4057-a871-fb4465ed6a0a', $q$Customer Data Platform$q$, 443, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18737f8c-c44b-4057-a871-fb4465ed6a0a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '223c71a5-b6cb-4905-9f70-574d9f9bc8af', $q$Account-Based Marketing$q$, 445, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '223c71a5-b6cb-4905-9f70-574d9f9bc8af')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c2afb871-434c-42dc-82de-1021ad1d8ac4', $q$Privacy & Compliance$q$, 446, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2afb871-434c-42dc-82de-1021ad1d8ac4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a950e66-7ffc-4b83-8ac3-183aa254ec2e', $q$Assessments$q$, 447, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a950e66-7ffc-4b83-8ac3-183aa254ec2e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'faca3beb-680a-498b-bb09-9ae519c2e0a9', $q$Business Intelligence$q$, 449, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'faca3beb-680a-498b-bb09-9ae519c2e0a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1f8afccf-e8ad-407d-aa77-4eba5dae8e7d', $q$Internal Tools$q$, 450, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f8afccf-e8ad-407d-aa77-4eba5dae8e7d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b0fbf5b-29c2-4f24-9d58-db28da8606fb', $q$Privacy & Compliance$q$, 452, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b0fbf5b-29c2-4f24-9d58-db28da8606fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b292c601-890e-4094-9058-d1f0720c453e', $q$CI/CD$q$, 453, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b292c601-890e-4094-9058-d1f0720c453e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7f352cab-bdc4-4795-9159-696405ba43ec', $q$Payroll & HR$q$, 454, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f352cab-bdc4-4795-9159-696405ba43ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d579de2-f5fd-4cce-b695-94dd73f07475', $q$Ecommerce Analytics$q$, 455, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d579de2-f5fd-4cce-b695-94dd73f07475')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8abb4e68-07aa-47d3-b94c-67246c27a367', $q$Contact Center$q$, 456, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8abb4e68-07aa-47d3-b94c-67246c27a367')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7071772a-c4c1-4f50-b21d-a167f4f36c3a', $q$Customer Support AI$q$, 458, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7071772a-c4c1-4f50-b21d-a167f4f36c3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a70b797c-66e9-47b6-b16a-d536e6b511bf', $q$Maintenance Management$q$, 460, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a70b797c-66e9-47b6-b16a-d536e6b511bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7416111b-9380-4361-bcc9-07efc1c638dd', $q$Wellness Business Software$q$, 463, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7416111b-9380-4361-bcc9-07efc1c638dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28fbaa0e-4698-4f41-9fd6-4a80bc9f22e0', $q$FP&A$q$, 465, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28fbaa0e-4698-4f41-9fd6-4a80bc9f22e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f7867979-6c3b-4e9c-b1de-7358343a5a3b', $q$Assessments$q$, 466, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7867979-6c3b-4e9c-b1de-7358343a5a3b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a9272287-5009-4120-bb26-743a2c3e388b', $q$Experimentation$q$, 467, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9272287-5009-4120-bb26-743a2c3e388b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dac530ad-b9a1-4e6d-958f-e36fbc0aee5e', $q$Diagramming$q$, 470, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dac530ad-b9a1-4e6d-958f-e36fbc0aee5e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '01d5ea65-cfa6-4646-a4a5-95d41b4e1c4c', $q$Marketing Analytics$q$, 471, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01d5ea65-cfa6-4646-a4a5-95d41b4e1c4c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b7fec722-c877-4dff-8d06-1e2c28e79d01', $q$Customer Analytics$q$, 472, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7fec722-c877-4dff-8d06-1e2c28e79d01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e8f3291-8805-474a-9765-cbf43ed18cf8', $q$Backend as a Service$q$, 474, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e8f3291-8805-474a-9765-cbf43ed18cf8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f6d13d57-a73c-4c25-bd7d-0b250e0f351f', $q$Wellness Business Software$q$, 475, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6d13d57-a73c-4c25-bd7d-0b250e0f351f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '38d8271b-389d-4a5c-972d-8334f4d1f507', $q$Networking & Security$q$, 477, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38d8271b-389d-4a5c-972d-8334f4d1f507')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3cd4d25e-1743-4778-9ea6-b9436a0b290f', $q$Contract Management$q$, 481, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cd4d25e-1743-4778-9ea6-b9436a0b290f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '408b4a51-44c6-46e4-a026-286c555744de', $q$Subscription Billing$q$, 486, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '408b4a51-44c6-46e4-a026-286c555744de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '969013c8-45e7-4dd5-a5af-ce00c8bebe8f', $q$Cybersecurity$q$, 489, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '969013c8-45e7-4dd5-a5af-ce00c8bebe8f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '50bd3bb7-d6d3-4418-956d-523512e40c34', $q$Education Software$q$, 492, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50bd3bb7-d6d3-4418-956d-523512e40c34')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b268513b-5d42-4fff-badc-9c4bb25ce66b', $q$Email Marketing$q$, 2, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$No-Code$q$, 3, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Advertising$q$, 5, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Social Media$q$, 7, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$AI & Content$q$, 10, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('943e842e-ea6b-423a-ad07-1657fff38f93', $q$CRM$q$, 12, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Recruiting$q$, 14, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Email Marketing$q$, 16, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('adb39746-99f6-497c-bc76-0bb5b5de259e', $q$HR Software$q$, 17, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e9285583-523b-4e6a-b932-0f19d3c503b8', $q$Project Management$q$, 18, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c3103af2-b89a-4cb2-ac57-83030df19efa', $q$Ecommerce$q$, 19, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('7cac63e1-ade1-4e49-9c9c-3d85ed715d3a', $q$Recruiting$q$, 22, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('fd2949bf-02b3-4401-a031-61e56f53b753', $q$Email Marketing$q$, 23, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('90a5952e-cd43-4cf5-bc88-317304be7a50', $q$Expense Management$q$, 24, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('cdbd18ff-a281-4cb1-87dc-90ab666683fe', $q$No-Code$q$, 25, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a6203d78-992e-46dd-84e0-13212a7b5a75', $q$Social Media$q$, 26, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f19864e7-5001-4ebd-84f9-5bb40f1b4b22', $q$Email Marketing$q$, 28, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8c59b3c9-1d5c-41aa-8b9d-d87093081798', $q$Project Management$q$, 31, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('59e7c6f4-7f3f-4a9d-a078-a2b7d95263db', $q$Subscription Billing$q$, 32, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('7de794bf-b842-4128-82f7-b18545f5a992', $q$SEO & Content$q$, 34, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('63a64c42-cc4a-45fb-b461-783e43ab44aa', $q$CRM$q$, 35, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d46e98c7-b182-4988-9c3a-b509b0e2beff', $q$Email Marketing$q$, 38, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ca95321e-8259-4037-a292-11f90e6c3856', $q$CRM$q$, 41, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3c515695-9a2f-4479-901f-6ca785a0e07c', $q$AI & Content$q$, 42, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('4f75ddaa-758b-4b98-b9a1-7abb4b581a78', $q$CRM$q$, 45, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b1f76735-5538-4701-8d39-11c92919d1d4', $q$Customer Support$q$, 46, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8ba3ae79-2d46-4049-881a-4cf6417f0f42', $q$Global HR$q$, 47, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('381765dd-2a06-4f6d-87c2-9252da262faf', $q$Email Marketing$q$, 52, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('22ab0c21-f5e6-4e9a-919f-4e80fdc79abb', $q$Expense Management$q$, 55, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0f3743e6-4384-4d1d-8b20-c6c59c84ed3d', $q$HR Software$q$, 56, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ab7b3699-804e-44f2-83c1-0814b44d388b', $q$AI & Content$q$, 59, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e36a0c09-82ff-48bd-9da0-38f045bb10a2', $q$Customer Support$q$, 60, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('83a31e14-8b81-4e6f-bd44-bf1082ccd21f', $q$Email Marketing$q$, 63, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('cd77df40-1f67-4666-a14d-e6d3b6245dbf', $q$No-Code$q$, 64, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('421bda78-e5b8-4973-86a7-1481632d297e', $q$Customer Support$q$, 65, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8069bad0-6be8-4d8e-bbf8-5cdf38829228', $q$AI & Content$q$, 66, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('69afcc2a-09a4-49b5-a478-dc5c7b9d0240', $q$Recruiting$q$, 67, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('93a4e3c6-9406-420d-bf93-f0605bae4c10', $q$Customer Support$q$, 70, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b433c3e5-1372-4d99-8fbd-7702d9586534', $q$AI Video & Creative$q$, 73, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('113b6907-6942-4e86-a060-16d7decf6a9f', $q$HR Software$q$, 74, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e05880b5-22df-4a10-a038-632711020632', $q$Project Management$q$, 75, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('db35ba3a-f84e-424f-82ef-b3154b5d2ca0', $q$Social Media$q$, 76, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('bbbaf42a-877b-4574-bbcf-56a9d704be00', $q$Field Service Management$q$, 78, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('1e0af591-0b3b-4416-988d-d1b31d3ab630', $q$AI & Content$q$, 79, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e511c2d2-ceea-48e2-bbc6-ea875df08668', $q$CRM$q$, 80, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('15dd21fe-ee11-4215-995a-79327176360a', $q$AI Video & Creative$q$, 81, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c0335fd7-e7db-4c6c-8ece-4a1bf5b78c12', $q$Contract Management$q$, 82, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d87ead8b-8c90-424b-ae07-9b4003510b45', $q$AI & Content$q$, 83, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8edc4560-4c87-4f48-9ba0-8af1a559a2e7', $q$Recruiting$q$, 84, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c23b8837-4a75-4e45-83cf-8a217ebf06ae', $q$Field Service Management$q$, 85, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e36dac6a-4141-4189-8ee8-eb6f2ed8f21f', $q$CRM$q$, 87, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('86565576-9938-418e-8b55-ba39e12ff033', $q$Email Marketing$q$, 89, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d3223547-1bc9-472d-8449-260dc6b88988', $q$Email Marketing$q$, 90, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('45cee20f-f1da-4f5d-86e5-485b9a0b34b6', $q$Customer Support$q$, 91, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('34b4f794-ce37-4598-b6e9-fe9e9269a4c8', $q$Social Media$q$, 92, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('25b50035-747c-462e-a2db-a4e3b14e8c02', $q$CRM$q$, 93, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e059a784-d8bc-45d5-ab94-fea4f0338c4e', $q$Recruiting$q$, 94, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('00ba7518-5599-46d0-b82c-32563e1bac39', $q$Customer Support$q$, 98, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0b8a0924-eba0-43ca-b6e5-f3c97392c07e', $q$Social Media$q$, 100, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('eb14d50a-e3a5-457e-8b21-c45cdda89d54', $q$Email Marketing$q$, 103, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('bf487e99-d6ce-4329-b02b-a9efe905e265', $q$Automation$q$, 104, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('1677b9b7-dd62-421f-95ae-ac5647c1cc29', $q$SEO$q$, 105, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b77c4b21-5cd3-47b0-a144-34c9f0369acb', $q$SEO & Content$q$, 106, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0af4f822-0c8a-4a66-b0ae-4dcb5e2d9f6b', $q$Social Media$q$, 107, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('639091c6-3897-46d2-b20e-6a7dfd423bec', $q$CRM$q$, 110, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('5bf89844-295b-44a9-b875-c4f86ae4f19d', $q$Email Marketing$q$, 111, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ed5feb5f-02cf-4bc0-a6b1-e14c52f7aab2', $q$SEO$q$, 112, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('55145ca3-38c5-472e-91e5-8e0f54c3f703', $q$SEO & Content$q$, 114, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f3558245-b91d-4875-b0dc-3842ac4f3805', $q$CRM$q$, 115, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('336862e5-da77-44d8-bed2-981fb6c31cb8', $q$Project Management$q$, 117, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('de6eb85c-e884-4464-97df-4e4c4479c1d0', $q$CRM$q$, 118, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('96c3ecf0-fcaf-4131-91d0-08ec9da68acf', $q$Customer Support$q$, 120, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('902d8b1b-af39-4cdf-a2b7-db0c5672b059', $q$Email Marketing$q$, 121, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8551a49c-f983-4a46-ad50-c9e06a796573', $q$AI Video & Creative$q$, 123, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('53bb6923-d4d1-4ead-bd6a-7aa8450e41ee', $q$AI & Content$q$, 124, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('6a07317c-b1f1-40dd-a137-ed66a88f82a7', $q$Project Management$q$, 127, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3ed578b8-4db9-4fce-98af-7a24c8e0021c', $q$HR Software$q$, 129, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e9f9ecc1-a538-4c7f-b987-67a12f749876', $q$CRM$q$, 131, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d33a449d-fed5-4373-8185-a70d16979e8b', $q$Social Media$q$, 132, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2160b497-eee0-445d-8e03-8e017410723b', $q$Project Management$q$, 133, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('272fac60-438a-4487-9d22-a04e72fbaf3e', $q$AI & Content$q$, 135, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e279aac8-93be-4884-86b3-544687f01909', $q$Social Media$q$, 136, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f18cd757-37d4-43bb-966d-11c389f63bb7', $q$AI & Content$q$, 137, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('73bfc873-4265-4959-93b9-df520ad9fcd5', $q$Expense Management$q$, 138, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('6b1fba57-cd15-424e-804c-46b51d8f4396', $q$Recruiting$q$, 141, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2899eedd-31f8-47bb-91c7-6b9e3cb0215b', $q$Subscription Billing$q$, 142, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ad16437d-1117-4ccd-976f-2e70d7ae268c', $q$Global HR$q$, 143, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('7f58ae22-1c44-4f9a-9b61-75861272aaaa', $q$HR Software$q$, 148, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('82e23514-860e-4179-aa6e-cc95f88d7372', $q$AI Video & Creative$q$, 150, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ae913412-1cd7-414a-b291-f3e2c6aabc3b', $q$AI & Content$q$, 152, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d43520c9-b82b-4496-a05c-754885af835f', $q$AI & Content$q$, 154, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('fd5e3d2c-6ddc-4750-8bd5-ba653068f181', $q$SEO$q$, 155, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('71aee4e7-d181-4086-ac46-c52b1a6ba51e', $q$Social Media$q$, 157, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f4b7a227-b58a-4c5d-b4e2-c8b940afb795', $q$SEO$q$, 159, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('6fc3837d-ade3-437f-ac16-1a4ee783c3f8', $q$Field Service Management$q$, 162, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2713c5df-5f0a-4c25-8922-9c315b9b040b', $q$Project Management$q$, 167, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Social Media$q$, 168, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3c1c11fd-4faf-4d6c-8f2f-a21304ececf9', $q$No-Code$q$, 169, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Social Media$q$, 170, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$SEO$q$, 171, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('279c7ff2-d20a-4f79-bdc5-e15f28fdc531', $q$AI & Content$q$, 173, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('4bde6dc2-b8d1-4b46-8cc1-d1490acca3d0', $q$CRM$q$, 174, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('5ac53984-b400-454f-baed-b707bfdb12ec', $q$AI Video & Creative$q$, 175, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Recruiting$q$, 176, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ff2a2bb2-265f-4fb2-8b9b-06a77db11584', $q$Project Management$q$, 177, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$AI & Content$q$, 179, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('6e610684-65a5-4699-9418-e1149b45dc11', $q$Customer Support$q$, 181, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('08775de0-0ff3-40d7-ba33-f4d648f4381a', $q$Project Management$q$, 182, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$SEO$q$, 185, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Social Media$q$, 188, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a5fa585a-6104-495a-a452-912fb307c35f', $q$AI & Content$q$, 191, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('63552ca4-8785-47c6-9aaf-f0643adf97b5', $q$Recruiting$q$, 192, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d4a5fa48-12d7-422f-9252-b7bea83b9ff4', $q$Project Management$q$, 195, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ca1d9da3-5f04-44f4-a493-8de2c1275125', $q$AI & Content$q$, 196, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f31dc073-4cc3-41a0-aee3-8701aed38b64', $q$AI & Content$q$, 197, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('925daab1-05f1-463d-acca-f58f8cdc0978', $q$Automation$q$, 200, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ca9138f2-35fd-49cf-8af2-819fa2691854', $q$CRM$q$, 201, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d6fe9497-6864-400b-8879-65cfc6655084', $q$Subscription Billing$q$, 202, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Scheduling$q$, 208, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('21bdfa23-af5d-4b48-9a08-e0e8a30bd531', $q$Payroll & HR$q$, 211, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b10c6b8a-40e2-4fc2-ad32-f46718541193', $q$Contact Center$q$, 213, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f8d0b370-224b-4156-8af1-97a407f171ba', $q$Database & Workflow$q$, 214, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Forms & Surveys$q$, 215, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d40dfcb1-d37b-4b46-88e3-e3880ecbeec8', $q$Product Analytics$q$, 216, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('eb2d22a1-1ce3-4203-a28c-4dcd411456cf', $q$Video Conferencing$q$, 219, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Identity Management$q$, 221, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Construction Management$q$, 222, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ff227d86-ddbd-4dae-a781-076d3958c64f', $q$Newsletter Software$q$, 224, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('95c9d0a5-64da-46ca-b8b7-a7245a366020', $q$Proposals & Contracts$q$, 225, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('5f612c37-64e2-4aeb-a2a0-9b6d63df09b4', $q$Learning Management$q$, 227, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('76c85988-2b96-4585-b424-bd7aa44ecb82', $q$Social Listening$q$, 232, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('38f31757-caed-4a00-b556-ce49f176b713', $q$Customer Engagement$q$, 233, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ab6eb6c8-1825-4ab1-b5fc-02b6eae68a88', $q$Construction Management$q$, 235, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('5799f1ce-5e51-44c3-9992-d68250deeb71', $q$Website Builder$q$, 236, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('4a9597db-c7eb-4543-a969-70c7a5b25c4e', $q$Legal Practice Management$q$, 242, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a9f437c8-3fc1-4fa0-b4fb-d1a65cd81f29', $q$Networking & Security$q$, 243, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('eb149729-5f83-425f-8d50-05c96971bdf3', $q$Construction Management$q$, 245, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('68d2cc39-83c1-4877-8a8c-2057a904b538', $q$Database & Workflow$q$, 246, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8d0cb449-bb08-4c54-9e30-c13e9e4fee0c', $q$Forms & Surveys$q$, 250, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('88c573c2-bcec-44cf-a9cb-80c691b977d7', $q$Customer Engagement$q$, 255, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('38565ec2-30ed-445f-b1d3-7ebd8fe67504', $q$Video & Creative$q$, 261, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3d765235-7add-4917-a93e-2e11d8fe95a8', $q$Contact Center$q$, 262, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e2f3e916-a6c5-4d8f-9d3a-df43e916f33c', $q$Business Intelligence$q$, 265, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('4cf9cd65-f41d-4829-821a-01a2e4394707', $q$Website Builder$q$, 266, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0c7ffe5d-03a8-4aa8-aa1e-04f31e023da0', $q$User Research$q$, 267, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('658c8cb8-ea59-4b89-bc57-b008fda4a4bd', $q$Healthcare Practice Management$q$, 269, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('1a2fc4b5-8703-4434-a8f7-702d91a3ded6', $q$Website Builder$q$, 272, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('800f1735-5876-4cb4-b6d8-d7bee24e7a9f', $q$Audio & Podcasting$q$, 277, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3190d2c9-97ab-4131-81ee-15a9bb5745a2', $q$Backend as a Service$q$, 284, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('77bcbe4d-ff51-41f9-a9da-963c98821e89', $q$Data Integration$q$, 287, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e0d19f35-3b93-4946-be3c-8f0848baac1e', $q$Forms & Surveys$q$, 291, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0eb2413c-7ff7-4575-ac2b-3bd288d5a1e3', $q$Website Builder$q$, 292, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c9d6721c-323e-461a-9e3f-5f4dfc9baedb', $q$Accounting$q$, 295, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('504c1944-1d50-48a6-8bbd-c32da5230932', $q$Web Analytics$q$, 299, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('cba47027-91c4-4aeb-adf8-67c52b50f458', $q$Product Analytics$q$, 304, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('65ed3bfb-065e-4391-8e0f-5ffc7b205daa', $q$Digital Experience$q$, 313, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('45bcdd12-fc73-4e69-a6ec-4961fd076322', $q$Landing Pages$q$, 316, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('5fc7d423-2bfb-4923-85a9-5d419bf4c26f', $q$Customer Engagement$q$, 317, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('bd5a4743-03ea-4f41-9507-17a3a9f17894', $q$Forms & Surveys$q$, 320, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c36767cb-32ab-4d26-8f68-e5a87e160f08', $q$Course Platforms$q$, 322, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('27a0d263-d000-4bfb-ac14-1b67221d0428', $q$Video & Creative$q$, 324, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('cb3933a8-b7e0-4fcb-a19a-28725cbedc5d', $q$Password Managers$q$, 326, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('347340e4-2920-47db-a757-9978b6eb89a7', $q$Employee Experience$q$, 330, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d6a26ca4-38a0-43e3-8120-1f2c0a119cc1', $q$Feature Management$q$, 331, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3d29e78e-8c66-4222-a921-bf433a98f869', $q$Legal CRM$q$, 332, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d9e98516-f585-417e-b8e1-aa7ccf705fd5', $q$Landing Pages$q$, 333, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('742217b9-34b3-4a6b-ba4a-7592b4fc8b20', $q$User Research$q$, 337, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2f887979-d5df-489e-930d-a372b71f2354', $q$Async Video$q$, 338, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f57787ac-8e11-4769-9b64-15fa4453a73c', $q$User Research$q$, 345, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f0e66535-3ff0-4403-abac-5c27a5f34b18', $q$Media Intelligence$q$, 346, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('697e3318-d5de-4b30-adef-f66e599b0f6d', $q$Social Listening$q$, 347, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0428a5b1-b8f8-4d1b-baf7-bf63ca5c612f', $q$Collaboration$q$, 349, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('9163dedf-1317-4248-a79a-e9fd4b8cf999', $q$Product Analytics$q$, 350, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e08399eb-07db-4b71-82b5-43cef3fcf199', $q$Audio & Podcasting$q$, 358, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b4459135-cfd3-4027-bdc1-046357985283', $q$Legal Practice Management$q$, 359, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('26474910-f9a4-4767-aebb-d9caf5983498', $q$Cloud Platform$q$, 362, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2f2cd50a-fcbc-4f86-9f47-5b2d1457d871', $q$Knowledge Management$q$, 367, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('5de91ee1-beae-41ba-afc9-53772c7393cb', $q$Experimentation$q$, 371, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b183037a-4efe-4a36-bad0-06a1402afd4b', $q$Incident Management$q$, 373, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b3f994ed-6c32-4065-b748-3f9cadf0652e', $q$Forms & Surveys$q$, 374, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('732bd846-a2ef-4fbe-a773-dbbef676dd2d', $q$Payroll & HR$q$, 378, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('9b3f0303-3e4e-44b8-b85b-8e246173d906', $q$Construction Management$q$, 382, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('11aeaa6f-ca3a-4980-80c9-07d68c56564a', $q$Course Platforms$q$, 384, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ff342572-8c41-421f-88e9-ab4155b8dbbf', $q$API Development$q$, 386, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('278217f3-1beb-4f01-8213-5430c71d5245', $q$Legal Practice Management$q$, 387, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('bc3b8540-7633-45e3-8bb9-3540341f319d', $q$Construction Management$q$, 388, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('95f3299d-181e-4436-824f-a995c9317a92', $q$Proposals & Contracts$q$, 390, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('94b9a1ae-427d-49ec-bb26-75d68dd17562', $q$Business Intelligence$q$, 391, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3b111844-9cfa-4a96-813d-555779600f9d', $q$Experience Management$q$, 392, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('23dde3d1-1c69-4fd8-bdea-41ceb5449c9a', $q$Proposals & Contracts$q$, 394, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b696da65-5315-4c8c-b34f-3a2fe6617f10', $q$Cloud Platform$q$, 395, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('87cb32a2-9663-4c3e-a003-f1735380ac01', $q$Cloud Platform$q$, 397, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('395c608c-5d39-431e-9dd4-670981dd1352', $q$Internal Tools$q$, 398, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('92a082b4-89b7-491c-a783-39088d0397e1', $q$Contact Center$q$, 400, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f4698c6b-f210-42dd-bcc1-bc0d8ae274f3', $q$Accounting$q$, 404, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('534a63de-bd62-4e46-81b3-354224a9fcb1', $q$Work Management$q$, 407, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('d52ac061-1ae2-4441-9edf-ab136e3ac5ac', $q$Customer Data Platform$q$, 410, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f8f6d9c2-d0cd-4055-9836-236ee79834a7', $q$Cybersecurity$q$, 412, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c1f93663-fc76-4430-8326-61a4f8cb731a', $q$Practice Management$q$, 419, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('46f3d2a9-02b8-43f2-a139-956dd022d4b6', $q$Scheduling$q$, 420, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('aec91730-c8dd-4844-8f50-8eb053c6b5c4', $q$Business Intelligence$q$, 421, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('41637f09-c19d-4491-9683-03950483e648', $q$Legal Practice Management$q$, 424, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Audio & Podcasting$q$, 428, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a2099be2-0fe5-4bea-8970-af25479c0e1a', $q$Marketing Analytics$q$, 433, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c69ab424-480e-464f-8a10-266de3ca5887', $q$Networking & Security$q$, 436, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('65992870-15b8-4319-a2e6-b0c8037a92bf', $q$Forms & Surveys$q$, 440, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Course Platforms$q$, 441, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('fdb22c7e-5eac-4888-bd83-48ca29adb96d', $q$Healthcare Practice Management$q$, 444, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('6f813de0-d2a3-471f-a9eb-5435220544a4', $q$Course Platforms$q$, 448, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('4fba1a19-3d7b-4619-b54f-30bc07736976', $q$Restaurant Software$q$, 451, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('263195a9-55ed-4e99-acf2-d53db84ad056', $q$Payroll & HR$q$, 457, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a3310151-7d88-4c23-b959-1faaa5132f8d', $q$Landing Pages$q$, 459, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$User Research$q$, 461, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$User Research$q$, 462, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('409ea4dc-896f-4857-8834-ef3e42d8555a', $q$Video & Creative$q$, 464, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('e5e2d12b-a101-4a07-8262-007ffad934e6', $q$Accounting$q$, 468, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('5a9eace0-9ae6-46ca-a41f-e970f5f11aea', $q$Video Conferencing$q$, 469, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('106def15-bc26-47dd-b9c7-dbb691ff1a8c', $q$Forms & Surveys$q$, 473, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('970dd292-16fa-475f-996d-e50070df18a1', $q$Accounting$q$, 476, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8b5dba74-01a8-4dc3-bb43-d474f4a18943', $q$SEO$q$, 478, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Project Management$q$, 479, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('dbd701b9-01ba-4402-984c-660c90af0d4b', $q$Project Management$q$, 480, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('453ae436-57ca-4b8a-8abd-3f36dcefa927', $q$Email Marketing$q$, 482, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('7bc1e8a6-de99-4eb8-9968-c92bb4254013', $q$Project Management$q$, 483, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3564d834-f51a-4718-9030-849e68652d1f', $q$SEO$q$, 484, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Ecommerce$q$, 485, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b87bf8ae-75dd-4294-97a0-45d392ce365a', $q$Customer Support$q$, 487, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a69c9e8e-2b63-4936-9731-f85ffcfa1860', $q$Scheduling$q$, 488, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b7e3de09-3d1f-4cf2-8337-c269090981c8', $q$Observability$q$, 490, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('8af9c066-32c1-4f6a-8dc1-50233b5e3a3b', $q$CRM & Marketing$q$, 491, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f36057a5-8bfe-46d6-b430-56cb10cd464c', $q$Observability$q$, 493, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3030433b-3418-43ac-aa59-beb69c92a481', $q$Identity Management$q$, 494, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Website Builder$q$, 495, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Forms & Surveys$q$, 496, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('bb9a5203-561f-405b-883a-bf1a1d13b0fd', $q$Forms & Surveys$q$, 497, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3a3ebe73-ba0d-4cfd-884e-37df2cf4210d', $q$Cloud Platform$q$, 498, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('33552c2c-cd73-4391-9fd5-c7a4f0df8e9e', $q$Website Builder$q$, 499, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2a6940b9-4b57-4612-8541-84535793b340', $q$Website Builder$q$, 500, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch10$q$)
ON CONFLICT (tool_id) DO NOTHING;

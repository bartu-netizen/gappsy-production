-- Data for the v4 500-target bulk import (batch 4, see 20260718100000 for
-- the companion new-categories migration). Idempotent: every INSERT is
-- ON CONFLICT DO NOTHING keyed on tools.slug or
-- tool_strategic_metadata.tool_id. New tools land as
-- status='needs_review', noindex=true, sitemap_eligible=false — invisible
-- to the public site until enrichment (Phase B) reviews and publishes them.

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$corteza-crm$q$, $q$Corteza CRM$q$, $q$https://cortezaproject.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '016aac11-14a9-4e56-958c-3b361e5b1ef4', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '016aac11-14a9-4e56-958c-3b361e5b1ef4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$atomic-crm$q$, $q$Atomic CRM$q$, $q$https://marmelab.com/atomic-crm$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$krayin-crm$q$, $q$Krayin CRM$q$, $q$https://krayincrm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a346f9ff-ee8c-46ac-9a67-521ae858c58b', 'f43e4da0-c358-49a1-b584-e37a4c91ebee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a346f9ff-ee8c-46ac-9a67-521ae858c58b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$odoo-community$q$, $q$Odoo Community$q$, $q$https://www.odoo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e2c5c190-2aaa-46b6-b142-c38b763e334a', '00f06335-a253-4204-b2ee-d67b6ff99ecd', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2c5c190-2aaa-46b6-b142-c38b763e334a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('99b0c7e3-3443-428c-9117-bae2653976d1', $q$frappe-books$q$, $q$Frappe Books$q$, $q$https://frappebooks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '99b0c7e3-3443-428c-9117-bae2653976d1', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99b0c7e3-3443-428c-9117-bae2653976d1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$akaunting$q$, $q$Akaunting$q$, $q$https://akaunting.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$invoice-ninja$q$, $q$Invoice Ninja$q$, $q$https://www.invoiceninja.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a4e1855-1280-4e6d-addb-b37221f3a3ec', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a4e1855-1280-4e6d-addb-b37221f3a3ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('607fbb48-621c-4c7e-b652-55e4892d86ce', $q$crater$q$, $q$Crater$q$, $q$https://craterapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '607fbb48-621c-4c7e-b652-55e4892d86ce', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '607fbb48-621c-4c7e-b652-55e4892d86ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$bigcapital$q$, $q$Bigcapital$q$, $q$https://bigcapital.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0ef7337-a5e2-4799-a976-3b354b927eaf', 'f6da053d-7ba2-44ad-a2fb-ce5860275992', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0ef7337-a5e2-4799-a976-3b354b927eaf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1f92f756-1ddd-475c-a7ab-6671d8405485', $q$firefly-iii$q$, $q$Firefly III$q$, $q$https://www.firefly-iii.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1f92f756-1ddd-475c-a7ab-6671d8405485', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f92f756-1ddd-475c-a7ab-6671d8405485')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$actual-budget$q$, $q$Actual Budget$q$, $q$https://actualbudget.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e27dc122-1b31-46b0-a5e4-521acfa85cbb', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('da31787e-379e-49b6-a261-7561c9b69de4', $q$maybe-finance$q$, $q$Maybe Finance$q$, $q$https://maybe.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'da31787e-379e-49b6-a261-7561c9b69de4', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da31787e-379e-49b6-a261-7561c9b69de4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$lunch-money$q$, $q$Lunch Money$q$, $q$https://lunchmoney.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b18967c-f6f6-453b-8f0e-8b8d312dfe53', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b18967c-f6f6-453b-8f0e-8b8d312dfe53')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$ghostfolio$q$, $q$Ghostfolio$q$, $q$https://ghostfol.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '94821a2d-fb17-42ea-8e5e-a593d22a6841', '99049c69-1564-45b4-8d8c-a417e0d724d7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94821a2d-fb17-42ea-8e5e-a593d22a6841')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$planka$q$, $q$Planka$q$, $q$https://planka.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bfc32b77-2902-4a87-8ab8-27743eb3989b', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfc32b77-2902-4a87-8ab8-27743eb3989b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$redmine$q$, $q$Redmine$q$, $q$https://www.redmine.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82a64b4e-889f-499f-9da5-e2f83f5d9d43', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82a64b4e-889f-499f-9da5-e2f83f5d9d43')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$phorge$q$, $q$Phorge$q$, $q$https://we.phorge.it$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', '29820009-ff5d-4628-b69c-570283caa09e', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$taskwarrior$q$, $q$Taskwarrior$q$, $q$https://taskwarrior.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '083ec4ab-767e-4d64-abab-5bc86ae9e884', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '083ec4ab-767e-4d64-abab-5bc86ae9e884')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$super-productivity$q$, $q$Super Productivity$q$, $q$https://super-productivity.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '17662ee8-4f5f-4a4b-9002-5343fb4b960a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fc868bfd-fdf4-4187-9d7e-b719006af946', $q$siyuan$q$, $q$SiYuan$q$, $q$https://b3log.org/siyuan$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fc868bfd-fdf4-4187-9d7e-b719006af946', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc868bfd-fdf4-4187-9d7e-b719006af946')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a1e8900-232b-487e-a707-161bf160047b', $q$trilium-notes$q$, $q$Trilium Notes$q$, $q$https://triliumnotes.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a1e8900-232b-487e-a707-161bf160047b', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a1e8900-232b-487e-a707-161bf160047b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$joplin$q$, $q$Joplin$q$, $q$https://joplinapp.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4de112c5-5df2-4ef8-9c42-0ec1c3bde762', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4de112c5-5df2-4ef8-9c42-0ec1c3bde762')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$standard-notes$q$, $q$Standard Notes$q$, $q$https://standardnotes.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '19834a87-bdcd-4d0a-b9a5-f013e990b7b2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19834a87-bdcd-4d0a-b9a5-f013e990b7b2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$notesnook$q$, $q$Notesnook$q$, $q$https://notesnook.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$memos$q$, $q$Memos$q$, $q$https://www.usememos.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4d5b94dc-fbd1-4f00-aeaf-079f4a300745', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d5b94dc-fbd1-4f00-aeaf-079f4a300745')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$silverbullet$q$, $q$SilverBullet$q$, $q$https://silverbullet.md$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc626839-0d04-4df9-9c03-63658e2f415a', $q$documize$q$, $q$Documize$q$, $q$https://www.documize.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc626839-0d04-4df9-9c03-63658e2f415a', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc626839-0d04-4df9-9c03-63658e2f415a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$hedgedoc$q$, $q$HedgeDoc$q$, $q$https://hedgedoc.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6c79fd04-1ff8-447b-b662-4ad9e3fff565', '0c792fef-72be-4926-8476-6ee9b4797663', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c79fd04-1ff8-447b-b662-4ad9e3fff565')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$mattermost$q$, $q$Mattermost$q$, $q$https://mattermost.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ed8be1e-2fb9-4bf9-a989-092c8ce6517d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$rocket-chat$q$, $q$Rocket.Chat$q$, $q$https://www.rocket.chat$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '376dca7b-3bc4-46f6-ae09-635baf27d62b', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '376dca7b-3bc4-46f6-ae09-635baf27d62b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c920ff4f-292d-4b70-82c4-92886a22daa0', $q$zulip$q$, $q$Zulip$q$, $q$https://zulip.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c920ff4f-292d-4b70-82c4-92886a22daa0', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c920ff4f-292d-4b70-82c4-92886a22daa0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7a0ebe08-e4d6-46da-a624-6b276c676577', $q$element$q$, $q$Element$q$, $q$https://element.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7a0ebe08-e4d6-46da-a624-6b276c676577', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a0ebe08-e4d6-46da-a624-6b276c676577')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9f4d0c4d-4a72-444b-93c1-cad35e82f0d3', $q$revolt$q$, $q$Revolt$q$, $q$https://revolt.chat$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9f4d0c4d-4a72-444b-93c1-cad35e82f0d3', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f4d0c4d-4a72-444b-93c1-cad35e82f0d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$mirotalk$q$, $q$MiroTalk$q$, $q$https://mirotalk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f5b98a61-eacf-4efe-aaf6-07eff41492b5', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5b98a61-eacf-4efe-aaf6-07eff41492b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$bigbluebutton$q$, $q$BigBlueButton$q$, $q$https://bigbluebutton.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6128d24-7ad0-4f60-87ac-6b8a21ef5c99')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('36449a40-80e5-4dd6-8164-c731f720d4dd', $q$galene$q$, $q$Galene$q$, $q$https://galene.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '36449a40-80e5-4dd6-8164-c731f720d4dd', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36449a40-80e5-4dd6-8164-c731f720d4dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$briefing$q$, $q$Briefing$q$, $q$https://brie.fi/ng$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53194735-82e1-4a27-b2dc-b4ed0454db1e', 'eb3fbae6-66df-457f-b44b-bf25aad41a35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53194735-82e1-4a27-b2dc-b4ed0454db1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$nextcloud-talk$q$, $q$Nextcloud Talk$q$, $q$https://nextcloud.com/talk$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6396cd5b-5f93-4e4e-a61e-b8afc0db1893', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6396cd5b-5f93-4e4e-a61e-b8afc0db1893')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$synapse$q$, $q$Synapse$q$, $q$https://matrix.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '447961f9-a6c6-4aef-b7cc-318f6a912fa3', '29dfce31-cfe8-453b-96ed-1c4a0b07bf35', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$forem$q$, $q$Forem$q$, $q$https://www.forem.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '104c1524-087c-4a12-b6f7-1c69780a1d4b', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '104c1524-087c-4a12-b6f7-1c69780a1d4b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$humhub$q$, $q$HumHub$q$, $q$https://www.humhub.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a7a7d03-38e8-4c10-aa13-d20c62a48b08', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a7a7d03-38e8-4c10-aa13-d20c62a48b08')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$mastodon$q$, $q$Mastodon$q$, $q$https://joinmastodon.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9fecdcd9-2620-4cdf-982f-3615b76750b1', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9fecdcd9-2620-4cdf-982f-3615b76750b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$misskey$q$, $q$Misskey$q$, $q$https://misskey-hub.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bbcea426-8b22-4fd5-96ad-4e11c6da8bd2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87827575-d6b9-427d-9a29-d335e632d59f', $q$pleroma$q$, $q$Pleroma$q$, $q$https://pleroma.social$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87827575-d6b9-427d-9a29-d335e632d59f', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87827575-d6b9-427d-9a29-d335e632d59f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$friendica$q$, $q$Friendica$q$, $q$https://friendi.ca$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c0016ff-460a-49f3-a0f2-026bb26769d9', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c0016ff-460a-49f3-a0f2-026bb26769d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$pixelfed$q$, $q$Pixelfed$q$, $q$https://pixelfed.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '18949653-684b-4d6b-9f7f-0ba4d9594f29', 'e2198aac-d20e-47a9-8ad0-59606ef0379f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18949653-684b-4d6b-9f7f-0ba4d9594f29')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$lemmy$q$, $q$Lemmy$q$, $q$https://join-lemmy.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f318e3fc-7f57-48b4-8872-a1885a2bafc0', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f318e3fc-7f57-48b4-8872-a1885a2bafc0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('43f6360a-aa53-44d3-b925-dc3fc6ed4841', $q$kbin$q$, $q$Kbin$q$, $q$https://kbin.pub$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '43f6360a-aa53-44d3-b925-dc3fc6ed4841', '30f9f187-2974-430d-9da4-d1ca25a9d417', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43f6360a-aa53-44d3-b925-dc3fc6ed4841')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$mobilizon$q$, $q$Mobilizon$q$, $q$https://joinmobilizon.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ab47ffe-4a96-4827-af17-8cd00e51800b', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ab47ffe-4a96-4827-af17-8cd00e51800b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('283e6deb-e069-4af7-88a7-a176d867da95', $q$pretix$q$, $q$Pretix$q$, $q$https://pretix.eu$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '283e6deb-e069-4af7-88a7-a176d867da95', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '283e6deb-e069-4af7-88a7-a176d867da95')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('309b9728-2f66-4911-9e11-c40f64054a67', $q$attendize$q$, $q$Attendize$q$, $q$https://www.attendize.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '309b9728-2f66-4911-9e11-c40f64054a67', '85500b66-428a-47a5-9549-eb896d19457c', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '309b9728-2f66-4911-9e11-c40f64054a67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e0b83b6-71ce-4357-81d5-6f9274821112', $q$nocodb$q$, $q$NocoDB$q$, $q$https://nocodb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e0b83b6-71ce-4357-81d5-6f9274821112', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e0b83b6-71ce-4357-81d5-6f9274821112')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$baserow$q$, $q$Baserow$q$, $q$https://baserow.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a277ff8-0957-4069-9f79-4ef1be818b6e', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a277ff8-0957-4069-9f79-4ef1be818b6e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b0a59332-e7cb-4428-afe9-3934017982dd', $q$grist$q$, $q$Grist$q$, $q$https://www.getgrist.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b0a59332-e7cb-4428-afe9-3934017982dd', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0a59332-e7cb-4428-afe9-3934017982dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$seatable$q$, $q$SeaTable$q$, $q$https://seatable.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0909fefb-ee91-4a8f-972b-d6cce78f8b1e', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0909fefb-ee91-4a8f-972b-d6cce78f8b1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$teable$q$, $q$Teable$q$, $q$https://teable.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$mathesar$q$, $q$Mathesar$q$, $q$https://mathesar.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b425d59b-1c35-4d02-b5ba-62b13f0c3db7', 'ff3badf7-fb6d-4136-a445-edf2addbe6ff', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b425d59b-1c35-4d02-b5ba-62b13f0c3db7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$keystonejs$q$, $q$KeystoneJS$q$, $q$https://keystonejs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$tinacms$q$, $q$TinaCMS$q$, $q$https://tina.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '10cff4ac-f281-4d9e-998a-dc5742fcfd08', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10cff4ac-f281-4d9e-998a-dc5742fcfd08')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('26315baf-61aa-4fda-b2de-4986fe3babe9', $q$cockpit-cms$q$, $q$Cockpit CMS$q$, $q$https://getcockpit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '26315baf-61aa-4fda-b2de-4986fe3babe9', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26315baf-61aa-4fda-b2de-4986fe3babe9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$statamic$q$, $q$Statamic$q$, $q$https://statamic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f9925de6-28c3-40f9-a148-3dd0616aa66f', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9925de6-28c3-40f9-a148-3dd0616aa66f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('35e4bc85-6298-43d3-bc27-0854ea063792', $q$craft-cms$q$, $q$Craft CMS$q$, $q$https://craftcms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '35e4bc85-6298-43d3-bc27-0854ea063792', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35e4bc85-6298-43d3-bc27-0854ea063792')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$grav$q$, $q$Grav$q$, $q$https://getgrav.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fbbd32cd-6120-4478-b00a-9de654f9e59e', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbbd32cd-6120-4478-b00a-9de654f9e59e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('960def45-b280-43d5-9fc8-858cdf44c8e2', $q$october-cms$q$, $q$October CMS$q$, $q$https://octobercms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '960def45-b280-43d5-9fc8-858cdf44c8e2', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '960def45-b280-43d5-9fc8-858cdf44c8e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$processwire$q$, $q$ProcessWire$q$, $q$https://processwire.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41d3c6d5-f1bd-4474-a701-bf4a104a118c', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41d3c6d5-f1bd-4474-a701-bf4a104a118c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$concrete-cms$q$, $q$Concrete CMS$q$, $q$https://www.concretecms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7442e6d9-b040-4cc3-a601-2e27ba36cb13', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7442e6d9-b040-4cc3-a601-2e27ba36cb13')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$typo3$q$, $q$TYPO3$q$, $q$https://typo3.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5534f256-62d0-46af-b02c-4c789873abc7', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5534f256-62d0-46af-b02c-4c789873abc7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$umbraco$q$, $q$Umbraco$q$, $q$https://umbraco.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$backdrop-cms$q$, $q$Backdrop CMS$q$, $q$https://backdropcms.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a37dd8ea-c6eb-4027-91e5-148f6db06493', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$silverstripe-cms$q$, $q$Silverstripe CMS$q$, $q$https://www.silverstripe.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$publii$q$, $q$Publii$q$, $q$https://getpublii.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aef99ec6-cc74-4f51-80a7-2b4686dc1465', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aef99ec6-cc74-4f51-80a7-2b4686dc1465')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$micro-blog$q$, $q$Micro.blog$q$, $q$https://micro.blog$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$blot$q$, $q$Blot$q$, $q$https://blot.im$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53ba4185-9c98-4925-94b6-7aa6336c54d0', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53ba4185-9c98-4925-94b6-7aa6336c54d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3bc33713-c005-4ff3-a44a-039f94585dff', $q$bear-blog$q$, $q$Bear Blog$q$, $q$https://bearblog.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3bc33713-c005-4ff3-a44a-039f94585dff', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bc33713-c005-4ff3-a44a-039f94585dff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a7ee6f66-16f1-4c51-a583-64c21b5e4165', $q$plume$q$, $q$Plume$q$, $q$https://joinplu.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a7ee6f66-16f1-4c51-a583-64c21b5e4165', 'c7f5fb3a-0a08-491c-ab5b-df2c708ef1e9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a7ee6f66-16f1-4c51-a583-64c21b5e4165')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$shopware$q$, $q$Shopware$q$, $q$https://www.shopware.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4129c50a-55d6-450e-8940-28027dd14508', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4129c50a-55d6-450e-8940-28027dd14508')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$sylius$q$, $q$Sylius$q$, $q$https://sylius.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8c235fd0-f6aa-40a1-a259-80552567229d', $q$medusa$q$, $q$Medusa$q$, $q$https://medusajs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8c235fd0-f6aa-40a1-a259-80552567229d', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c235fd0-f6aa-40a1-a259-80552567229d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$saleor$q$, $q$Saleor$q$, $q$https://saleor.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd85391e-2a8c-4713-ae6d-b8babec00fef', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd85391e-2a8c-4713-ae6d-b8babec00fef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b6f6733-ef4d-4430-95f2-717f687caf82', $q$vendure$q$, $q$Vendure$q$, $q$https://www.vendure.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b6f6733-ef4d-4430-95f2-717f687caf82', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b6f6733-ef4d-4430-95f2-717f687caf82')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$bagisto$q$, $q$Bagisto$q$, $q$https://bagisto.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e31477ab-3154-4ea8-8d67-a637bb9acd3b', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$opencart$q$, $q$OpenCart$q$, $q$https://www.opencart.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d420822-07a5-41e5-ace9-e3a4a6821dee', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d420822-07a5-41e5-ace9-e3a4a6821dee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54196510-1549-49ef-8799-53017ed6e08f', $q$thirty-bees$q$, $q$Thirty Bees$q$, $q$https://thirtybees.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54196510-1549-49ef-8799-53017ed6e08f', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54196510-1549-49ef-8799-53017ed6e08f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('80d28886-f2f5-4191-a617-3ed3234eb862', $q$spree-commerce$q$, $q$Spree Commerce$q$, $q$https://spreecommerce.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '80d28886-f2f5-4191-a617-3ed3234eb862', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80d28886-f2f5-4191-a617-3ed3234eb862')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('634915a8-0356-4646-9ea7-8f8a547db0f9', $q$reaction-commerce$q$, $q$Reaction Commerce$q$, $q$https://reactioncommerce.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '634915a8-0356-4646-9ea7-8f8a547db0f9', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '634915a8-0356-4646-9ea7-8f8a547db0f9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c34caf13-187c-4852-8539-3e8297879c3d', $q$solidus$q$, $q$Solidus$q$, $q$https://solidus.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c34caf13-187c-4852-8539-3e8297879c3d', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c34caf13-187c-4852-8539-3e8297879c3d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$drupal-commerce$q$, $q$Drupal Commerce$q$, $q$https://drupalcommerce.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ee87c2b-85ba-44c2-8569-a2e50fe673c2', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ee87c2b-85ba-44c2-8569-a2e50fe673c2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$grandnode$q$, $q$GrandNode$q$, $q$https://grandnode.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d5b3bdc-eff0-48ab-b65b-30a03203b12e', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d5b3bdc-eff0-48ab-b65b-30a03203b12e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a28c91f9-301a-4413-8b14-a58c3ee344df', $q$nopcommerce$q$, $q$nopCommerce$q$, $q$https://www.nopcommerce.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a28c91f9-301a-4413-8b14-a58c3ee344df', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a28c91f9-301a-4413-8b14-a58c3ee344df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$snipcart$q$, $q$Snipcart$q$, $q$https://snipcart.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '33d8b578-c949-41fd-b5e1-f9c8acf9190a', 'c3ed3e32-a393-4074-aa85-eac9138dc87f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33d8b578-c949-41fd-b5e1-f9c8acf9190a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$kill-bill$q$, $q$Kill Bill$q$, $q$https://killbill.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '07fb8b20-d497-452b-ab9e-d61603e77eb7', 'af5053c8-d7cb-418d-bc99-0d6c06e61dee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07fb8b20-d497-452b-ab9e-d61603e77eb7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$hyperline$q$, $q$Hyperline$q$, $q$https://www.hyperline.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92', 'af5053c8-d7cb-418d-bc99-0d6c06e61dee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$autumn$q$, $q$Autumn$q$, $q$https://www.useautumn.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'db4e8f1d-beb1-40ee-bdeb-678fe623d016', 'af5053c8-d7cb-418d-bc99-0d6c06e61dee', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$profitwell$q$, $q$ProfitWell$q$, $q$https://www.paddle.com/profitwell$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a4f0fe3-b308-423c-aecf-cdff842abdcc', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a4f0fe3-b308-423c-aecf-cdff842abdcc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$vitally$q$, $q$Vitally$q$, $q$https://www.vitally.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '354544ee-5844-47e0-abfb-03b3c7ee9886', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '354544ee-5844-47e0-abfb-03b3c7ee9886')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('599548f2-9d79-4758-9183-d5c016b8b2a6', $q$planhat$q$, $q$Planhat$q$, $q$https://www.planhat.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '599548f2-9d79-4758-9183-d5c016b8b2a6', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '599548f2-9d79-4758-9183-d5c016b8b2a6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e817d4a-bca3-442e-be39-93f237e411c9', $q$custify$q$, $q$Custify$q$, $q$https://www.custify.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e817d4a-bca3-442e-be39-93f237e411c9', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e817d4a-bca3-442e-be39-93f237e411c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$clientsuccess$q$, $q$ClientSuccess$q$, $q$https://www.clientsuccess.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b85ba652-1c1b-4a44-ba69-19c2f681f148', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b85ba652-1c1b-4a44-ba69-19c2f681f148')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d4008e96-5007-46e7-98c7-0f90f45c63fa', $q$freescout$q$, $q$FreeScout$q$, $q$https://freescout.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd4008e96-5007-46e7-98c7-0f90f45c63fa', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4008e96-5007-46e7-98c7-0f90f45c63fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$zammad$q$, $q$Zammad$q$, $q$https://zammad.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ad76ec7-95d0-4c9d-8183-877e0a53b6e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$uvdesk$q$, $q$UVdesk$q$, $q$https://www.uvdesk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee32ab12-332b-4d10-9733-64fdc3deca2d', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e90b718-dc56-45ed-adcf-9ca1d534513e', $q$peppermint$q$, $q$Peppermint$q$, $q$https://peppermint.sh$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e90b718-dc56-45ed-adcf-9ca1d534513e', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e90b718-dc56-45ed-adcf-9ca1d534513e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('203778ad-4def-4fde-8983-24641267e6c6', $q$helpy$q$, $q$Helpy$q$, $q$https://helpy.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '203778ad-4def-4fde-8983-24641267e6c6', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '203778ad-4def-4fde-8983-24641267e6c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$osticket$q$, $q$osTicket$q$, $q$https://osticket.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6e21c1b-c4e0-486b-8501-88c1bbe7830a', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6e21c1b-c4e0-486b-8501-88c1bbe7830a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$request-tracker$q$, $q$Request Tracker$q$, $q$https://bestpractical.com/request-tracker$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c74c6d31-a2de-408d-9658-1ce6cd0f1ff3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$otobo$q$, $q$OTOBO$q$, $q$https://otobo.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ff507f8-cdb5-4501-a01f-b42875d7b2a8', 'b691230f-bd6b-43ef-b2ed-9c2730ddcb39', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ff507f8-cdb5-4501-a01f-b42875d7b2a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$glpi$q$, $q$GLPI$q$, $q$https://glpi-project.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4d4e26c-b174-4a6c-a897-123a9f5d759f', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4d4e26c-b174-4a6c-a897-123a9f5d759f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7979bb4-e11f-4629-ba03-f702582d77cc', $q$itop$q$, $q$iTop$q$, $q$https://www.combodo.com/itop$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7979bb4-e11f-4629-ba03-f702582d77cc', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7979bb4-e11f-4629-ba03-f702582d77cc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('807b9f70-85d4-451c-836e-7da931db0f4d', $q$snipe-it$q$, $q$Snipe-IT$q$, $q$https://snipeitapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '807b9f70-85d4-451c-836e-7da931db0f4d', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '807b9f70-85d4-451c-836e-7da931db0f4d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2b9da418-5593-411e-b754-f7ed76965af3', $q$ralph$q$, $q$Ralph$q$, $q$https://ralph.allegro.tech$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2b9da418-5593-411e-b754-f7ed76965af3', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b9da418-5593-411e-b754-f7ed76965af3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$netbox$q$, $q$NetBox$q$, $q$https://netbox.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aec1c6d5-ecc8-46ac-9da2-4a389876a94b', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aec1c6d5-ecc8-46ac-9da2-4a389876a94b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$nautobot$q$, $q$Nautobot$q$, $q$https://networktocode.com/nautobot$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '979b8875-ed44-408b-b6aa-f0477d81e7fc', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '979b8875-ed44-408b-b6aa-f0477d81e7fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('42a75ad3-068c-492e-a658-dfdeda416a65', $q$phpipam$q$, $q$phpIPAM$q$, $q$https://phpipam.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '42a75ad3-068c-492e-a658-dfdeda416a65', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42a75ad3-068c-492e-a658-dfdeda416a65')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$racktables$q$, $q$RackTables$q$, $q$https://www.racktables.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a6cf529-e980-41a6-a8bd-f9fddd93fce3', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a6cf529-e980-41a6-a8bd-f9fddd93fce3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$device42$q$, $q$Device42$q$, $q$https://www.device42.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9fc7c07a-2f39-4616-b762-2e97af017f6e', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9fc7c07a-2f39-4616-b762-2e97af017f6e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$freshservice$q$, $q$Freshservice$q$, $q$https://www.freshworks.com/freshservice$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41501fa1-8a36-4631-b45d-fc12ce3657f5', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41501fa1-8a36-4631-b45d-fc12ce3657f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$invgate-service-desk$q$, $q$InvGate Service Desk$q$, $q$https://invgate.com/service-desk$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0de1e87e-9618-43ae-b91b-b9ceedf4e826', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0de1e87e-9618-43ae-b91b-b9ceedf4e826')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$haloitsm$q$, $q$HaloITSM$q$, $q$https://www.haloitsm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c110df5-bfa6-4663-9dad-5ea512a9a23a', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c110df5-bfa6-4663-9dad-5ea512a9a23a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$manageengine-servicedesk-plus$q$, $q$ManageEngine ServiceDesk Plus$q$, $q$https://www.manageengine.com/products/service-desk$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('47b3f39e-f481-4d52-be50-11d497bacb7b', $q$otrs$q$, $q$OTRS$q$, $q$https://otrs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '47b3f39e-f481-4d52-be50-11d497bacb7b', 'a43ef978-b2e2-48db-b6e2-fb4d6e5002d0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47b3f39e-f481-4d52-be50-11d497bacb7b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$horilla$q$, $q$Horilla$q$, $q$https://www.horilla.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6c4d248e-ed75-425f-a74f-2cfa5f36dc03', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c4d248e-ed75-425f-a74f-2cfa5f36dc03')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$minthcm$q$, $q$MintHCM$q$, $q$https://minthcm.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6fd92840-a8d9-4354-97b1-b102f54b88d6', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fd92840-a8d9-4354-97b1-b102f54b88d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e6508f8-f264-449c-bf83-015dd51a8619', $q$open-hrms$q$, $q$Open HRMS$q$, $q$https://www.openhrms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e6508f8-f264-449c-bf83-015dd51a8619', '596fb67f-0962-4527-9241-58a8336ef879', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e6508f8-f264-449c-bf83-015dd51a8619')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$kimai$q$, $q$Kimai$q$, $q$https://www.kimai.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', '2dd43503-9ee2-4cfa-83e0-922fe57f6dfc', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9723eb0b-ac61-46c1-b15a-4b60b4e6d68f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$activitywatch$q$, $q$ActivityWatch$q$, $q$https://activitywatch.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c90b471e-f0b7-403c-972f-49e1d0871d55', '2dd43503-9ee2-4cfa-83e0-922fe57f6dfc', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c90b471e-f0b7-403c-972f-49e1d0871d55')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d816c0d6-616e-417e-bf4c-30fc9be88134', $q$traggo$q$, $q$Traggo$q$, $q$https://traggo.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd816c0d6-616e-417e-bf4c-30fc9be88134', '2dd43503-9ee2-4cfa-83e0-922fe57f6dfc', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd816c0d6-616e-417e-bf4c-30fc9be88134')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$solidtime$q$, $q$Solidtime$q$, $q$https://www.solidtime.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5c6ff423-a4cd-408d-b230-67dfd498aa1d', '2dd43503-9ee2-4cfa-83e0-922fe57f6dfc', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c6ff423-a4cd-408d-b230-67dfd498aa1d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$tmetric$q$, $q$TMetric$q$, $q$https://tmetric.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ca54283-3659-44f7-9c00-35f92eddfd5f', '2dd43503-9ee2-4cfa-83e0-922fe57f6dfc', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ca54283-3659-44f7-9c00-35f92eddfd5f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc59330e-f844-4f93-be6c-bf6f8678410b', $q$timecamp$q$, $q$TimeCamp$q$, $q$https://www.timecamp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc59330e-f844-4f93-be6c-bf6f8678410b', '2dd43503-9ee2-4cfa-83e0-922fe57f6dfc', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc59330e-f844-4f93-be6c-bf6f8678410b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$desktime$q$, $q$DeskTime$q$, $q$https://desktime.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b6b57d57-40f4-4d52-966d-761a1cafadb8', '2dd43503-9ee2-4cfa-83e0-922fe57f6dfc', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6b57d57-40f4-4d52-966d-761a1cafadb8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$jibble$q$, $q$Jibble$q$, $q$https://www.jibble.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '83609f1b-4f33-443e-91c3-d41dea40e0aa', '2dd43503-9ee2-4cfa-83e0-922fe57f6dfc', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83609f1b-4f33-443e-91c3-d41dea40e0aa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$opentimeclock$q$, $q$OpenTimeClock$q$, $q$https://www.opentimeclock.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c4f3d77-298c-424f-a26d-6c21dd92ceda', '2dd43503-9ee2-4cfa-83e0-922fe57f6dfc', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c4f3d77-298c-424f-a26d-6c21dd92ceda')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e17e182c-05b6-4b50-b6cc-283acedc783a', $q$signserver$q$, $q$SignServer$q$, $q$https://www.signserver.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e17e182c-05b6-4b50-b6cc-283acedc783a', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e17e182c-05b6-4b50-b6cc-283acedc783a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d5f8979c-0034-41d0-8a61-d04ac685524e', $q$libresign$q$, $q$LibreSign$q$, $q$https://libresign.coop$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd5f8979c-0034-41d0-8a61-d04ac685524e', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5f8979c-0034-41d0-8a61-d04ac685524e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('833af197-f585-45d4-b9f9-cf879adb35d4', $q$paperless-ngx$q$, $q$Paperless-ngx$q$, $q$https://docs.paperless-ngx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '833af197-f585-45d4-b9f9-cf879adb35d4', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '833af197-f585-45d4-b9f9-cf879adb35d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('094491bf-2c55-4e74-8744-920a4c1860d4', $q$papermerge$q$, $q$Papermerge$q$, $q$https://www.papermerge.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '094491bf-2c55-4e74-8744-920a4c1860d4', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '094491bf-2c55-4e74-8744-920a4c1860d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$mayan-edms$q$, $q$Mayan EDMS$q$, $q$https://www.mayan-edms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b5c46acf-0f25-4f29-8713-c5083cd9eea5', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5c46acf-0f25-4f29-8713-c5083cd9eea5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e57311ae-2760-4595-acff-07a9102a6a78', $q$docspell$q$, $q$Docspell$q$, $q$https://docspell.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e57311ae-2760-4595-acff-07a9102a6a78', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e57311ae-2760-4595-acff-07a9102a6a78')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aca7a829-e889-4429-ac20-146ff507188a', $q$teedy$q$, $q$Teedy$q$, $q$https://teedy.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aca7a829-e889-4429-ac20-146ff507188a', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aca7a829-e889-4429-ac20-146ff507188a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$logicaldoc$q$, $q$LogicalDOC$q$, $q$https://www.logicaldoc.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fbab0d6d-e002-4027-8b1d-76a72da67b81', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbab0d6d-e002-4027-8b1d-76a72da67b81')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13b061f8-1278-44ee-b96b-21fa24709fc9', $q$openkm$q$, $q$OpenKM$q$, $q$https://www.openkm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13b061f8-1278-44ee-b96b-21fa24709fc9', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13b061f8-1278-44ee-b96b-21fa24709fc9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('72dc4119-8718-45ec-8600-77edafd7ff89', $q$seeddms$q$, $q$SeedDMS$q$, $q$https://www.seeddms.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '72dc4119-8718-45ec-8600-77edafd7ff89', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72dc4119-8718-45ec-8600-77edafd7ff89')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$alfresco$q$, $q$Alfresco$q$, $q$https://www.hyland.com/en/products/alfresco-platform$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '35a25125-49a7-491d-af00-f68e8a653d0c', '6d8c748b-f4fc-42af-a356-70648169e699', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35a25125-49a7-491d-af00-f68e8a653d0c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$owncloud$q$, $q$ownCloud$q$, $q$https://owncloud.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f44a41ac-bf85-4920-b6a5-83b94226a9d6', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f44a41ac-bf85-4920-b6a5-83b94226a9d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$seafile$q$, $q$Seafile$q$, $q$https://www.seafile.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('458633b6-d7a2-4972-910e-e20a9a1c4947', $q$pydio-cells$q$, $q$Pydio Cells$q$, $q$https://pydio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '458633b6-d7a2-4972-910e-e20a9a1c4947', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '458633b6-d7a2-4972-910e-e20a9a1c4947')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$filerun$q$, $q$FileRun$q$, $q$https://filerun.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c69f3e8f-9780-457f-a312-c387ed3ead8a', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c69f3e8f-9780-457f-a312-c387ed3ead8a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cbc956c8-2e83-4ee3-94e6-cbec829422bf', $q$cozy-cloud$q$, $q$Cozy Cloud$q$, $q$https://cozy.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cbc956c8-2e83-4ee3-94e6-cbec829422bf', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cbc956c8-2e83-4ee3-94e6-cbec829422bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6081e57b-98a6-4413-b8d5-be18ac3034df', $q$peergos$q$, $q$Peergos$q$, $q$https://peergos.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6081e57b-98a6-4413-b8d5-be18ac3034df', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6081e57b-98a6-4413-b8d5-be18ac3034df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$filestash$q$, $q$Filestash$q$, $q$https://www.filestash.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bfbd22a1-7933-401b-b0f3-d85dae77fecd', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfbd22a1-7933-401b-b0f3-d85dae77fecd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e72088e-b35d-4326-9a4b-87a7536c4484', $q$filebrowser$q$, $q$FileBrowser$q$, $q$https://filebrowser.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e72088e-b35d-4326-9a4b-87a7536c4484', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e72088e-b35d-4326-9a4b-87a7536c4484')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$minio$q$, $q$MinIO$q$, $q$https://min.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7f20a0c9-52f8-4c2c-8723-46040d797c2b', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f20a0c9-52f8-4c2c-8723-46040d797c2b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$garage$q$, $q$Garage$q$, $q$https://garagehq.deuxfleurs.fr$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3be3e9b4-cb50-43f7-9445-28dcf621ad49', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3be3e9b4-cb50-43f7-9445-28dcf621ad49')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('32f17210-2418-4e31-bedc-836e12407246', $q$ceph$q$, $q$Ceph$q$, $q$https://ceph.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '32f17210-2418-4e31-bedc-836e12407246', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32f17210-2418-4e31-bedc-836e12407246')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cfd96970-81c8-46e6-aaba-767235ac591e', $q$seaweedfs$q$, $q$SeaweedFS$q$, $q$https://seaweedfs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cfd96970-81c8-46e6-aaba-767235ac591e', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfd96970-81c8-46e6-aaba-767235ac591e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$glusterfs$q$, $q$GlusterFS$q$, $q$https://www.gluster.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8bdbdb20-3a53-4c65-b774-2c8bcceae403', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8bdbdb20-3a53-4c65-b774-2c8bcceae403')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b940250d-ac45-4210-914d-864334dda391', $q$openio$q$, $q$OpenIO$q$, $q$https://www.openio.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b940250d-ac45-4210-914d-864334dda391', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b940250d-ac45-4210-914d-864334dda391')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$restic$q$, $q$Restic$q$, $q$https://restic.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '38c4934d-5e31-4ebe-b4ec-4ca3760270e4', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38c4934d-5e31-4ebe-b4ec-4ca3760270e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('156f6244-fa16-4f23-b785-7b39766ad2f0', $q$borgbackup$q$, $q$BorgBackup$q$, $q$https://www.borgbackup.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '156f6244-fa16-4f23-b785-7b39766ad2f0', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '156f6244-fa16-4f23-b785-7b39766ad2f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('806a6c41-0dfb-4b12-9209-416dc798214d', $q$kopia$q$, $q$Kopia$q$, $q$https://kopia.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '806a6c41-0dfb-4b12-9209-416dc798214d', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '806a6c41-0dfb-4b12-9209-416dc798214d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$duplicati$q$, $q$Duplicati$q$, $q$https://duplicati.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4fda3a0-ecc1-4630-9d85-b01bc239bd2c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$urbackup$q$, $q$UrBackup$q$, $q$https://www.urbackup.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b386442-acd6-4287-b601-254de09a7e9b', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b386442-acd6-4287-b601-254de09a7e9b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$bareos$q$, $q$Bareos$q$, $q$https://www.bareos.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '75745b38-a453-422a-bd66-d036181d6207', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75745b38-a453-422a-bd66-d036181d6207')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$bacula$q$, $q$Bacula$q$, $q$https://www.bacula.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9fd83865-ab16-41ac-a7c4-d08bb699bdb3', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$proxmox-backup-server$q$, $q$Proxmox Backup Server$q$, $q$https://www.proxmox.com/en/proxmox-backup-server$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '04912e59-00ff-41ed-a119-8f56bc5e3397', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04912e59-00ff-41ed-a119-8f56bc5e3397')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$syncthing$q$, $q$Syncthing$q$, $q$https://syncthing.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6f4efaba-e2ba-4cc8-ad0e-eef383de0614', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$resilio-sync$q$, $q$Resilio Sync$q$, $q$https://www.resilio.com/individuals$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '44084df6-f4d6-4a50-9b62-fd348ba43737', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44084df6-f4d6-4a50-9b62-fd348ba43737')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$unison$q$, $q$Unison$q$, $q$https://www.cis.upenn.edu/~bcpierce/unison$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0531938d-75d2-445c-8d15-96c3a265f3c0', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0531938d-75d2-445c-8d15-96c3a265f3c0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$rclone$q$, $q$Rclone$q$, $q$https://rclone.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d6ffdf8-6da0-4046-a24c-1af0f948ce0d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$mutagen$q$, $q$Mutagen$q$, $q$https://mutagen.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '245ad2b6-9f67-4f27-8678-01d18388c426', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '245ad2b6-9f67-4f27-8678-01d18388c426')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$kiwix$q$, $q$Kiwix$q$, $q$https://www.kiwix.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '650e05bf-0756-4e0c-83db-dabfb42d361a', 'ad71c514-c98b-4715-8b73-f8e86828558a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '650e05bf-0756-4e0c-83db-dabfb42d361a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$linkding$q$, $q$Linkding$q$, $q$https://linkding.link$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8026be73-ac41-420c-b94b-3ca165f049ef', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8026be73-ac41-420c-b94b-3ca165f049ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$linkace$q$, $q$LinkAce$q$, $q$https://www.linkace.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a589b88-3042-41c7-8ea2-df2e6f517ac7', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a589b88-3042-41c7-8ea2-df2e6f517ac7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$shaarli$q$, $q$Shaarli$q$, $q$https://shaarli.readthedocs.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c2a2dac-cd9a-4339-9ab2-dfd365b2be95')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$readeck$q$, $q$Readeck$q$, $q$https://readeck.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '64003bd2-5181-45f3-8722-b827c604e9d2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64003bd2-5181-45f3-8722-b827c604e9d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$omnivore$q$, $q$Omnivore$q$, $q$https://omnivore.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0882639c-99a4-4dc9-ad54-7de7889c2d10', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0882639c-99a4-4dc9-ad54-7de7889c2d10')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$webrecorder$q$, $q$Webrecorder$q$, $q$https://webrecorder.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c3ec637c-da4e-49a1-b2c3-ecb51e556b29', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3ec637c-da4e-49a1-b2c3-ecb51e556b29')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$pinry$q$, $q$Pinry$q$, $q$https://docs.getpinry.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eed72c85-b8c1-41ad-bfa6-c1d425f02b1e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('263cd9a2-c8c9-4495-9dc3-7c90e6e1adef', $q$hoarder$q$, $q$Hoarder$q$, $q$https://hoarder.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '263cd9a2-c8c9-4495-9dc3-7c90e6e1adef', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '263cd9a2-c8c9-4495-9dc3-7c90e6e1adef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$immich$q$, $q$Immich$q$, $q$https://immich.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a6a9fcd4-559e-4221-972d-3f4084fc1dc5', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6a9fcd4-559e-4221-972d-3f4084fc1dc5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$photoprism$q$, $q$PhotoPrism$q$, $q$https://www.photoprism.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2f89cac5-124c-4e1b-8f09-b84e459dd4dc', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f89cac5-124c-4e1b-8f09-b84e459dd4dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$librephotos$q$, $q$LibrePhotos$q$, $q$https://docs.librephotos.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd62c6f08-582d-469d-a2bc-f3b5a26a0454', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd62c6f08-582d-469d-a2bc-f3b5a26a0454')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$piwigo$q$, $q$Piwigo$q$, $q$https://piwigo.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dc6e0788-b827-42b0-bfab-4a75e09f4a12', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc6e0788-b827-42b0-bfab-4a75e09f4a12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$chevereto$q$, $q$Chevereto$q$, $q$https://chevereto.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '08cb66ce-1814-4087-a29d-3578403ad173', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08cb66ce-1814-4087-a29d-3578403ad173')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$photostructure$q$, $q$PhotoStructure$q$, $q$https://photostructure.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '738c4ff8-6bc1-45af-9978-423b14aba862', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '738c4ff8-6bc1-45af-9978-423b14aba862')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$ente-photos$q$, $q$Ente Photos$q$, $q$https://ente.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05877299-4a26-44db-aeaf-52ace933c3fc', '6e768403-61cc-4040-817b-888a454833bf', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05877299-4a26-44db-aeaf-52ace933c3fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$jellyfin$q$, $q$Jellyfin$q$, $q$https://jellyfin.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '07686163-d3fa-49ec-9a3d-0f4d2664089d', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07686163-d3fa-49ec-9a3d-0f4d2664089d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$emby$q$, $q$Emby$q$, $q$https://emby.media$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '243b00aa-9aa3-4490-8b1b-0156281eda01', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '243b00aa-9aa3-4490-8b1b-0156281eda01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$plex$q$, $q$Plex$q$, $q$https://www.plex.tv$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$navidrome$q$, $q$Navidrome$q$, $q$https://www.navidrome.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c85b0c6f-553d-4885-a67e-33c9297d3634', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c85b0c6f-553d-4885-a67e-33c9297d3634')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$ampache$q$, $q$Ampache$q$, $q$https://ampache.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e99d3f06-f0d5-4075-94ed-49469f876517', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e99d3f06-f0d5-4075-94ed-49469f876517')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$funkwhale$q$, $q$Funkwhale$q$, $q$https://www.funkwhale.audio$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11a3e46c-83db-4586-a93d-d93fad3ce9d6', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11a3e46c-83db-4586-a93d-d93fad3ce9d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$koel$q$, $q$Koel$q$, $q$https://koel.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '237520e2-d5af-4e71-b585-63b5af2e41f1', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '237520e2-d5af-4e71-b585-63b5af2e41f1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$audiobookshelf$q$, $q$Audiobookshelf$q$, $q$https://www.audiobookshelf.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$peertube$q$, $q$PeerTube$q$, $q$https://joinpeertube.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '43fecc1e-117b-4ec8-ae44-12dc137692b9', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43fecc1e-117b-4ec8-ae44-12dc137692b9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$owncast$q$, $q$Owncast$q$, $q$https://owncast.online$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a8c86fff-3023-43da-8e2f-7a64b9b6fba4', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8c86fff-3023-43da-8e2f-7a64b9b6fba4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$mediacms$q$, $q$MediaCMS$q$, $q$https://mediacms.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1761a911-bf5b-44d8-a1a3-2fca40562b85', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1761a911-bf5b-44d8-a1a3-2fca40562b85')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$tube-archivist$q$, $q$Tube Archivist$q$, $q$https://www.tubearchivist.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd3725ed0-83b6-4344-b6e9-9cc03592d572', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3725ed0-83b6-4344-b6e9-9cc03592d572')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$azuracast$q$, $q$AzuraCast$q$, $q$https://www.azuracast.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'edcb26fc-e0a6-432b-a023-ba04a025a9de', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$podlove$q$, $q$Podlove$q$, $q$https://podlove.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b01d76ea-bf87-434f-abc4-af2bc181bdcc', 'c0f1759c-8d45-4053-8629-f6f132784fb7', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b01d76ea-bf87-434f-abc4-af2bc181bdcc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$ant-media-server$q$, $q$Ant Media Server$q$, $q$https://antmedia.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d8087e6-e022-4b9c-9760-d491836887d8', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d8087e6-e022-4b9c-9760-d491836887d8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$srs$q$, $q$SRS$q$, $q$https://ossrs.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'abc2721a-0a2c-4cbe-a939-ce3315e4592a', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$obs-studio$q$, $q$OBS Studio$q$, $q$https://obsproject.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba63a23f-3cf0-4180-a7bf-2561af98bb09', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba63a23f-3cf0-4180-a7bf-2561af98bb09')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$kdenlive$q$, $q$Kdenlive$q$, $q$https://kdenlive.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$shotcut$q$, $q$Shotcut$q$, $q$https://shotcut.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '57934454-9221-47e3-87a7-83d5b080c4a6', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57934454-9221-47e3-87a7-83d5b080c4a6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$openshot$q$, $q$OpenShot$q$, $q$https://www.openshot.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '541442eb-549b-42a3-a8f8-d423bdb42a14', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '541442eb-549b-42a3-a8f8-d423bdb42a14')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$olive-video-editor$q$, $q$Olive Video Editor$q$, $q$https://www.olivevideoeditor.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76721f82-dab0-44d8-9e79-1d3b6df99f76', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76721f82-dab0-44d8-9e79-1d3b6df99f76')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$pitivi$q$, $q$Pitivi$q$, $q$https://www.pitivi.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '588dad8e-446f-42e3-8554-3bef2ef37a9a', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '588dad8e-446f-42e3-8554-3bef2ef37a9a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$handbrake$q$, $q$HandBrake$q$, $q$https://handbrake.fr$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5193cb21-ed1a-4efa-8952-c3400dfcbad7', '1729c7bb-f228-4581-ab0e-ae2443237097', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5193cb21-ed1a-4efa-8952-c3400dfcbad7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$audacity$q$, $q$Audacity$q$, $q$https://www.audacityteam.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0feb9ecc-7812-47e0-afb1-c05d828a05c3', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$ardour$q$, $q$Ardour$q$, $q$https://ardour.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '31cd7295-1d81-4b31-927e-f153490c69dc', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31cd7295-1d81-4b31-927e-f153490c69dc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$lmms$q$, $q$LMMS$q$, $q$https://lmms.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86fbd391-0641-4d3e-9a56-e671a2e7b73d', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86fbd391-0641-4d3e-9a56-e671a2e7b73d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$mixxx$q$, $q$Mixxx$q$, $q$https://mixxx.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '909db6fb-d649-46c3-9386-4c38e0917e64', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '909db6fb-d649-46c3-9386-4c38e0917e64')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$musescore$q$, $q$MuseScore$q$, $q$https://musescore.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f7005b5d-dff5-494b-852a-3b557ff0ece0', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7005b5d-dff5-494b-852a-3b557ff0ece0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$rosegarden$q$, $q$Rosegarden$q$, $q$https://www.rosegardenmusic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae8d22a5-f1b3-47ce-81df-8d297a9c7bba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$hydrogen$q$, $q$Hydrogen$q$, $q$https://hydrogen-music.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4193fcc0-5bf7-41df-a6ae-52733d63e797', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4193fcc0-5bf7-41df-a6ae-52733d63e797')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$tenacity$q$, $q$Tenacity$q$, $q$https://tenacityaudio.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e22108c9-93fe-4a9c-aba5-89f5de7d0693', '486a4d0b-3e98-4c9a-b3f9-f35581438a1b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$gimp$q$, $q$GIMP$q$, $q$https://www.gimp.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05fd9154-b81e-4108-87a9-fd64b03f828c', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05fd9154-b81e-4108-87a9-fd64b03f828c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$krita$q$, $q$Krita$q$, $q$https://krita.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4d6dd956-9199-4e06-b14d-777578701617', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d6dd956-9199-4e06-b14d-777578701617')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$inkscape$q$, $q$Inkscape$q$, $q$https://inkscape.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c4dd8f19-6a19-464f-aa03-b7df8213b789', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4dd8f19-6a19-464f-aa03-b7df8213b789')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$scribus$q$, $q$Scribus$q$, $q$https://www.scribus.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '89f1086c-860a-4405-8ba6-cdbbeb21675a', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89f1086c-860a-4405-8ba6-cdbbeb21675a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$pencil-project$q$, $q$Pencil Project$q$, $q$https://pencil.evolus.vn$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '00563610-94ad-4982-9919-0d497b31162d', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00563610-94ad-4982-9919-0d497b31162d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$vectr$q$, $q$Vectr$q$, $q$https://vectr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a4586b52-247b-4d12-87eb-3ffa94cf6ee5', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4586b52-247b-4d12-87eb-3ffa94cf6ee5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$boxy-svg$q$, $q$Boxy SVG$q$, $q$https://boxy-svg.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e093e26f-1179-4cad-b7f0-010ea97f3788', 'bc3e0817-65f2-4592-95e7-a78212698024', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e093e26f-1179-4cad-b7f0-010ea97f3788')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$excalidraw$q$, $q$Excalidraw$q$, $q$https://excalidraw.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ca5270f-e111-4975-805d-895270a05cb1', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ca5270f-e111-4975-805d-895270a05cb1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$tldraw$q$, $q$tldraw$q$, $q$https://www.tldraw.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3f6cc024-9f36-451d-b9e9-a8bc13712e95', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f6cc024-9f36-451d-b9e9-a8bc13712e95')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$wbo$q$, $q$WBO$q$, $q$https://wbo.ophir.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6dfb48ec-e418-4fe0-93c7-9323f4ba54ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$drawpile$q$, $q$Drawpile$q$, $q$https://drawpile.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$diagrams-net$q$, $q$Diagrams.net$q$, $q$https://www.diagrams.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af654930-837f-40c8-b359-6e2d826ad6ff', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af654930-837f-40c8-b359-6e2d826ad6ff')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$plantuml$q$, $q$PlantUML$q$, $q$https://plantuml.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea83f533-2784-47e9-b55f-e37f270b013d', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea83f533-2784-47e9-b55f-e37f270b013d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$d2$q$, $q$D2$q$, $q$https://d2lang.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8f5095fd-2fe0-49e0-936e-9bb82f1c6752', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f5095fd-2fe0-49e0-936e-9bb82f1c6752')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$kroki$q$, $q$Kroki$q$, $q$https://kroki.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd01ba1ee-34ac-4433-8e64-30da756ce4a2', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd01ba1ee-34ac-4433-8e64-30da756ce4a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$graphviz$q$, $q$Graphviz$q$, $q$https://graphviz.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '810dd7ba-142d-43eb-a0cd-c0bc68503b42', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '810dd7ba-142d-43eb-a0cd-c0bc68503b42')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$libreoffice$q$, $q$LibreOffice$q$, $q$https://www.libreoffice.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54c13dd3-4248-499f-8fcf-083dadd9d1bb', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54c13dd3-4248-499f-8fcf-083dadd9d1bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$onlyoffice$q$, $q$ONLYOFFICE$q$, $q$https://www.onlyoffice.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab659340-1acd-4acc-9653-f4c90a759519', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab659340-1acd-4acc-9653-f4c90a759519')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$collabora-online$q$, $q$Collabora Online$q$, $q$https://www.collaboraonline.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '314b57b0-8a83-4a7f-9610-e611f8f2c94f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '314b57b0-8a83-4a7f-9610-e611f8f2c94f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$cryptpad$q$, $q$CryptPad$q$, $q$https://cryptpad.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41beb071-a49d-4ab2-b0b3-1264edc2d746', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41beb071-a49d-4ab2-b0b3-1264edc2d746')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$etherpad$q$, $q$Etherpad$q$, $q$https://etherpad.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '69a475e1-9bb8-4bf6-9842-69059a3261a0', '22533e63-71f9-44be-a5f7-39043f8e8668', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69a475e1-9bb8-4bf6-9842-69059a3261a0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$ethercalc$q$, $q$EtherCalc$q$, $q$https://ethercalc.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eddc5a12-a813-48d5-b150-695f5bfdf5f3', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eddc5a12-a813-48d5-b150-695f5bfdf5f3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$limesurvey$q$, $q$LimeSurvey$q$, $q$https://www.limesurvey.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2927d1f2-3dbf-4d7c-b455-1855e71fc96e', $q$ohmyform$q$, $q$OhMyForm$q$, $q$https://ohmyform.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2927d1f2-3dbf-4d7c-b455-1855e71fc96e', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2927d1f2-3dbf-4d7c-b455-1855e71fc96e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$form-io$q$, $q$Form.io$q$, $q$https://form.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a141dc6c-48ce-4194-aa10-52dc5225f542', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a141dc6c-48ce-4194-aa10-52dc5225f542')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$heyform$q$, $q$HeyForm$q$, $q$https://heyform.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fddc4cea-b640-45b6-a982-077960bcbadc', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fddc4cea-b640-45b6-a982-077960bcbadc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$formpress$q$, $q$Formpress$q$, $q$https://formpress.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0118430-d952-414d-b1c2-ca4afbeb6470', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0118430-d952-414d-b1c2-ca4afbeb6470')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$yakforms$q$, $q$Yakforms$q$, $q$https://yakforms.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aedcb41b-b1e4-4c36-a18f-c2f220a1750c', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aedcb41b-b1e4-4c36-a18f-c2f220a1750c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('08eb66a4-9de1-4b79-9c48-f66eb776838d', $q$tellform$q$, $q$TellForm$q$, $q$https://www.tellform.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '08eb66a4-9de1-4b79-9c48-f66eb776838d', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08eb66a4-9de1-4b79-9c48-f66eb776838d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$surveyjs$q$, $q$SurveyJS$q$, $q$https://surveyjs.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', '5f2195a0-4dc6-438a-80bf-61f975e47f89', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$opnform$q$, $q$OpnForm$q$, $q$https://opnform.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'acb31b58-aa23-4c6b-b191-585512bf65f6', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'acb31b58-aa23-4c6b-b191-585512bf65f6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$docassemble$q$, $q$Docassemble$q$, $q$https://docassemble.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', '72142975-35ca-4cb9-a665-4d59432f7cda', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c386a7f9-0f7e-468a-84bc-c61cc73cf1a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$goaccess$q$, $q$GoAccess$q$, $q$https://goaccess.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a432f190-1b4c-4ed3-8f70-e63c936ac1f0', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a432f190-1b4c-4ed3-8f70-e63c936ac1f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$open-web-analytics$q$, $q$Open Web Analytics$q$, $q$https://www.openwebanalytics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8ecbeea-8621-4dc5-9c0a-606221d037c3', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8ecbeea-8621-4dc5-9c0a-606221d037c3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$ackee$q$, $q$Ackee$q$, $q$https://ackee.electerious.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$counter$q$, $q$Counter$q$, $q$https://counter.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$flagsmith$q$, $q$Flagsmith$q$, $q$https://www.flagsmith.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '019204fd-182f-40f5-9827-49ed1e395308', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '019204fd-182f-40f5-9827-49ed1e395308')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$unleash$q$, $q$Unleash$q$, $q$https://www.getunleash.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7796a03d-4b99-4591-a6d0-97a6d4b4c39b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7796a03d-4b99-4591-a6d0-97a6d4b4c39b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$flipt$q$, $q$Flipt$q$, $q$https://www.flipt.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6732bbc4-c8d6-442d-91b0-c2d8939b74bb', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6732bbc4-c8d6-442d-91b0-c2d8939b74bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$featbit$q$, $q$FeatBit$q$, $q$https://www.featbit.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '94397512-e81a-4da3-8e0a-9e8fa8ba4e79', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94397512-e81a-4da3-8e0a-9e8fa8ba4e79')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$configcat$q$, $q$ConfigCat$q$, $q$https://configcat.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cce6651b-abc7-4428-9917-f07ac8142bf2', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cce6651b-abc7-4428-9917-f07ac8142bf2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$devcycle$q$, $q$DevCycle$q$, $q$https://devcycle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4697278a-138a-4bf7-873d-8d71a39b66c4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4697278a-138a-4bf7-873d-8d71a39b66c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$mariadb$q$, $q$MariaDB$q$, $q$https://mariadb.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b06d1d19-b0b8-4c54-894b-14a56a483e6c', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b06d1d19-b0b8-4c54-894b-14a56a483e6c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$scylladb$q$, $q$ScyllaDB$q$, $q$https://www.scylladb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '19274a99-a56f-41a7-8809-d973ed36645b', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19274a99-a56f-41a7-8809-d973ed36645b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$clickhouse$q$, $q$ClickHouse$q$, $q$https://clickhouse.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd1cc98c8-156a-4960-9e1b-8d537e303a0e', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1cc98c8-156a-4960-9e1b-8d537e303a0e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$duckdb$q$, $q$DuckDB$q$, $q$https://duckdb.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '80cb4f6d-eff0-4feb-abf9-70df2946bcfe', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80cb4f6d-eff0-4feb-abf9-70df2946bcfe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$ferretdb$q$, $q$FerretDB$q$, $q$https://www.ferretdb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c63f5cdd-3d2b-4852-9c15-e6302ec5f68e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$valkey$q$, $q$Valkey$q$, $q$https://valkey.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$dragonfly$q$, $q$Dragonfly$q$, $q$https://www.dragonflydb.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a28f7a9-0896-4972-aa26-4337e26797f9', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a28f7a9-0896-4972-aa26-4337e26797f9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$keydb$q$, $q$KeyDB$q$, $q$https://docs.keydb.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5090858f-f936-401a-988e-90e50e3c63af', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5090858f-f936-401a-988e-90e50e3c63af')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$opensearch$q$, $q$OpenSearch$q$, $q$https://opensearch.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '897517f2-e813-44cf-9a91-5b3befd56d44', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '897517f2-e813-44cf-9a91-5b3befd56d44')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('847c2fe7-37aa-4c95-b7e7-da6d6af53346', $q$zincsearch$q$, $q$ZincSearch$q$, $q$https://zincsearch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '847c2fe7-37aa-4c95-b7e7-da6d6af53346', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '847c2fe7-37aa-4c95-b7e7-da6d6af53346')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$quickwit$q$, $q$Quickwit$q$, $q$https://quickwit.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ad07660-a8fd-4c45-a63d-f9199fe54fa9', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ad07660-a8fd-4c45-a63d-f9199fe54fa9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$manticore-search$q$, $q$Manticore Search$q$, $q$https://manticoresearch.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8eeed669-fbb5-47e4-8555-27145e4a692e', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8eeed669-fbb5-47e4-8555-27145e4a692e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$vespa$q$, $q$Vespa$q$, $q$https://vespa.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3bab8d3-6cb7-4707-add4-248119724ff1', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3bab8d3-6cb7-4707-add4-248119724ff1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$chroma$q$, $q$Chroma$q$, $q$https://www.trychroma.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd5a43d0-6c12-4d8c-95e4-dbcf7e682046')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$lancedb$q$, $q$LanceDB$q$, $q$https://lancedb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '391b42a3-3312-43a4-800a-ec03d77e0694', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '391b42a3-3312-43a4-800a-ec03d77e0694')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$marqo$q$, $q$Marqo$q$, $q$https://www.marqo.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7bc828a9-6a44-47e7-9d64-c584650ed6e0', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bc828a9-6a44-47e7-9d64-c584650ed6e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$parse-platform$q$, $q$Parse Platform$q$, $q$https://parseplatform.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3fda03d5-8efa-4417-bae1-e4cc14dc560a', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fda03d5-8efa-4417-bae1-e4cc14dc560a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$postgrest$q$, $q$PostgREST$q$, $q$https://postgrest.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dd33727e-2e57-4b2e-af05-7dee39588471', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd33727e-2e57-4b2e-af05-7dee39588471')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$dreamfactory$q$, $q$DreamFactory$q$, $q$https://www.dreamfactory.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$kong$q$, $q$Kong$q$, $q$https://konghq.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '739a3d06-32a8-47ca-88cb-0b897c628ff9', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '739a3d06-32a8-47ca-88cb-0b897c628ff9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$tyk$q$, $q$Tyk$q$, $q$https://tyk.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '89dff1be-8908-47b5-b669-4283360cd267', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89dff1be-8908-47b5-b669-4283360cd267')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$gravitee$q$, $q$Gravitee$q$, $q$https://www.gravitee.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '64537204-ede8-4be9-b3b2-bb1a6ffab1aa', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64537204-ede8-4be9-b3b2-bb1a6ffab1aa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$krakend$q$, $q$KrakenD$q$, $q$https://www.krakend.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27e34a6d-64ed-4d82-bdf3-3bc216000871', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27e34a6d-64ed-4d82-bdf3-3bc216000871')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('836889d0-eae4-40b4-be6a-40be147b1ab7', $q$gloo-gateway$q$, $q$Gloo Gateway$q$, $q$https://www.solo.io/products/gloo-gateway$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '836889d0-eae4-40b4-be6a-40be147b1ab7', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '836889d0-eae4-40b4-be6a-40be147b1ab7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$traefik-hub$q$, $q$Traefik Hub$q$, $q$https://traefik.io/traefik-hub$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea6717b3-d173-4853-b8b4-beb2d3f1c1e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$hurl$q$, $q$Hurl$q$, $q$https://hurl.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5db80a47-34dc-4c07-9969-53321dbed91e', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5db80a47-34dc-4c07-9969-53321dbed91e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$schemathesis$q$, $q$Schemathesis$q$, $q$https://schemathesis.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5da7c24e-f64f-46b1-a907-d8b6683f3c73', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5da7c24e-f64f-46b1-a907-d8b6683f3c73')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('df960659-f54b-4be1-8faf-a995a08464e8', $q$dredd$q$, $q$Dredd$q$, $q$https://dredd.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'df960659-f54b-4be1-8faf-a995a08464e8', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df960659-f54b-4be1-8faf-a995a08464e8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$convoy$q$, $q$Convoy$q$, $q$https://getconvoy.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb460c74-dce8-4856-9dc3-61f824bd3a75', '12ba4c6a-94ec-42bb-918b-0b2f8c74f26b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb460c74-dce8-4856-9dc3-61f824bd3a75')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$novu$q$, $q$Novu$q$, $q$https://novu.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '555aaf18-6846-4042-ba95-cc4fd3189aec', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '555aaf18-6846-4042-ba95-cc4fd3189aec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$knock$q$, $q$Knock$q$, $q$https://knock.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '146cfaaf-aaff-451e-bc9c-ee8099f69750', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '146cfaaf-aaff-451e-bc9c-ee8099f69750')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$courier$q$, $q$Courier$q$, $q$https://www.courier.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '47573ceb-bc2e-4aa8-88aa-21c943d7431f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47573ceb-bc2e-4aa8-88aa-21c943d7431f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$suprsend$q$, $q$SuprSend$q$, $q$https://www.suprsend.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a57f6aeb-72fe-474e-8368-01db35053063', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a57f6aeb-72fe-474e-8368-01db35053063')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$magicbell$q$, $q$MagicBell$q$, $q$https://www.magicbell.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '683c4752-3d3c-49ed-8578-cbba9f8507d3', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '683c4752-3d3c-49ed-8578-cbba9f8507d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$engagespot$q$, $q$Engagespot$q$, $q$https://engagespot.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '128a81ea-1a14-4c1e-9cd9-5cad1207d02b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '128a81ea-1a14-4c1e-9cd9-5cad1207d02b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$gotify$q$, $q$Gotify$q$, $q$https://gotify.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '36781d6b-14d7-4e2f-b591-0f378b601761', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36781d6b-14d7-4e2f-b591-0f378b601761')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$ntfy$q$, $q$ntfy$q$, $q$https://ntfy.sh$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65e976a6-18cc-449b-b109-b26bbd870c7c', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65e976a6-18cc-449b-b109-b26bbd870c7c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$listmonk$q$, $q$Listmonk$q$, $q$https://listmonk.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '84142957-2683-4f6e-9088-2169508d193b', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84142957-2683-4f6e-9088-2169508d193b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$mautic$q$, $q$Mautic$q$, $q$https://www.mautic.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '780f67bf-33b3-43f7-9cf1-e78a31b9f50f', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '780f67bf-33b3-43f7-9cf1-e78a31b9f50f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$keila$q$, $q$Keila$q$, $q$https://www.keila.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$sendy$q$, $q$Sendy$q$, $q$https://sendy.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '44d9699e-8d32-4e15-b625-c6a58b71f09e', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44d9699e-8d32-4e15-b625-c6a58b71f09e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$postal$q$, $q$Postal$q$, $q$https://postalserver.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '23c53c70-2a21-4d74-b527-25a8f44a4362', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23c53c70-2a21-4d74-b527-25a8f44a4362')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$mailcow$q$, $q$Mailcow$q$, $q$https://mailcow.email$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$mailu$q$, $q$Mailu$q$, $q$https://mailu.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fcb91d77-94ad-4a0c-b605-9adaf3d6225f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fcb91d77-94ad-4a0c-b605-9adaf3d6225f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$modoboa$q$, $q$Modoboa$q$, $q$https://modoboa.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba61acd7-9961-41fb-a375-101e19f2f40e', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba61acd7-9961-41fb-a375-101e19f2f40e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$stalwart-mail-server$q$, $q$Stalwart Mail Server$q$, $q$https://stalw.art$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'db5dc978-1f33-4ece-86f5-07c85e0d3438', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db5dc978-1f33-4ece-86f5-07c85e0d3438')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$maddy-mail-server$q$, $q$Maddy Mail Server$q$, $q$https://maddy.email$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e21bbe8e-03eb-4184-be8d-54e23a99ca1f', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e21bbe8e-03eb-4184-be8d-54e23a99ca1f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$mail-in-a-box$q$, $q$Mail-in-a-Box$q$, $q$https://mailinabox.email$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd082b33f-646c-4955-831f-c22ea77858a8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd082b33f-646c-4955-831f-c22ea77858a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$mailpit$q$, $q$Mailpit$q$, $q$https://mailpit.axllent.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '75720a0f-3359-4066-8426-dccd1160a142', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75720a0f-3359-4066-8426-dccd1160a142')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$mjml$q$, $q$MJML$q$, $q$https://mjml.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b032bbf-1c83-4ca0-8ae9-0ff746c43cee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$unlayer$q$, $q$Unlayer$q$, $q$https://unlayer.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2af93f8f-0570-4f36-b4b2-40e5917e9e2a', '69c93b60-255b-4e89-9dee-2f58dceb175f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2af93f8f-0570-4f36-b4b2-40e5917e9e2a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$grapesjs$q$, $q$GrapesJS$q$, $q$https://grapesjs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95c8082d-ffa9-4958-bc60-8f9f554f3f0a', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95c8082d-ffa9-4958-bc60-8f9f554f3f0a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$builder-io$q$, $q$Builder.io$q$, $q$https://www.builder.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f8a615cc-2733-4282-bb83-ea78b3682118', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8a615cc-2733-4282-bb83-ea78b3682118')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$plasmic$q$, $q$Plasmic$q$, $q$https://www.plasmic.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '62f1f869-8400-4cf4-bb92-4a6aa2ab0719', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62f1f869-8400-4cf4-bb92-4a6aa2ab0719')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$webstudio$q$, $q$Webstudio$q$, $q$https://webstudio.is$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '17c0bc49-5c4a-433c-9ace-21a7b1f6192b', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17c0bc49-5c4a-433c-9ace-21a7b1f6192b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$teleporthq$q$, $q$TeleportHQ$q$, $q$https://teleporthq.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2ecc0e88-527f-46f0-83e1-06163f665cdf', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ecc0e88-527f-46f0-83e1-06163f665cdf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$pinegrow$q$, $q$Pinegrow$q$, $q$https://pinegrow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cce62d49-de89-4c74-80bb-713e85f97dbe', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cce62d49-de89-4c74-80bb-713e85f97dbe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$bootstrap-studio$q$, $q$Bootstrap Studio$q$, $q$https://bootstrapstudio.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a32c2e6-fe5a-4065-bfb8-918758329971', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a32c2e6-fe5a-4065-bfb8-918758329971')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$silex$q$, $q$Silex$q$, $q$https://www.silex.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', '957673ed-0837-457f-8b68-35d829b6428a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b05cba9-d8b6-4cbf-8bf4-824461bac8ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$hugo$q$, $q$Hugo$q$, $q$https://gohugo.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a46d19fe-50a3-4df2-8764-c03c06ff332b', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a46d19fe-50a3-4df2-8764-c03c06ff332b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$jekyll$q$, $q$Jekyll$q$, $q$https://jekyllrb.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'df10fa66-24a3-4755-9dcd-f62b7329c9c8', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df10fa66-24a3-4755-9dcd-f62b7329c9c8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$eleventy$q$, $q$Eleventy$q$, $q$https://www.11ty.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd95e837c-ef43-455b-89b5-3d198bab18ed', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd95e837c-ef43-455b-89b5-3d198bab18ed')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$nuxt$q$, $q$Nuxt$q$, $q$https://nuxt.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '18d961a0-d3f8-4b71-86cc-965236f0cda6', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18d961a0-d3f8-4b71-86cc-965236f0cda6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$sveltekit$q$, $q$SvelteKit$q$, $q$https://svelte.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$remix$q$, $q$Remix$q$, $q$https://remix.run$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '037448f0-d565-48e0-bfb8-ee13f7081535', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '037448f0-d565-48e0-bfb8-ee13f7081535')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$qwik$q$, $q$Qwik$q$, $q$https://qwik.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06d2781b-fc8f-45ff-905b-0da1b9931d4e', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06d2781b-fc8f-45ff-905b-0da1b9931d4e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2bd08796-f236-49d1-b0c1-ff0571cf289e', $q$docute$q$, $q$Docute$q$, $q$https://docute.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2bd08796-f236-49d1-b0c1-ff0571cf289e', '29a29978-263d-4f45-870a-83892e4d937b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2bd08796-f236-49d1-b0c1-ff0571cf289e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$theneo$q$, $q$Theneo$q$, $q$https://www.theneo.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87dcb1df-40ff-447f-9953-e64d1561e834', '29a29978-263d-4f45-870a-83892e4d937b', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87dcb1df-40ff-447f-9953-e64d1561e834')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$backstage$q$, $q$Backstage$q$, $q$https://backstage.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5009be9-697e-4348-8c21-f8adaa429ec5', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5009be9-697e-4348-8c21-f8adaa429ec5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$port$q$, $q$Port$q$, $q$https://www.getport.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0db14796-fc34-4c7e-aed4-8d302ce97b7d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0db14796-fc34-4c7e-aed4-8d302ce97b7d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$cortex$q$, $q$Cortex$q$, $q$https://www.cortex.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3dc31633-727a-4c74-8a39-811e3fd310a2', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3dc31633-727a-4c74-8a39-811e3fd310a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$opslevel$q$, $q$OpsLevel$q$, $q$https://www.opslevel.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$roadie$q$, $q$Roadie$q$, $q$https://roadie.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd2f52a6e-f44d-4cf6-8f6a-17030432b63d', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2f52a6e-f44d-4cf6-8f6a-17030432b63d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b7b5cb9-c8e4-42b5-837c-28f52ca5aaa3', $q$compass$q$, $q$Compass$q$, $q$https://www.atlassian.com/software/compass$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b7b5cb9-c8e4-42b5-837c-28f52ca5aaa3', 'e7b270ef-d9b3-4809-97b7-3202b1db20c5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b7b5cb9-c8e4-42b5-837c-28f52ca5aaa3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7edc2fa9-6abe-4910-9366-00484927bb82', $q$gitness$q$, $q$Gitness$q$, $q$https://gitness.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7edc2fa9-6abe-4910-9366-00484927bb82', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7edc2fa9-6abe-4910-9366-00484927bb82')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$gitea$q$, $q$Gitea$q$, $q$https://about.gitea.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8e10e1d-f374-4ec0-aa21-3a07fe66eae5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$forgejo$q$, $q$Forgejo$q$, $q$https://forgejo.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1827e10f-a82c-4fb0-8d38-d47e51547c3e', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1827e10f-a82c-4fb0-8d38-d47e51547c3e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$rhodecode$q$, $q$RhodeCode$q$, $q$https://rhodecode.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '85550e75-0afc-4140-81a3-4e711ba76ca4', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85550e75-0afc-4140-81a3-4e711ba76ca4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$gogs$q$, $q$Gogs$q$, $q$https://gogs.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '610f2fd5-da8a-4b36-8a7f-bf94d0307b17', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '610f2fd5-da8a-4b36-8a7f-bf94d0307b17')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$sourcehut$q$, $q$SourceHut$q$, $q$https://sourcehut.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65ac1159-3886-4555-9998-daa1111a04b1', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65ac1159-3886-4555-9998-daa1111a04b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$onedev$q$, $q$OneDev$q$, $q$https://onedev.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$woodpecker-ci$q$, $q$Woodpecker CI$q$, $q$https://woodpecker-ci.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ff195225-a15d-4993-96da-c517414aa5f5', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff195225-a15d-4993-96da-c517414aa5f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$drone-ci$q$, $q$Drone CI$q$, $q$https://www.drone.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b721f7a1-30be-4fe9-aaef-0d63697db57b', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b721f7a1-30be-4fe9-aaef-0d63697db57b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$concourse-ci$q$, $q$Concourse CI$q$, $q$https://concourse-ci.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a86a598d-f117-4b86-8cbc-fd8500f829db', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a86a598d-f117-4b86-8cbc-fd8500f829db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$buildbot$q$, $q$Buildbot$q$, $q$https://buildbot.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7c25a31-e4a6-4f92-befe-498598b09f32', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7c25a31-e4a6-4f92-befe-498598b09f32')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$gocd$q$, $q$GoCD$q$, $q$https://www.gocd.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74b2d4e2-99dc-4bc1-bfaa-f10e06aac809')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$circleci$q$, $q$CircleCI$q$, $q$https://circleci.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$semaphore$q$, $q$Semaphore$q$, $q$https://semaphoreci.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '32135d16-f5f2-4da3-94f9-bb49145ae75e', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32135d16-f5f2-4da3-94f9-bb49145ae75e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$buildkite$q$, $q$Buildkite$q$, $q$https://buildkite.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e080ec1f-f731-4575-b1da-0167d0092eb9', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e080ec1f-f731-4575-b1da-0167d0092eb9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$buddy$q$, $q$Buddy$q$, $q$https://buddy.works$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a8f6b931-ead8-4549-9325-5d2d323f59c8', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8f6b931-ead8-4549-9325-5d2d323f59c8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$harness$q$, $q$Harness$q$, $q$https://www.harness.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$flux$q$, $q$Flux$q$, $q$https://fluxcd.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ffc4ecf-fd8f-435d-a80c-5753e1503951', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ffc4ecf-fd8f-435d-a80c-5753e1503951')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$rancher$q$, $q$Rancher$q$, $q$https://www.rancher.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '446aa6e7-9482-4a1a-b79a-0320f056b430', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '446aa6e7-9482-4a1a-b79a-0320f056b430')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$portainer$q$, $q$Portainer$q$, $q$https://www.portainer.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '533ae83f-c4e9-4971-b328-0c6cb0ac3d10', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '533ae83f-c4e9-4971-b328-0c6cb0ac3d10')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$coolify$q$, $q$Coolify$q$, $q$https://coolify.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '005bfac7-53dd-49b7-9c17-ef452a208620', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '005bfac7-53dd-49b7-9c17-ef452a208620')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$caprover$q$, $q$CapRover$q$, $q$https://caprover.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a45bf44-b4ce-425d-98d9-8231b5a94b48', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a45bf44-b4ce-425d-98d9-8231b5a94b48')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$dokku$q$, $q$Dokku$q$, $q$https://dokku.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6cf17823-4f66-4f20-8ec7-a8927a750f25', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6cf17823-4f66-4f20-8ec7-a8927a750f25')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bf089564-4482-4de4-a5c3-8bb1314b5d48', $q$flynn$q$, $q$Flynn$q$, $q$https://flynn.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bf089564-4482-4de4-a5c3-8bb1314b5d48', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf089564-4482-4de4-a5c3-8bb1314b5d48')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$tsuru$q$, $q$Tsuru$q$, $q$https://tsuru.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a8012fa-de58-422c-8781-450f465f4beb', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a8012fa-de58-422c-8781-450f465f4beb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$cloudron$q$, $q$Cloudron$q$, $q$https://www.cloudron.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '63b900b3-a299-4585-b839-c8a5c321ef6b', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63b900b3-a299-4585-b839-c8a5c321ef6b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$yunohost$q$, $q$YunoHost$q$, $q$https://yunohost.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0aa25628-95fd-4484-a51f-ba231959a576', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0aa25628-95fd-4484-a51f-ba231959a576')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$casaos$q$, $q$CasaOS$q$, $q$https://casaos.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2436cfe-e0aa-468d-9855-6acb47cd220e', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2436cfe-e0aa-468d-9855-6acb47cd220e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$umbrel$q$, $q$Umbrel$q$, $q$https://umbrel.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cfe083dd-da65-4b67-83be-298a4c15c75c', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfe083dd-da65-4b67-83be-298a4c15c75c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$opennebula$q$, $q$OpenNebula$q$, $q$https://opennebula.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$openstack$q$, $q$OpenStack$q$, $q$https://www.openstack.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8739782d-56c1-4efc-a3ac-3d0c9d531296', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8739782d-56c1-4efc-a3ac-3d0c9d531296')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$harvester$q$, $q$Harvester$q$, $q$https://harvesterhci.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a9e58a83-376b-4e93-b8f6-d707024da382', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9e58a83-376b-4e93-b8f6-d707024da382')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$kubevirt$q$, $q$KubeVirt$q$, $q$https://kubevirt.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '66cb57df-a72f-4b48-8e7c-dd2074ba5b6e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$nomad$q$, $q$Nomad$q$, $q$https://www.nomadproject.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd651e30f-02b4-4774-b024-a6a3d9d377ee', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd651e30f-02b4-4774-b024-a6a3d9d377ee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$hashicorp-consul$q$, $q$HashiCorp Consul$q$, $q$https://www.consul.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5b8da39-746d-47c9-a6e2-4ce6ea00b2a0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$boundary$q$, $q$Boundary$q$, $q$https://www.boundaryproject.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af04c60a-0edd-428f-9f5c-f88f9ad98f64', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af04c60a-0edd-428f-9f5c-f88f9ad98f64')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$authelia$q$, $q$Authelia$q$, $q$https://www.authelia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82f44b81-1616-4e4f-99ec-891f86393804', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82f44b81-1616-4e4f-99ec-891f86393804')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$permify$q$, $q$Permify$q$, $q$https://permify.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b95ba4cb-96d7-4478-9722-2807aa591486', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b95ba4cb-96d7-4478-9722-2807aa591486')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$casbin$q$, $q$Casbin$q$, $q$https://casbin.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05c2f6b8-9698-410f-a6a2-b3cdf7f98777', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05c2f6b8-9698-410f-a6a2-b3cdf7f98777')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$open-policy-agent$q$, $q$Open Policy Agent$q$, $q$https://www.openpolicyagent.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c1a8c047-6445-4dbd-ae16-412f8a2807f2', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1a8c047-6445-4dbd-ae16-412f8a2807f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$conjur$q$, $q$Conjur$q$, $q$https://www.conjur.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b888188-3d57-4941-b06a-2c4600263666', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b888188-3d57-4941-b06a-2c4600263666')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$thehive$q$, $q$TheHive$q$, $q$https://thehive-project.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '257eca99-6ff2-4447-96da-fbf120b70160', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '257eca99-6ff2-4447-96da-fbf120b70160')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$misp$q$, $q$MISP$q$, $q$https://www.misp-project.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$opencti$q$, $q$OpenCTI$q$, $q$https://www.opencti.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '51b8b175-b3a3-4820-80ba-3b5c9cb31c4e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$velociraptor$q$, $q$Velociraptor$q$, $q$https://docs.velociraptor.app$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e37166a1-5273-4465-ae0c-fa12188ba286', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e37166a1-5273-4465-ae0c-fa12188ba286')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$fleetdm$q$, $q$FleetDM$q$, $q$https://fleetdm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a79e35cf-f4a5-404f-8138-ace452376ebd', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a79e35cf-f4a5-404f-8138-ace452376ebd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$osquery$q$, $q$osquery$q$, $q$https://www.osquery.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2bf3de07-cc2a-49cd-8239-4d711fd37c68', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2bf3de07-cc2a-49cd-8239-4d711fd37c68')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$suricata$q$, $q$Suricata$q$, $q$https://suricata.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ee44c6e-b374-4911-ad78-9275dc36fec8', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ee44c6e-b374-4911-ad78-9275dc36fec8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$zeek$q$, $q$Zeek$q$, $q$https://zeek.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82d8db18-43fe-4252-9850-0cc4a603d607', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82d8db18-43fe-4252-9850-0cc4a603d607')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$snort$q$, $q$Snort$q$, $q$https://www.snort.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '816a340d-aa9a-49e1-9aad-c93e0406c1d9', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '816a340d-aa9a-49e1-9aad-c93e0406c1d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$defectdojo$q$, $q$DefectDojo$q$, $q$https://www.defectdojo.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '717823fe-8010-4821-a2b2-2263a7afbe21', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '717823fe-8010-4821-a2b2-2263a7afbe21')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$faraday$q$, $q$Faraday$q$, $q$https://faradaysec.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '119e88eb-8125-4474-bd00-8010e05e2e72', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '119e88eb-8125-4474-bd00-8010e05e2e72')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$dependency-track$q$, $q$Dependency-Track$q$, $q$https://dependencytrack.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b102eee5-b364-47b7-9569-b256d99e7549', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b102eee5-b364-47b7-9569-b256d99e7549')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$owasp-dependency-check$q$, $q$OWASP Dependency-Check$q$, $q$https://owasp.org/www-project-dependency-check$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4e30e978-262d-4a83-b746-96ea2a1f37ae', 'ae1ba790-36aa-40e4-822c-a843237ae9a1', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e30e978-262d-4a83-b746-96ea2a1f37ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$harbor$q$, $q$Harbor$q$, $q$https://goharbor.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2fda9f09-2141-4cc7-84c4-66606e716a87', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2fda9f09-2141-4cc7-84c4-66606e716a87')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$quay$q$, $q$Quay$q$, $q$https://www.redhat.com/en/technologies/cloud-computing/quay$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd5332e67-88ad-4e34-998d-c503ab84ed89', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5332e67-88ad-4e34-998d-c503ab84ed89')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$verdaccio$q$, $q$Verdaccio$q$, $q$https://verdaccio.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e4836b9e-697c-4735-b03e-624cbcf6545f', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4836b9e-697c-4735-b03e-624cbcf6545f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$sonatype-nexus-repository$q$, $q$Sonatype Nexus Repository$q$, $q$https://www.sonatype.com/products/sonatype-nexus-repository$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba780fa8-7453-4d31-a091-d99288158644', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba780fa8-7453-4d31-a091-d99288158644')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$jfrog-artifactory$q$, $q$JFrog Artifactory$q$, $q$https://jfrog.com/artifactory$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed99d703-32ed-4261-9895-3b1e2b391d3a', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed99d703-32ed-4261-9895-3b1e2b391d3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$pulp$q$, $q$Pulp$q$, $q$https://pulpproject.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ebebe13c-233a-47f4-a8e7-636776fbd5d6', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebebe13c-233a-47f4-a8e7-636776fbd5d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$cloudsmith$q$, $q$Cloudsmith$q$, $q$https://cloudsmith.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e47e77d6-8770-40cc-ad32-e7a099e5b0e2', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e47e77d6-8770-40cc-ad32-e7a099e5b0e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$nagios$q$, $q$Nagios$q$, $q$https://www.nagios.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6fe712b1-9844-4be1-8956-48e550068b64', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fe712b1-9844-4be1-8956-48e550068b64')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$checkmk$q$, $q$Checkmk$q$, $q$https://checkmk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5beb7929-33c1-44c9-ad6b-682495b32b28', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5beb7929-33c1-44c9-ad6b-682495b32b28')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$librenms$q$, $q$LibreNMS$q$, $q$https://www.librenms.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f5945274-4119-4f53-a92b-62b5b22c5045', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5945274-4119-4f53-a92b-62b5b22c5045')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$observium$q$, $q$Observium$q$, $q$https://www.observium.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d389cbb-d85a-449c-bf50-4f82fcfc841f', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d389cbb-d85a-449c-bf50-4f82fcfc841f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$gatus$q$, $q$Gatus$q$, $q$https://gatus.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1edb450a-0531-4854-a16b-c23fd485bcce', $q$cabot$q$, $q$Cabot$q$, $q$https://cabotapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1edb450a-0531-4854-a16b-c23fd485bcce', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1edb450a-0531-4854-a16b-c23fd485bcce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$thanos$q$, $q$Thanos$q$, $q$https://thanos.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$graylog$q$, $q$Graylog$q$, $q$https://graylog.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5f805c48-e5b0-4af0-83dd-98deb8ee69d9', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f805c48-e5b0-4af0-83dd-98deb8ee69d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$fluentd$q$, $q$Fluentd$q$, $q$https://www.fluentd.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d623697-0839-419d-b74c-5c99fda783e0', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d623697-0839-419d-b74c-5c99fda783e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$fluent-bit$q$, $q$Fluent Bit$q$, $q$https://fluentbit.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c5592933-959b-4725-9845-baccff52192d', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5592933-959b-4725-9845-baccff52192d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$vector$q$, $q$Vector$q$, $q$https://vector.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8ccfa422-ec09-4a81-8ffc-cee3d57641ca', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ccfa422-ec09-4a81-8ffc-cee3d57641ca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$logstash$q$, $q$Logstash$q$, $q$https://www.elastic.co/logstash$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dbaa6caa-3a8b-44a6-a307-4debcee9af7a', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dbaa6caa-3a8b-44a6-a307-4debcee9af7a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$jaeger$q$, $q$Jaeger$q$, $q$https://www.jaegertracing.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '117d354d-ba1d-4901-852d-f37b6680c972', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '117d354d-ba1d-4901-852d-f37b6680c972')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$zipkin$q$, $q$Zipkin$q$, $q$https://zipkin.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b18b84bf-1a80-44d2-8619-43e15614d140', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b18b84bf-1a80-44d2-8619-43e15614d140')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$bugsink$q$, $q$Bugsink$q$, $q$https://www.bugsink.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b5e89d16-61c3-4ade-882a-138e2a553e12', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5e89d16-61c3-4ade-882a-138e2a553e12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$coroot$q$, $q$Coroot$q$, $q$https://coroot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '883b2808-6d12-4830-b483-eca7281f59f1', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '883b2808-6d12-4830-b483-eca7281f59f1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$opentelemetry$q$, $q$OpenTelemetry$q$, $q$https://opentelemetry.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '567932b8-eb63-435b-a35e-b252afd5a120', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '567932b8-eb63-435b-a35e-b252afd5a120')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$streamsets$q$, $q$StreamSets$q$, $q$https://streamsets.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af41f8fc-b90f-4d77-80ef-840d3baf8120', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af41f8fc-b90f-4d77-80ef-840d3baf8120')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$debezium$q$, $q$Debezium$q$, $q$https://debezium.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8fe9ecc9-4076-431c-b5a3-fbde13581137', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8fe9ecc9-4076-431c-b5a3-fbde13581137')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$estuary-flow$q$, $q$Estuary Flow$q$, $q$https://estuary.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c4addc67-46f9-4aeb-9550-246f4f8c3d78', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4addc67-46f9-4aeb-9550-246f4f8c3d78')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$growthloop$q$, $q$GrowthLoop$q$, $q$https://www.growthloop.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '45050474-ebf1-4a46-89d7-f47f4521c45f', '9376b76b-56aa-41cc-bcee-042c76df96c2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45050474-ebf1-4a46-89d7-f47f4521c45f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$redash$q$, $q$Redash$q$, $q$https://redash.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4fe35bb-b786-4c89-83e9-c43385bfe93b', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4fe35bb-b786-4c89-83e9-c43385bfe93b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$lightdash$q$, $q$Lightdash$q$, $q$https://www.lightdash.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c32a6cb9-22d2-4149-b6bc-129ecd02b8c3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$evidence$q$, $q$Evidence$q$, $q$https://evidence.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5512df11-bacf-4edc-8977-91af599645ef', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5512df11-bacf-4edc-8977-91af599645ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$cube$q$, $q$Cube$q$, $q$https://cube.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ae35df8-1db0-4f11-b030-bac3223a2cbe', '6b52a111-e823-4cc4-9029-7f798d5872f9', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ae35df8-1db0-4f11-b030-bac3223a2cbe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$sqlmesh$q$, $q$SQLMesh$q$, $q$https://sqlmesh.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5c5bacf6-63dd-435b-b336-2b016854189b', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c5bacf6-63dd-435b-b336-2b016854189b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$dataform$q$, $q$Dataform$q$, $q$https://cloud.google.com/dataform$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6e6b8492-4c4d-4131-97c2-330cb025a664', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e6b8492-4c4d-4131-97c2-330cb025a664')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$rundeck$q$, $q$Rundeck$q$, $q$https://www.rundeck.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', 'a54dce62-a992-4017-9d68-c3d348a7bf3d', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$mlflow$q$, $q$MLflow$q$, $q$https://mlflow.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '731c611d-030c-488a-b3cb-8255aa73e8ab', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '731c611d-030c-488a-b3cb-8255aa73e8ab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$kubeflow$q$, $q$Kubeflow$q$, $q$https://www.kubeflow.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '47cd8f03-df02-4827-a41a-94df72cd0222', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47cd8f03-df02-4827-a41a-94df72cd0222')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$dvc$q$, $q$DVC$q$, $q$https://dvc.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1c8e4152-687c-4455-b1b5-b86303960027', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c8e4152-687c-4455-b1b5-b86303960027')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$clearml$q$, $q$ClearML$q$, $q$https://clear.ml$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f1140885-6be9-4e12-8a14-e60b800377b9', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1140885-6be9-4e12-8a14-e60b800377b9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$feast$q$, $q$Feast$q$, $q$https://feast.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f7aac8e5-93a6-4551-b76b-53dae46d786f', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7aac8e5-93a6-4551-b76b-53dae46d786f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$bentoml$q$, $q$BentoML$q$, $q$https://www.bentoml.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a4996b9-281e-4443-a143-16669b9aebee', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a4996b9-281e-4443-a143-16669b9aebee')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('10293470-1da9-4e2e-8572-c5038c251326', $q$seldon$q$, $q$Seldon$q$, $q$https://www.seldon.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '10293470-1da9-4e2e-8572-c5038c251326', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10293470-1da9-4e2e-8572-c5038c251326')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$weights-biases$q$, $q$Weights & Biases$q$, $q$https://wandb.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c66ab08-e955-4517-83cb-ca812af3c38d', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c66ab08-e955-4517-83cb-ca812af3c38d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$comet$q$, $q$Comet$q$, $q$https://www.comet.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd1e51b23-11d5-4a32-91ce-ccf878a2484a', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1e51b23-11d5-4a32-91ce-ccf878a2484a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$evidently$q$, $q$Evidently$q$, $q$https://www.evidentlyai.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '77429280-36af-46ef-b496-25b4c65c2176', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '77429280-36af-46ef-b496-25b4c65c2176')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$arize-phoenix$q$, $q$Arize Phoenix$q$, $q$https://phoenix.arize.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '43a21783-24ae-4f92-b263-4021ecd34f16', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43a21783-24ae-4f92-b263-4021ecd34f16')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$langfuse$q$, $q$Langfuse$q$, $q$https://langfuse.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c392b66f-4dcb-40e6-989c-f072b529aff7', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c392b66f-4dcb-40e6-989c-f072b529aff7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$helicone$q$, $q$Helicone$q$, $q$https://www.helicone.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5b558345-f62d-4c17-b8c6-88e78d8300a2', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b558345-f62d-4c17-b8c6-88e78d8300a2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$openllmetry$q$, $q$OpenLLMetry$q$, $q$https://www.traceloop.com/openllmetry$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1c4daae7-b7fd-449c-a71e-daba739c3ca5', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c4daae7-b7fd-449c-a71e-daba739c3ca5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$promptlayer$q$, $q$PromptLayer$q$, $q$https://promptlayer.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '788da3e1-d1d6-401e-a948-5529f931152a', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '788da3e1-d1d6-401e-a948-5529f931152a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f1bc166f-ddbe-4be1-8ddf-8e45667c861e', $q$humanloop$q$, $q$Humanloop$q$, $q$https://humanloop.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f1bc166f-ddbe-4be1-8ddf-8e45667c861e', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1bc166f-ddbe-4be1-8ddf-8e45667c861e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$langsmith$q$, $q$LangSmith$q$, $q$https://www.langchain.com/langsmith$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ebd27bea-946b-435d-8767-2c6ce3d3d696', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebd27bea-946b-435d-8767-2c6ce3d3d696')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$dify$q$, $q$Dify$q$, $q$https://dify.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd515660a-2710-4138-a906-19ab0c3f0a81', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd515660a-2710-4138-a906-19ab0c3f0a81')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$flowise$q$, $q$Flowise$q$, $q$https://flowiseai.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a24c79b2-2532-4586-980b-a77abc122161', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a24c79b2-2532-4586-980b-a77abc122161')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$langflow$q$, $q$Langflow$q$, $q$https://www.langflow.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '063d9724-1713-4fc5-9347-e4e03f6040a1', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '063d9724-1713-4fc5-9347-e4e03f6040a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$anythingllm$q$, $q$AnythingLLM$q$, $q$https://anythingllm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b9045b0b-a0f9-495a-a06c-21acb051ac12', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$open-webui$q$, $q$Open WebUI$q$, $q$https://openwebui.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '362996ad-6cda-41f1-8ec2-066aa387a46c', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '362996ad-6cda-41f1-8ec2-066aa387a46c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$librechat$q$, $q$LibreChat$q$, $q$https://www.librechat.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '465b7b09-9fa2-4ab9-9a80-e441a1effd0a', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '465b7b09-9fa2-4ab9-9a80-e441a1effd0a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b5d7cf28-5eac-4ad6-a24a-dff47bd3edc7', $q$lobechat$q$, $q$LobeChat$q$, $q$https://lobehub.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b5d7cf28-5eac-4ad6-a24a-dff47bd3edc7', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5d7cf28-5eac-4ad6-a24a-dff47bd3edc7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$jan$q$, $q$Jan$q$, $q$https://jan.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9cc30e55-3b4a-4b57-88bd-393a5082ac87', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9cc30e55-3b4a-4b57-88bd-393a5082ac87')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$gpt4all$q$, $q$GPT4All$q$, $q$https://www.nomic.ai/gpt4all$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bdd55166-9401-4b99-9213-184d1c7c5807', '89b4cd15-6f79-4aa6-a0ba-0e76bca68816', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bdd55166-9401-4b99-9213-184d1c7c5807')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$ollama$q$, $q$Ollama$q$, $q$https://ollama.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c830bb2b-1cd7-47d7-b6a1-c48147945ecf', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c830bb2b-1cd7-47d7-b6a1-c48147945ecf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$localai$q$, $q$LocalAI$q$, $q$https://localai.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c416cb1e-8524-43e0-a740-2a092903d5fe', 'f97d13df-30dd-4c2a-8bb8-d64e75a75a92', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c416cb1e-8524-43e0-a740-2a092903d5fe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$vllm$q$, $q$vLLM$q$, $q$https://vllm.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1abf3a7b-a12c-4d0b-8925-d4026402d4e5', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$litellm$q$, $q$LiteLLM$q$, $q$https://www.litellm.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '02fc0fca-7896-41fa-8356-751971c7a3eb', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02fc0fca-7896-41fa-8356-751971c7a3eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$openrouter$q$, $q$OpenRouter$q$, $q$https://openrouter.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54b33467-c0e1-45e4-b29f-69b5ce8ea2dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$together-ai$q$, $q$Together AI$q$, $q$https://www.together.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95e1413b-980b-4a7c-a0da-8b7353d2474d', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95e1413b-980b-4a7c-a0da-8b7353d2474d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$fireworks-ai$q$, $q$Fireworks AI$q$, $q$https://fireworks.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aff64b96-3f9d-4b60-acba-86586aac9085', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aff64b96-3f9d-4b60-acba-86586aac9085')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$replicate$q$, $q$Replicate$q$, $q$https://replicate.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '60180cba-c779-4a42-9314-22aade49a3a1', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60180cba-c779-4a42-9314-22aade49a3a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$modal$q$, $q$Modal$q$, $q$https://modal.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c5f50ff9-292d-461f-9877-3ee54d35032f', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5f50ff9-292d-461f-9877-3ee54d35032f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$runpod$q$, $q$RunPod$q$, $q$https://www.runpod.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '33a2e54d-ea2a-4eac-b6c4-dbd80828337e', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33a2e54d-ea2a-4eac-b6c4-dbd80828337e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$baseten$q$, $q$Baseten$q$, $q$https://www.baseten.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5ad76bbb-468c-4854-b144-baf5844135c5', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ad76bbb-468c-4854-b144-baf5844135c5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$anyscale$q$, $q$Anyscale$q$, $q$https://www.anyscale.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be678c6c-acd6-4ec2-a468-efd166188d17', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be678c6c-acd6-4ec2-a468-efd166188d17')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$ray$q$, $q$Ray$q$, $q$https://www.ray.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2cf05821-b645-4a5c-9cb3-a492d371211f', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2cf05821-b645-4a5c-9cb3-a492d371211f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$label-studio$q$, $q$Label Studio$q$, $q$https://labelstud.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b86f2d2c-9242-4ac1-8381-48bac80db6dd', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b86f2d2c-9242-4ac1-8381-48bac80db6dd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e0e7ab65-6f45-469f-a81e-a24f104a32d1', $q$argilla$q$, $q$Argilla$q$, $q$https://argilla.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e0e7ab65-6f45-469f-a81e-a24f104a32d1', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0e7ab65-6f45-469f-a81e-a24f104a32d1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$cvat$q$, $q$CVAT$q$, $q$https://www.cvat.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0d4608fd-3411-46e9-b7bd-86e6765d726c', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d4608fd-3411-46e9-b7bd-86e6765d726c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$labelbox$q$, $q$Labelbox$q$, $q$https://labelbox.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5ff2b0e8-8acc-497e-9c48-da9f2af462a8', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ff2b0e8-8acc-497e-9c48-da9f2af462a8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$superannotate$q$, $q$SuperAnnotate$q$, $q$https://www.superannotate.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '53a0cb41-3c1b-499b-a369-31d2bb36357e', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53a0cb41-3c1b-499b-a369-31d2bb36357e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$roboflow$q$, $q$Roboflow$q$, $q$https://roboflow.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee1d5a2e-e303-4d50-b144-230cf5daeaf1', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee1d5a2e-e303-4d50-b144-230cf5daeaf1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$ultralytics$q$, $q$Ultralytics$q$, $q$https://www.ultralytics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3ae68e89-7cc4-46ca-b15d-3b10568de023', '929b2e83-272f-462b-9290-df5152725e29', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ae68e89-7cc4-46ca-b15d-3b10568de023')
ON CONFLICT DO NOTHING;


-- Strategic metadata — one row per list entry (new tool or matched existing).
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '016aac11-14a9-4e56-958c-3b361e5b1ef4', $q$CRM$q$, 1, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '016aac11-14a9-4e56-958c-3b361e5b1ef4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$CRM$q$, 2, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a346f9ff-ee8c-46ac-9a67-521ae858c58b', $q$CRM$q$, 3, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a346f9ff-ee8c-46ac-9a67-521ae858c58b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e2c5c190-2aaa-46b6-b142-c38b763e334a', $q$ERP & Business Management$q$, 4, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2c5c190-2aaa-46b6-b142-c38b763e334a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '99b0c7e3-3443-428c-9117-bae2653976d1', $q$Accounting$q$, 5, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '99b0c7e3-3443-428c-9117-bae2653976d1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869', $q$Accounting$q$, 6, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1cc4c3e-0cf9-4d81-96ce-6a93cb963869')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a4e1855-1280-4e6d-addb-b37221f3a3ec', $q$Accounting$q$, 7, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a4e1855-1280-4e6d-addb-b37221f3a3ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '607fbb48-621c-4c7e-b652-55e4892d86ce', $q$Accounting$q$, 8, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '607fbb48-621c-4c7e-b652-55e4892d86ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0ef7337-a5e2-4799-a976-3b354b927eaf', $q$Accounting$q$, 9, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0ef7337-a5e2-4799-a976-3b354b927eaf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1f92f756-1ddd-475c-a7ab-6671d8405485', $q$Personal Finance$q$, 10, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1f92f756-1ddd-475c-a7ab-6671d8405485')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Personal Finance$q$, 11, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'da31787e-379e-49b6-a261-7561c9b69de4', $q$Personal Finance$q$, 12, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da31787e-379e-49b6-a261-7561c9b69de4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b18967c-f6f6-453b-8f0e-8b8d312dfe53', $q$Personal Finance$q$, 13, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b18967c-f6f6-453b-8f0e-8b8d312dfe53')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '94821a2d-fb17-42ea-8e5e-a593d22a6841', $q$Personal Finance$q$, 14, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94821a2d-fb17-42ea-8e5e-a593d22a6841')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bfc32b77-2902-4a87-8ab8-27743eb3989b', $q$Project Management$q$, 15, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfc32b77-2902-4a87-8ab8-27743eb3989b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82a64b4e-889f-499f-9da5-e2f83f5d9d43', $q$Project Management$q$, 16, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82a64b4e-889f-499f-9da5-e2f83f5d9d43')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085', $q$Project Management$q$, 17, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa4f4092-fd7c-44e6-a8d5-8c7d5fc2b085')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Productivity$q$, 18, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '083ec4ab-767e-4d64-abab-5bc86ae9e884')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Productivity$q$, 19, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fc868bfd-fdf4-4187-9d7e-b719006af946', $q$Productivity$q$, 20, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc868bfd-fdf4-4187-9d7e-b719006af946')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a1e8900-232b-487e-a707-161bf160047b', $q$Productivity$q$, 21, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a1e8900-232b-487e-a707-161bf160047b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4de112c5-5df2-4ef8-9c42-0ec1c3bde762', $q$Productivity$q$, 22, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4de112c5-5df2-4ef8-9c42-0ec1c3bde762')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '19834a87-bdcd-4d0a-b9a5-f013e990b7b2', $q$Productivity$q$, 23, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19834a87-bdcd-4d0a-b9a5-f013e990b7b2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce', $q$Productivity$q$, 24, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bbef43e5-afc5-416f-a4bf-68df7c6a61ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4d5b94dc-fbd1-4f00-aeaf-079f4a300745', $q$Productivity$q$, 25, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d5b94dc-fbd1-4f00-aeaf-079f4a300745')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b', $q$Productivity$q$, 26, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c8191c2-eb3f-4d5e-8efc-4c1e054d313b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc626839-0d04-4df9-9c03-63658e2f415a', $q$Knowledge Management$q$, 27, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc626839-0d04-4df9-9c03-63658e2f415a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6c79fd04-1ff8-447b-b662-4ad9e3fff565', $q$Knowledge Management$q$, 28, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c79fd04-1ff8-447b-b662-4ad9e3fff565')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0ed8be1e-2fb9-4bf9-a989-092c8ce6517d', $q$Team Communication$q$, 29, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ed8be1e-2fb9-4bf9-a989-092c8ce6517d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '376dca7b-3bc4-46f6-ae09-635baf27d62b', $q$Team Communication$q$, 30, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '376dca7b-3bc4-46f6-ae09-635baf27d62b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c920ff4f-292d-4b70-82c4-92886a22daa0', $q$Team Communication$q$, 31, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c920ff4f-292d-4b70-82c4-92886a22daa0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7a0ebe08-e4d6-46da-a624-6b276c676577', $q$Team Communication$q$, 32, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7a0ebe08-e4d6-46da-a624-6b276c676577')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9f4d0c4d-4a72-444b-93c1-cad35e82f0d3', $q$Team Communication$q$, 33, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f4d0c4d-4a72-444b-93c1-cad35e82f0d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f5b98a61-eacf-4efe-aaf6-07eff41492b5', $q$Video Conferencing$q$, 34, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5b98a61-eacf-4efe-aaf6-07eff41492b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6128d24-7ad0-4f60-87ac-6b8a21ef5c99', $q$Video Conferencing$q$, 36, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6128d24-7ad0-4f60-87ac-6b8a21ef5c99')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '36449a40-80e5-4dd6-8164-c731f720d4dd', $q$Video Conferencing$q$, 37, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36449a40-80e5-4dd6-8164-c731f720d4dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '53194735-82e1-4a27-b2dc-b4ed0454db1e', $q$Video Conferencing$q$, 38, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53194735-82e1-4a27-b2dc-b4ed0454db1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6396cd5b-5f93-4e4e-a61e-b8afc0db1893', $q$Team Communication$q$, 39, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6396cd5b-5f93-4e4e-a61e-b8afc0db1893')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '447961f9-a6c6-4aef-b7cc-318f6a912fa3', $q$Team Communication$q$, 40, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '447961f9-a6c6-4aef-b7cc-318f6a912fa3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '104c1524-087c-4a12-b6f7-1c69780a1d4b', $q$Community Platforms$q$, 41, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '104c1524-087c-4a12-b6f7-1c69780a1d4b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a7a7d03-38e8-4c10-aa13-d20c62a48b08', $q$Community Platforms$q$, 42, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a7a7d03-38e8-4c10-aa13-d20c62a48b08')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9fecdcd9-2620-4cdf-982f-3615b76750b1', $q$Social Networks$q$, 43, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9fecdcd9-2620-4cdf-982f-3615b76750b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bbcea426-8b22-4fd5-96ad-4e11c6da8bd2', $q$Social Networks$q$, 44, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bbcea426-8b22-4fd5-96ad-4e11c6da8bd2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '87827575-d6b9-427d-9a29-d335e632d59f', $q$Social Networks$q$, 45, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87827575-d6b9-427d-9a29-d335e632d59f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c0016ff-460a-49f3-a0f2-026bb26769d9', $q$Social Networks$q$, 46, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c0016ff-460a-49f3-a0f2-026bb26769d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '18949653-684b-4d6b-9f7f-0ba4d9594f29', $q$Social Networks$q$, 47, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18949653-684b-4d6b-9f7f-0ba4d9594f29')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f318e3fc-7f57-48b4-8872-a1885a2bafc0', $q$Community Platforms$q$, 48, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f318e3fc-7f57-48b4-8872-a1885a2bafc0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '43f6360a-aa53-44d3-b925-dc3fc6ed4841', $q$Community Platforms$q$, 49, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43f6360a-aa53-44d3-b925-dc3fc6ed4841')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ab47ffe-4a96-4827-af17-8cd00e51800b', $q$Event Management$q$, 50, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ab47ffe-4a96-4827-af17-8cd00e51800b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '283e6deb-e069-4af7-88a7-a176d867da95', $q$Event Management$q$, 51, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '283e6deb-e069-4af7-88a7-a176d867da95')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '309b9728-2f66-4911-9e11-c40f64054a67', $q$Event Management$q$, 52, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '309b9728-2f66-4911-9e11-c40f64054a67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8e0b83b6-71ce-4357-81d5-6f9274821112', $q$No-Code & Databases$q$, 55, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e0b83b6-71ce-4357-81d5-6f9274821112')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a277ff8-0957-4069-9f79-4ef1be818b6e', $q$No-Code & Databases$q$, 56, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a277ff8-0957-4069-9f79-4ef1be818b6e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b0a59332-e7cb-4428-afe9-3934017982dd', $q$No-Code & Databases$q$, 57, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b0a59332-e7cb-4428-afe9-3934017982dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0909fefb-ee91-4a8f-972b-d6cce78f8b1e', $q$No-Code & Databases$q$, 58, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0909fefb-ee91-4a8f-972b-d6cce78f8b1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$No-Code & Databases$q$, 59, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b425d59b-1c35-4d02-b5ba-62b13f0c3db7', $q$No-Code & Databases$q$, 60, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b425d59b-1c35-4d02-b5ba-62b13f0c3db7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff', $q$Headless CMS$q$, 61, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ae551c4-e1e4-4011-b3e4-9ec706fc44ff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '10cff4ac-f281-4d9e-998a-dc5742fcfd08', $q$Headless CMS$q$, 62, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10cff4ac-f281-4d9e-998a-dc5742fcfd08')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '26315baf-61aa-4fda-b2de-4986fe3babe9', $q$Headless CMS$q$, 63, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '26315baf-61aa-4fda-b2de-4986fe3babe9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f9925de6-28c3-40f9-a148-3dd0616aa66f', $q$CMS$q$, 64, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9925de6-28c3-40f9-a148-3dd0616aa66f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '35e4bc85-6298-43d3-bc27-0854ea063792', $q$CMS$q$, 65, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35e4bc85-6298-43d3-bc27-0854ea063792')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fbbd32cd-6120-4478-b00a-9de654f9e59e', $q$CMS$q$, 66, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbbd32cd-6120-4478-b00a-9de654f9e59e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '960def45-b280-43d5-9fc8-858cdf44c8e2', $q$CMS$q$, 67, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '960def45-b280-43d5-9fc8-858cdf44c8e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '41d3c6d5-f1bd-4474-a701-bf4a104a118c', $q$CMS$q$, 68, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41d3c6d5-f1bd-4474-a701-bf4a104a118c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7442e6d9-b040-4cc3-a601-2e27ba36cb13', $q$CMS$q$, 69, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7442e6d9-b040-4cc3-a601-2e27ba36cb13')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5534f256-62d0-46af-b02c-4c789873abc7', $q$CMS$q$, 70, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5534f256-62d0-46af-b02c-4c789873abc7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db', $q$CMS$q$, 71, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1977ce3-5ae1-4d22-8fba-55e0bd8412db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$CMS$q$, 72, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba', $q$CMS$q$, 73, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbbf64a9-d7e7-4ac7-970d-5bf277603dba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aef99ec6-cc74-4f51-80a7-2b4686dc1465', $q$Publishing$q$, 76, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aef99ec6-cc74-4f51-80a7-2b4686dc1465')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18', $q$Publishing$q$, 77, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '338c1b3b-50e3-45a0-b1e8-99c9e22e7a18')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '53ba4185-9c98-4925-94b6-7aa6336c54d0', $q$Publishing$q$, 78, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53ba4185-9c98-4925-94b6-7aa6336c54d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3bc33713-c005-4ff3-a44a-039f94585dff', $q$Publishing$q$, 79, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bc33713-c005-4ff3-a44a-039f94585dff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a7ee6f66-16f1-4c51-a583-64c21b5e4165', $q$Publishing$q$, 80, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a7ee6f66-16f1-4c51-a583-64c21b5e4165')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4129c50a-55d6-450e-8940-28027dd14508', $q$E-commerce$q$, 81, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4129c50a-55d6-450e-8940-28027dd14508')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90', $q$E-commerce$q$, 82, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ccabbef-b970-4c8f-b9a2-9ac140b5ea90')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8c235fd0-f6aa-40a1-a259-80552567229d', $q$E-commerce$q$, 83, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8c235fd0-f6aa-40a1-a259-80552567229d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fd85391e-2a8c-4713-ae6d-b8babec00fef', $q$E-commerce$q$, 84, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd85391e-2a8c-4713-ae6d-b8babec00fef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b6f6733-ef4d-4430-95f2-717f687caf82', $q$E-commerce$q$, 85, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b6f6733-ef4d-4430-95f2-717f687caf82')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$E-commerce$q$, 86, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7d420822-07a5-41e5-ace9-e3a4a6821dee', $q$E-commerce$q$, 88, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d420822-07a5-41e5-ace9-e3a4a6821dee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54196510-1549-49ef-8799-53017ed6e08f', $q$E-commerce$q$, 89, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54196510-1549-49ef-8799-53017ed6e08f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '80d28886-f2f5-4191-a617-3ed3234eb862', $q$E-commerce$q$, 90, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80d28886-f2f5-4191-a617-3ed3234eb862')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '634915a8-0356-4646-9ea7-8f8a547db0f9', $q$E-commerce$q$, 91, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '634915a8-0356-4646-9ea7-8f8a547db0f9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c34caf13-187c-4852-8539-3e8297879c3d', $q$E-commerce$q$, 92, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c34caf13-187c-4852-8539-3e8297879c3d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ee87c2b-85ba-44c2-8569-a2e50fe673c2', $q$E-commerce$q$, 93, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ee87c2b-85ba-44c2-8569-a2e50fe673c2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8d5b3bdc-eff0-48ab-b65b-30a03203b12e', $q$E-commerce$q$, 94, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d5b3bdc-eff0-48ab-b65b-30a03203b12e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a28c91f9-301a-4413-8b14-a58c3ee344df', $q$E-commerce$q$, 95, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a28c91f9-301a-4413-8b14-a58c3ee344df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '33d8b578-c949-41fd-b5e1-f9c8acf9190a', $q$E-commerce$q$, 98, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33d8b578-c949-41fd-b5e1-f9c8acf9190a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '07fb8b20-d497-452b-ab9e-d61603e77eb7', $q$Billing$q$, 99, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07fb8b20-d497-452b-ab9e-d61603e77eb7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92', $q$Billing$q$, 100, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd452fd91-6d49-40e7-8a71-ae9f6a9bbf92')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'db4e8f1d-beb1-40ee-bdeb-678fe623d016', $q$Billing$q$, 101, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db4e8f1d-beb1-40ee-bdeb-678fe623d016')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a4f0fe3-b308-423c-aecf-cdff842abdcc', $q$Subscription Analytics$q$, 102, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a4f0fe3-b308-423c-aecf-cdff842abdcc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Customer Success$q$, 103, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '354544ee-5844-47e0-abfb-03b3c7ee9886')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '599548f2-9d79-4758-9183-d5c016b8b2a6', $q$Customer Success$q$, 104, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '599548f2-9d79-4758-9183-d5c016b8b2a6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e817d4a-bca3-442e-be39-93f237e411c9', $q$Customer Success$q$, 106, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e817d4a-bca3-442e-be39-93f237e411c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b85ba652-1c1b-4a44-ba69-19c2f681f148', $q$Customer Success$q$, 109, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b85ba652-1c1b-4a44-ba69-19c2f681f148')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd4008e96-5007-46e7-98c7-0f90f45c63fa', $q$Customer Support$q$, 111, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd4008e96-5007-46e7-98c7-0f90f45c63fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ad76ec7-95d0-4c9d-8183-877e0a53b6e2', $q$Customer Support$q$, 112, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ad76ec7-95d0-4c9d-8183-877e0a53b6e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Customer Support$q$, 113, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1e90b718-dc56-45ed-adcf-9ca1d534513e', $q$Customer Support$q$, 114, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e90b718-dc56-45ed-adcf-9ca1d534513e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '203778ad-4def-4fde-8983-24641267e6c6', $q$Customer Support$q$, 115, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '203778ad-4def-4fde-8983-24641267e6c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6e21c1b-c4e0-486b-8501-88c1bbe7830a', $q$Customer Support$q$, 116, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6e21c1b-c4e0-486b-8501-88c1bbe7830a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c74c6d31-a2de-408d-9658-1ce6cd0f1ff3', $q$Customer Support$q$, 117, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c74c6d31-a2de-408d-9658-1ce6cd0f1ff3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ff507f8-cdb5-4501-a01f-b42875d7b2a8', $q$Customer Support$q$, 118, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ff507f8-cdb5-4501-a01f-b42875d7b2a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b4d4e26c-b174-4a6c-a897-123a9f5d759f', $q$IT Service Management$q$, 119, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4d4e26c-b174-4a6c-a897-123a9f5d759f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7979bb4-e11f-4629-ba03-f702582d77cc', $q$IT Service Management$q$, 120, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7979bb4-e11f-4629-ba03-f702582d77cc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '807b9f70-85d4-451c-836e-7da931db0f4d', $q$IT Asset Management$q$, 121, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '807b9f70-85d4-451c-836e-7da931db0f4d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2b9da418-5593-411e-b754-f7ed76965af3', $q$IT Asset Management$q$, 122, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2b9da418-5593-411e-b754-f7ed76965af3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aec1c6d5-ecc8-46ac-9da2-4a389876a94b', $q$IT Infrastructure$q$, 123, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aec1c6d5-ecc8-46ac-9da2-4a389876a94b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '979b8875-ed44-408b-b6aa-f0477d81e7fc', $q$IT Infrastructure$q$, 124, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '979b8875-ed44-408b-b6aa-f0477d81e7fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '42a75ad3-068c-492e-a658-dfdeda416a65', $q$IT Infrastructure$q$, 125, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42a75ad3-068c-492e-a658-dfdeda416a65')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4a6cf529-e980-41a6-a8bd-f9fddd93fce3', $q$IT Infrastructure$q$, 126, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a6cf529-e980-41a6-a8bd-f9fddd93fce3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9fc7c07a-2f39-4616-b762-2e97af017f6e', $q$IT Asset Management$q$, 127, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9fc7c07a-2f39-4616-b762-2e97af017f6e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '41501fa1-8a36-4631-b45d-fc12ce3657f5', $q$IT Service Management$q$, 128, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41501fa1-8a36-4631-b45d-fc12ce3657f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0de1e87e-9618-43ae-b91b-b9ceedf4e826', $q$IT Service Management$q$, 129, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0de1e87e-9618-43ae-b91b-b9ceedf4e826')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c110df5-bfa6-4663-9dad-5ea512a9a23a', $q$IT Service Management$q$, 130, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c110df5-bfa6-4663-9dad-5ea512a9a23a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e', $q$IT Service Management$q$, 131, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aa99e850-6bd2-45a1-aa7b-4b9df4d24c1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '47b3f39e-f481-4d52-be50-11d497bacb7b', $q$IT Service Management$q$, 132, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47b3f39e-f481-4d52-be50-11d497bacb7b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6c4d248e-ed75-425f-a74f-2cfa5f36dc03', $q$HR Software$q$, 133, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c4d248e-ed75-425f-a74f-2cfa5f36dc03')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6fd92840-a8d9-4354-97b1-b102f54b88d6', $q$HR Software$q$, 134, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fd92840-a8d9-4354-97b1-b102f54b88d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8e6508f8-f264-449c-bf83-015dd51a8619', $q$HR Software$q$, 135, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e6508f8-f264-449c-bf83-015dd51a8619')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9723eb0b-ac61-46c1-b15a-4b60b4e6d68f', $q$Time Tracking$q$, 136, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9723eb0b-ac61-46c1-b15a-4b60b4e6d68f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Time Tracking$q$, 137, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c90b471e-f0b7-403c-972f-49e1d0871d55')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd816c0d6-616e-417e-bf4c-30fc9be88134', $q$Time Tracking$q$, 138, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd816c0d6-616e-417e-bf4c-30fc9be88134')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5c6ff423-a4cd-408d-b230-67dfd498aa1d', $q$Time Tracking$q$, 139, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c6ff423-a4cd-408d-b230-67dfd498aa1d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ca54283-3659-44f7-9c00-35f92eddfd5f', $q$Time Tracking$q$, 141, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ca54283-3659-44f7-9c00-35f92eddfd5f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc59330e-f844-4f93-be6c-bf6f8678410b', $q$Time Tracking$q$, 142, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc59330e-f844-4f93-be6c-bf6f8678410b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b6b57d57-40f4-4d52-966d-761a1cafadb8', $q$Time Tracking$q$, 143, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6b57d57-40f4-4d52-966d-761a1cafadb8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '83609f1b-4f33-443e-91c3-d41dea40e0aa', $q$Time Tracking$q$, 145, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '83609f1b-4f33-443e-91c3-d41dea40e0aa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c4f3d77-298c-424f-a26d-6c21dd92ceda', $q$Time Tracking$q$, 146, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c4f3d77-298c-424f-a26d-6c21dd92ceda')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e17e182c-05b6-4b50-b6cc-283acedc783a', $q$Electronic Signatures$q$, 147, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e17e182c-05b6-4b50-b6cc-283acedc783a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd5f8979c-0034-41d0-8a61-d04ac685524e', $q$Electronic Signatures$q$, 148, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5f8979c-0034-41d0-8a61-d04ac685524e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '833af197-f585-45d4-b9f9-cf879adb35d4', $q$Document Management$q$, 150, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '833af197-f585-45d4-b9f9-cf879adb35d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '094491bf-2c55-4e74-8744-920a4c1860d4', $q$Document Management$q$, 151, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '094491bf-2c55-4e74-8744-920a4c1860d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b5c46acf-0f25-4f29-8713-c5083cd9eea5', $q$Document Management$q$, 152, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5c46acf-0f25-4f29-8713-c5083cd9eea5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e57311ae-2760-4595-acff-07a9102a6a78', $q$Document Management$q$, 153, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e57311ae-2760-4595-acff-07a9102a6a78')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aca7a829-e889-4429-ac20-146ff507188a', $q$Document Management$q$, 154, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aca7a829-e889-4429-ac20-146ff507188a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fbab0d6d-e002-4027-8b1d-76a72da67b81', $q$Document Management$q$, 155, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbab0d6d-e002-4027-8b1d-76a72da67b81')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13b061f8-1278-44ee-b96b-21fa24709fc9', $q$Document Management$q$, 156, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13b061f8-1278-44ee-b96b-21fa24709fc9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '72dc4119-8718-45ec-8600-77edafd7ff89', $q$Document Management$q$, 157, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '72dc4119-8718-45ec-8600-77edafd7ff89')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '35a25125-49a7-491d-af00-f68e8a653d0c', $q$Document Management$q$, 158, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35a25125-49a7-491d-af00-f68e8a653d0c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f44a41ac-bf85-4920-b6a5-83b94226a9d6', $q$Cloud Storage$q$, 159, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f44a41ac-bf85-4920-b6a5-83b94226a9d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30', $q$Cloud Storage$q$, 160, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de70bfa0-ebf8-448e-ad5c-dfbc5fcd3a30')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '458633b6-d7a2-4972-910e-e20a9a1c4947', $q$Cloud Storage$q$, 161, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '458633b6-d7a2-4972-910e-e20a9a1c4947')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c69f3e8f-9780-457f-a312-c387ed3ead8a', $q$Cloud Storage$q$, 162, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c69f3e8f-9780-457f-a312-c387ed3ead8a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cbc956c8-2e83-4ee3-94e6-cbec829422bf', $q$Cloud Storage$q$, 163, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cbc956c8-2e83-4ee3-94e6-cbec829422bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6081e57b-98a6-4413-b8d5-be18ac3034df', $q$Cloud Storage$q$, 164, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6081e57b-98a6-4413-b8d5-be18ac3034df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bfbd22a1-7933-401b-b0f3-d85dae77fecd', $q$Cloud Storage$q$, 165, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bfbd22a1-7933-401b-b0f3-d85dae77fecd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e72088e-b35d-4326-9a4b-87a7536c4484', $q$Cloud Storage$q$, 166, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e72088e-b35d-4326-9a4b-87a7536c4484')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7f20a0c9-52f8-4c2c-8723-46040d797c2b', $q$Object Storage$q$, 167, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f20a0c9-52f8-4c2c-8723-46040d797c2b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3be3e9b4-cb50-43f7-9445-28dcf621ad49', $q$Object Storage$q$, 168, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3be3e9b4-cb50-43f7-9445-28dcf621ad49')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '32f17210-2418-4e31-bedc-836e12407246', $q$Object Storage$q$, 169, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32f17210-2418-4e31-bedc-836e12407246')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cfd96970-81c8-46e6-aaba-767235ac591e', $q$Object Storage$q$, 170, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfd96970-81c8-46e6-aaba-767235ac591e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8bdbdb20-3a53-4c65-b774-2c8bcceae403', $q$Object Storage$q$, 171, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8bdbdb20-3a53-4c65-b774-2c8bcceae403')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b940250d-ac45-4210-914d-864334dda391', $q$Object Storage$q$, 172, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b940250d-ac45-4210-914d-864334dda391')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '38c4934d-5e31-4ebe-b4ec-4ca3760270e4', $q$Backup$q$, 173, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '38c4934d-5e31-4ebe-b4ec-4ca3760270e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '156f6244-fa16-4f23-b785-7b39766ad2f0', $q$Backup$q$, 174, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '156f6244-fa16-4f23-b785-7b39766ad2f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '806a6c41-0dfb-4b12-9209-416dc798214d', $q$Backup$q$, 175, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '806a6c41-0dfb-4b12-9209-416dc798214d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Backup$q$, 176, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4fda3a0-ecc1-4630-9d85-b01bc239bd2c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b386442-acd6-4287-b601-254de09a7e9b', $q$Backup$q$, 177, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b386442-acd6-4287-b601-254de09a7e9b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '75745b38-a453-422a-bd66-d036181d6207', $q$Backup$q$, 178, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75745b38-a453-422a-bd66-d036181d6207')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Backup$q$, 179, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Backup$q$, 180, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04912e59-00ff-41ed-a119-8f56bc5e3397')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$File Synchronization$q$, 181, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '44084df6-f4d6-4a50-9b62-fd348ba43737', $q$File Synchronization$q$, 182, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44084df6-f4d6-4a50-9b62-fd348ba43737')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0531938d-75d2-445c-8d15-96c3a265f3c0', $q$File Synchronization$q$, 183, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0531938d-75d2-445c-8d15-96c3a265f3c0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$File Synchronization$q$, 184, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d6ffdf8-6da0-4046-a24c-1af0f948ce0d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '245ad2b6-9f67-4f27-8678-01d18388c426', $q$File Synchronization$q$, 185, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '245ad2b6-9f67-4f27-8678-01d18388c426')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Offline Content$q$, 186, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '650e05bf-0756-4e0c-83db-dabfb42d361a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8026be73-ac41-420c-b94b-3ca165f049ef', $q$Bookmarks$q$, 188, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8026be73-ac41-420c-b94b-3ca165f049ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Bookmarks$q$, 189, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a589b88-3042-41c7-8ea2-df2e6f517ac7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Bookmarks$q$, 190, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c2a2dac-cd9a-4339-9ab2-dfd365b2be95')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '64003bd2-5181-45f3-8722-b827c604e9d2', $q$Read It Later$q$, 191, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64003bd2-5181-45f3-8722-b827c604e9d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Read It Later$q$, 192, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0882639c-99a4-4dc9-ad54-7de7889c2d10')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Web Archiving$q$, 194, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3ec637c-da4e-49a1-b2c3-ecb51e556b29')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Bookmarks$q$, 195, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eed72c85-b8c1-41ad-bfa6-c1d425f02b1e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '263cd9a2-c8c9-4495-9dc3-7c90e6e1adef', $q$Bookmarks$q$, 196, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '263cd9a2-c8c9-4495-9dc3-7c90e6e1adef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Photo Management$q$, 197, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6a9fcd4-559e-4221-972d-3f4084fc1dc5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Photo Management$q$, 198, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f89cac5-124c-4e1b-8f09-b84e459dd4dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Photo Management$q$, 199, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd62c6f08-582d-469d-a2bc-f3b5a26a0454')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Photo Management$q$, 200, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dc6e0788-b827-42b0-bfab-4a75e09f4a12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '08cb66ce-1814-4087-a29d-3578403ad173', $q$Photo Management$q$, 201, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08cb66ce-1814-4087-a29d-3578403ad173')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '738c4ff8-6bc1-45af-9978-423b14aba862', $q$Photo Management$q$, 202, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '738c4ff8-6bc1-45af-9978-423b14aba862')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05877299-4a26-44db-aeaf-52ace933c3fc', $q$Photo Management$q$, 203, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05877299-4a26-44db-aeaf-52ace933c3fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Media Server$q$, 204, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07686163-d3fa-49ec-9a3d-0f4d2664089d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Media Server$q$, 205, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '243b00aa-9aa3-4490-8b1b-0156281eda01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Media Server$q$, 206, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Music Server$q$, 207, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c85b0c6f-553d-4885-a67e-33c9297d3634')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e99d3f06-f0d5-4075-94ed-49469f876517', $q$Music Server$q$, 208, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e99d3f06-f0d5-4075-94ed-49469f876517')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Music Server$q$, 209, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11a3e46c-83db-4586-a93d-d93fad3ce9d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Music Server$q$, 210, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '237520e2-d5af-4e71-b585-63b5af2e41f1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Media Server$q$, 211, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Video Hosting$q$, 212, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43fecc1e-117b-4ec8-ae44-12dc137692b9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Live Streaming$q$, 213, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8c86fff-3023-43da-8e2f-7a64b9b6fba4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Video Hosting$q$, 214, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1761a911-bf5b-44d8-a1a3-2fca40562b85')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Video Management$q$, 215, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd3725ed0-83b6-4344-b6e9-9cc03592d572')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Audio Streaming$q$, 216, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Podcasting$q$, 218, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b01d76ea-bf87-434f-abc4-af2bc181bdcc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d8087e6-e022-4b9c-9760-d491836887d8', $q$Video Streaming$q$, 219, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d8087e6-e022-4b9c-9760-d491836887d8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Video Streaming$q$, 220, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Video Production$q$, 221, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba63a23f-3cf0-4180-a7bf-2561af98bb09')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Video Editing$q$, 222, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '57934454-9221-47e3-87a7-83d5b080c4a6', $q$Video Editing$q$, 223, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57934454-9221-47e3-87a7-83d5b080c4a6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Video Editing$q$, 224, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '541442eb-549b-42a3-a8f8-d423bdb42a14')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Video Editing$q$, 225, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76721f82-dab0-44d8-9e79-1d3b6df99f76')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Video Editing$q$, 226, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '588dad8e-446f-42e3-8554-3bef2ef37a9a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Video Tools$q$, 227, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5193cb21-ed1a-4efa-8952-c3400dfcbad7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Audio Editing$q$, 228, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '31cd7295-1d81-4b31-927e-f153490c69dc', $q$Audio Editing$q$, 229, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31cd7295-1d81-4b31-927e-f153490c69dc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Music Production$q$, 230, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86fbd391-0641-4d3e-9a56-e671a2e7b73d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '909db6fb-d649-46c3-9386-4c38e0917e64', $q$DJ Software$q$, 231, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '909db6fb-d649-46c3-9386-4c38e0917e64')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Music Notation$q$, 232, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7005b5d-dff5-494b-852a-3b557ff0ece0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Music Production$q$, 233, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ae8d22a5-f1b3-47ce-81df-8d297a9c7bba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Music Production$q$, 234, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4193fcc0-5bf7-41df-a6ae-52733d63e797')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Audio Editing$q$, 235, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Graphic Design$q$, 236, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05fd9154-b81e-4108-87a9-fd64b03f828c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4d6dd956-9199-4e06-b14d-777578701617', $q$Graphic Design$q$, 237, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d6dd956-9199-4e06-b14d-777578701617')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Graphic Design$q$, 238, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4dd8f19-6a19-464f-aa03-b7df8213b789')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Publishing Design$q$, 239, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89f1086c-860a-4405-8ba6-cdbbeb21675a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '00563610-94ad-4982-9919-0d497b31162d', $q$Product Design$q$, 240, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00563610-94ad-4982-9919-0d497b31162d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Graphic Design$q$, 241, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a4586b52-247b-4d12-87eb-3ffa94cf6ee5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Graphic Design$q$, 242, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e093e26f-1179-4cad-b7f0-010ea97f3788')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ca5270f-e111-4975-805d-895270a05cb1', $q$Whiteboarding$q$, 243, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ca5270f-e111-4975-805d-895270a05cb1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Whiteboarding$q$, 244, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f6cc024-9f36-451d-b9e9-a8bc13712e95')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Whiteboarding$q$, 245, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6dfb48ec-e418-4fe0-93c7-9323f4ba54ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Collaborative Drawing$q$, 246, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af654930-837f-40c8-b359-6e2d826ad6ff', $q$Diagramming$q$, 247, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af654930-837f-40c8-b359-6e2d826ad6ff')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea83f533-2784-47e9-b55f-e37f270b013d', $q$Diagramming$q$, 248, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea83f533-2784-47e9-b55f-e37f270b013d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Diagramming$q$, 249, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f5095fd-2fe0-49e0-936e-9bb82f1c6752')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Diagramming$q$, 250, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd01ba1ee-34ac-4433-8e64-30da756ce4a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Diagramming$q$, 251, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '810dd7ba-142d-43eb-a0cd-c0bc68503b42')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Office Suite$q$, 252, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54c13dd3-4248-499f-8fcf-083dadd9d1bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ab659340-1acd-4acc-9653-f4c90a759519', $q$Office Suite$q$, 253, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab659340-1acd-4acc-9653-f4c90a759519')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Office Suite$q$, 254, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '314b57b0-8a83-4a7f-9610-e611f8f2c94f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Office Suite$q$, 255, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41beb071-a49d-4ab2-b0b3-1264edc2d746')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Collaborative Editing$q$, 256, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '69a475e1-9bb8-4bf6-9842-69059a3261a0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Spreadsheets$q$, 257, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eddc5a12-a813-48d5-b150-695f5bfdf5f3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Surveys$q$, 258, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2927d1f2-3dbf-4d7c-b455-1855e71fc96e', $q$Forms$q$, 259, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2927d1f2-3dbf-4d7c-b455-1855e71fc96e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Forms$q$, 260, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a141dc6c-48ce-4194-aa10-52dc5225f542')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fddc4cea-b640-45b6-a982-077960bcbadc', $q$Forms$q$, 261, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fddc4cea-b640-45b6-a982-077960bcbadc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Forms$q$, 262, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0118430-d952-414d-b1c2-ca4afbeb6470')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Forms$q$, 263, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aedcb41b-b1e4-4c36-a18f-c2f220a1750c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '08eb66a4-9de1-4b79-9c48-f66eb776838d', $q$Forms$q$, 264, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08eb66a4-9de1-4b79-9c48-f66eb776838d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Surveys$q$, 265, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Forms$q$, 266, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'acb31b58-aa23-4c6b-b191-585512bf65f6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Forms$q$, 267, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c386a7f9-0f7e-468a-84bc-c61cc73cf1a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Web Analytics$q$, 270, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a432f190-1b4c-4ed3-8f70-e63c936ac1f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Web Analytics$q$, 271, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8ecbeea-8621-4dc5-9c0a-606221d037c3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Web Analytics$q$, 272, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Web Analytics$q$, 273, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '019204fd-182f-40f5-9827-49ed1e395308', $q$Feature Management$q$, 274, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '019204fd-182f-40f5-9827-49ed1e395308')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Feature Management$q$, 275, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7796a03d-4b99-4591-a6d0-97a6d4b4c39b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Feature Management$q$, 276, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6732bbc4-c8d6-442d-91b0-c2d8939b74bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Feature Management$q$, 277, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '94397512-e81a-4da3-8e0a-9e8fa8ba4e79')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Feature Management$q$, 278, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cce6651b-abc7-4428-9917-f07ac8142bf2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Feature Management$q$, 279, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4697278a-138a-4bf7-873d-8d71a39b66c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Databases$q$, 281, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b06d1d19-b0b8-4c54-894b-14a56a483e6c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '19274a99-a56f-41a7-8809-d973ed36645b', $q$Databases$q$, 283, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19274a99-a56f-41a7-8809-d973ed36645b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Databases$q$, 284, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1cc98c8-156a-4960-9e1b-8d537e303a0e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Databases$q$, 285, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '80cb4f6d-eff0-4feb-abf9-70df2946bcfe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Databases$q$, 287, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c63f5cdd-3d2b-4852-9c15-e6302ec5f68e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Databases$q$, 288, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Databases$q$, 289, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a28f7a9-0896-4972-aa26-4337e26797f9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5090858f-f936-401a-988e-90e50e3c63af', $q$Databases$q$, 290, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5090858f-f936-401a-988e-90e50e3c63af')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '897517f2-e813-44cf-9a91-5b3befd56d44', $q$Search$q$, 291, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '897517f2-e813-44cf-9a91-5b3befd56d44')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '847c2fe7-37aa-4c95-b7e7-da6d6af53346', $q$Search$q$, 292, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '847c2fe7-37aa-4c95-b7e7-da6d6af53346')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Search$q$, 293, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ad07660-a8fd-4c45-a63d-f9199fe54fa9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Search$q$, 294, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8eeed669-fbb5-47e4-8555-27145e4a692e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Search$q$, 295, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3bab8d3-6cb7-4707-add4-248119724ff1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Vector Databases$q$, 296, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd5a43d0-6c12-4d8c-95e4-dbcf7e682046')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '391b42a3-3312-43a4-800a-ec03d77e0694', $q$Vector Databases$q$, 297, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '391b42a3-3312-43a4-800a-ec03d77e0694')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Vector Databases$q$, 298, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7bc828a9-6a44-47e7-9d64-c584650ed6e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Backend as a Service$q$, 301, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fda03d5-8efa-4417-bae1-e4cc14dc560a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dd33727e-2e57-4b2e-af05-7dee39588471', $q$APIs$q$, 302, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd33727e-2e57-4b2e-af05-7dee39588471')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$APIs$q$, 303, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$API Management$q$, 304, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '739a3d06-32a8-47ca-88cb-0b897c628ff9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '89dff1be-8908-47b5-b669-4283360cd267', $q$API Management$q$, 305, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '89dff1be-8908-47b5-b669-4283360cd267')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$API Management$q$, 306, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '64537204-ede8-4be9-b3b2-bb1a6ffab1aa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$API Management$q$, 307, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27e34a6d-64ed-4d82-bdf3-3bc216000871')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '836889d0-eae4-40b4-be6a-40be147b1ab7', $q$API Management$q$, 308, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '836889d0-eae4-40b4-be6a-40be147b1ab7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$API Management$q$, 309, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ea6717b3-d173-4853-b8b4-beb2d3f1c1e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5db80a47-34dc-4c07-9969-53321dbed91e', $q$API Testing$q$, 310, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5db80a47-34dc-4c07-9969-53321dbed91e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$API Testing$q$, 311, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5da7c24e-f64f-46b1-a907-d8b6683f3c73')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'df960659-f54b-4be1-8faf-a995a08464e8', $q$API Testing$q$, 312, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df960659-f54b-4be1-8faf-a995a08464e8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Webhooks$q$, 313, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb460c74-dce8-4856-9dc3-61f824bd3a75')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Notifications$q$, 314, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '555aaf18-6846-4042-ba95-cc4fd3189aec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Notifications$q$, 315, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '146cfaaf-aaff-451e-bc9c-ee8099f69750')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Notifications$q$, 316, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47573ceb-bc2e-4aa8-88aa-21c943d7431f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a57f6aeb-72fe-474e-8368-01db35053063', $q$Notifications$q$, 317, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a57f6aeb-72fe-474e-8368-01db35053063')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Notifications$q$, 318, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '683c4752-3d3c-49ed-8578-cbba9f8507d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Notifications$q$, 319, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '128a81ea-1a14-4c1e-9cd9-5cad1207d02b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '36781d6b-14d7-4e2f-b591-0f378b601761', $q$Notifications$q$, 320, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36781d6b-14d7-4e2f-b591-0f378b601761')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Notifications$q$, 321, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65e976a6-18cc-449b-b109-b26bbd870c7c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '84142957-2683-4f6e-9088-2169508d193b', $q$Email Marketing$q$, 322, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84142957-2683-4f6e-9088-2169508d193b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Marketing Automation$q$, 323, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '780f67bf-33b3-43f7-9cf1-e78a31b9f50f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Email Marketing$q$, 324, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Email Marketing$q$, 325, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '44d9699e-8d32-4e15-b625-c6a58b71f09e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Email Infrastructure$q$, 326, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '23c53c70-2a21-4d74-b527-25a8f44a4362')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Email Infrastructure$q$, 327, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Email Infrastructure$q$, 328, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fcb91d77-94ad-4a0c-b605-9adaf3d6225f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Email Infrastructure$q$, 329, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba61acd7-9961-41fb-a375-101e19f2f40e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Email Infrastructure$q$, 330, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'db5dc978-1f33-4ece-86f5-07c85e0d3438')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Email Infrastructure$q$, 331, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e21bbe8e-03eb-4184-be8d-54e23a99ca1f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd082b33f-646c-4955-831f-c22ea77858a8', $q$Email Infrastructure$q$, 332, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd082b33f-646c-4955-831f-c22ea77858a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '75720a0f-3359-4066-8426-dccd1160a142', $q$Email Testing$q$, 333, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '75720a0f-3359-4066-8426-dccd1160a142')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Email Design$q$, 334, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b032bbf-1c83-4ca0-8ae9-0ff746c43cee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Email Design$q$, 336, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2af93f8f-0570-4f36-b4b2-40e5917e9e2a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Web Design$q$, 337, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95c8082d-ffa9-4958-bc60-8f9f554f3f0a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f8a615cc-2733-4282-bb83-ea78b3682118', $q$Visual Development$q$, 338, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f8a615cc-2733-4282-bb83-ea78b3682118')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Visual Development$q$, 339, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62f1f869-8400-4cf4-bb92-4a6aa2ab0719')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Visual Development$q$, 340, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17c0bc49-5c4a-433c-9ace-21a7b1f6192b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Visual Development$q$, 341, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ecc0e88-527f-46f0-83e1-06163f665cdf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Web Design$q$, 342, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cce62d49-de89-4c74-80bb-713e85f97dbe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Web Design$q$, 343, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a32c2e6-fe5a-4065-bfb8-918758329971')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Website Builder$q$, 344, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b05cba9-d8b6-4cbf-8bf4-824461bac8ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Static Site Generators$q$, 345, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a46d19fe-50a3-4df2-8764-c03c06ff332b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Static Site Generators$q$, 346, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df10fa66-24a3-4755-9dcd-f62b7329c9c8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd95e837c-ef43-455b-89b5-3d198bab18ed', $q$Static Site Generators$q$, 347, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd95e837c-ef43-455b-89b5-3d198bab18ed')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Web Frameworks$q$, 348, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '18d961a0-d3f8-4b71-86cc-965236f0cda6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Web Frameworks$q$, 349, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '037448f0-d565-48e0-bfb8-ee13f7081535', $q$Web Frameworks$q$, 350, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '037448f0-d565-48e0-bfb8-ee13f7081535')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Web Frameworks$q$, 351, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06d2781b-fc8f-45ff-905b-0da1b9931d4e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2bd08796-f236-49d1-b0c1-ff0571cf289e', $q$Documentation$q$, 352, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2bd08796-f236-49d1-b0c1-ff0571cf289e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '87dcb1df-40ff-447f-9953-e64d1561e834', $q$API Documentation$q$, 353, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87dcb1df-40ff-447f-9953-e64d1561e834')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Developer Portals$q$, 354, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5009be9-697e-4348-8c21-f8adaa429ec5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Developer Portals$q$, 355, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0db14796-fc34-4c7e-aed4-8d302ce97b7d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Developer Portals$q$, 356, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3dc31633-727a-4c74-8a39-811e3fd310a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Developer Portals$q$, 357, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Developer Portals$q$, 358, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd2f52a6e-f44d-4cf6-8f6a-17030432b63d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b7b5cb9-c8e4-42b5-837c-28f52ca5aaa3', $q$Developer Portals$q$, 359, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b7b5cb9-c8e4-42b5-837c-28f52ca5aaa3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7edc2fa9-6abe-4910-9366-00484927bb82', $q$DevOps$q$, 360, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7edc2fa9-6abe-4910-9366-00484927bb82')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Version Control$q$, 361, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8e10e1d-f374-4ec0-aa21-3a07fe66eae5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Version Control$q$, 362, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1827e10f-a82c-4fb0-8d38-d47e51547c3e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Version Control$q$, 363, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85550e75-0afc-4140-81a3-4e711ba76ca4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Version Control$q$, 364, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '610f2fd5-da8a-4b36-8a7f-bf94d0307b17')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '65ac1159-3886-4555-9998-daa1111a04b1', $q$Version Control$q$, 365, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65ac1159-3886-4555-9998-daa1111a04b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$DevOps$q$, 366, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ff195225-a15d-4993-96da-c517414aa5f5', $q$CI/CD$q$, 367, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ff195225-a15d-4993-96da-c517414aa5f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$CI/CD$q$, 368, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b721f7a1-30be-4fe9-aaef-0d63697db57b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a86a598d-f117-4b86-8cbc-fd8500f829db', $q$CI/CD$q$, 369, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a86a598d-f117-4b86-8cbc-fd8500f829db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7c25a31-e4a6-4f92-befe-498598b09f32', $q$CI/CD$q$, 370, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7c25a31-e4a6-4f92-befe-498598b09f32')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$CI/CD$q$, 371, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74b2d4e2-99dc-4bc1-bfaa-f10e06aac809')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$CI/CD$q$, 372, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$CI/CD$q$, 373, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '32135d16-f5f2-4da3-94f9-bb49145ae75e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e080ec1f-f731-4575-b1da-0167d0092eb9', $q$CI/CD$q$, 374, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e080ec1f-f731-4575-b1da-0167d0092eb9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$CI/CD$q$, 375, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a8f6b931-ead8-4549-9325-5d2d323f59c8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$DevOps$q$, 376, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$GitOps$q$, 377, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ffc4ecf-fd8f-435d-a80c-5753e1503951')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Kubernetes Management$q$, 378, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '446aa6e7-9482-4a1a-b79a-0320f056b430')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Container Management$q$, 379, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '533ae83f-c4e9-4971-b328-0c6cb0ac3d10')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '005bfac7-53dd-49b7-9c17-ef452a208620', $q$Cloud Platforms$q$, 380, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '005bfac7-53dd-49b7-9c17-ef452a208620')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Cloud Platforms$q$, 381, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a45bf44-b4ce-425d-98d9-8231b5a94b48')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Cloud Platforms$q$, 382, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6cf17823-4f66-4f20-8ec7-a8927a750f25')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bf089564-4482-4de4-a5c3-8bb1314b5d48', $q$Cloud Platforms$q$, 383, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf089564-4482-4de4-a5c3-8bb1314b5d48')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a8012fa-de58-422c-8781-450f465f4beb', $q$Cloud Platforms$q$, 384, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a8012fa-de58-422c-8781-450f465f4beb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Cloud Platforms$q$, 385, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '63b900b3-a299-4585-b839-c8a5c321ef6b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0aa25628-95fd-4484-a51f-ba231959a576', $q$Cloud Platforms$q$, 386, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0aa25628-95fd-4484-a51f-ba231959a576')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Cloud Platforms$q$, 387, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2436cfe-e0aa-468d-9855-6acb47cd220e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Cloud Platforms$q$, 388, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfe083dd-da65-4b67-83be-298a4c15c75c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Cloud Management$q$, 389, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Cloud Management$q$, 390, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8739782d-56c1-4efc-a3ac-3d0c9d531296')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a9e58a83-376b-4e93-b8f6-d707024da382', $q$Virtualization$q$, 391, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9e58a83-376b-4e93-b8f6-d707024da382')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Virtualization$q$, 392, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '66cb57df-a72f-4b48-8e7c-dd2074ba5b6e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Orchestration$q$, 393, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd651e30f-02b4-4774-b024-a6a3d9d377ee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Service Networking$q$, 394, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5b8da39-746d-47c9-a6e2-4ce6ea00b2a0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Security$q$, 395, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af04c60a-0edd-428f-9f5c-f88f9ad98f64')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82f44b81-1616-4e4f-99ec-891f86393804', $q$Identity Management$q$, 396, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82f44b81-1616-4e4f-99ec-891f86393804')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b95ba4cb-96d7-4478-9722-2807aa591486', $q$Authorization$q$, 397, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b95ba4cb-96d7-4478-9722-2807aa591486')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Authorization$q$, 398, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05c2f6b8-9698-410f-a6a2-b3cdf7f98777')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Authorization$q$, 399, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1a8c047-6445-4dbd-ae16-412f8a2807f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0b888188-3d57-4941-b06a-2c4600263666', $q$Secrets Management$q$, 400, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b888188-3d57-4941-b06a-2c4600263666')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '257eca99-6ff2-4447-96da-fbf120b70160', $q$Security Operations$q$, 401, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '257eca99-6ff2-4447-96da-fbf120b70160')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Threat Intelligence$q$, 402, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Threat Intelligence$q$, 403, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '51b8b175-b3a3-4820-80ba-3b5c9cb31c4e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e37166a1-5273-4465-ae0c-fa12188ba286', $q$Digital Forensics$q$, 404, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e37166a1-5273-4465-ae0c-fa12188ba286')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Device Management$q$, 405, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a79e35cf-f4a5-404f-8138-ace452376ebd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Security Monitoring$q$, 406, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2bf3de07-cc2a-49cd-8239-4d711fd37c68')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Network Security$q$, 407, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ee44c6e-b374-4911-ad78-9275dc36fec8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82d8db18-43fe-4252-9850-0cc4a603d607', $q$Network Security$q$, 408, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82d8db18-43fe-4252-9850-0cc4a603d607')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Network Security$q$, 409, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '816a340d-aa9a-49e1-9aad-c93e0406c1d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '717823fe-8010-4821-a2b2-2263a7afbe21', $q$Vulnerability Management$q$, 410, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '717823fe-8010-4821-a2b2-2263a7afbe21')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '119e88eb-8125-4474-bd00-8010e05e2e72', $q$Vulnerability Management$q$, 411, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '119e88eb-8125-4474-bd00-8010e05e2e72')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b102eee5-b364-47b7-9569-b256d99e7549', $q$Software Supply Chain$q$, 412, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b102eee5-b364-47b7-9569-b256d99e7549')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Software Supply Chain$q$, 413, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e30e978-262d-4a83-b746-96ea2a1f37ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Container Registry$q$, 414, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2fda9f09-2141-4cc7-84c4-66606e716a87')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd5332e67-88ad-4e34-998d-c503ab84ed89', $q$Container Registry$q$, 415, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5332e67-88ad-4e34-998d-c503ab84ed89')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Package Registry$q$, 416, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4836b9e-697c-4735-b03e-624cbcf6545f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba780fa8-7453-4d31-a091-d99288158644', $q$Package Registry$q$, 417, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba780fa8-7453-4d31-a091-d99288158644')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Package Registry$q$, 418, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed99d703-32ed-4261-9895-3b1e2b391d3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Package Registry$q$, 419, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebebe13c-233a-47f4-a8e7-636776fbd5d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Package Registry$q$, 420, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e47e77d6-8770-40cc-ad32-e7a099e5b0e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6fe712b1-9844-4be1-8956-48e550068b64', $q$Monitoring$q$, 421, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fe712b1-9844-4be1-8956-48e550068b64')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Monitoring$q$, 422, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5beb7929-33c1-44c9-ad6b-682495b32b28')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f5945274-4119-4f53-a92b-62b5b22c5045', $q$Monitoring$q$, 423, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5945274-4119-4f53-a92b-62b5b22c5045')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Monitoring$q$, 424, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d389cbb-d85a-449c-bf50-4f82fcfc841f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Uptime Monitoring$q$, 425, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1edb450a-0531-4854-a16b-c23fd485bcce', $q$Uptime Monitoring$q$, 426, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1edb450a-0531-4854-a16b-c23fd485bcce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Monitoring$q$, 428, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Log Management$q$, 429, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5f805c48-e5b0-4af0-83dd-98deb8ee69d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0d623697-0839-419d-b74c-5c99fda783e0', $q$Log Management$q$, 430, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d623697-0839-419d-b74c-5c99fda783e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c5592933-959b-4725-9845-baccff52192d', $q$Log Management$q$, 431, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5592933-959b-4725-9845-baccff52192d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Log Management$q$, 432, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8ccfa422-ec09-4a81-8ffc-cee3d57641ca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Log Management$q$, 433, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dbaa6caa-3a8b-44a6-a307-4debcee9af7a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '117d354d-ba1d-4901-852d-f37b6680c972', $q$Observability$q$, 434, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '117d354d-ba1d-4901-852d-f37b6680c972')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b18b84bf-1a80-44d2-8619-43e15614d140', $q$Observability$q$, 435, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b18b84bf-1a80-44d2-8619-43e15614d140')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Error Tracking$q$, 436, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5e89d16-61c3-4ade-882a-138e2a553e12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '883b2808-6d12-4830-b483-eca7281f59f1', $q$Observability$q$, 437, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '883b2808-6d12-4830-b483-eca7281f59f1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '567932b8-eb63-435b-a35e-b252afd5a120', $q$Observability$q$, 438, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '567932b8-eb63-435b-a35e-b252afd5a120')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Data Integration$q$, 440, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af41f8fc-b90f-4d77-80ef-840d3baf8120')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Data Integration$q$, 441, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8fe9ecc9-4076-431c-b5a3-fbde13581137')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Data Integration$q$, 442, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c4addc67-46f9-4aeb-9550-246f4f8c3d78')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Customer Data Platforms$q$, 443, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45050474-ebf1-4a46-89d7-f47f4521c45f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Business Intelligence$q$, 445, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4fe35bb-b786-4c89-83e9-c43385bfe93b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Business Intelligence$q$, 446, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c32a6cb9-22d2-4149-b6bc-129ecd02b8c3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5512df11-bacf-4edc-8977-91af599645ef', $q$Business Intelligence$q$, 447, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5512df11-bacf-4edc-8977-91af599645ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Semantic Layer$q$, 448, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ae35df8-1db0-4f11-b030-bac3223a2cbe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5c5bacf6-63dd-435b-b336-2b016854189b', $q$Data Transformation$q$, 450, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c5bacf6-63dd-435b-b336-2b016854189b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Data Transformation$q$, 451, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6e6b8492-4c4d-4131-97c2-330cb025a664')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Runbook Automation$q$, 454, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '731c611d-030c-488a-b3cb-8255aa73e8ab', $q$MLOps$q$, 455, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '731c611d-030c-488a-b3cb-8255aa73e8ab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '47cd8f03-df02-4827-a41a-94df72cd0222', $q$MLOps$q$, 456, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47cd8f03-df02-4827-a41a-94df72cd0222')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1c8e4152-687c-4455-b1b5-b86303960027', $q$MLOps$q$, 457, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c8e4152-687c-4455-b1b5-b86303960027')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f1140885-6be9-4e12-8a14-e60b800377b9', $q$MLOps$q$, 458, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1140885-6be9-4e12-8a14-e60b800377b9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$MLOps$q$, 459, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7aac8e5-93a6-4551-b76b-53dae46d786f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a4996b9-281e-4443-a143-16669b9aebee', $q$MLOps$q$, 460, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a4996b9-281e-4443-a143-16669b9aebee')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '10293470-1da9-4e2e-8572-c5038c251326', $q$MLOps$q$, 461, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10293470-1da9-4e2e-8572-c5038c251326')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c66ab08-e955-4517-83cb-ca812af3c38d', $q$MLOps$q$, 462, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c66ab08-e955-4517-83cb-ca812af3c38d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$MLOps$q$, 463, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1e51b23-11d5-4a32-91ce-ccf878a2484a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '77429280-36af-46ef-b496-25b4c65c2176', $q$AI Observability$q$, 464, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '77429280-36af-46ef-b496-25b4c65c2176')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '43a21783-24ae-4f92-b263-4021ecd34f16', $q$AI Observability$q$, 465, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43a21783-24ae-4f92-b263-4021ecd34f16')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c392b66f-4dcb-40e6-989c-f072b529aff7', $q$AI Observability$q$, 466, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c392b66f-4dcb-40e6-989c-f072b529aff7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$AI Observability$q$, 467, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b558345-f62d-4c17-b8c6-88e78d8300a2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$AI Observability$q$, 468, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c4daae7-b7fd-449c-a71e-daba739c3ca5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '788da3e1-d1d6-401e-a948-5529f931152a', $q$Prompt Management$q$, 469, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '788da3e1-d1d6-401e-a948-5529f931152a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f1bc166f-ddbe-4be1-8ddf-8e45667c861e', $q$Prompt Management$q$, 470, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1bc166f-ddbe-4be1-8ddf-8e45667c861e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$AI Observability$q$, 471, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ebd27bea-946b-435d-8767-2c6ce3d3d696')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd515660a-2710-4138-a906-19ab0c3f0a81', $q$AI Development$q$, 472, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd515660a-2710-4138-a906-19ab0c3f0a81')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a24c79b2-2532-4586-980b-a77abc122161', $q$AI Development$q$, 473, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a24c79b2-2532-4586-980b-a77abc122161')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '063d9724-1713-4fc5-9347-e4e03f6040a1', $q$AI Development$q$, 474, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '063d9724-1713-4fc5-9347-e4e03f6040a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$AI Development$q$, 475, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '362996ad-6cda-41f1-8ec2-066aa387a46c', $q$AI Assistants$q$, 476, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '362996ad-6cda-41f1-8ec2-066aa387a46c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$AI Assistants$q$, 477, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '465b7b09-9fa2-4ab9-9a80-e441a1effd0a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b5d7cf28-5eac-4ad6-a24a-dff47bd3edc7', $q$AI Assistants$q$, 478, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5d7cf28-5eac-4ad6-a24a-dff47bd3edc7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$AI Assistants$q$, 479, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9cc30e55-3b4a-4b57-88bd-393a5082ac87')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bdd55166-9401-4b99-9213-184d1c7c5807', $q$AI Assistants$q$, 480, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bdd55166-9401-4b99-9213-184d1c7c5807')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$AI Development$q$, 481, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c830bb2b-1cd7-47d7-b6a1-c48147945ecf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c416cb1e-8524-43e0-a740-2a092903d5fe', $q$AI Development$q$, 482, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c416cb1e-8524-43e0-a740-2a092903d5fe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$AI Infrastructure$q$, 483, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '02fc0fca-7896-41fa-8356-751971c7a3eb', $q$AI Infrastructure$q$, 484, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '02fc0fca-7896-41fa-8356-751971c7a3eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$AI Infrastructure$q$, 485, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54b33467-c0e1-45e4-b29f-69b5ce8ea2dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$AI Infrastructure$q$, 486, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95e1413b-980b-4a7c-a0da-8b7353d2474d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aff64b96-3f9d-4b60-acba-86586aac9085', $q$AI Infrastructure$q$, 487, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aff64b96-3f9d-4b60-acba-86586aac9085')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '60180cba-c779-4a42-9314-22aade49a3a1', $q$AI Infrastructure$q$, 488, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '60180cba-c779-4a42-9314-22aade49a3a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Cloud Computing$q$, 489, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5f50ff9-292d-461f-9877-3ee54d35032f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Cloud Computing$q$, 490, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '33a2e54d-ea2a-4eac-b6c4-dbd80828337e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5ad76bbb-468c-4854-b144-baf5844135c5', $q$AI Infrastructure$q$, 491, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ad76bbb-468c-4854-b144-baf5844135c5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be678c6c-acd6-4ec2-a468-efd166188d17', $q$AI Infrastructure$q$, 492, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be678c6c-acd6-4ec2-a468-efd166188d17')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2cf05821-b645-4a5c-9cb3-a492d371211f', $q$AI Infrastructure$q$, 493, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2cf05821-b645-4a5c-9cb3-a492d371211f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Data Labeling$q$, 494, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b86f2d2c-9242-4ac1-8381-48bac80db6dd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e0e7ab65-6f45-469f-a81e-a24f104a32d1', $q$Data Labeling$q$, 495, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0e7ab65-6f45-469f-a81e-a24f104a32d1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Data Labeling$q$, 496, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0d4608fd-3411-46e9-b7bd-86e6765d726c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Data Labeling$q$, 497, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ff2b0e8-8acc-497e-9c48-da9f2af462a8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Data Labeling$q$, 498, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '53a0cb41-3c1b-499b-a369-31d2bb36357e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Computer Vision$q$, 499, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee1d5a2e-e303-4d50-b144-230cf5daeaf1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Computer Vision$q$, 500, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3ae68e89-7cc4-46ca-b15d-3b10568de023')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('85b65232-2caf-4969-998f-22b6d54fd447', $q$Video Conferencing$q$, 35, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('db2a5c35-cb6d-4682-ad3f-0c3ddff2ba7b', $q$Event Management$q$, 53, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('1c4c7eb8-4d91-4764-a260-79baa4f12ad4', $q$Scheduling$q$, 54, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('0eeb6217-8a67-456a-8643-6f5a58e0f979', $q$Publishing$q$, 74, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ece3f5b6-3302-4069-a41e-b5e480349b71', $q$Publishing$q$, 75, 8, 8, 8, $q$Tier B — Strong expansion$q$, 8, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('6807ab40-552b-4044-8610-c58acf04855d', $q$E-commerce$q$, 87, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('fe08bff8-895b-4ba9-9fcd-09e3e773bb57', $q$E-commerce$q$, 96, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('37d9ac64-b7a8-413c-8a11-4db621fc9e33', $q$E-commerce$q$, 97, 9, 7, 9, $q$Tier A — High priority$q$, 8.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('79eab7a4-e62b-49e1-b4c9-ba1e46383aec', $q$Customer Success$q$, 105, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('42178daa-c8ed-41d0-b8b7-d8e53057a2ce', $q$Customer Success$q$, 107, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ca7516a2-730d-48ae-b2cd-54a3da886bac', $q$Customer Success$q$, 108, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('baabcbd9-49ee-4844-9aae-bc407aa1c068', $q$Customer Support$q$, 110, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('fefc9c6e-aa17-4e1e-88f9-9f4d8925e494', $q$Time Tracking$q$, 140, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('7a1260e7-5c8c-4d8c-bcb5-ddf9865100d6', $q$Time Tracking$q$, 144, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('ed06026a-8e0a-484f-bfd3-2d07240984eb', $q$Document Management$q$, 149, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2d0559af-047f-4b10-a092-6965237ee798', $q$Read It Later$q$, 187, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('3dd438a5-8354-47f1-89d7-033079a89cc5', $q$Web Archiving$q$, 193, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('9de517df-9167-4f74-81ef-57b4e421d271', $q$Podcast Hosting$q$, 217, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f83fc3c6-361d-4fca-8f70-695fa0c9ab4f', $q$Web Analytics$q$, 268, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('4ad6bb35-29e1-42bd-9183-39a59570aee8', $q$Web Analytics$q$, 269, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b4b6eb99-0c87-4eaa-8305-aff383ed3c8f', $q$Databases$q$, 280, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b91ae4a4-138d-4d64-ad9d-e248ca4f5aaa', $q$Databases$q$, 282, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('09b41cb4-0b11-4480-ad3f-317c597ce7a4', $q$Databases$q$, 286, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('cf2565ff-7160-42e9-8d6c-efdb9830004d', $q$Databases$q$, 299, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Backend as a Service$q$, 300, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('6b946b0d-bbd9-4828-97ce-cd1fcb7ad0fd', $q$Email Design$q$, 335, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('1a437a0b-2569-49db-aa44-9626350f97d5', $q$Monitoring$q$, 427, 7, 8, 7, $q$Tier B — Strong expansion$q$, 7.3, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('80b10260-3b64-43a4-af8d-f79e3fab1f2b', $q$Data Integration$q$, 439, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('742ef257-e98d-45ec-870b-b12953892eab', $q$Business Intelligence$q$, 444, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('50be4027-11b3-43fe-b1ca-c6caad422481', $q$Data Transformation$q$, 449, 6, 8, 6, $q$Tier C — Long-tail expansion$q$, 6.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('2345d0ed-4255-4773-9565-b0ced4967bcd', $q$Workflow Automation$q$, 452, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Workflow Automation$q$, 453, 8, 7, 8, $q$Tier B — Strong expansion$q$, 7.7, $q$gappsy-500-2026-07-17-v4$q$)
ON CONFLICT (tool_id) DO NOTHING;

-- Bulk import gappsy-500-2026-07-18-batch13: 488 new commercial-SaaS tools,
-- landed as status='needs_review', noindex=true, sitemap_eligible=false.
-- Invisible to the public site until a separate editorial-enrichment pass
-- reviews and publishes each one (same pattern as prior bulk-import batches).

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ede5e1e6-847c-4d18-a668-f60f02db6d58', $q$commure$q$, $q$Commure$q$, $q$https://commure.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ede5e1e6-847c-4d18-a668-f60f02db6d58', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ede5e1e6-847c-4d18-a668-f60f02db6d58')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('067c9288-4e9d-4319-8b98-89343581ca11', $q$hover$q$, $q$Hover$q$, $q$https://www.hover.to$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '067c9288-4e9d-4319-8b98-89343581ca11', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '067c9288-4e9d-4319-8b98-89343581ca11')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('42273775-9af9-49e2-bee0-17abf6eab3d5', $q$livongo$q$, $q$Livongo$q$, $q$https://livongo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '42273775-9af9-49e2-bee0-17abf6eab3d5', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42273775-9af9-49e2-bee0-17abf6eab3d5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e3f6368-47e9-4067-8df8-b6e3ede9863a', $q$qualia$q$, $q$Qualia$q$, $q$https://qualia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e3f6368-47e9-4067-8df8-b6e3ede9863a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e3f6368-47e9-4067-8df8-b6e3ede9863a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2292afbf-ac82-4dcd-816d-f24125908a30', $q$zenysis$q$, $q$Zenysis$q$, $q$https://zenysis.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2292afbf-ac82-4dcd-816d-f24125908a30', '4414d2af-4c22-4dc9-9ebd-90255b64cdb0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2292afbf-ac82-4dcd-816d-f24125908a30')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c3329d28-c04e-48fd-acb5-e4086d15cfec', $q$140-proof$q$, $q$140 Proof$q$, $q$https://140proof.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c3329d28-c04e-48fd-acb5-e4086d15cfec', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3329d28-c04e-48fd-acb5-e4086d15cfec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0bc14bf4-8347-485e-acc6-bd34d5f82146', $q$8base-com$q$, $q$8base.com$q$, $q$https://www.8base.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0bc14bf4-8347-485e-acc6-bd34d5f82146', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0bc14bf4-8347-485e-acc6-bd34d5f82146')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2606bcee-7c10-4c19-ac05-38743faafbbd', $q$99designs$q$, $q$99designs$q$, $q$https://99designs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2606bcee-7c10-4c19-ac05-38743faafbbd', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2606bcee-7c10-4c19-ac05-38743faafbbd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a503988-293f-49b2-ae6f-d6bb6c392206', $q$ableton-live$q$, $q$Ableton Live$q$, $q$https://www.ableton.com/en/live/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a503988-293f-49b2-ae6f-d6bb6c392206', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a503988-293f-49b2-ae6f-d6bb6c392206')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d481ce42-0ced-4647-b358-b4f024cda820', $q$ably$q$, $q$Ably$q$, $q$https://www.ably.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd481ce42-0ced-4647-b358-b4f024cda820', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd481ce42-0ced-4647-b358-b4f024cda820')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4faf985-7c58-4c87-8560-524d88331992', $q$abstract$q$, $q$Abstract$q$, $q$https://goabstract.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4faf985-7c58-4c87-8560-524d88331992', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4faf985-7c58-4c87-8560-524d88331992')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('673f3f0e-691b-45d1-8e4a-dfea89115d74', $q$addepar$q$, $q$Addepar$q$, $q$https://addepar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '673f3f0e-691b-45d1-8e4a-dfea89115d74', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '673f3f0e-691b-45d1-8e4a-dfea89115d74')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05aacd49-d29b-4263-a5d6-c4d3f7e3858b', $q$adminmart$q$, $q$AdminMart$q$, $q$https://adminmart.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05aacd49-d29b-4263-a5d6-c4d3f7e3858b', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05aacd49-d29b-4263-a5d6-c4d3f7e3858b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e7cd212-e364-4192-be8c-cab48ff64fb4', $q$admitsee$q$, $q$Admitsee$q$, $q$https://www.admitsee.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e7cd212-e364-4192-be8c-cab48ff64fb4', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e7cd212-e364-4192-be8c-cab48ff64fb4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7584974-30ec-4e51-aaab-f7ffa033ea78', $q$aftershot$q$, $q$Aftershot$q$, $q$https://www.aftershotpro.com/en/products/aftershot/pro/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7584974-30ec-4e51-aaab-f7ffa033ea78', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7584974-30ec-4e51-aaab-f7ffa033ea78')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de12a70b-5557-4d95-9eac-afca1fc10178', $q$albert$q$, $q$Albert$q$, $q$https://albertlauncher.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de12a70b-5557-4d95-9eac-afca1fc10178', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de12a70b-5557-4d95-9eac-afca1fc10178')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('74e10c7d-96d5-4264-ba96-cb2433fa5fc8', $q$also-available-in-german$q$, $q$also available in german$q$, $q$https://www.manubes.de$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '74e10c7d-96d5-4264-ba96-cb2433fa5fc8', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74e10c7d-96d5-4264-ba96-cb2433fa5fc8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0fa10ed5-4e60-4735-9866-16c7f888de45', $q$amberol$q$, $q$Amberol$q$, $q$https://apps.gnome.org/app/io.bassi.Amberol/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0fa10ed5-4e60-4735-9866-16c7f888de45', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0fa10ed5-4e60-4735-9866-16c7f888de45')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('967241ce-ad2e-479e-8559-6bc5c95eaaea', $q$androidide$q$, $q$AndroidIDE$q$, $q$https://m.androidide.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '967241ce-ad2e-479e-8559-6bc5c95eaaea', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '967241ce-ad2e-479e-8559-6bc5c95eaaea')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f879c9e8-a938-4954-848c-249a83729428', $q$anki$q$, $q$Anki$q$, $q$https://apps.ankiweb.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f879c9e8-a938-4954-848c-249a83729428', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f879c9e8-a938-4954-848c-249a83729428')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c5d7d496-060b-494f-b8f1-4a7cae08eda5', $q$anvil-works$q$, $q$anvil.works$q$, $q$https://anvil.works$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c5d7d496-060b-494f-b8f1-4a7cae08eda5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5d7d496-060b-494f-b8f1-4a7cae08eda5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('31db427c-ae17-4868-bb93-d759584d6445', $q$anydesk$q$, $q$AnyDesk$q$, $q$https://anydesk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '31db427c-ae17-4868-bb93-d759584d6445', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31db427c-ae17-4868-bb93-d759584d6445')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('66ba6370-3244-451b-a008-2d5c51c1fb8e', $q$apache-netbeans$q$, $q$Apache Netbeans$q$, $q$https://netbeans.apache.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '66ba6370-3244-451b-a008-2d5c51c1fb8e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '66ba6370-3244-451b-a008-2d5c51c1fb8e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('612bcebe-49cc-416a-936e-aee471f9763d', $q$appcircle-io$q$, $q$appcircle.io$q$, $q$https://appcircle.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '612bcebe-49cc-416a-936e-aee471f9763d', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '612bcebe-49cc-416a-936e-aee471f9763d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cb6e4649-6cc1-4673-ab1d-33f9a1308e33', $q$appdirect$q$, $q$AppDirect$q$, $q$https://www.appdirect.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cb6e4649-6cc1-4673-ab1d-33f9a1308e33', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb6e4649-6cc1-4673-ab1d-33f9a1308e33')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bf96ddc1-32b1-4237-817a-ca717e3008ab', $q$appdynamics$q$, $q$AppDynamics$q$, $q$https://www.appdynamics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bf96ddc1-32b1-4237-817a-ca717e3008ab', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf96ddc1-32b1-4237-817a-ca717e3008ab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b8db3f8-aabc-46bb-845b-8bd3674c6134', $q$appho-st$q$, $q$Appho.st$q$, $q$https://appho.st$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b8db3f8-aabc-46bb-845b-8bd3674c6134', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b8db3f8-aabc-46bb-845b-8bd3674c6134')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b964897-a385-425c-98f2-a58e6a53a9d9', $q$apply-build$q$, $q$Apply.build$q$, $q$https://apply.build/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b964897-a385-425c-98f2-a58e6a53a9d9', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b964897-a385-425c-98f2-a58e6a53a9d9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ac0aa078-cb44-4e12-b0a3-6eb4566c68e0', $q$appveyor-com$q$, $q$appveyor.com$q$, $q$https://www.appveyor.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ac0aa078-cb44-4e12-b0a3-6eb4566c68e0', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac0aa078-cb44-4e12-b0a3-6eb4566c68e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9f9e9d60-0697-44c0-88b4-4fa2ce57cd98', $q$apteligent$q$, $q$Apteligent$q$, $q$https://www.apteligent.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9f9e9d60-0697-44c0-88b4-4fa2ce57cd98', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f9e9d60-0697-44c0-88b4-4fa2ce57cd98')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76210422-8c74-4fd4-bc59-22399dd75183', $q$ares$q$, $q$ares$q$, $q$https://ares-emu.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76210422-8c74-4fd4-bc59-22399dd75183', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76210422-8c74-4fd4-bc59-22399dd75183')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5acbadd8-c332-4176-81fe-f757b578a77a', $q$aria2$q$, $q$aria2$q$, $q$https://aria2.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5acbadd8-c332-4176-81fe-f757b578a77a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5acbadd8-c332-4176-81fe-f757b578a77a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('49f3b309-4a25-4b5f-8510-8a8e1a3e50bb', $q$arista$q$, $q$Arista$q$, $q$https://arista.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '49f3b309-4a25-4b5f-8510-8a8e1a3e50bb', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '49f3b309-4a25-4b5f-8510-8a8e1a3e50bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05511d22-956f-4717-b903-1a7fa4fc130e', $q$arrowdl$q$, $q$ArrowDL$q$, $q$https://www.arrow-dl.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05511d22-956f-4717-b903-1a7fa4fc130e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05511d22-956f-4717-b903-1a7fa4fc130e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0e89dfe-75ab-4aea-a6da-0f0334f44020', $q$aseprite$q$, $q$Aseprite$q$, $q$https://www.aseprite.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0e89dfe-75ab-4aea-a6da-0f0334f44020', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0e89dfe-75ab-4aea-a6da-0f0334f44020')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('57a97ac4-376f-4dca-b06f-6fa8252794f0', $q$ask-media-group$q$, $q$Ask Media Group$q$, $q$https://www.askmediagroup.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '57a97ac4-376f-4dca-b06f-6fa8252794f0', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57a97ac4-376f-4dca-b06f-6fa8252794f0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1a4b2be9-43e2-4d4d-8dc5-0d36c5f7848a', $q$assertible-com$q$, $q$assertible.com$q$, $q$https://assertible.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1a4b2be9-43e2-4d4d-8dc5-0d36c5f7848a', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a4b2be9-43e2-4d4d-8dc5-0d36c5f7848a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a5b8096a-5ef5-481d-b6e1-09b700f1cd7f', $q$astromenace$q$, $q$AstroMenace$q$, $q$https://viewizard.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a5b8096a-5ef5-481d-b6e1-09b700f1cd7f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5b8096a-5ef5-481d-b6e1-09b700f1cd7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('974f7a00-1d67-447e-9058-bf05fe6357ad', $q$astronvim$q$, $q$AstroNvim$q$, $q$https://astronvim.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '974f7a00-1d67-447e-9058-bf05fe6357ad', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '974f7a00-1d67-447e-9058-bf05fe6357ad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ef40340d-975f-4467-ba6c-2e12878f77bb', $q$audionodes$q$, $q$AudioNodes$q$, $q$https://audionodes.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ef40340d-975f-4467-ba6c-2e12878f77bb', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef40340d-975f-4467-ba6c-2e12878f77bb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2b4d4d3-6914-494c-ab3e-8d02d581f802', $q$aura-frames$q$, $q$Aura Frames$q$, $q$https://auraframes.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2b4d4d3-6914-494c-ab3e-8d02d581f802', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2b4d4d3-6914-494c-ab3e-8d02d581f802')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11674814-c70f-44c9-ba68-d6bf1db1e289', $q$autodesk$q$, $q$Autodesk$q$, $q$https://www.autodesk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11674814-c70f-44c9-ba68-d6bf1db1e289', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11674814-c70f-44c9-ba68-d6bf1db1e289')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e65336ed-2fb0-413b-92ae-f4002c55115f', $q$autolocalise-com$q$, $q$AutoLocalise.com$q$, $q$https://www.autolocalise.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e65336ed-2fb0-413b-92ae-f4002c55115f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e65336ed-2fb0-413b-92ae-f4002c55115f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('08f28219-ca73-42dd-9c5f-17577ab1c841', $q$avocode$q$, $q$Avocode$q$, $q$https://avocode.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '08f28219-ca73-42dd-9c5f-17577ab1c841', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08f28219-ca73-42dd-9c5f-17577ab1c841')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('df246c3f-a420-443c-8aff-f00c444d14d6', $q$ayedot$q$, $q$AyeDot$q$, $q$https://ayedot.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'df246c3f-a420-443c-8aff-f00c444d14d6', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df246c3f-a420-443c-8aff-f00c444d14d6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('403ebb64-8b75-4c16-9d1d-26535704f097', $q$backblaze-com$q$, $q$backblaze.com$q$, $q$https://www.backblaze.com/b2/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '403ebb64-8b75-4c16-9d1d-26535704f097', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '403ebb64-8b75-4c16-9d1d-26535704f097')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dd3835c7-4555-46b1-a75d-55532c70e333', $q$basket-note-pads$q$, $q$Basket Note Pads$q$, $q$https://basket-notepads.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dd3835c7-4555-46b1-a75d-55532c70e333', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd3835c7-4555-46b1-a75d-55532c70e333')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5d754571-a7ce-46cf-a42b-c0a05ee72625', $q$bbedit$q$, $q$BBEdit$q$, $q$https://www.barebones.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5d754571-a7ce-46cf-a42b-c0a05ee72625', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d754571-a7ce-46cf-a42b-c0a05ee72625')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('271e90eb-7f4a-4830-83c8-cbe9a8ca5270', $q$bebo$q$, $q$Bebo$q$, $q$https://bebo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '271e90eb-7f4a-4830-83c8-cbe9a8ca5270', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '271e90eb-7f4a-4830-83c8-cbe9a8ca5270')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41edfd95-63c6-404d-94c9-c87a98ef19f2', $q$beezwax-datatools$q$, $q$Beezwax Datatools$q$, $q$https://www.beezwax.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41edfd95-63c6-404d-94c9-c87a98ef19f2', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41edfd95-63c6-404d-94c9-c87a98ef19f2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('21dbbf18-b3b0-406f-8a88-055297fc15ab', $q$befonts$q$, $q$Befonts$q$, $q$https://befonts.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '21dbbf18-b3b0-406f-8a88-055297fc15ab', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21dbbf18-b3b0-406f-8a88-055297fc15ab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2fbffd64-ad25-4d61-8f29-f825da09e9de', $q$benchmark-capital$q$, $q$Benchmark Capital$q$, $q$https://www.benchmark.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2fbffd64-ad25-4d61-8f29-f825da09e9de', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2fbffd64-ad25-4d61-8f29-f825da09e9de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1cd3a1d9-5da9-4f4c-825e-94b1d362dd27', $q$benevity$q$, $q$Benevity$q$, $q$https://benevity.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1cd3a1d9-5da9-4f4c-825e-94b1d362dd27', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1cd3a1d9-5da9-4f4c-825e-94b1d362dd27')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('57e5cd5a-3371-4f98-94e6-bdba29cb1d89', $q$betterdiscord$q$, $q$BetterDiscord$q$, $q$https://betterdiscord.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '57e5cd5a-3371-4f98-94e6-bdba29cb1d89', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57e5cd5a-3371-4f98-94e6-bdba29cb1d89')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('247d840a-2d7d-4990-8c6a-3e31760daf3d', $q$betterment$q$, $q$Betterment$q$, $q$https://www.betterment.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '247d840a-2d7d-4990-8c6a-3e31760daf3d', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '247d840a-2d7d-4990-8c6a-3e31760daf3d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d53fd227-dfc9-4433-b23c-eae93cde107f', $q$bevy-engine$q$, $q$Bevy Engine$q$, $q$https://bevyengine.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd53fd227-dfc9-4433-b23c-eae93cde107f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd53fd227-dfc9-4433-b23c-eae93cde107f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a69f323a-5bac-439b-8d2a-5a1b3804401e', $q$bibletime$q$, $q$BibleTime$q$, $q$http://bibletime.info/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a69f323a-5bac-439b-8d2a-5a1b3804401e', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a69f323a-5bac-439b-8d2a-5a1b3804401e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d482f06e-58db-4ac9-abf8-65397ec49f7b', $q$binder$q$, $q$Binder$q$, $q$https://mybinder.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd482f06e-58db-4ac9-abf8-65397ec49f7b', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd482f06e-58db-4ac9-abf8-65397ec49f7b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8472f3a3-648f-4ce3-a589-dce2fb48bd28', $q$binti$q$, $q$Binti$q$, $q$https://binti.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8472f3a3-648f-4ce3-a589-dce2fb48bd28', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8472f3a3-648f-4ce3-a589-dce2fb48bd28')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fd499a7e-95e4-4f5b-9e0d-e56389d69a77', $q$bismuth$q$, $q$Bismuth$q$, $q$https://bismuth-forge.github.io/bismuth/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fd499a7e-95e4-4f5b-9e0d-e56389d69a77', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd499a7e-95e4-4f5b-9e0d-e56389d69a77')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bdf4149c-1a2a-4360-bde4-d355b0d33fb6', $q$bitnami-com$q$, $q$bitnami.com$q$, $q$https://bitnami.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bdf4149c-1a2a-4360-bde4-d355b0d33fb6', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bdf4149c-1a2a-4360-bde4-d355b0d33fb6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('195e877a-90ba-4659-b84b-ec76222ce094', $q$bitwig$q$, $q$Bitwig$q$, $q$https://www.bitwig.com/en/download.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '195e877a-90ba-4659-b84b-ec76222ce094', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '195e877a-90ba-4659-b84b-ec76222ce094')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('31c502b7-f2eb-4549-bd9c-e25ef5ac1381', $q$bleemeo-com$q$, $q$bleemeo.com$q$, $q$https://bleemeo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '31c502b7-f2eb-4549-bd9c-e25ef5ac1381', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31c502b7-f2eb-4549-bd9c-e25ef5ac1381')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d5455709-cf29-432c-94eb-031f95b97e84', $q$blend$q$, $q$Blend$q$, $q$https://blend.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd5455709-cf29-432c-94eb-031f95b97e84', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5455709-cf29-432c-94eb-031f95b97e84')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('62e5423f-7b35-4d89-942b-e5a1783055ad', $q$blender$q$, $q$Blender$q$, $q$https://www.blender.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '62e5423f-7b35-4d89-942b-e5a1783055ad', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62e5423f-7b35-4d89-942b-e5a1783055ad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('550831fa-f6ac-49ce-8f68-9bb633fdd5ec', $q$blue-river-technology$q$, $q$Blue River Technology$q$, $q$https://www.bluerivertechnology.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '550831fa-f6ac-49ce-8f68-9bb633fdd5ec', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '550831fa-f6ac-49ce-8f68-9bb633fdd5ec')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('40873439-74d5-4c5a-9d8b-5e7348a903a9', $q$bluej$q$, $q$BlueJ$q$, $q$https://bluej.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '40873439-74d5-4c5a-9d8b-5e7348a903a9', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40873439-74d5-4c5a-9d8b-5e7348a903a9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6a378f3f-8fa1-4cc4-a151-94f0e9c1bddd', $q$bonsai-io$q$, $q$bonsai.io$q$, $q$https://bonsai.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6a378f3f-8fa1-4cc4-a151-94f0e9c1bddd', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a378f3f-8fa1-4cc4-a151-94f0e9c1bddd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c1619246-54cb-4904-969c-d8ab480b59b5', $q$bookworm$q$, $q$Bookworm$q$, $q$https://babluboy.github.io/bookworm/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c1619246-54cb-4904-969c-d8ab480b59b5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1619246-54cb-4904-969c-d8ab480b59b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('43eb1f18-f8c1-4055-9bd9-67c2673345ba', $q$bootstrapcdn-com$q$, $q$bootstrapcdn.com$q$, $q$https://www.bootstrapcdn.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '43eb1f18-f8c1-4055-9bd9-67c2673345ba', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43eb1f18-f8c1-4055-9bd9-67c2673345ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4ecc6a92-bd84-46ac-ae4b-7a99940eda7f', $q$borgbase-com$q$, $q$borgbase.com$q$, $q$https://www.borgbase.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4ecc6a92-bd84-46ac-ae4b-7a99940eda7f', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ecc6a92-bd84-46ac-ae4b-7a99940eda7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f6982bed-77ea-4c1c-86ae-f110f934bb26', $q$bottles$q$, $q$Bottles$q$, $q$https://usebottles.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f6982bed-77ea-4c1c-86ae-f110f934bb26', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6982bed-77ea-4c1c-86ae-f110f934bb26')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('73ac7167-1ba7-4e44-bbf8-dbdbcad06d99', $q$bottom$q$, $q$bottom$q$, $q$https://clementtsang.github.io/bottom/nightly/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '73ac7167-1ba7-4e44-bbf8-dbdbcad06d99', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '73ac7167-1ba7-4e44-bbf8-dbdbcad06d99')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6b78ba61-e23d-473a-8f61-939c1f5fce7b', $q$box$q$, $q$Box$q$, $q$https://box.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6b78ba61-e23d-473a-8f61-939c1f5fce7b', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b78ba61-e23d-473a-8f61-939c1f5fce7b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('abb96509-e0ba-4927-9110-f72512053172', $q$boxbot$q$, $q$Boxbot$q$, $q$https://www.boxbot.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'abb96509-e0ba-4927-9110-f72512053172', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abb96509-e0ba-4927-9110-f72512053172')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('424eeed7-a359-4785-947f-0867babfff58', $q$bradfield-school-of-computer-science$q$, $q$Bradfield School of Computer Science$q$, $q$https://bradfieldcs.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '424eeed7-a359-4785-947f-0867babfff58', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '424eeed7-a359-4785-947f-0867babfff58')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('683fdfa0-ec88-4a29-ade2-8bfe6a6b6328', $q$brainboard$q$, $q$Brainboard$q$, $q$https://www.brainboard.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '683fdfa0-ec88-4a29-ade2-8bfe6a6b6328', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '683fdfa0-ec88-4a29-ade2-8bfe6a6b6328')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f5c3a0e0-ca87-4f5e-89ba-38c7a15c351a', $q$brightidea$q$, $q$Brightidea$q$, $q$https://www.brightidea.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f5c3a0e0-ca87-4f5e-89ba-38c7a15c351a', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5c3a0e0-ca87-4f5e-89ba-38c7a15c351a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b7ab00e3-768f-4aff-a73c-f35eeb640abf', $q$brillio$q$, $q$Brillio$q$, $q$https://www.brillio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b7ab00e3-768f-4aff-a73c-f35eeb640abf', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7ab00e3-768f-4aff-a73c-f35eeb640abf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c227968d-30da-4d0b-9a4e-428bc0305d94', $q$broot$q$, $q$broot$q$, $q$https://dystroy.org/broot/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c227968d-30da-4d0b-9a4e-428bc0305d94', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c227968d-30da-4d0b-9a4e-428bc0305d94')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('af3b617e-ddb9-4747-8ee6-05fd0b76ab74', $q$browse-ai$q$, $q$Browse AI$q$, $q$https://www.browse.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'af3b617e-ddb9-4747-8ee6-05fd0b76ab74', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af3b617e-ddb9-4747-8ee6-05fd0b76ab74')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('707c21c2-77d0-4aa8-a1f3-817320f58c18', $q$btunnel$q$, $q$btunnel$q$, $q$https://www.btunnel.in/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '707c21c2-77d0-4aa8-a1f3-817320f58c18', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '707c21c2-77d0-4aa8-a1f3-817320f58c18')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('85ea5bd3-d7d0-4431-bd52-9819c2698a09', $q$budgie$q$, $q$Budgie$q$, $q$https://buddiesofbudgie.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '85ea5bd3-d7d0-4431-bd52-9819c2698a09', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85ea5bd3-d7d0-4431-bd52-9819c2698a09')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a5c2c9f-429f-43f8-aa35-04e216ea807d', $q$bugfender-com$q$, $q$bugfender.com$q$, $q$https://bugfender.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a5c2c9f-429f-43f8-aa35-04e216ea807d', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a5c2c9f-429f-43f8-aa35-04e216ea807d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eab39cb5-4a40-4290-930a-ce81ba4b90e2', $q$build-opensuse-org$q$, $q$build.opensuse.org$q$, $q$https://build.opensuse.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eab39cb5-4a40-4290-930a-ce81ba4b90e2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eab39cb5-4a40-4290-930a-ce81ba4b90e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('168f0fc4-11e6-43e9-b43d-4165c98d14f5', $q$bunny$q$, $q$Bunny$q$, $q$https://fonts.bunny.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '168f0fc4-11e6-43e9-b43d-4165c98d14f5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '168f0fc4-11e6-43e9-b43d-4165c98d14f5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ca3f9df7-9a06-4cc2-93fc-2fe091154016', $q$c-dogs-sdl$q$, $q$C-Dogs SDL$q$, $q$https://cxong.github.io/cdogs-sdl/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ca3f9df7-9a06-4cc2-93fc-2fe091154016', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca3f9df7-9a06-4cc2-93fc-2fe091154016')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4bd5937f-e64f-4c25-8c79-12336b88dbbf', $q$caja$q$, $q$Caja$q$, $q$https://mate-desktop.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4bd5937f-e64f-4c25-8c79-12336b88dbbf', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bd5937f-e64f-4c25-8c79-12336b88dbbf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a45a42d6-f099-41c6-ae25-4e9fbe792489', $q$calendar-icons-generator$q$, $q$Calendar Icons Generator$q$, $q$https://calendariconsgenerator.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a45a42d6-f099-41c6-ae25-4e9fbe792489', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a45a42d6-f099-41c6-ae25-4e9fbe792489')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fc042bad-c86d-4897-bb85-63e8cd464041', $q$carbon-five$q$, $q$Carbon Five$q$, $q$https://www.carbonfive.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fc042bad-c86d-4897-bb85-63e8cd464041', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc042bad-c86d-4897-bb85-63e8cd464041')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('05dae713-e7e6-4376-9f1c-10404d9bd72a', $q$carta$q$, $q$Carta$q$, $q$https://carta.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '05dae713-e7e6-4376-9f1c-10404d9bd72a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05dae713-e7e6-4376-9f1c-10404d9bd72a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8cd7aefe-b8d8-4c44-99fd-8bd25c94179b', $q$catalyst-by-zoho$q$, $q$Catalyst by Zoho$q$, $q$https://catalyst.zoho.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8cd7aefe-b8d8-4c44-99fd-8bd25c94179b', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8cd7aefe-b8d8-4c44-99fd-8bd25c94179b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dac93ca8-8c32-4123-94ac-09b9cd060986', $q$cdnjs-com$q$, $q$cdnjs.com$q$, $q$https://cdnjs.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dac93ca8-8c32-4123-94ac-09b9cd060986', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dac93ca8-8c32-4123-94ac-09b9cd060986')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ff3f3d7-0f1f-4463-92fc-7af7e8d400ae', $q$cemu$q$, $q$Cemu$q$, $q$https://cemu.info/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ff3f3d7-0f1f-4463-92fc-7af7e8d400ae', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ff3f3d7-0f1f-4463-92fc-7af7e8d400ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c5ac4d46-cf75-4332-94c1-b24fe24c15d3', $q$ceres-imaging$q$, $q$Ceres Imaging$q$, $q$https://ceresimaging.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c5ac4d46-cf75-4332-94c1-b24fe24c15d3', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5ac4d46-cf75-4332-94c1-b24fe24c15d3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3df60d9d-daa9-46fe-9df1-ce082cf3c163', $q$chartio$q$, $q$Chartio$q$, $q$https://chartio.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3df60d9d-daa9-46fe-9df1-ce082cf3c163', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3df60d9d-daa9-46fe-9df1-ce082cf3c163')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('07f7e3a2-3549-492f-9f44-b804dbf9984a', $q$chatty$q$, $q$Chatty$q$, $q$https://chatty.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '07f7e3a2-3549-492f-9f44-b804dbf9984a', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07f7e3a2-3549-492f-9f44-b804dbf9984a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('81681037-3e0b-4157-82ac-707a4372e951', $q$chegg$q$, $q$Chegg$q$, $q$https://www.chegg.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '81681037-3e0b-4157-82ac-707a4372e951', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81681037-3e0b-4157-82ac-707a4372e951')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('25d9c800-4614-4cac-874b-c91169b5deca', $q$chemtool$q$, $q$Chemtool$q$, $q$http://ruby.chemie.uni-freiburg.de/~martin/chemtool/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '25d9c800-4614-4cac-874b-c91169b5deca', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25d9c800-4614-4cac-874b-c91169b5deca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d57763a2-33b1-4688-9b26-dbe5e77635fc', $q$cherrytree$q$, $q$Cherrytree$q$, $q$https://www.giuspen.com/cherrytree/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd57763a2-33b1-4688-9b26-dbe5e77635fc', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd57763a2-33b1-4688-9b26-dbe5e77635fc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b61e50b2-c50d-42ef-95c6-150b39c0cb33', $q$chime$q$, $q$Chime$q$, $q$https://www.chimebank.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b61e50b2-c50d-42ef-95c6-150b39c0cb33', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b61e50b2-c50d-42ef-95c6-150b39c0cb33')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7198b10d-6099-4a58-a508-0fbb0e8b0fef', $q$chromeremotedesktop$q$, $q$ChromeRemoteDesktop$q$, $q$https://remotedesktop.google.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7198b10d-6099-4a58-a508-0fbb0e8b0fef', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7198b10d-6099-4a58-a508-0fbb0e8b0fef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('41d1b5f6-c8db-4613-a01f-279f3c9c767a', $q$cirun-io$q$, $q$cirun.io$q$, $q$https://cirun.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '41d1b5f6-c8db-4613-a01f-279f3c9c767a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41d1b5f6-c8db-4613-a01f-279f3c9c767a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a92ed71-a803-41b0-acbd-8930ee381549', $q$clementine$q$, $q$Clementine$q$, $q$https://www.clementine-player.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a92ed71-a803-41b0-acbd-8930ee381549', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a92ed71-a803-41b0-acbd-8930ee381549')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('791911ae-7f13-4b22-807b-bd998dc0e2de', $q$clever$q$, $q$Clever$q$, $q$https://clever.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '791911ae-7f13-4b22-807b-bd998dc0e2de', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '791911ae-7f13-4b22-807b-bd998dc0e2de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3bd680fb-ffaf-4404-9c06-bac18a4eedf9', $q$clockwork-micro$q$, $q$Clockwork Micro$q$, $q$https://clockworkmicro.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3bd680fb-ffaf-4404-9c06-bac18a4eedf9', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bd680fb-ffaf-4404-9c06-bac18a4eedf9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f1dbcfa2-6b82-4d0b-bc9c-353914d887fa', $q$cloud4wi$q$, $q$Cloud4Wi$q$, $q$https://cloud4wi.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f1dbcfa2-6b82-4d0b-bc9c-353914d887fa', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1dbcfa2-6b82-4d0b-bc9c-353914d887fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('da011c25-1ab6-4391-85b0-7e5c3ab1d6ac', $q$cloudamqp-com$q$, $q$cloudamqp.com$q$, $q$https://www.cloudamqp.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'da011c25-1ab6-4391-85b0-7e5c3ab1d6ac', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da011c25-1ab6-4391-85b0-7e5c3ab1d6ac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4ce9a315-8686-43e9-92c6-7a9d8afd48f7', $q$cloudbees$q$, $q$Cloudbees$q$, $q$https://www.cloudbees.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4ce9a315-8686-43e9-92c6-7a9d8afd48f7', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ce9a315-8686-43e9-92c6-7a9d8afd48f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c870db71-e7b1-467b-9f40-865796d9d4e9', $q$cloudera$q$, $q$Cloudera$q$, $q$https://cloudera.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c870db71-e7b1-467b-9f40-865796d9d4e9', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c870db71-e7b1-467b-9f40-865796d9d4e9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('35fa5c2a-e6b9-42a1-afc9-8109dd8e4b91', $q$cloudinary-com$q$, $q$cloudinary.com$q$, $q$https://cloudinary.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '35fa5c2a-e6b9-42a1-afc9-8109dd8e4b91', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35fa5c2a-e6b9-42a1-afc9-8109dd8e4b91')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('346d7851-ae5a-45e5-8f1c-25b4761b86d4', $q$cmus$q$, $q$Cmus$q$, $q$https://cmus.github.io/#download$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '346d7851-ae5a-45e5-8f1c-25b4761b86d4', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '346d7851-ae5a-45e5-8f1c-25b4761b86d4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d1601b35-55c8-4070-a942-c125771f0492', $q$cname-dev$q$, $q$cname.dev$q$, $q$https://cname.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd1601b35-55c8-4070-a942-c125771f0492', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1601b35-55c8-4070-a942-c125771f0492')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de6a5e70-4d70-4559-9d98-560bb0650b87', $q$code-nation$q$, $q$Code Nation$q$, $q$https://codenation.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de6a5e70-4d70-4559-9d98-560bb0650b87', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de6a5e70-4d70-4559-9d98-560bb0650b87')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('25bee257-9102-401a-86db-0cafade6b7fb', $q$code-blocks$q$, $q$Code::Blocks$q$, $q$https://codeblocks.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '25bee257-9102-401a-86db-0cafade6b7fb', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25bee257-9102-401a-86db-0cafade6b7fb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('faca7857-2bd8-451d-ac00-7dca0e45b289', $q$codedthemes$q$, $q$CodedThemes$q$, $q$https://codedthemes.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'faca7857-2bd8-451d-ac00-7dca0e45b289', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'faca7857-2bd8-451d-ac00-7dca0e45b289')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b77ec0e4-dcb2-4ec6-b1b5-af439818971f', $q$codehooks-io$q$, $q$codehooks.io$q$, $q$https://codehooks.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b77ec0e4-dcb2-4ec6-b1b5-af439818971f', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b77ec0e4-dcb2-4ec6-b1b5-af439818971f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4ce09b99-f2be-46e5-87e9-b738add6bd0c', $q$codekeep$q$, $q$CodeKeep$q$, $q$https://codekeep.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4ce09b99-f2be-46e5-87e9-b738add6bd0c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ce09b99-f2be-46e5-87e9-b738add6bd0c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe10ef49-8462-4ceb-b099-a81501193e11', $q$codemagic-io$q$, $q$codemagic.io$q$, $q$https://codemagic.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe10ef49-8462-4ceb-b099-a81501193e11', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe10ef49-8462-4ceb-b099-a81501193e11')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('77d2c00f-b93d-4ada-a9e5-3d02c9527db3', $q$codiga-io$q$, $q$codiga.io$q$, $q$https://codiga.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '77d2c00f-b93d-4ada-a9e5-3d02c9527db3', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '77d2c00f-b93d-4ada-a9e5-3d02c9527db3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7ddd07fe-32b0-4a5b-bf05-2226553c7e22', $q$coinbase$q$, $q$Coinbase$q$, $q$https://www.coinbase.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7ddd07fe-32b0-4a5b-bf05-2226553c7e22', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ddd07fe-32b0-4a5b-bf05-2226553c7e22')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('be9bb1a6-1bfa-468a-b4ce-ad7f245bb353', $q$colobot$q$, $q$Colobot$q$, $q$https://colobot.info/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'be9bb1a6-1bfa-468a-b4ce-ad7f245bb353', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be9bb1a6-1bfa-468a-b4ce-ad7f245bb353')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('779920fd-e21a-4301-86be-66403583d8ad', $q$comfy$q$, $q$Comfy$q$, $q$https://comfyapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '779920fd-e21a-4301-86be-66403583d8ad', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '779920fd-e21a-4301-86be-66403583d8ad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('224efe76-dd3a-4172-b743-7b0ea83c601a', $q$compology$q$, $q$Compology$q$, $q$https://compology.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '224efe76-dd3a-4172-b743-7b0ea83c601a', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '224efe76-dd3a-4172-b743-7b0ea83c601a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ac6b6746-2fa3-4120-a29b-219a3772b4df', $q$components-studio$q$, $q$Components.studio$q$, $q$https://webcomponents.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ac6b6746-2fa3-4120-a29b-219a3772b4df', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac6b6746-2fa3-4120-a29b-219a3772b4df')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('383f828c-a6f6-416b-a1d7-5263c0b93d24', $q$conky$q$, $q$Conky$q$, $q$https://conky.cc/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '383f828c-a6f6-416b-a1d7-5263c0b93d24', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '383f828c-a6f6-416b-a1d7-5263c0b93d24')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4bb7cefd-1923-4415-8bca-87e2a1517d8e', $q$connectycube-com$q$, $q$connectycube.com$q$, $q$https://connectycube.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4bb7cefd-1923-4415-8bca-87e2a1517d8e', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bb7cefd-1923-4415-8bca-87e2a1517d8e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('34f0259b-c793-4cb5-a8ec-9f6e4cd5389e', $q$contrib-rocks$q$, $q$contrib.rocks$q$, $q$https://contrib.rocks$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '34f0259b-c793-4cb5-a8ec-9f6e4cd5389e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34f0259b-c793-4cb5-a8ec-9f6e4cd5389e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4d396976-cc5c-4bf3-93a7-b18cb22dc1b2', $q$conveyor-cloud$q$, $q$conveyor.cloud$q$, $q$https://conveyor.cloud/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4d396976-cc5c-4bf3-93a7-b18cb22dc1b2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d396976-cc5c-4bf3-93a7-b18cb22dc1b2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('acd57c1b-0ec4-47eb-b5bb-a573a2b42662', $q$cookiefirst$q$, $q$Cookiefirst$q$, $q$https://cookiefirst.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'acd57c1b-0ec4-47eb-b5bb-a573a2b42662', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'acd57c1b-0ec4-47eb-b5bb-a573a2b42662')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2c6b3848-19a4-4c49-b931-003ba838b9c9', $q$copr-fedorainfracloud-org$q$, $q$copr.fedorainfracloud.org$q$, $q$https://copr.fedorainfracloud.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2c6b3848-19a4-4c49-b931-003ba838b9c9', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c6b3848-19a4-4c49-b931-003ba838b9c9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f6cb1438-d516-463e-beaf-3bfbbafea48a', $q$copyq$q$, $q$CopyQ$q$, $q$https://hluk.github.io/CopyQ/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f6cb1438-d516-463e-beaf-3bfbbafea48a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6cb1438-d516-463e-beaf-3bfbbafea48a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b1f42185-14bd-4461-a6a6-45918dcb78bf', $q$core-web-vitals-history$q$, $q$Core Web Vitals History$q$, $q$https://punits.dev/core-web-vitals-historical/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b1f42185-14bd-4461-a6a6-45918dcb78bf', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1f42185-14bd-4461-a6a6-45918dcb78bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65691317-5539-43a3-8bb3-c4ad9b27e638', $q$couchdb$q$, $q$CouchDB$q$, $q$https://couchdb.apache.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65691317-5539-43a3-8bb3-c4ad9b27e638', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65691317-5539-43a3-8bb3-c4ad9b27e638')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('90cb6082-c3da-4d35-ae16-517cb9004d38', $q$cpu-x$q$, $q$CPU-X$q$, $q$https://thetumultuousunicornofdarkness.github.io/CPU-X/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '90cb6082-c3da-4d35-ae16-517cb9004d38', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90cb6082-c3da-4d35-ae16-517cb9004d38')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ba7da5aa-1683-4bf9-a259-63591d303e29', $q$cpu-z$q$, $q$CPU-Z$q$, $q$https://www.cpuid.com/softwares/cpu-z.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ba7da5aa-1683-4bf9-a259-63591d303e29', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba7da5aa-1683-4bf9-a259-63591d303e29')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6f5f09e5-d368-4bc6-b9cd-16e74d0398f9', $q$cricket-health$q$, $q$Cricket Health$q$, $q$https://crickethealth.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6f5f09e5-d368-4bc6-b9cd-16e74d0398f9', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f5f09e5-d368-4bc6-b9cd-16e74d0398f9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('996b4a9f-71f2-4b4d-b8aa-21fea76d6666', $q$croc$q$, $q$croc$q$, $q$https://schollz.com/blog/croc6/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '996b4a9f-71f2-4b4d-b8aa-21fea76d6666', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '996b4a9f-71f2-4b4d-b8aa-21fea76d6666')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b8174abd-ac27-46c2-9a51-f08d6b87ce7f', $q$cron-job-org$q$, $q$cron-job.org$q$, $q$https://cron-job.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b8174abd-ac27-46c2-9a51-f08d6b87ce7f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8174abd-ac27-46c2-9a51-f08d6b87ce7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('17a0a618-1801-4386-bec9-758ae128df92', $q$cronhooks$q$, $q$Cronhooks$q$, $q$https://cronhooks.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '17a0a618-1801-4386-bec9-758ae128df92', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17a0a618-1801-4386-bec9-758ae128df92')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6f2e18b-eae3-454e-9469-bc5dd87574f4', $q$crunchyroll$q$, $q$Crunchyroll$q$, $q$https://www.crunchyroll.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6f2e18b-eae3-454e-9469-bc5dd87574f4', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6f2e18b-eae3-454e-9469-bc5dd87574f4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c8e9c26-c142-40c1-852c-62506bc54e8c', $q$cudatext$q$, $q$CudaText$q$, $q$https://cudatext.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c8e9c26-c142-40c1-852c-62506bc54e8c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c8e9c26-c142-40c1-852c-62506bc54e8c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b7bbdb7-187c-4a21-ab16-a809bd731985', $q$cura$q$, $q$Cura$q$, $q$https://ultimaker.com/software/ultimaker-cura/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b7bbdb7-187c-4a21-ab16-a809bd731985', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b7bbdb7-187c-4a21-ab16-a809bd731985')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d45f9431-9e0c-4ef3-bcf4-e8d33c882ffc', $q$customer-lobby$q$, $q$Customer Lobby$q$, $q$https://customerlobby.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd45f9431-9e0c-4ef3-bcf4-e8d33c882ffc', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd45f9431-9e0c-4ef3-bcf4-e8d33c882ffc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c2bbf3f9-04ed-4d69-b6d3-3d1445d23b0e', $q$d-lan$q$, $q$D-lan$q$, $q$https://www.d-lan.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c2bbf3f9-04ed-4d69-b6d3-3d1445d23b0e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2bbf3f9-04ed-4d69-b6d3-3d1445d23b0e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9a4da127-1e89-46a5-ae31-ebba4008d58f', $q$daily-reddit-wallpaper$q$, $q$Daily Reddit Wallpaper$q$, $q$https://federicotorrielli.github.io/Daily-Reddit-Wallpaper/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9a4da127-1e89-46a5-ae31-ebba4008d58f', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a4da127-1e89-46a5-ae31-ebba4008d58f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b756f9f4-d0fd-4019-94bf-65b792969130', $q$datelist-io$q$, $q$datelist.io$q$, $q$https://datelist.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b756f9f4-d0fd-4019-94bf-65b792969130', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b756f9f4-d0fd-4019-94bf-65b792969130')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fbf78e8a-26c7-4d63-a7b4-b3b2f814c06a', $q$datrium$q$, $q$Datrium$q$, $q$https://datrium.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fbf78e8a-26c7-4d63-a7b4-b3b2f814c06a', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbf78e8a-26c7-4d63-a7b4-b3b2f814c06a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d849eb46-cb77-427d-92b2-77f0e11c7f95', $q$db-designer$q$, $q$DB Designer$q$, $q$https://www.dbdesigner.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd849eb46-cb77-427d-92b2-77f0e11c7f95', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd849eb46-cb77-427d-92b2-77f0e11c7f95')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6776ca43-0c85-42d6-ab67-97d33ece86d2', $q$db-ip$q$, $q$DB-IP$q$, $q$https://db-ip.com/api/free$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6776ca43-0c85-42d6-ab67-97d33ece86d2', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6776ca43-0c85-42d6-ab67-97d33ece86d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e41fd154-3522-4aa5-8b80-838519aa792f', $q$deadbeef$q$, $q$DeaDBeeF$q$, $q$https://deadbeef.sourceforge.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e41fd154-3522-4aa5-8b80-838519aa792f', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e41fd154-3522-4aa5-8b80-838519aa792f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8f1f6581-f42c-4ff4-a4aa-54f0bd634a79', $q$deadmanssnitch-com$q$, $q$deadmanssnitch.com$q$, $q$https://deadmanssnitch.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8f1f6581-f42c-4ff4-a4aa-54f0bd634a79', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f1f6581-f42c-4ff4-a4aa-54f0bd634a79')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c23b60b-9c3b-4df6-8be5-00cbfd4640ae', $q$decky-loader$q$, $q$Decky Loader$q$, $q$https://decky.xyz/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c23b60b-9c3b-4df6-8be5-00cbfd4640ae', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c23b60b-9c3b-4df6-8be5-00cbfd4640ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('19c0285e-c51c-4c81-8ee7-bb3f44416a19', $q$deem$q$, $q$Deem$q$, $q$https://deem.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '19c0285e-c51c-4c81-8ee7-bb3f44416a19', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19c0285e-c51c-4c81-8ee7-bb3f44416a19')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4c75243-257c-4c4d-93e3-1519620163e2', $q$deemed-idle$q$, $q$deemed idle$q$, $q$https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm#compute__idleinstances$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4c75243-257c-4c4d-93e3-1519620163e2', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4c75243-257c-4c4d-93e3-1519620163e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f45f5100-cd0f-40df-bf87-e9f50305ca3a', $q$deepin-music$q$, $q$Deepin Music$q$, $q$https://www.deepin.org/en/original/deepin-music/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f45f5100-cd0f-40df-bf87-e9f50305ca3a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f45f5100-cd0f-40df-bf87-e9f50305ca3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('618b0928-1fc1-4ffb-81cd-0264a6700ecf', $q$defold$q$, $q$Defold$q$, $q$https://defold.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '618b0928-1fc1-4ffb-81cd-0264a6700ecf', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '618b0928-1fc1-4ffb-81cd-0264a6700ecf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a06f6937-ec5d-4dde-aaaa-bd2c63cbf4c6', $q$delphix$q$, $q$Delphix$q$, $q$https://delphix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a06f6937-ec5d-4dde-aaaa-bd2c63cbf4c6', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a06f6937-ec5d-4dde-aaaa-bd2c63cbf4c6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('eb0232dc-5691-48ff-9ddf-d08361449726', $q$deno-deploy$q$, $q$Deno Deploy$q$, $q$https://deno.com/deploy$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'eb0232dc-5691-48ff-9ddf-d08361449726', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb0232dc-5691-48ff-9ddf-d08361449726')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed5ad82f-5490-40b9-9b0f-b5d360bf67a6', $q$desmume$q$, $q$DeSmuME$q$, $q$https://desmume.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed5ad82f-5490-40b9-9b0f-b5d360bf67a6', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed5ad82f-5490-40b9-9b0f-b5d360bf67a6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c935f7b-2238-4175-a21f-59980fc50bd9', $q$dev-to$q$, $q$Dev.to$q$, $q$https://dev.to/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c935f7b-2238-4175-a21f-59980fc50bd9', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c935f7b-2238-4175-a21f-59980fc50bd9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fa573bd3-0d65-4d75-8e2b-283a2f8c2ca0', $q$dino$q$, $q$Dino$q$, $q$https://dino.im$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fa573bd3-0d65-4d75-8e2b-283a2f8c2ca0', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa573bd3-0d65-4d75-8e2b-283a2f8c2ca0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5a9d8f69-1922-41da-8c71-ace11d3b04d0', $q$discover$q$, $q$Discover$q$, $q$https://trigg.github.io/Discover/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5a9d8f69-1922-41da-8c71-ace11d3b04d0', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a9d8f69-1922-41da-8c71-ace11d3b04d0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('00fc9a24-2f53-4135-85d0-890fb85f6e29', $q$diy$q$, $q$DIY$q$, $q$https://diy.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '00fc9a24-2f53-4135-85d0-890fb85f6e29', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00fc9a24-2f53-4135-85d0-890fb85f6e29')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7f16724c-cf95-4fa4-8b22-bf014ec23a64', $q$dnanexus$q$, $q$DNAnexus$q$, $q$https://dnanexusconnect.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7f16724c-cf95-4fa4-8b22-bf014ec23a64', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f16724c-cf95-4fa4-8b22-bf014ec23a64')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f01cc239-90d3-4d24-953d-ca65c09ad4ef', $q$dnspod-com$q$, $q$dnspod.com$q$, $q$https://www.dnspod.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f01cc239-90d3-4d24-953d-ca65c09ad4ef', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f01cc239-90d3-4d24-953d-ca65c09ad4ef')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('68bd3c80-9152-458f-a401-30f2f0a33ab7', $q$docker-hub$q$, $q$Docker Hub$q$, $q$https://hub.docker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '68bd3c80-9152-458f-a401-30f2f0a33ab7', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68bd3c80-9152-458f-a401-30f2f0a33ab7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6983fb32-3dab-49d9-b7f1-769dfda4e53f', $q$dopamine$q$, $q$Dopamine$q$, $q$https://digimezzo.github.io/site/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6983fb32-3dab-49d9-b7f1-769dfda4e53f', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6983fb32-3dab-49d9-b7f1-769dfda4e53f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d6939667-af00-4352-97c1-821741d7fb44', $q$dosbox-staging$q$, $q$DOSBox Staging$q$, $q$https://www.dosbox-staging.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd6939667-af00-4352-97c1-821741d7fb44', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6939667-af00-4352-97c1-821741d7fb44')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d51edc99-d90f-4962-8080-0b1f3641d055', $q$dr-robotnik-s-ring-racers$q$, $q$Dr. Robotnik's Ring Racers$q$, $q$https://www.kartkrew.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd51edc99-d90f-4962-8080-0b1f3641d055', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd51edc99-d90f-4962-8080-0b1f3641d055')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b27bfad7-6653-487f-88f3-c21af5e760e5', $q$dracula$q$, $q$Dracula$q$, $q$https://draculatheme.com/gtk$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b27bfad7-6653-487f-88f3-c21af5e760e5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b27bfad7-6653-487f-88f3-c21af5e760e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('501f1470-d47d-4174-902b-704a2b0c83db', $q$drawdb$q$, $q$drawDB$q$, $q$https://drawdb.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '501f1470-d47d-4174-902b-704a2b0c83db', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '501f1470-d47d-4174-902b-704a2b0c83db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9ad7f473-e6db-4f8c-a293-def363651810', $q$dropshare$q$, $q$Dropshare$q$, $q$https://dropsha.re$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9ad7f473-e6db-4f8c-a293-def363651810', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ad7f473-e6db-4f8c-a293-def363651810')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('982b64a8-a629-401d-b51e-1f33ca865cd9', $q$drumbeats-io$q$, $q$drumbeats.io$q$, $q$https://drumbeats.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '982b64a8-a629-401d-b51e-1f33ca865cd9', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '982b64a8-a629-401d-b51e-1f33ca865cd9')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9ace0d1f-f7cd-4734-b86f-bd65a3ef0eb1', $q$duc$q$, $q$Duc$q$, $q$https://duc.zevv.nl/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9ace0d1f-f7cd-4734-b86f-bd65a3ef0eb1', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ace0d1f-f7cd-4734-b86f-bd65a3ef0eb1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('06ca1a75-1783-4ad9-afc0-07a8e8681171', $q$duckstation$q$, $q$DuckStation$q$, $q$https://www.duckstation.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '06ca1a75-1783-4ad9-afc0-07a8e8681171', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06ca1a75-1783-4ad9-afc0-07a8e8681171')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1149c01b-6a85-4215-b99d-2a8428cd16f7', $q$dwarf-fortress$q$, $q$Dwarf Fortress$q$, $q$http://www.bay12games.com/dwarves/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1149c01b-6a85-4215-b99d-2a8428cd16f7', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1149c01b-6a85-4215-b99d-2a8428cd16f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c55332dc-3a18-4da3-a05e-612cd9857b90', $q$dwm$q$, $q$dwm$q$, $q$https://dwm.suckless.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c55332dc-3a18-4da3-a05e-612cd9857b90', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c55332dc-3a18-4da3-a05e-612cd9857b90')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('87d9c6b3-d8dd-4e4e-bd1b-9372fc1e78ca', $q$earnest$q$, $q$Earnest$q$, $q$https://www.earnest.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '87d9c6b3-d8dd-4e4e-bd1b-9372fc1e78ca', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87d9c6b3-d8dd-4e4e-bd1b-9372fc1e78ca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c39d00f0-8025-44c3-9bf0-5183ad062ee5', $q$eartrumpet$q$, $q$EarTrumpet$q$, $q$https://eartrumpet.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c39d00f0-8025-44c3-9bf0-5183ad062ee5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c39d00f0-8025-44c3-9bf0-5183ad062ee5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4eb3124b-13d8-4ca6-9474-29d4d982fe06', $q$easy-window-switcher$q$, $q$Easy Window Switcher$q$, $q$https://neosmart.net/EasySwitch/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4eb3124b-13d8-4ca6-9474-29d4d982fe06', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4eb3124b-13d8-4ca6-9474-29d4d982fe06')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c67ec046-f635-4f97-81eb-88fe628c453f', $q$eaze$q$, $q$Eaze$q$, $q$https://www.eaze.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c67ec046-f635-4f97-81eb-88fe628c453f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c67ec046-f635-4f97-81eb-88fe628c453f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fa0e8b2e-ed9f-44e6-b004-931db0666f70', $q$ebay$q$, $q$eBay$q$, $q$https://ebayinc.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fa0e8b2e-ed9f-44e6-b004-931db0666f70', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa0e8b2e-ed9f-44e6-b004-931db0666f70')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('03235e53-bf9d-4d4a-884e-ff0627700670', $q$economize-cloud$q$, $q$economize.cloud$q$, $q$https://economize.cloud$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '03235e53-bf9d-4d4a-884e-ff0627700670', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03235e53-bf9d-4d4a-884e-ff0627700670')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('95f3651c-a425-427e-adcc-02eeb635d5b3', $q$embrace$q$, $q$Embrace$q$, $q$https://embrace.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '95f3651c-a425-427e-adcc-02eeb635d5b3', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95f3651c-a425-427e-adcc-02eeb635d5b3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('61426574-2fcf-460e-9e97-ac60a182bb81', $q$emudeck$q$, $q$EmuDeck$q$, $q$https://www.emudeck.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '61426574-2fcf-460e-9e97-ac60a182bb81', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61426574-2fcf-460e-9e97-ac60a182bb81')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b330ace2-1e49-4fea-86e6-08869829ae44', $q$enpass$q$, $q$Enpass$q$, $q$https://www.enpass.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b330ace2-1e49-4fea-86e6-08869829ae44', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b330ace2-1e49-4fea-86e6-08869829ae44')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5d349153-8e50-4cbb-8fee-feec4618e8e2', $q$equinix$q$, $q$Equinix$q$, $q$https://equinix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5d349153-8e50-4cbb-8fee-feec4618e8e2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d349153-8e50-4cbb-8fee-feec4618e8e2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fc151623-2597-4f5d-afe0-6cec7896db30', $q$esper$q$, $q$Esper$q$, $q$https://esper.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fc151623-2597-4f5d-afe0-6cec7896db30', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc151623-2597-4f5d-afe0-6cec7896db30')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a0447767-0311-435b-81e2-20841d91ddbb', $q$everything$q$, $q$Everything$q$, $q$https://www.voidtools.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a0447767-0311-435b-81e2-20841d91ddbb', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0447767-0311-435b-81e2-20841d91ddbb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4fd365b2-b5c2-4925-a7d6-f33c57ab9cd0', $q$everything-fonts$q$, $q$Everything Fonts$q$, $q$https://everythingfonts.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4fd365b2-b5c2-4925-a7d6-f33c57ab9cd0', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4fd365b2-b5c2-4925-a7d6-f33c57ab9cd0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dde02615-5bfb-4ef9-b81a-ae9d291fec00', $q$exceptionless$q$, $q$exceptionless$q$, $q$https://exceptionless.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dde02615-5bfb-4ef9-b81a-ae9d291fec00', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dde02615-5bfb-4ef9-b81a-ae9d291fec00')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0a8457e3-5983-4dc0-8b49-6b3e6fd57d0e', $q$extole$q$, $q$Extole$q$, $q$https://www.extole.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0a8457e3-5983-4dc0-8b49-6b3e6fd57d0e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a8457e3-5983-4dc0-8b49-6b3e6fd57d0e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c73db290-cb5b-4939-9ea6-5894ea071ff2', $q$eza$q$, $q$eza$q$, $q$https://eza.rocks/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c73db290-cb5b-4939-9ea6-5894ea071ff2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c73db290-cb5b-4939-9ea6-5894ea071ff2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7e1958f6-c3cd-401b-b567-de22b54ca1f7', $q$factorio$q$, $q$Factorio$q$, $q$https://www.factorio.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7e1958f6-c3cd-401b-b567-de22b54ca1f7', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e1958f6-c3cd-401b-b567-de22b54ca1f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('131c242c-255a-4d06-83bf-f7421cb73ba7', $q$fan-control$q$, $q$Fan Control$q$, $q$https://getfancontrol.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '131c242c-255a-4d06-83bf-f7421cb73ba7', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '131c242c-255a-4d06-83bf-f7421cb73ba7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3fe59d47-7b27-4e42-a701-6dd41312406f', $q$fanatics$q$, $q$Fanatics$q$, $q$https://fanatics.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3fe59d47-7b27-4e42-a701-6dd41312406f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fe59d47-7b27-4e42-a701-6dd41312406f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e2ea84f6-54bf-46cb-aa55-5efea2486f60', $q$fbreader$q$, $q$FBReader$q$, $q$https://fbreader.org/content/fbreader-beta-linux-desktop$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e2ea84f6-54bf-46cb-aa55-5efea2486f60', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2ea84f6-54bf-46cb-aa55-5efea2486f60')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9c60fd29-9360-4e0b-b425-8821b46fcaaf', $q$feh$q$, $q$Feh$q$, $q$https://feh.finalrewind.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9c60fd29-9360-4e0b-b425-8821b46fcaaf', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9c60fd29-9360-4e0b-b425-8821b46fcaaf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0606a756-5002-4edd-9943-772a30d40c66', $q$ferdium$q$, $q$Ferdium$q$, $q$https://ferdium.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0606a756-5002-4edd-9943-772a30d40c66', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0606a756-5002-4edd-9943-772a30d40c66')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fc6d65ab-04da-4feb-92f9-105c4dcd4bd7', $q$file-converter$q$, $q$File Converter$q$, $q$https://file-converter.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fc6d65ab-04da-4feb-92f9-105c4dcd4bd7', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc6d65ab-04da-4feb-92f9-105c4dcd4bd7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8f4af635-2acf-4254-abda-cfc3ff26c07d', $q$file-pilot$q$, $q$File pilot$q$, $q$https://filepilot.tech/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8f4af635-2acf-4254-abda-cfc3ff26c07d', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f4af635-2acf-4254-abda-cfc3ff26c07d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1e904a6-71b0-4f23-a7cd-88f1f5aa2b30', $q$filemaker$q$, $q$FileMaker$q$, $q$https://www.filemaker.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1e904a6-71b0-4f23-a7cd-88f1f5aa2b30', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1e904a6-71b0-4f23-a7cd-88f1f5aa2b30')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('17539e07-2bc1-4999-badc-5ec2ff410426', $q$fileoptimizer$q$, $q$FileOptimizer$q$, $q$https://nikkhokkho.sourceforge.io/static.php?page=FileOptimizer$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '17539e07-2bc1-4999-badc-5ec2ff410426', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17539e07-2bc1-4999-badc-5ec2ff410426')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e9067c56-feac-4dd8-9704-37dff5415394', $q$files$q$, $q$Files$q$, $q$https://files.community/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e9067c56-feac-4dd8-9704-37dff5415394', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9067c56-feac-4dd8-9704-37dff5415394')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab295fca-b53d-43a1-8d07-e20df3134a1b', $q$fileshot-io$q$, $q$FileShot.io$q$, $q$https://fileshot.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab295fca-b53d-43a1-8d07-e20df3134a1b', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab295fca-b53d-43a1-8d07-e20df3134a1b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('16e09abd-e9cf-4a80-9594-d0d5267bd1ce', $q$filess-io$q$, $q$filess.io$q$, $q$https://filess.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '16e09abd-e9cf-4a80-9594-d0d5267bd1ce', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16e09abd-e9cf-4a80-9594-d0d5267bd1ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee0b2e50-33e7-44c9-a816-93566360adf4', $q$filezilla$q$, $q$FileZilla$q$, $q$https://filezilla-project.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee0b2e50-33e7-44c9-a816-93566360adf4', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee0b2e50-33e7-44c9-a816-93566360adf4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5c35f7c0-ad9a-4109-8253-93a2486655d2', $q$firehol$q$, $q$FireHOL$q$, $q$https://firehol.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5c35f7c0-ad9a-4109-8253-93a2486655d2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c35f7c0-ad9a-4109-8253-93a2486655d2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4076d278-fefc-42b9-ade9-8b4f77294f83', $q$fish$q$, $q$Fish$q$, $q$https://fishshell.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4076d278-fefc-42b9-ade9-8b4f77294f83', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4076d278-fefc-42b9-ade9-8b4f77294f83')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e3ed2338-e1c4-461f-b5dc-ea762386a5e0', $q$fivenines-io$q$, $q$fivenines.io$q$, $q$https://fivenines.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e3ed2338-e1c4-461f-b5dc-ea762386a5e0', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3ed2338-e1c4-461f-b5dc-ea762386a5e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cba3ee81-5d04-4ae3-918b-132e89328a83', $q$flameshot$q$, $q$Flameshot$q$, $q$https://flameshot.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cba3ee81-5d04-4ae3-918b-132e89328a83', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cba3ee81-5d04-4ae3-918b-132e89328a83')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee0c00fd-b144-433c-9d53-a5c1fbbc1c0f', $q$flarewarden$q$, $q$FlareWarden$q$, $q$https://flarewarden.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee0c00fd-b144-433c-9d53-a5c1fbbc1c0f', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee0c00fd-b144-433c-9d53-a5c1fbbc1c0f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3c4bdd29-01d9-48ba-b8d8-8e45c583a0cc', $q$flax-engine$q$, $q$Flax Engine$q$, $q$https://flaxengine.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3c4bdd29-01d9-48ba-b8d8-8e45c583a0cc', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c4bdd29-01d9-48ba-b8d8-8e45c583a0cc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('203cd4c9-9c8d-4424-b722-4a2d36374b34', $q$flexasio$q$, $q$FlexASIO$q$, $q$https://flexasio.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '203cd4c9-9c8d-4424-b722-4a2d36374b34', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '203cd4c9-9c8d-4424-b722-4a2d36374b34')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3fb832e5-4f7f-4d80-b77f-9ee328b19588', $q$flightgear$q$, $q$FlightGear$q$, $q$https://www.flightgear.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3fb832e5-4f7f-4d80-b77f-9ee328b19588', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fb832e5-4f7f-4d80-b77f-9ee328b19588')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b354e1c1-2aaf-4c90-bfa4-4b8cc24165f8', $q$flipboard$q$, $q$Flipboard$q$, $q$https://about.flipboard.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b354e1c1-2aaf-4c90-bfa4-4b8cc24165f8', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b354e1c1-2aaf-4c90-bfa4-4b8cc24165f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f13fe577-074c-4bfb-bdfd-391598ff5de8', $q$flow-launcher$q$, $q$Flow Launcher$q$, $q$https://flowlauncher.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f13fe577-074c-4bfb-bdfd-391598ff5de8', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f13fe577-074c-4bfb-bdfd-391598ff5de8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('10d53da5-5cc5-4906-87f3-841c86bac076', $q$flows$q$, $q$Flows$q$, $q$https://flows.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '10d53da5-5cc5-4906-87f3-841c86bac076', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10d53da5-5cc5-4906-87f3-841c86bac076')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('74f44d62-3f3b-4fd5-9c70-30609bddda9b', $q$fluent-reader$q$, $q$Fluent Reader$q$, $q$https://hyliu.me/fluent-reader/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '74f44d62-3f3b-4fd5-9c70-30609bddda9b', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74f44d62-3f3b-4fd5-9c70-30609bddda9b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2499c402-666f-412c-a889-2acccee0f343', $q$fluxbox$q$, $q$Fluxbox$q$, $q$http://fluxbox.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2499c402-666f-412c-a889-2acccee0f343', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2499c402-666f-412c-a889-2acccee0f343')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48e765bf-1d0f-4728-82ad-1c0c5939a8bf', $q$foliate$q$, $q$Foliate$q$, $q$https://johnfactotum.github.io/foliate/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48e765bf-1d0f-4728-82ad-1c0c5939a8bf', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48e765bf-1d0f-4728-82ad-1c0c5939a8bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7b37029-9001-4b04-af04-6b8a1527ab3a', $q$font-of-web$q$, $q$Font of web$q$, $q$https://fontofweb.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7b37029-9001-4b04-af04-6b8a1527ab3a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7b37029-9001-4b04-af04-6b8a1527ab3a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cc31dd4a-ed91-42bd-bf28-f8271b45148f', $q$font-squirrel$q$, $q$Font Squirrel$q$, $q$https://www.fontsquirrel.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cc31dd4a-ed91-42bd-bf28-f8271b45148f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc31dd4a-ed91-42bd-bf28-f8271b45148f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c1bbf8b-b7ef-4478-ba4b-9433b2e0b645', $q$fontforge$q$, $q$FontForge$q$, $q$https://fontforge.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c1bbf8b-b7ef-4478-ba4b-9433b2e0b645', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c1bbf8b-b7ef-4478-ba4b-9433b2e0b645')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('adb9cff6-86bf-4998-8506-4e88733f35eb', $q$fonts-xz-style$q$, $q$fonts.xz.style$q$, $q$https://fonts.xz.style/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'adb9cff6-86bf-4998-8506-4e88733f35eb', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'adb9cff6-86bf-4998-8506-4e88733f35eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a6e152e4-c3af-41f4-8319-d4087c7c7337', $q$fontsensei$q$, $q$Fontsensei$q$, $q$https://fontsensei.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a6e152e4-c3af-41f4-8319-d4087c7c7337', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6e152e4-c3af-41f4-8319-d4087c7c7337')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('474a4a6e-c4ff-4295-b4f7-6bb15498551c', $q$fontshare$q$, $q$Fontshare$q$, $q$https://www.fontshare.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '474a4a6e-c4ff-4295-b4f7-6bb15498551c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '474a4a6e-c4ff-4295-b4f7-6bb15498551c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d34d5ad-0c9d-4016-b95d-1b068b188944', $q$foobar2000$q$, $q$Foobar2000$q$, $q$https://www.foobar2000.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d34d5ad-0c9d-4016-b95d-1b068b188944', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d34d5ad-0c9d-4016-b95d-1b068b188944')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('52edd952-17dc-4bd6-a726-1cd7105a5189', $q$for-free$q$, $q$for free$q$, $q$https://docs.pipedream.com/pricing/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '52edd952-17dc-4bd6-a726-1cd7105a5189', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52edd952-17dc-4bd6-a726-1cd7105a5189')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f62201af-c64f-4ff3-934f-7160991341de', $q$fossa$q$, $q$FOSSA$q$, $q$https://fossa.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f62201af-c64f-4ff3-934f-7160991341de', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f62201af-c64f-4ff3-934f-7160991341de')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cf4a5e2b-4fb5-44aa-8a06-8c34eb872e00', $q$foxit$q$, $q$Foxit$q$, $q$https://www.foxit.com/pdf-reader/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cf4a5e2b-4fb5-44aa-8a06-8c34eb872e00', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf4a5e2b-4fb5-44aa-8a06-8c34eb872e00')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7def4ef7-3522-4409-913a-8059f9a4c57c', $q$franz$q$, $q$Franz$q$, $q$https://meetfranz.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7def4ef7-3522-4409-913a-8059f9a4c57c', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7def4ef7-3522-4409-913a-8059f9a4c57c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f1704ba2-c3c0-44f0-92c2-63cba83868b8', $q$fraps$q$, $q$Fraps$q$, $q$https://www.fraps.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f1704ba2-c3c0-44f0-92c2-63cba83868b8', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1704ba2-c3c0-44f0-92c2-63cba83868b8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('39ec218a-aacf-4f0d-8962-8cfba47f2d9d', $q$free-download-manager$q$, $q$Free Download Manager$q$, $q$https://www.freedownloadmanager.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '39ec218a-aacf-4f0d-8962-8cfba47f2d9d', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39ec218a-aacf-4f0d-8962-8cfba47f2d9d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d15e67ba-6526-47e2-a63c-cb6f09203562', $q$free-plan$q$, $q$free plan$q$, $q$https://wundergraph.com/pricing$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd15e67ba-6526-47e2-a63c-cb6f09203562', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd15e67ba-6526-47e2-a63c-cb6f09203562')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('974e7f41-c43e-4b23-8e33-65427f87f6db', $q$free-po-editor$q$, $q$Free PO editor$q$, $q$https://pofile.net/free-po-editor$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '974e7f41-c43e-4b23-8e33-65427f87f6db', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '974e7f41-c43e-4b23-8e33-65427f87f6db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e4f86fc2-89da-40a4-a848-3761aa1479aa', $q$freecad$q$, $q$FreeCAD$q$, $q$https://www.freecad.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e4f86fc2-89da-40a4-a848-3761aa1479aa', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4f86fc2-89da-40a4-a848-3761aa1479aa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f5d67902-822b-4a7a-be0c-1e6a35731441', $q$freedoom$q$, $q$Freedoom$q$, $q$https://freedoom.github.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f5d67902-822b-4a7a-be0c-1e6a35731441', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5d67902-822b-4a7a-be0c-1e6a35731441')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b2443390-016f-45f0-9875-198f795c1db6', $q$freedroidrpg$q$, $q$FreedroidRPG$q$, $q$https://www.freedroid.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b2443390-016f-45f0-9875-198f795c1db6', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2443390-016f-45f0-9875-198f795c1db6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b316c2c-229e-4a90-b380-386ac0bc1ab2', $q$freefilesync$q$, $q$FreeFileSync$q$, $q$https://www.freefilesync.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b316c2c-229e-4a90-b380-386ac0bc1ab2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b316c2c-229e-4a90-b380-386ac0bc1ab2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5bfbbe4-a092-491e-92c4-309da2a3da41', $q$freeflarum$q$, $q$FreeFlarum$q$, $q$https://freeflarum.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5bfbbe4-a092-491e-92c4-309da2a3da41', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5bfbbe4-a092-491e-92c4-309da2a3da41')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a8b8da8-95dc-4398-aa45-d8783e3c6ee5', $q$freeoffice$q$, $q$FreeOffice$q$, $q$https://www.freeoffice.com/en/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a8b8da8-95dc-4398-aa45-d8783e3c6ee5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a8b8da8-95dc-4398-aa45-d8783e3c6ee5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20117f93-b024-4fc4-be56-e37b5eb13cb3', $q$freetools-site$q$, $q$freetools.site$q$, $q$https://freetools.site/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20117f93-b024-4fc4-be56-e37b5eb13cb3', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20117f93-b024-4fc4-be56-e37b5eb13cb3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fab40da5-d391-40fe-aff0-a2001bf6db2a', $q$freetube$q$, $q$FreeTube$q$, $q$https://freetubeapp.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fab40da5-d391-40fe-aff0-a2001bf6db2a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fab40da5-d391-40fe-aff0-a2001bf6db2a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b9ef8465-57d3-43e2-8e9f-10ad6a054ce3', $q$funding-circle$q$, $q$Funding Circle$q$, $q$https://fundingcircle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b9ef8465-57d3-43e2-8e9f-10ad6a054ce3', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9ef8465-57d3-43e2-8e9f-10ad6a054ce3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a9655e8b-ccbe-4413-9c28-fd49f95df92f', $q$fuse$q$, $q$Fuse$q$, $q$https://fuse-emulator.sourceforge.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a9655e8b-ccbe-4413-9c28-fd49f95df92f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9655e8b-ccbe-4413-9c28-fd49f95df92f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c782e64-503f-4c6e-a0b4-773c2bb85393', $q$galvanize$q$, $q$Galvanize$q$, $q$https://www.galvanize.com/san-francisco$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c782e64-503f-4c6e-a0b4-773c2bb85393', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c782e64-503f-4c6e-a0b4-773c2bb85393')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2f3a1ab9-64bf-4a8a-afb9-5aede25b97b1', $q$gamemaker$q$, $q$GameMaker$q$, $q$https://gamemaker.io/en$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2f3a1ab9-64bf-4a8a-afb9-5aede25b97b1', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f3a1ab9-64bf-4a8a-afb9-5aede25b97b1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8171bb95-e42e-46ed-9041-79beadb7fcbe', $q$gap$q$, $q$GAP$q$, $q$https://www.gap-system.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8171bb95-e42e-46ed-9041-79beadb7fcbe', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8171bb95-e42e-46ed-9041-79beadb7fcbe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4a44f254-5aad-46b3-a4a5-e72502ff528f', $q$gcompris$q$, $q$Gcompris$q$, $q$https://gcompris.net/index-en.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4a44f254-5aad-46b3-a4a5-e72502ff528f', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a44f254-5aad-46b3-a4a5-e72502ff528f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c0b61203-dc40-44c4-a95c-0a228b29e663', $q$gcore$q$, $q$Gcore$q$, $q$https://gcorelabs.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c0b61203-dc40-44c4-a95c-0a228b29e663', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0b61203-dc40-44c4-a95c-0a228b29e663')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fef248b9-0a1c-44a8-ad74-efe92c5a5fae', $q$gd-map$q$, $q$GD map$q$, $q$https://gdmap.sourceforge.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fef248b9-0a1c-44a8-ad74-efe92c5a5fae', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fef248b9-0a1c-44a8-ad74-efe92c5a5fae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('24a13e17-0bd4-4ac0-9633-31263f84eb49', $q$geeqie$q$, $q$geeqie$q$, $q$http://www.geeqie.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '24a13e17-0bd4-4ac0-9633-31263f84eb49', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24a13e17-0bd4-4ac0-9633-31263f84eb49')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a14f3f7f-1828-4b1e-8abc-fa892f0731eb', $q$gemini$q$, $q$Gemini$q$, $q$https://gemini.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a14f3f7f-1828-4b1e-8abc-fa892f0731eb', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a14f3f7f-1828-4b1e-8abc-fa892f0731eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d9794dc-9479-45d4-beb8-2712619f1604', $q$geogebra$q$, $q$Geogebra$q$, $q$https://www.geogebra.org/download$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d9794dc-9479-45d4-beb8-2712619f1604', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d9794dc-9479-45d4-beb8-2712619f1604')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f56fdbb8-9ec0-4a94-95cf-66a760e51101', $q$getscreen-me$q$, $q$Getscreen.me$q$, $q$https://getscreen.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f56fdbb8-9ec0-4a94-95cf-66a760e51101', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f56fdbb8-9ec0-4a94-95cf-66a760e51101')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d91ca7ce-e0a1-4e58-9537-860936c84e9d', $q$getstream-io$q$, $q$getstream.io$q$, $q$https://getstream.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd91ca7ce-e0a1-4e58-9537-860936c84e9d', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd91ca7ce-e0a1-4e58-9537-860936c84e9d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('617f5deb-40f2-421b-8912-3e424d74595f', $q$ghost-writer$q$, $q$Ghost Writer$q$, $q$https://ghostwriter.kde.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '617f5deb-40f2-421b-8912-3e424d74595f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '617f5deb-40f2-421b-8912-3e424d74595f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('50cc94c8-e070-45c1-92e6-00e26ad0dc48', $q$gigalixir-com$q$, $q$gigalixir.com$q$, $q$https://gigalixir.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '50cc94c8-e070-45c1-92e6-00e26ad0dc48', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50cc94c8-e070-45c1-92e6-00e26ad0dc48')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('313c7874-7e86-4743-93cf-911e1189712e', $q$globalfoundries$q$, $q$Globalfoundries$q$, $q$https://globalfoundries.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '313c7874-7e86-4743-93cf-911e1189712e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '313c7874-7e86-4743-93cf-911e1189712e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8bbcb1a6-146c-4988-a987-04db14d713ac', $q$gnome$q$, $q$GNOME$q$, $q$https://www.gnome.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8bbcb1a6-146c-4988-a987-04db14d713ac', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8bbcb1a6-146c-4988-a987-04db14d713ac')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0c59b493-5ae7-4032-9f30-74573eebe525', $q$gnome-extensions$q$, $q$GNOME Extensions$q$, $q$https://extensions.gnome.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0c59b493-5ae7-4032-9f30-74573eebe525', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c59b493-5ae7-4032-9f30-74573eebe525')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a1d18dea-adab-4864-be43-0317ca8c6d83', $q$gnome-look$q$, $q$GNOME Look$q$, $q$https://www.gnome-look.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a1d18dea-adab-4864-be43-0317ca8c6d83', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1d18dea-adab-4864-be43-0317ca8c6d83')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bd848d43-abb6-469e-aec6-0b54c99d6de6', $q$gnu-octave$q$, $q$GNU Octave$q$, $q$https://octave.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bd848d43-abb6-469e-aec6-0b54c99d6de6', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd848d43-abb6-469e-aec6-0b54c99d6de6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('857f5953-4e12-4ff2-a5f0-413165282958', $q$goodtime$q$, $q$GoodTime$q$, $q$https://goodtime.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '857f5953-4e12-4ff2-a5f0-413165282958', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '857f5953-4e12-4ff2-a5f0-413165282958')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('00eeb380-089b-4a60-ac66-c12e1121a869', $q$gpu-z$q$, $q$GPU-Z$q$, $q$https://www.techpowerup.com/gpuz/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '00eeb380-089b-4a60-ac66-c12e1121a869', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00eeb380-089b-4a60-ac66-c12e1121a869')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('19222d88-668f-4ede-9a47-5773b0418662', $q$gravitational$q$, $q$Gravitational$q$, $q$https://gravitational.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '19222d88-668f-4ede-9a47-5773b0418662', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19222d88-668f-4ede-9a47-5773b0418662')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b6ecec47-9a5c-490d-8098-99a83270a135', $q$grin$q$, $q$Grin$q$, $q$https://www.grin.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b6ecec47-9a5c-490d-8098-99a83270a135', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6ecec47-9a5c-490d-8098-99a83270a135')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8afe1375-9535-4dd1-8036-9e86271539cd', $q$grovo$q$, $q$Grovo$q$, $q$https://www.grovo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8afe1375-9535-4dd1-8036-9e86271539cd', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8afe1375-9535-4dd1-8036-9e86271539cd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fa574bf7-d995-4bfb-b44e-d53c7d3829bf', $q$gumlet-com$q$, $q$gumlet.com$q$, $q$https://www.gumlet.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fa574bf7-d995-4bfb-b44e-d53c7d3829bf', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa574bf7-d995-4bfb-b44e-d53c7d3829bf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7b80b1eb-308e-47cf-a9c1-5380aa48ca7c', $q$hack-reactor$q$, $q$Hack Reactor$q$, $q$https://www.hackreactor.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7b80b1eb-308e-47cf-a9c1-5380aa48ca7c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b80b1eb-308e-47cf-a9c1-5380aa48ca7c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('88814d3d-e18d-4144-8b2a-6c46053ca81c', $q$hackerone$q$, $q$HackerOne$q$, $q$https://hackerone.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '88814d3d-e18d-4144-8b2a-6c46053ca81c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88814d3d-e18d-4144-8b2a-6c46053ca81c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('36429d28-3fa4-475f-a374-ca7ea3ad722b', $q$hamachi$q$, $q$Hamachi$q$, $q$https://www.vpn.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '36429d28-3fa4-475f-a374-ca7ea3ad722b', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36429d28-3fa4-475f-a374-ca7ea3ad722b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('62ec801b-65ab-49ad-91aa-39b0ade64472', $q$hashnode$q$, $q$Hashnode$q$, $q$https://hashnode.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '62ec801b-65ab-49ad-91aa-39b0ade64472', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62ec801b-65ab-49ad-91aa-39b0ade64472')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ee421e2c-f1cf-410d-89a2-13cc25b00174', $q$headspace$q$, $q$Headspace$q$, $q$https://headspace.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ee421e2c-f1cf-410d-89a2-13cc25b00174', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee421e2c-f1cf-410d-89a2-13cc25b00174')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2540a2d6-58c2-4f94-bba0-36d19a3f19cb', $q$hellosign$q$, $q$HelloSign$q$, $q$https://www.hellosign.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2540a2d6-58c2-4f94-bba0-36d19a3f19cb', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2540a2d6-58c2-4f94-bba0-36d19a3f19cb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd583dbf-10af-4898-86b8-f8fb2937a09d', $q$help-launchpad-net$q$, $q$help.launchpad.net$q$, $q$https://help.launchpad.net/Packaging$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd583dbf-10af-4898-86b8-f8fb2937a09d', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd583dbf-10af-4898-86b8-f8fb2937a09d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('37c54402-1f2e-43cc-a036-319595252488', $q$hewlett-packard$q$, $q$Hewlett Packard$q$, $q$https://hp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '37c54402-1f2e-43cc-a036-319595252488', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37c54402-1f2e-43cc-a036-319595252488')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cf6b8b7f-f3cc-49df-8f8e-28df320abf15', $q$hivemapper$q$, $q$Hivemapper$q$, $q$https://hivemapper.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cf6b8b7f-f3cc-49df-8f8e-28df320abf15', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf6b8b7f-f3cc-49df-8f8e-28df320abf15')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab0fc517-fcf4-4b1c-891d-018de3dca6af', $q$hivemq$q$, $q$HiveMQ$q$, $q$https://www.hivemq.com/mqtt-cloud-broker/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab0fc517-fcf4-4b1c-891d-018de3dca6af', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab0fc517-fcf4-4b1c-891d-018de3dca6af')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a3501178-44c3-44ef-bc5a-d0980c7fffc6', $q$hotschedules$q$, $q$HotSchedules$q$, $q$https://www.hotschedules.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a3501178-44c3-44ef-bc5a-d0980c7fffc6', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a3501178-44c3-44ef-bc5a-d0980c7fffc6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b102bf45-3465-4493-9c03-c32d52c10668', $q$houzz$q$, $q$Houzz$q$, $q$https://houzz.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b102bf45-3465-4493-9c03-c32d52c10668', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b102bf45-3465-4493-9c03-c32d52c10668')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5b8d917a-75da-40bb-b06b-4cf6b7b3bc56', $q$howuku-com$q$, $q$howuku.com$q$, $q$https://howuku.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5b8d917a-75da-40bb-b06b-4cf6b7b3bc56', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b8d917a-75da-40bb-b06b-4cf6b7b3bc56')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('204e04ce-67c3-4940-afb1-5cf2fe2b28c4', $q$https-node-new$q$, $q$https://node.new$q$, $q$https://node.new$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '204e04ce-67c3-4940-afb1-5cf2fe2b28c4', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '204e04ce-67c3-4940-afb1-5cf2fe2b28c4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c9a33a41-18fc-4133-ad15-11e5057ac860', $q$httpsms$q$, $q$httpSMS$q$, $q$https://httpsms.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c9a33a41-18fc-4133-ad15-11e5057ac860', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9a33a41-18fc-4133-ad15-11e5057ac860')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48a6aeeb-62e0-42c2-bb6a-f56d6793e133', $q$huaweicloud-com$q$, $q$huaweicloud.com$q$, $q$https://www.huaweicloud.com/intl/en-us/product/dns.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48a6aeeb-62e0-42c2-bb6a-f56d6793e133', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48a6aeeb-62e0-42c2-bb6a-f56d6793e133')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ada1724-79ad-4925-b104-09ed89cb3dbe', $q$image-charts-com$q$, $q$image-charts.com$q$, $q$https://www.image-charts.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ada1724-79ad-4925-b104-09ed89cb3dbe', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ada1724-79ad-4925-b104-09ed89cb3dbe')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e66294ea-fcb7-418e-915f-50e1e10aae1b', $q$imagekit-io$q$, $q$imagekit.io$q$, $q$https://imagekit.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e66294ea-fcb7-418e-915f-50e1e10aae1b', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e66294ea-fcb7-418e-915f-50e1e10aae1b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b18aa15b-a5b5-4f42-8782-b1a4f5e5dd6b', $q$imgix$q$, $q$imgix$q$, $q$https://www.imgix.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b18aa15b-a5b5-4f42-8782-b1a4f5e5dd6b', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b18aa15b-a5b5-4f42-8782-b1a4f5e5dd6b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('88e62bca-4663-4a52-acc5-e36e25972a08', $q$incidenthub-cloud$q$, $q$incidenthub.cloud$q$, $q$https://incidenthub.cloud/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '88e62bca-4663-4a52-acc5-e36e25972a08', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88e62bca-4663-4a52-acc5-e36e25972a08')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b79c3a9-514e-4324-afbc-837f10877ce3', $q$indeed$q$, $q$Indeed$q$, $q$https://indeed.jobs$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b79c3a9-514e-4324-afbc-837f10877ce3', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b79c3a9-514e-4324-afbc-837f10877ce3')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('31dad8a5-8ad8-481c-af88-a6985cc8dabd', $q$inkdrop$q$, $q$Inkdrop$q$, $q$https://www.inkdrop.info/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '31dad8a5-8ad8-481c-af88-a6985cc8dabd', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31dad8a5-8ad8-481c-af88-a6985cc8dabd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('330b47cf-e009-4ced-9c1e-98ede6cd8f51', $q$inspectlet-com$q$, $q$inspectlet.com$q$, $q$https://www.inspectlet.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '330b47cf-e009-4ced-9c1e-98ede6cd8f51', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '330b47cf-e009-4ced-9c1e-98ede6cd8f51')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ab0f5201-0654-4259-a2ec-89a27ee01084', $q$inspector-dev$q$, $q$inspector.dev$q$, $q$https://www.inspector.dev$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ab0f5201-0654-4259-a2ec-89a27ee01084', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab0f5201-0654-4259-a2ec-89a27ee01084')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de39e4de-2a3a-4179-80a8-5f4d0b965a4b', $q$intel$q$, $q$Intel$q$, $q$https://intel.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de39e4de-2a3a-4179-80a8-5f4d0b965a4b', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de39e4de-2a3a-4179-80a8-5f4d0b965a4b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4e1a4fa4-5b7e-411b-9ecb-e05035df46e1', $q$intelliswift$q$, $q$Intelliswift$q$, $q$https://intelliswift.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4e1a4fa4-5b7e-411b-9ecb-e05035df46e1', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e1a4fa4-5b7e-411b-9ecb-e05035df46e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('24392f09-a1ea-4fed-862b-0f05b4c1af89', $q$iplocate$q$, $q$IPLocate$q$, $q$https://www.iplocate.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '24392f09-a1ea-4fed-862b-0f05b4c1af89', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24392f09-a1ea-4fed-862b-0f05b4c1af89')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ac0dfb0e-6545-465b-9399-d4a67daee626', $q$ipstack$q$, $q$ipstack$q$, $q$https://ipstack.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ac0dfb0e-6545-465b-9399-d4a67daee626', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac0dfb0e-6545-465b-9399-d4a67daee626')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('47643b7d-110f-42fe-becd-99ff81a6790e', $q$isitdownstatus-com$q$, $q$isitdownstatus.com$q$, $q$https://isitdownstatus.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '47643b7d-110f-42fe-becd-99ff81a6790e', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47643b7d-110f-42fe-becd-99ff81a6790e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a30ef273-9f6c-4648-83ce-e35770510ce2', $q$iubenda$q$, $q$Iubenda$q$, $q$https://www.iubenda.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a30ef273-9f6c-4648-83ce-e35770510ce2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a30ef273-9f6c-4648-83ce-e35770510ce2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fb712175-9e28-4116-a938-827f1248d0fa', $q$jane-technologies$q$, $q$Jane Technologies$q$, $q$https://iheartjane.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fb712175-9e28-4116-a938-827f1248d0fa', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb712175-9e28-4116-a938-827f1248d0fa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4ef39011-da66-4f81-8f96-18114f80a9ad', $q$jasper-wireless$q$, $q$Jasper Wireless$q$, $q$https://jasper.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4ef39011-da66-4f81-8f96-18114f80a9ad', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ef39011-da66-4f81-8f96-18114f80a9ad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fa22235a-bfe1-49d2-ae3f-ae13f8bf8a97', $q$joy$q$, $q$Joy$q$, $q$https://withjoy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fa22235a-bfe1-49d2-ae3f-ae13f8bf8a97', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa22235a-bfe1-49d2-ae3f-ae13f8bf8a97')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3a0dbd1a-8f71-4f81-82b4-4198ffdd3590', $q$joyent$q$, $q$Joyent$q$, $q$https://www.joyent.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3a0dbd1a-8f71-4f81-82b4-4198ffdd3590', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a0dbd1a-8f71-4f81-82b4-4198ffdd3590')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d727c5ea-6bc6-41f1-9a6f-67cd6ffcc33f', $q$json-ip$q$, $q$JSON IP$q$, $q$https://getjsonip.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd727c5ea-6bc6-41f1-9a6f-67cd6ffcc33f', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd727c5ea-6bc6-41f1-9a6f-67cd6ffcc33f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ec01a00e-7a93-4ab0-a0f0-f666eee90a39', $q$judge-group$q$, $q$Judge Group$q$, $q$https://www.judge.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ec01a00e-7a93-4ab0-a0f0-f666eee90a39', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ec01a00e-7a93-4ab0-a0f0-f666eee90a39')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aed11cc9-ad09-4f09-b7e6-3e0ff292dff2', $q$jumpshot$q$, $q$Jumpshot$q$, $q$https://www.jumpshot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aed11cc9-ad09-4f09-b7e6-3e0ff292dff2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aed11cc9-ad09-4f09-b7e6-3e0ff292dff2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d480e072-3dab-4e4b-8015-b8b353896200', $q$kapor-center$q$, $q$Kapor Center$q$, $q$https://www.kaporcenter.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd480e072-3dab-4e4b-8015-b8b353896200', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd480e072-3dab-4e4b-8015-b8b353896200')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b0f3920-3de2-41f1-9904-f465c7cc9e7f', $q$ketch$q$, $q$Ketch$q$, $q$https://www.ketch.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b0f3920-3de2-41f1-9904-f465c7cc9e7f', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b0f3920-3de2-41f1-9904-f465c7cc9e7f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('48bf90a4-dd16-4cfa-b0dc-6687b98f76e6', $q$keywiz$q$, $q$Keywiz$q$, $q$https://mularahul.github.io/keyviz/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '48bf90a4-dd16-4cfa-b0dc-6687b98f76e6', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48bf90a4-dd16-4cfa-b0dc-6687b98f76e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7d0e3372-6acf-4443-9f42-df1f12c70fb8', $q$komorebi$q$, $q$Komorebi$q$, $q$https://lgug2z.github.io/komorebi/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7d0e3372-6acf-4443-9f42-df1f12c70fb8', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d0e3372-6acf-4443-9f42-df1f12c70fb8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e6e647a-5bb3-4276-beff-fac6ec8016cd', $q$kraken-io$q$, $q$kraken.io$q$, $q$https://kraken.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e6e647a-5bb3-4276-beff-fac6ec8016cd', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e6e647a-5bb3-4276-beff-fac6ec8016cd')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('39bb6930-79de-4ce6-88f3-9f6113687cca', $q$lambda-school$q$, $q$Lambda School$q$, $q$https://lambdaschool.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '39bb6930-79de-4ce6-88f3-9f6113687cca', '380d14d9-1148-40b5-a8ac-bf691120a9b0', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39bb6930-79de-4ce6-88f3-9f6113687cca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bbbe5826-3a86-4490-8acd-52bd10c50978', $q$landen-co$q$, $q$landen.co$q$, $q$https://www.landen.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bbbe5826-3a86-4490-8acd-52bd10c50978', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bbbe5826-3a86-4490-8acd-52bd10c50978')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('782b0516-d982-4777-b008-70bb20dbe6c7', $q$lensdump-com$q$, $q$lensdump.com$q$, $q$https://lensdump.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '782b0516-d982-4777-b008-70bb20dbe6c7', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '782b0516-d982-4777-b008-70bb20dbe6c7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7f302dd4-b7ad-40e7-9d7d-75ced6f767f7', $q$libraries-io$q$, $q$libraries.io$q$, $q$https://libraries.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7f302dd4-b7ad-40e7-9d7d-75ced6f767f7', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f302dd4-b7ad-40e7-9d7d-75ced6f767f7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ba5c9a5-eeb2-48b7-8904-0843a9e0c641', $q$libreqr$q$, $q$LibreQR$q$, $q$https://libreqr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ba5c9a5-eeb2-48b7-8904-0843a9e0c641', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ba5c9a5-eeb2-48b7-8904-0843a9e0c641')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1192ad3b-0004-4c8f-9196-b25774e05fdc', $q$licecap$q$, $q$LICEcap$q$, $q$https://www.cockos.com/licecap/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1192ad3b-0004-4c8f-9196-b25774e05fdc', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1192ad3b-0004-4c8f-9196-b25774e05fdc')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('400591f7-0d38-4c33-b19e-6fe04e7a51d8', $q$lightshot$q$, $q$Lightshot$q$, $q$https://app.prntscr.com/en/index.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '400591f7-0d38-4c33-b19e-6fe04e7a51d8', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '400591f7-0d38-4c33-b19e-6fe04e7a51d8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('650afbdf-21cc-46cc-ab97-22be3fa37b38', $q$lightstep$q$, $q$LightStep$q$, $q$https://lightstep.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '650afbdf-21cc-46cc-ab97-22be3fa37b38', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '650afbdf-21cc-46cc-ab97-22be3fa37b38')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0ab1bf19-9b67-44f6-ba07-9b9f2b18ceb7', $q$lime$q$, $q$Lime$q$, $q$https://li.me$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0ab1bf19-9b67-44f6-ba07-9b9f2b18ceb7', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ab1bf19-9b67-44f6-ba07-9b9f2b18ceb7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('045c5d8d-3736-4d95-9744-c56026fa6800', $q$lingohub-com$q$, $q$lingohub.com$q$, $q$https://lingohub.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '045c5d8d-3736-4d95-9744-c56026fa6800', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '045c5d8d-3736-4d95-9744-c56026fa6800')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('10f8c1de-1d73-4930-a533-4bcb8cf4d8c2', $q$listary$q$, $q$Listary$q$, $q$https://www.listary.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '10f8c1de-1d73-4930-a533-4bcb8cf4d8c2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10f8c1de-1d73-4930-a533-4bcb8cf4d8c2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('20e6404e-cbef-4f7f-a733-f27656eca283', $q$loader-io$q$, $q$loader.io$q$, $q$https://loader.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '20e6404e-cbef-4f7f-a733-f27656eca283', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20e6404e-cbef-4f7f-a733-f27656eca283')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76f7394b-fb74-41cd-b87b-85f6d2183d40', $q$lob$q$, $q$Lob$q$, $q$https://lob.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76f7394b-fb74-41cd-b87b-85f6d2183d40', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76f7394b-fb74-41cd-b87b-85f6d2183d40')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4385e79f-0479-4a5a-9241-994c0a55223a', $q$localazy-com$q$, $q$localazy.com$q$, $q$https://localazy.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4385e79f-0479-4a5a-9241-994c0a55223a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4385e79f-0479-4a5a-9241-994c0a55223a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('49044ad0-3629-4e16-a8fc-1e9aa19739e4', $q$localhost-run$q$, $q$localhost.run$q$, $q$https://localhost.run/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '49044ad0-3629-4e16-a8fc-1e9aa19739e4', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '49044ad0-3629-4e16-a8fc-1e9aa19739e4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('11287e22-d3f8-41b1-9093-07cd67c9a77e', $q$localizely-com$q$, $q$localizely.com$q$, $q$https://localizely.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '11287e22-d3f8-41b1-9093-07cd67c9a77e', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11287e22-d3f8-41b1-9093-07cd67c9a77e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f6b62219-4aca-4296-ac51-6cc5808f1399', $q$localtonet$q$, $q$localtonet$q$, $q$https://localtonet.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f6b62219-4aca-4296-ac51-6cc5808f1399', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6b62219-4aca-4296-ac51-6cc5808f1399')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0b2ea677-51ee-45fc-8c2c-bcbfe634fa67', $q$localtunnel$q$, $q$localtunnel$q$, $q$https://theboroer.github.io/localtunnel-www/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0b2ea677-51ee-45fc-8c2c-bcbfe634fa67', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b2ea677-51ee-45fc-8c2c-bcbfe634fa67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1210f91d-fdf8-4ec2-8944-8e47f873aac2', $q$localxpose$q$, $q$LocalXpose$q$, $q$https://localxpose.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1210f91d-fdf8-4ec2-8944-8e47f873aac2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1210f91d-fdf8-4ec2-8944-8e47f873aac2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8e196347-9f47-4f45-b1b3-fa4d4ce27614', $q$log-dog$q$, $q$log.dog$q$, $q$https://log.dog/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8e196347-9f47-4f45-b1b3-fa4d4ce27614', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e196347-9f47-4f45-b1b3-fa4d4ce27614')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('177a5ea3-0633-432e-a2d0-f73de15fea26', $q$logflare-app$q$, $q$logflare.app$q$, $q$https://logflare.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '177a5ea3-0633-432e-a2d0-f73de15fea26', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '177a5ea3-0633-432e-a2d0-f73de15fea26')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d8097ed-353f-42d5-aa67-552a2741f38c', $q$logitech$q$, $q$Logitech$q$, $q$https://logitech.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d8097ed-353f-42d5-aa67-552a2741f38c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d8097ed-353f-42d5-aa67-552a2741f38c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c90b7c74-3f0b-42ab-9ffb-c06225bb0e64', $q$lohika$q$, $q$Lohika$q$, $q$https://lohika.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c90b7c74-3f0b-42ab-9ffb-c06225bb0e64', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c90b7c74-3f0b-42ab-9ffb-c06225bb0e64')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7896ee82-1216-417c-b0ae-08feded4e539', $q$macy-s$q$, $q$Macy's$q$, $q$https://www.macys.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7896ee82-1216-417c-b0ae-08feded4e539', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7896ee82-1216-417c-b0ae-08feded4e539')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6d6f937b-1204-44f1-b9a2-0c1247081e1b', $q$magoosh$q$, $q$Magoosh$q$, $q$https://magoosh.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6d6f937b-1204-44f1-b9a2-0c1247081e1b', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d6f937b-1204-44f1-b9a2-0c1247081e1b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('54ea9d0d-996f-471c-8bc7-85fc3fbe16e0', $q$mamp$q$, $q$Mamp$q$, $q$https://www.mamp.info/en/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '54ea9d0d-996f-471c-8bc7-85fc3fbe16e0', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54ea9d0d-996f-471c-8bc7-85fc3fbe16e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('65df064f-c033-48de-963a-975e3a0de2d5', $q$mapbox-com$q$, $q$mapbox.com$q$, $q$https://www.mapbox.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '65df064f-c033-48de-963a-975e3a0de2d5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65df064f-c033-48de-963a-975e3a0de2d5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3391e417-1602-4700-9fb5-25539c0bdc10', $q$maps-stamen-com$q$, $q$maps.stamen.com$q$, $q$http://maps.stamen.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3391e417-1602-4700-9fb5-25539c0bdc10', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3391e417-1602-4700-9fb5-25539c0bdc10')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c529d0a-2b13-466c-9b02-389217e946db', $q$maptiler-com$q$, $q$maptiler.com$q$, $q$https://www.maptiler.com/cloud/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c529d0a-2b13-466c-9b02-389217e946db', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c529d0a-2b13-466c-9b02-389217e946db')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4d8a3758-7694-4248-beb1-71381ebe01eb', $q$marionetteops-com$q$, $q$MarionetteOps.com$q$, $q$https://www.marionetteops.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4d8a3758-7694-4248-beb1-71381ebe01eb', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d8a3758-7694-4248-beb1-71381ebe01eb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8d44df95-076f-4b04-8588-d09a802ea0ed', $q$marklogic$q$, $q$MarkLogic$q$, $q$https://marklogic.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8d44df95-076f-4b04-8588-d09a802ea0ed', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d44df95-076f-4b04-8588-d09a802ea0ed')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8a0139ef-143e-477f-9ff7-81df389106ad', $q$marqeta$q$, $q$Marqeta$q$, $q$https://marqeta.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8a0139ef-143e-477f-9ff7-81df389106ad', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a0139ef-143e-477f-9ff7-81df389106ad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('001d95b5-ec13-44c2-a248-77ee4847b3b5', $q$masterclass$q$, $q$MasterClass$q$, $q$https://www.masterclass.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '001d95b5-ec13-44c2-a248-77ee4847b3b5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '001d95b5-ec13-44c2-a248-77ee4847b3b5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed42cf02-1249-4444-ad26-4e2e6d110ede', $q$matchpoint-solutions$q$, $q$Matchpoint Solutions$q$, $q$https://matchps.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed42cf02-1249-4444-ad26-4e2e6d110ede', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed42cf02-1249-4444-ad26-4e2e6d110ede')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a11b20bf-4080-4f8f-86bb-35b7ae8f0897', $q$medallia$q$, $q$Medallia$q$, $q$https://medallia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a11b20bf-4080-4f8f-86bb-35b7ae8f0897', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a11b20bf-4080-4f8f-86bb-35b7ae8f0897')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7d5a9c2-8090-4804-9158-6673b15ad608', $q$medium$q$, $q$Medium$q$, $q$https://medium.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7d5a9c2-8090-4804-9158-6673b15ad608', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7d5a9c2-8090-4804-9158-6673b15ad608')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6c54c203-c6bd-4a93-b9d7-8c7596d34e37', $q$mega$q$, $q$Mega$q$, $q$https://mega.nz/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6c54c203-c6bd-4a93-b9d7-8c7596d34e37', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c54c203-c6bd-4a93-b9d7-8c7596d34e37')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('34142778-ce27-4fc1-a6f2-f4759311ed30', $q$mesosphere$q$, $q$Mesosphere$q$, $q$https://mesosphere.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '34142778-ce27-4fc1-a6f2-f4759311ed30', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34142778-ce27-4fc1-a6f2-f4759311ed30')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c6eeab9c-1912-4c68-baec-92fe8b36128d', $q$middleware-io$q$, $q$Middleware.io$q$, $q$https://middleware.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c6eeab9c-1912-4c68-baec-92fe8b36128d', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6eeab9c-1912-4c68-baec-92fe8b36128d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9b3fae41-1703-49a8-976c-df88b84c194a', $q$miradore$q$, $q$Miradore$q$, $q$https://miradore.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9b3fae41-1703-49a8-976c-df88b84c194a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b3fae41-1703-49a8-976c-df88b84c194a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2eefd11f-2786-4279-a1ff-6e6b8a43d86d', $q$mockaroo$q$, $q$mockaroo$q$, $q$https://mockaroo.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2eefd11f-2786-4279-a1ff-6e6b8a43d86d', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2eefd11f-2786-4279-a1ff-6e6b8a43d86d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2a03f18b-002e-4912-8543-a5d6d3af4697', $q$modern-health$q$, $q$Modern Health$q$, $q$https://joinmodernhealth.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2a03f18b-002e-4912-8543-a5d6d3af4697', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a03f18b-002e-4912-8543-a5d6d3af4697')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d05fa3d-d9db-4318-8c30-1e1ab8659c23', $q$monitormonk$q$, $q$MonitorMonk$q$, $q$https://monitormonk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d05fa3d-d9db-4318-8c30-1e1ab8659c23', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d05fa3d-d9db-4318-8c30-1e1ab8659c23')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f444f017-5023-4194-8015-ffa1be730479', $q$mp3tag$q$, $q$Mp3tag$q$, $q$https://www.mp3tag.de/en/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f444f017-5023-4194-8015-ffa1be730479', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f444f017-5023-4194-8015-ffa1be730479')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5ef88de9-491c-4178-bbfd-2407a8343f21', $q$nats-io$q$, $q$NATS.io$q$, $q$https://nats.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5ef88de9-491c-4178-bbfd-2407a8343f21', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ef88de9-491c-4178-bbfd-2407a8343f21')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cae20a8e-278c-4a33-a3b0-225d031962be', $q$neocities$q$, $q$Neocities$q$, $q$https://neocities.org$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cae20a8e-278c-4a33-a3b0-225d031962be', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cae20a8e-278c-4a33-a3b0-225d031962be')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('82f73737-f24e-4791-ad2a-051f1a2a6581', $q$netapp$q$, $q$NetApp$q$, $q$https://netapp.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '82f73737-f24e-4791-ad2a-051f1a2a6581', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82f73737-f24e-4791-ad2a-051f1a2a6581')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('abe93e17-3a77-4279-bbff-bd5943e73402', $q$netflix$q$, $q$Netflix$q$, $q$https://netflix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'abe93e17-3a77-4279-bbff-bd5943e73402', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abe93e17-3a77-4279-bbff-bd5943e73402')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('22aa6cd1-7c01-43f5-ab30-c82299a787ae', $q$netsuite$q$, $q$NetSuite$q$, $q$https://www.netsuite.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '22aa6cd1-7c01-43f5-ab30-c82299a787ae', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22aa6cd1-7c01-43f5-ab30-c82299a787ae')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c7f8fb0b-008a-4783-87bf-bc9de7c1769a', $q$newfront-insurance$q$, $q$Newfront Insurance$q$, $q$https://www.newfrontinsurance.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c7f8fb0b-008a-4783-87bf-bc9de7c1769a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7f8fb0b-008a-4783-87bf-bc9de7c1769a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e5669d78-9447-4a0a-8330-b535d6814691', $q$nextgen-technologies$q$, $q$Nextgen Technologies$q$, $q$https://www.nextgentechinc.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e5669d78-9447-4a0a-8330-b535d6814691', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5669d78-9447-4a0a-8330-b535d6814691')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe1f7cc5-7acc-4f0d-9fc5-66ae375d1c01', $q$nextravel$q$, $q$NexTravel$q$, $q$https://www.nextravel.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe1f7cc5-7acc-4f0d-9fc5-66ae375d1c01', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe1f7cc5-7acc-4f0d-9fc5-66ae375d1c01')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3f061782-fdbf-4d73-8e6d-024359acebb2', $q$ngrok-com$q$, $q$ngrok.com$q$, $q$https://ngrok.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3f061782-fdbf-4d73-8e6d-024359acebb2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f061782-fdbf-4d73-8e6d-024359acebb2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('27d8b818-d6a3-4e88-8e32-8b174e00aff1', $q$ninite$q$, $q$Ninite$q$, $q$https://ninite.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '27d8b818-d6a3-4e88-8e32-8b174e00aff1', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27d8b818-d6a3-4e88-8e32-8b174e00aff1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('29bbfcbe-2a79-463b-b0bf-ffb47cdb8e91', $q$ninjarmm$q$, $q$NinjaRMM$q$, $q$https://ninjarmm.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '29bbfcbe-2a79-463b-b0bf-ffb47cdb8e91', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '29bbfcbe-2a79-463b-b0bf-ffb47cdb8e91')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d813318a-7c8f-456c-855e-050148e17634', $q$nirsoft$q$, $q$Nirsoft$q$, $q$https://www.nirsoft.net/utils/index.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd813318a-7c8f-456c-855e-050148e17634', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd813318a-7c8f-456c-855e-050148e17634')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d574c3af-ad89-4fc3-a2f9-871c64fe0b5e', $q$nitropack-io$q$, $q$nitropack.io$q$, $q$https://nitropack.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd574c3af-ad89-4fc3-a2f9-871c64fe0b5e', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd574c3af-ad89-4fc3-a2f9-871c64fe0b5e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('de04bc80-8ff5-41f4-9de1-b1ef2bb4939c', $q$nitropdf$q$, $q$NitroPDF$q$, $q$https://www.gonitro.com/pdf-reader$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'de04bc80-8ff5-41f4-9de1-b1ef2bb4939c', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de04bc80-8ff5-41f4-9de1-b1ef2bb4939c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a04d0876-5dfa-493f-9a71-1fb688f5a8e1', $q$noip$q$, $q$noip$q$, $q$https://www.noip.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a04d0876-5dfa-493f-9a71-1fb688f5a8e1', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a04d0876-5dfa-493f-9a71-1fb688f5a8e1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1c0a1eeb-af85-47f4-81ad-f2d3722b2adb', $q$nora$q$, $q$Nora$q$, $q$https://noramusic.netlify.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1c0a1eeb-af85-47f4-81ad-f2d3722b2adb', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c0a1eeb-af85-47f4-81ad-f2d3722b2adb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b57e67a2-2d4e-4b8e-a24f-d940ffa320aa', $q$npoint-io$q$, $q$npoint.io$q$, $q$https://www.npoint.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b57e67a2-2d4e-4b8e-a24f-d940ffa320aa', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b57e67a2-2d4e-4b8e-a24f-d940ffa320aa')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a61cad7f-b497-4dfe-8ab3-197f60ca3f57', $q$nutanix$q$, $q$Nutanix$q$, $q$https://nutanix.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a61cad7f-b497-4dfe-8ab3-197f60ca3f57', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a61cad7f-b497-4dfe-8ab3-197f60ca3f57')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('468ab4ac-c45a-45ff-a112-c0de7cf42397', $q$nvidia$q$, $q$NVIDIA$q$, $q$https://nvidia.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '468ab4ac-c45a-45ff-a112-c0de7cf42397', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '468ab4ac-c45a-45ff-a112-c0de7cf42397')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b39f588-8dac-4762-bb02-e4fa31089ff5', $q$ockam$q$, $q$Ockam$q$, $q$https://ockam.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b39f588-8dac-4762-bb02-e4fa31089ff5', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b39f588-8dac-4762-bb02-e4fa31089ff5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('569f324d-7d35-43ad-9ca0-9c27f833397e', $q$one-commander$q$, $q$One Commander$q$, $q$https://onecommander.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '569f324d-7d35-43ad-9ca0-9c27f833397e', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '569f324d-7d35-43ad-9ca0-9c27f833397e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e7431679-4c5c-481c-9d6e-5dc882599125', $q$onelogin$q$, $q$OneLogin$q$, $q$https://www.onelogin.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e7431679-4c5c-481c-9d6e-5dc882599125', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7431679-4c5c-481c-9d6e-5dc882599125')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f15523f2-f332-4aee-a29d-022539acd900', $q$ontarionet-ca-cn-test$q$, $q$OntarioNet.ca CN Test$q$, $q$https://cntest.ontarionet.ca$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f15523f2-f332-4aee-a29d-022539acd900', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f15523f2-f332-4aee-a29d-022539acd900')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28db617f-231d-4fab-988e-ab1670524841', $q$osisoft$q$, $q$OSIsoft$q$, $q$https://osisoft.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28db617f-231d-4fab-988e-ab1670524841', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28db617f-231d-4fab-988e-ab1670524841')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e0bde2b8-301a-4bcb-83b7-ef051eeb98ba', $q$osmnames$q$, $q$osmnames$q$, $q$https://osmnames.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e0bde2b8-301a-4bcb-83b7-ef051eeb98ba', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0bde2b8-301a-4bcb-83b7-ef051eeb98ba')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5b27a9ac-e34a-485a-83d5-3ec3655f772a', $q$otixo-com$q$, $q$otixo.com$q$, $q$https://www.otixo.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5b27a9ac-e34a-485a-83d5-3ec3655f772a', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b27a9ac-e34a-485a-83d5-3ec3655f772a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('367d93c3-9024-4edc-9f7a-b33694446d51', $q$oura$q$, $q$Oura$q$, $q$https://ouraring.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '367d93c3-9024-4edc-9f7a-b33694446d51', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '367d93c3-9024-4edc-9f7a-b33694446d51')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('358d246e-8d47-4277-9dd3-07b6ae875996', $q$outlier-ai$q$, $q$Outlier AI$q$, $q$https://outlier.ai$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '358d246e-8d47-4277-9dd3-07b6ae875996', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '358d246e-8d47-4277-9dd3-07b6ae875996')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6f714fa5-136f-483a-a9ae-32c06db775a4', $q$outsystems-com$q$, $q$outsystems.com$q$, $q$https://www.outsystems.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6f714fa5-136f-483a-a9ae-32c06db775a4', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f714fa5-136f-483a-a9ae-32c06db775a4')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c0ddf490-b5e9-4cba-9df4-7ddab0740be1', $q$ovh-ie$q$, $q$ovh.ie$q$, $q$https://www.ovh.ie/ssl-gateway/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c0ddf490-b5e9-4cba-9df4-7ddab0740be1', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0ddf490-b5e9-4cba-9df4-7ddab0740be1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f1686afe-048d-4d13-84b3-f7aedc909d5d', $q$ownkube$q$, $q$Ownkube$q$, $q$https://ownkube.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f1686afe-048d-4d13-84b3-f7aedc909d5d', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1686afe-048d-4d13-84b3-f7aedc909d5d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3bc192c2-8a7c-495d-8d22-bbee8af461a0', $q$pagertree-com$q$, $q$pagertree.com$q$, $q$https://pagertree.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3bc192c2-8a7c-495d-8d22-bbee8af461a0', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bc192c2-8a7c-495d-8d22-bbee8af461a0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3cb9d1ed-58fc-43bb-9c78-eede41255749', $q$paint-net$q$, $q$Paint.NET$q$, $q$https://www.getpaint.net/index.html$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3cb9d1ed-58fc-43bb-9c78-eede41255749', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cb9d1ed-58fc-43bb-9c78-eede41255749')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('edc0a915-513f-4ecf-a9a2-f6b72a6318a0', $q$paiza$q$, $q$Paiza$q$, $q$https://paiza.cloud/en/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'edc0a915-513f-4ecf-a9a2-f6b72a6318a0', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edc0a915-513f-4ecf-a9a2-f6b72a6318a0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7525fe34-7d1a-4e61-816b-ad21b1b0d74f', $q$panoply$q$, $q$Panoply$q$, $q$https://panoply.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7525fe34-7d1a-4e61-816b-ad21b1b0d74f', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7525fe34-7d1a-4e61-816b-ad21b1b0d74f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('032f2d56-0dcd-4c46-9791-d3160d13ec72', $q$parsable$q$, $q$Parsable$q$, $q$https://www.parsable.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '032f2d56-0dcd-4c46-9791-d3160d13ec72', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '032f2d56-0dcd-4c46-9791-d3160d13ec72')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fbcf3698-4281-42dc-847c-418e1115a847', $q$parsec$q$, $q$Parsec$q$, $q$https://parsec.app/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fbcf3698-4281-42dc-847c-418e1115a847', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbcf3698-4281-42dc-847c-418e1115a847')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a789e1e6-db14-4e14-8c28-61dfc090477a', $q$perforce$q$, $q$Perforce$q$, $q$https://perforce.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a789e1e6-db14-4e14-8c28-61dfc090477a', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a789e1e6-db14-4e14-8c28-61dfc090477a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('138d0be8-408e-4f39-8921-36e0754ac156', $q$performance-horizon$q$, $q$Performance Horizon$q$, $q$https://performancehorizon.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '138d0be8-408e-4f39-8921-36e0754ac156', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '138d0be8-408e-4f39-8921-36e0754ac156')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('423f7e1e-8c68-4a16-a8ac-318e725a0589', $q$phare-io$q$, $q$phare.io$q$, $q$https://phare.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '423f7e1e-8c68-4a16-a8ac-318e725a0589', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '423f7e1e-8c68-4a16-a8ac-318e725a0589')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e74eacf6-db29-4e62-b0bd-49ca33dfc5f8', $q$pingmeter-com$q$, $q$Pingmeter.com$q$, $q$https://pingmeter.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e74eacf6-db29-4e62-b0bd-49ca33dfc5f8', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e74eacf6-db29-4e62-b0bd-49ca33dfc5f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0de8b284-1474-480a-bc63-70a10a24e99e', $q$pixela$q$, $q$Pixela$q$, $q$https://pixe.la/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0de8b284-1474-480a-bc63-70a10a24e99e', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0de8b284-1474-480a-bc63-70a10a24e99e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b6378256-073c-41a0-b9ae-7309177ac695', $q$plot-ly$q$, $q$plot.ly$q$, $q$https://plot.ly/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b6378256-073c-41a0-b9ae-7309177ac695', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6378256-073c-41a0-b9ae-7309177ac695')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('765aee9e-524b-4d21-a9f2-f2f1570ed08b', $q$pngquant$q$, $q$pngquant$q$, $q$https://pngquant.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '765aee9e-524b-4d21-a9f2-f2f1570ed08b', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '765aee9e-524b-4d21-a9f2-f2f1570ed08b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4bcab876-2906-4df5-a9a8-85fb1d89cbb2', $q$podio-com$q$, $q$podio.com$q$, $q$https://podio.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4bcab876-2906-4df5-a9a8-85fb1d89cbb2', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bcab876-2906-4df5-a9a8-85fb1d89cbb2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f69dc960-e2a8-4fb4-8aaa-9ee46234e742', $q$preset-cloud$q$, $q$Preset Cloud$q$, $q$https://preset.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f69dc960-e2a8-4fb4-8aaa-9ee46234e742', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f69dc960-e2a8-4fb4-8aaa-9ee46234e742')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('793d2265-e7bd-4b69-97ea-434fa7b1cdea', $q$prisma-postgres$q$, $q$Prisma Postgres$q$, $q$https://prisma.io/postgres$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '793d2265-e7bd-4b69-97ea-434fa7b1cdea', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '793d2265-e7bd-4b69-97ea-434fa7b1cdea')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('604c2f5d-82b0-40ac-ab10-198154f9bead', $q$process-hacker$q$, $q$Process Hacker$q$, $q$https://processhacker.sourceforge.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '604c2f5d-82b0-40ac-ab10-198154f9bead', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '604c2f5d-82b0-40ac-ab10-198154f9bead')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('591a7164-a945-464f-bbd5-877419802e5d', $q$promoproxy$q$, $q$PromoProxy$q$, $q$https://promoproxy.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '591a7164-a945-464f-bbd5-877419802e5d', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '591a7164-a945-464f-bbd5-877419802e5d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f948abef-a45a-48ea-a8a1-f10e7cf64ed6', $q$pulumi$q$, $q$Pulumi$q$, $q$https://www.pulumi.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f948abef-a45a-48ea-a8a1-f10e7cf64ed6', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f948abef-a45a-48ea-a8a1-f10e7cf64ed6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('f7e870fd-7167-4584-8e3f-86c24ba36ca7', $q$quant-ux$q$, $q$Quant Ux$q$, $q$https://quant-ux.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'f7e870fd-7167-4584-8e3f-86c24ba36ca7', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7e870fd-7167-4584-8e3f-86c24ba36ca7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('747c7346-5f11-4502-a6bf-71743d86eb4f', $q$quickchart$q$, $q$QuickChart$q$, $q$https://quickchart.io$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '747c7346-5f11-4502-a6bf-71743d86eb4f', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '747c7346-5f11-4502-a6bf-71743d86eb4f')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('561e1312-cd0d-4f47-8230-f28421a2ffd5', $q$radmin-vpn$q$, $q$Radmin VPN$q$, $q$https://www.radmin-vpn.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '561e1312-cd0d-4f47-8230-f28421a2ffd5', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '561e1312-cd0d-4f47-8230-f28421a2ffd5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7aa0a594-b907-4664-9413-048ea3745ad8', $q$raw-githack-com$q$, $q$raw.githack.com$q$, $q$https://raw.githack.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7aa0a594-b907-4664-9413-048ea3745ad8', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7aa0a594-b907-4664-9413-048ea3745ad8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('fe89c483-8731-485d-8047-fa4068bc5196', $q$raycast$q$, $q$Raycast$q$, $q$https://www.raycast.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'fe89c483-8731-485d-8047-fa4068bc5196', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe89c483-8731-485d-8047-fa4068bc5196')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3e2aadb6-d285-4d2a-9116-8e3f49a8fe17', $q$readthedocs-org$q$, $q$readthedocs.org$q$, $q$https://readthedocs.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3e2aadb6-d285-4d2a-9116-8e3f49a8fe17', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e2aadb6-d285-4d2a-9116-8e3f49a8fe17')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('01b43452-2b3d-4983-b3ba-2245fe8a857d', $q$redbooth-com$q$, $q$redbooth.com$q$, $q$https://redbooth.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '01b43452-2b3d-4983-b3ba-2245fe8a857d', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01b43452-2b3d-4983-b3ba-2245fe8a857d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bb5043a1-f2a5-41e6-bfcb-5ac1ad3699e6', $q$redirhub$q$, $q$RedirHub$q$, $q$https://www.redirhub.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bb5043a1-f2a5-41e6-bfcb-5ac1ad3699e6', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb5043a1-f2a5-41e6-bfcb-5ac1ad3699e6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1e2fa1b1-9516-49ca-839f-6a11eeafb55d', $q$reviewable-io$q$, $q$reviewable.io$q$, $q$https://reviewable.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1e2fa1b1-9516-49ca-839f-6a11eeafb55d', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e2fa1b1-9516-49ca-839f-6a11eeafb55d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1bbd15c1-6ee0-45ba-8a96-24095c4b1449', $q$rigetti-computing$q$, $q$Rigetti Computing$q$, $q$https://www.rigetti.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1bbd15c1-6ee0-45ba-8a96-24095c4b1449', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1bbd15c1-6ee0-45ba-8a96-24095c4b1449')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7c650a9c-79b3-4500-add3-8726bdffa54e', $q$rockbot$q$, $q$Rockbot$q$, $q$https://rockbot.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7c650a9c-79b3-4500-add3-8726bdffa54e', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c650a9c-79b3-4500-add3-8726bdffa54e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e946ee9b-8b7a-4c15-b099-fb69d747ef70', $q$rocketgit$q$, $q$RocketGit$q$, $q$https://rocketgit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e946ee9b-8b7a-4c15-b099-fb69d747ef70', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e946ee9b-8b7a-4c15-b099-fb69d747ef70')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ed9d2ca1-e382-4ca8-a0e1-0e0cfd7cad9e', $q$runframe$q$, $q$Runframe$q$, $q$https://runframe.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ed9d2ca1-e382-4ca8-a0e1-0e0cfd7cad9e', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed9d2ca1-e382-4ca8-a0e1-0e0cfd7cad9e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e44b3145-4fc6-4862-9ce9-82fbc070ef36', $q$rustdesk$q$, $q$RustDesk$q$, $q$https://rustdesk.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e44b3145-4fc6-4862-9ce9-82fbc070ef36', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e44b3145-4fc6-4862-9ce9-82fbc070ef36')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b4cd7ddc-d7a7-4010-a5b1-76fb0eb1ed79', $q$samsara$q$, $q$Samsara$q$, $q$https://www.samsara.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b4cd7ddc-d7a7-4010-a5b1-76fb0eb1ed79', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4cd7ddc-d7a7-4010-a5b1-76fb0eb1ed79')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cfe17654-41ac-4dfa-8b69-eac99681d838', $q$savvymoney$q$, $q$SavvyMoney$q$, $q$https://savvymoney.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cfe17654-41ac-4dfa-8b69-eac99681d838', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfe17654-41ac-4dfa-8b69-eac99681d838')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1ca54e37-5cb2-40cb-9996-fd8f07e81418', $q$scalyr$q$, $q$Scalyr$q$, $q$https://scalyr.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1ca54e37-5cb2-40cb-9996-fd8f07e81418', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ca54e37-5cb2-40cb-9996-fd8f07e81418')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('04bb646f-e076-4b68-80f1-4b42834cce94', $q$scan-coverity-com$q$, $q$scan.coverity.com$q$, $q$https://scan.coverity.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '04bb646f-e076-4b68-80f1-4b42834cce94', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04bb646f-e076-4b68-80f1-4b42834cce94')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d6639407-50ec-4d57-b17d-8fc13401f00e', $q$screencloud$q$, $q$ScreenCloud$q$, $q$https://screencloud.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd6639407-50ec-4d57-b17d-8fc13401f00e', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6639407-50ec-4d57-b17d-8fc13401f00e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('cd0e3c5a-2288-4c68-ac22-6dffe7e8d568', $q$scrutinizer-ci-com$q$, $q$scrutinizer-ci.com$q$, $q$https://scrutinizer-ci.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'cd0e3c5a-2288-4c68-ac22-6dffe7e8d568', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd0e3c5a-2288-4c68-ac22-6dffe7e8d568')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('aea05ae7-4100-477e-9674-4882b55a538b', $q$searchly-com$q$, $q$searchly.com$q$, $q$http://www.searchly.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'aea05ae7-4100-477e-9674-4882b55a538b', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aea05ae7-4100-477e-9674-4882b55a538b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4dd4ad97-7cd4-4eb0-9c61-428a336d0b2a', $q$securly$q$, $q$Securly$q$, $q$https://securly.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4dd4ad97-7cd4-4eb0-9c61-428a336d0b2a', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4dd4ad97-7cd4-4eb0-9c61-428a336d0b2a')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e966b472-92d2-44be-9553-62a64495d279', $q$semanticdiff-com$q$, $q$semanticdiff.com$q$, $q$https://app.semanticdiff.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e966b472-92d2-44be-9553-62a64495d279', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e966b472-92d2-44be-9553-62a64495d279')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7cdb6e3c-55de-4de1-8fb9-3393b91efc04', $q$serveravatar-com$q$, $q$serveravatar.com$q$, $q$https://serveravatar.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7cdb6e3c-55de-4de1-8fb9-3393b91efc04', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cdb6e3c-55de-4de1-8fb9-3393b91efc04')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('25b7f3d8-235b-4964-a32d-bc0e642d8fdb', $q$shadcn-studio$q$, $q$Shadcn Studio$q$, $q$https://shadcnstudio.com/theme-editor$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '25b7f3d8-235b-4964-a32d-bc0e642d8fdb', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25b7f3d8-235b-4964-a32d-bc0e642d8fdb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e4849843-4cfc-42a9-afcd-588d477dc3da', $q$shutter$q$, $q$Shutter$q$, $q$https://shutter-project.org/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e4849843-4cfc-42a9-afcd-588d477dc3da', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4849843-4cfc-42a9-afcd-588d477dc3da')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b5921690-cda6-473e-8465-b294f87ec3f6', $q$signalfx$q$, $q$SignalFx$q$, $q$https://signalfx.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b5921690-cda6-473e-8465-b294f87ec3f6', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5921690-cda6-473e-8465-b294f87ec3f6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('b22de93c-aecf-4611-98e7-d8985578be42', $q$simperium-com$q$, $q$simperium.com$q$, $q$https://simperium.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'b22de93c-aecf-4611-98e7-d8985578be42', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b22de93c-aecf-4611-98e7-d8985578be42')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e2bf7b34-b9f4-4323-a520-573c767ca1e5', $q$simple-habit$q$, $q$Simple Habit$q$, $q$https://simplehabit.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e2bf7b34-b9f4-4323-a520-573c767ca1e5', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2bf7b34-b9f4-4323-a520-573c767ca1e5')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c8109b06-864f-4152-870a-61fee79cf5da', $q$simple-observability$q$, $q$Simple Observability$q$, $q$https://simpleobservability.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c8109b06-864f-4152-870a-61fee79cf5da', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8109b06-864f-4152-870a-61fee79cf5da')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('17d50aa8-5cc7-49a7-8b6d-968b11c1fb00', $q$simplenote$q$, $q$Simplenote$q$, $q$https://simplenote.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '17d50aa8-5cc7-49a7-8b6d-968b11c1fb00', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17d50aa8-5cc7-49a7-8b6d-968b11c1fb00')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('312b26ef-c0ab-4dd3-b093-176840c74c52', $q$sirv-com$q$, $q$sirv.com$q$, $q$https://sirv.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '312b26ef-c0ab-4dd3-b093-176840c74c52', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '312b26ef-c0ab-4dd3-b093-176840c74c52')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c32f3e20-34cf-4218-9ac5-8e56d2856cca', $q$sitesure-net$q$, $q$sitesure.net$q$, $q$https://sitesure.net$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c32f3e20-34cf-4218-9ac5-8e56d2856cca', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c32f3e20-34cf-4218-9ac5-8e56d2856cca')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('12dc5a9e-8824-4869-8f3b-0717550e4b71', $q$skedulo$q$, $q$Skedulo$q$, $q$https://skedulo.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '12dc5a9e-8824-4869-8f3b-0717550e4b71', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '12dc5a9e-8824-4869-8f3b-0717550e4b71')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9d6d8e24-2d40-450d-8feb-8482a1203a82', $q$skyvia-com$q$, $q$skyvia.com$q$, $q$https://skyvia.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9d6d8e24-2d40-450d-8feb-8482a1203a82', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d6d8e24-2d40-450d-8feb-8482a1203a82')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6f5099e3-bd9d-4452-88fc-6204e59aeaab', $q$smartmockups-com$q$, $q$smartmockups.com$q$, $q$https://smartmockups.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6f5099e3-bd9d-4452-88fc-6204e59aeaab', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f5099e3-bd9d-4452-88fc-6204e59aeaab')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3cbc9317-4d64-4f21-b7cc-760993666870', $q$sniffnet$q$, $q$Sniffnet$q$, $q$https://sniffnet.net/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3cbc9317-4d64-4f21-b7cc-760993666870', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cbc9317-4d64-4f21-b7cc-760993666870')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('803b4bbe-cab0-4e7d-bd43-91cc737c8535', $q$snipping-tool$q$, $q$Snipping Tool$q$, $q$https://support.microsoft.com/en-in/help/13776/windows-use-snipping-tool-to-capture-screenshots$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '803b4bbe-cab0-4e7d-bd43-91cc737c8535', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '803b4bbe-cab0-4e7d-bd43-91cc737c8535')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('37a5757a-233c-4d44-b107-5ee12a16080c', $q$splunk$q$, $q$Splunk$q$, $q$https://www.splunk.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '37a5757a-233c-4d44-b107-5ee12a16080c', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37a5757a-233c-4d44-b107-5ee12a16080c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('86cc1f26-e0a8-420d-877c-7ed037ff5057', $q$spotinst$q$, $q$Spotinst$q$, $q$https://spotinst.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '86cc1f26-e0a8-420d-877c-7ed037ff5057', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86cc1f26-e0a8-420d-877c-7ed037ff5057')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6447a010-3f0d-456f-9a01-2818c0885e31', $q$spotx$q$, $q$SpotX$q$, $q$https://spotx.tv$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6447a010-3f0d-456f-9a01-2818c0885e31', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6447a010-3f0d-456f-9a01-2818c0885e31')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1b6a7e0a-1bde-4c68-97df-61b4197ec9e0', $q$sqlable$q$, $q$Sqlable$q$, $q$https://sqlable.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1b6a7e0a-1bde-4c68-97df-61b4197ec9e0', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b6a7e0a-1bde-4c68-97df-61b4197ec9e0')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('410d884b-6903-4133-8f37-c6fe6e599e71', $q$ssr-server-side-rendering-checker$q$, $q$SSR (Server-side Rendering) Checker$q$, $q$https://www.crawlably.com/ssr-checker/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '410d884b-6903-4133-8f37-c6fe6e599e71', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '410d884b-6903-4133-8f37-c6fe6e599e71')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5e6c8ebb-33aa-4cb9-85ee-8ad06c3526f8', $q$statically-io$q$, $q$statically.io$q$, $q$https://statically.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5e6c8ebb-33aa-4cb9-85ee-8ad06c3526f8', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e6c8ebb-33aa-4cb9-85ee-8ad06c3526f8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('642ea73c-2c63-4361-ae01-97f65a08d580', $q$statusgator-com$q$, $q$statusgator.com$q$, $q$https://statusgator.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '642ea73c-2c63-4361-ae01-97f65a08d580', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '642ea73c-2c63-4361-ae01-97f65a08d580')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1d3d3842-0ae9-4daf-a433-4b8f7d9dfe3d', $q$swiftstack$q$, $q$SwiftStack$q$, $q$https://swiftstack.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1d3d3842-0ae9-4daf-a433-4b8f7d9dfe3d', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d3d3842-0ae9-4daf-a433-4b8f7d9dfe3d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7464f45b-a888-4cd0-a0dc-3c46b903b734', $q$syagent-com$q$, $q$syagent.com$q$, $q$https://syagent.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7464f45b-a888-4cd0-a0dc-3c46b903b734', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7464f45b-a888-4cd0-a0dc-3c46b903b734')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('43874be7-a358-4687-a231-64e948e062a1', $q$sync-com$q$, $q$sync.com$q$, $q$https://www.sync.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '43874be7-a358-4687-a231-64e948e062a1', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43874be7-a358-4687-a231-64e948e062a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('ffce9685-1bc6-4b20-a558-6d7b90d1ea26', $q$teracopy$q$, $q$TeraCopy$q$, $q$https://www.codesector.com/teracopy$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'ffce9685-1bc6-4b20-a558-6d7b90d1ea26', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffce9685-1bc6-4b20-a558-6d7b90d1ea26')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9193d00a-6490-4f31-9c6a-98707d16d3b8', $q$terramate$q$, $q$Terramate$q$, $q$https://terramate.io/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9193d00a-6490-4f31-9c6a-98707d16d3b8', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9193d00a-6490-4f31-9c6a-98707d16d3b8')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1a2ebb97-d7f5-4c30-a3ae-852b0123e8cf', $q$testspace-com$q$, $q$Testspace.com$q$, $q$https://testspace.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1a2ebb97-d7f5-4c30-a3ae-852b0123e8cf', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a2ebb97-d7f5-4c30-a3ae-852b0123e8cf')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('e71353fc-0f6c-44ed-887a-9c617cf3f6a1', $q$themeselection$q$, $q$Themeselection$q$, $q$https://themeselection.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'e71353fc-0f6c-44ed-887a-9c617cf3f6a1', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e71353fc-0f6c-44ed-887a-9c617cf3f6a1')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('0caedda2-828b-4f3b-b4ae-cd0941d4fe38', $q$thoughtworks$q$, $q$Thoughtworks$q$, $q$https://www.thoughtworks.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '0caedda2-828b-4f3b-b4ae-cd0941d4fe38', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0caedda2-828b-4f3b-b4ae-cd0941d4fe38')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3b87c272-8dd8-4419-85c0-9175c96f8ef2', $q$tickgit-com$q$, $q$tickgit.com$q$, $q$https://www.tickgit.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3b87c272-8dd8-4419-85c0-9175c96f8ef2', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b87c272-8dd8-4419-85c0-9175c96f8ef2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('13eff50a-75a8-4bfe-ab0b-9be1b06e3345', $q$tinybird$q$, $q$Tinybird$q$, $q$https://tinybird.co$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '13eff50a-75a8-4bfe-ab0b-9be1b06e3345', '4981e16a-135c-4ec0-ac1e-828b28e20aa2', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13eff50a-75a8-4bfe-ab0b-9be1b06e3345')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6fa1c525-8632-40fb-b1e8-e9a481d1f486', $q$tomorrow-io-weather-api$q$, $q$Tomorrow.io Weather API$q$, $q$https://www.tomorrow.io/weather-api/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6fa1c525-8632-40fb-b1e8-e9a481d1f486', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fa1c525-8632-40fb-b1e8-e9a481d1f486')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('bb37319d-bb56-4fe3-b692-9ef8e4f68a61', $q$treblle$q$, $q$Treblle$q$, $q$https://www.treblle.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'bb37319d-bb56-4fe3-b692-9ef8e4f68a61', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb37319d-bb56-4fe3-b692-9ef8e4f68a61')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('76af3c0a-f1ba-4f22-8a66-7148625c345b', $q$ttl-sh$q$, $q$ttl.sh$q$, $q$https://ttl.sh/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '76af3c0a-f1ba-4f22-8a66-7148625c345b', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76af3c0a-f1ba-4f22-8a66-7148625c345b')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('3268424d-00e9-4233-b68d-7a421e8b4782', $q$tunein$q$, $q$TuneIn$q$, $q$https://tunein.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '3268424d-00e9-4233-b68d-7a421e8b4782', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3268424d-00e9-4233-b68d-7a421e8b4782')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('28d94363-2f15-468a-a63f-eb487606f861', $q$twitch$q$, $q$Twitch$q$, $q$https://www.twitch.tv$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '28d94363-2f15-468a-a63f-eb487606f861', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28d94363-2f15-468a-a63f-eb487606f861')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('dfc77588-e534-4acc-a245-ad6c30c1c8b7', $q$uptimetoolbox-com$q$, $q$uptimetoolbox.com$q$, $q$https://uptimetoolbox.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'dfc77588-e534-4acc-a245-ad6c30c1c8b7', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dfc77588-e534-4acc-a245-ad6c30c1c8b7')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('1377f1a7-94da-484c-8c0a-e24fecb88745', $q$usewebhook-com$q$, $q$UseWebhook.com$q$, $q$https://usewebhook.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '1377f1a7-94da-484c-8c0a-e24fecb88745', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1377f1a7-94da-484c-8c0a-e24fecb88745')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('a05764ee-6fda-43e1-9c19-e22df70d8bd2', $q$veeva$q$, $q$Veeva$q$, $q$https://veeva.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'a05764ee-6fda-43e1-9c19-e22df70d8bd2', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a05764ee-6fda-43e1-9c19-e22df70d8bd2')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('d171f421-40d4-437a-924c-854351cf99ce', $q$velocmd$q$, $q$Velocmd$q$, $q$https://yashvardhang.github.io/Velocmd/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'd171f421-40d4-437a-924c-854351cf99ce', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd171f421-40d4-437a-924c-854351cf99ce')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('5856d9b7-af12-483f-8b52-c09e74c8275e', $q$wachete$q$, $q$Wachete$q$, $q$https://www.wachete.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '5856d9b7-af12-483f-8b52-c09e74c8275e', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5856d9b7-af12-483f-8b52-c09e74c8275e')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('9eb731c4-1797-4851-86e4-4f0d28227e63', $q$websitepulse-com$q$, $q$websitepulse.com$q$, $q$https://www.websitepulse.com/tools/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '9eb731c4-1797-4851-86e4-4f0d28227e63', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9eb731c4-1797-4851-86e4-4f0d28227e63')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('61649c54-e641-400b-9788-527f5e2d1899', $q$weserv$q$, $q$weserv$q$, $q$https://images.weserv.nl/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '61649c54-e641-400b-9788-527f5e2d1899', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61649c54-e641-400b-9788-527f5e2d1899')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7e3a72ef-a1d3-4095-8e66-c987efb3a588', $q$wizeline$q$, $q$Wizeline$q$, $q$https://www.wizeline.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7e3a72ef-a1d3-4095-8e66-c987efb3a588', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e3a72ef-a1d3-4095-8e66-c987efb3a588')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('8b40860d-046b-4122-ae90-e09ab1f4aa83', $q$wpjack$q$, $q$WPJack$q$, $q$https://wpjack.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '8b40860d-046b-4122-ae90-e09ab1f4aa83', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b40860d-046b-4122-ae90-e09ab1f4aa83')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('84f319e1-3c4f-4a8d-aee8-b49499eadfad', $q$wrappixel$q$, $q$WrapPixel$q$, $q$https://www.wrappixel.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '84f319e1-3c4f-4a8d-aee8-b49499eadfad', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84f319e1-3c4f-4a8d-aee8-b49499eadfad')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7080e9b0-03fb-4a7a-b2fe-90350d84b567', $q$xitoring-com$q$, $q$Xitoring.com$q$, $q$https://xitoring.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7080e9b0-03fb-4a7a-b2fe-90350d84b567', '9ac7d2fb-f677-45cb-8167-0d6208effa6f', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7080e9b0-03fb-4a7a-b2fe-90350d84b567')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('da421967-b1e4-4d48-8a90-66fe9381db48', $q$xmatters$q$, $q$xMatters$q$, $q$https://xmatters.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'da421967-b1e4-4d48-8a90-66fe9381db48', 'd1ecc8b2-3e2c-4c57-9f3b-f076c9557bab', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da421967-b1e4-4d48-8a90-66fe9381db48')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('7389f38c-e748-4e49-8bf7-b20dec169901', $q$zoomit$q$, $q$ZoomIt$q$, $q$https://technet.microsoft.com/en-us/sysinternals/zoomit.aspx$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '7389f38c-e748-4e49-8bf7-b20dec169901', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7389f38c-e748-4e49-8bf7-b20dec169901')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2d5f7b7b-a341-4c33-bad4-32961bfb5cdb', $q$zumper$q$, $q$Zumper$q$, $q$https://zumper.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2d5f7b7b-a341-4c33-bad4-32961bfb5cdb', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d5f7b7b-a341-4c33-bad4-32961bfb5cdb')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('45e7fa0b-672f-4380-8758-7af1a167c03d', $q$developers-google-com$q$, $q$developers.google.com$q$, $q$https://developers.google.com/speed/libraries/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '45e7fa0b-672f-4380-8758-7af1a167c03d', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45e7fa0b-672f-4380-8758-7af1a167c03d')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('77733d0f-adf5-4833-80ef-cc0bcd6a3fc6', $q$google-colab$q$, $q$Google Colab$q$, $q$https://colab.research.google.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '77733d0f-adf5-4833-80ef-cc0bcd6a3fc6', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '77733d0f-adf5-4833-80ef-cc0bcd6a3fc6')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('761e7f21-1d23-4640-8504-5dbc0bf24928', $q$google-fonts$q$, $q$Google Fonts$q$, $q$https://fonts.google.com/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '761e7f21-1d23-4640-8504-5dbc0bf24928', 'bf6cfc5f-9750-46ad-a541-abfa71710e30', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '761e7f21-1d23-4640-8504-5dbc0bf24928')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('6ec7aaf8-ff07-4d82-96b8-dd8b826a856c', $q$google-gemini-api$q$, $q$Google Gemini API$q$, $q$https://ai.google.dev/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '6ec7aaf8-ff07-4d82-96b8-dd8b826a856c', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ec7aaf8-ff07-4d82-96b8-dd8b826a856c')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('2ac9954b-c313-4db0-a920-6fd720ccad67', $q$google-meet$q$, $q$Google Meet$q$, $q$https://meet.google.com$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '2ac9954b-c313-4db0-a920-6fd720ccad67', '8279b043-9f40-4eff-a2f2-416df6ece1b5', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ac9954b-c313-4db0-a920-6fd720ccad67')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('c15342aa-c5ef-4e11-8054-c7010e732d20', $q$ibm-cloud$q$, $q$IBM Cloud$q$, $q$https://www.ibm.com/cloud/free/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT 'c15342aa-c5ef-4e11-8054-c7010e732d20', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c15342aa-c5ef-4e11-8054-c7010e732d20')
ON CONFLICT DO NOTHING;

INSERT INTO tools (id, slug, name, website, status, source, noindex, sitemap_eligible, verified, featured, rating, review_count)
VALUES ('4c18efb7-1701-4fcc-9d73-63de1d05164d', $q$oracle-cloud$q$, $q$Oracle Cloud$q$, $q$https://www.oracle.com/cloud/$q$, 'needs_review', 'bulk', true, false, false, false, 0, 0)
ON CONFLICT (slug) DO NOTHING;
INSERT INTO tool_category_links (tool_id, category_id, primary_category)
SELECT '4c18efb7-1701-4fcc-9d73-63de1d05164d', '5340e458-7435-4302-a751-61d13fff760a', true WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c18efb7-1701-4fcc-9d73-63de1d05164d')
ON CONFLICT DO NOTHING;


-- Strategic metadata — one row per list entry (new tool or matched existing).
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ede5e1e6-847c-4d18-a668-f60f02db6d58', $q$Healthcare Software$q$, 1, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ede5e1e6-847c-4d18-a668-f60f02db6d58')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '067c9288-4e9d-4319-8b98-89343581ca11', $q$Property Software$q$, 2, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '067c9288-4e9d-4319-8b98-89343581ca11')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '42273775-9af9-49e2-bee0-17abf6eab3d5', $q$Healthcare Software$q$, 3, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '42273775-9af9-49e2-bee0-17abf6eab3d5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e3f6368-47e9-4067-8df8-b6e3ede9863a', $q$Property Software$q$, 4, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e3f6368-47e9-4067-8df8-b6e3ede9863a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2292afbf-ac82-4dcd-816d-f24125908a30', $q$Healthcare Software$q$, 5, 9, 8, 9, $q$Tier A — Strong sales prospect$q$, 8.7, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2292afbf-ac82-4dcd-816d-f24125908a30')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c3329d28-c04e-48fd-acb5-e4086d15cfec', $q$Business Software$q$, 6, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c3329d28-c04e-48fd-acb5-e4086d15cfec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0bc14bf4-8347-485e-acc6-bd34d5f82146', $q$Databases & Data Infrastructure$q$, 7, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0bc14bf4-8347-485e-acc6-bd34d5f82146')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2606bcee-7c10-4c19-ac05-38743faafbbd', $q$Design & Media$q$, 8, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2606bcee-7c10-4c19-ac05-38743faafbbd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a503988-293f-49b2-ae6f-d6bb6c392206', $q$Design & Media$q$, 9, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a503988-293f-49b2-ae6f-d6bb6c392206')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd481ce42-0ced-4647-b358-b4f024cda820', $q$Business Software$q$, 10, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd481ce42-0ced-4647-b358-b4f024cda820')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b4faf985-7c58-4c87-8560-524d88331992', $q$Design & Media$q$, 11, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4faf985-7c58-4c87-8560-524d88331992')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '673f3f0e-691b-45d1-8e4a-dfea89115d74', $q$Business Software$q$, 12, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '673f3f0e-691b-45d1-8e4a-dfea89115d74')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05aacd49-d29b-4263-a5d6-c4d3f7e3858b', $q$Design & Media$q$, 13, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05aacd49-d29b-4263-a5d6-c4d3f7e3858b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e7cd212-e364-4192-be8c-cab48ff64fb4', $q$Business Software$q$, 14, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e7cd212-e364-4192-be8c-cab48ff64fb4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7584974-30ec-4e51-aaab-f7ffa033ea78', $q$Design & Media$q$, 15, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7584974-30ec-4e51-aaab-f7ffa033ea78')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de12a70b-5557-4d95-9eac-afca1fc10178', $q$Search$q$, 16, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de12a70b-5557-4d95-9eac-afca1fc10178')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '74e10c7d-96d5-4264-ba96-cb2433fa5fc8', $q$Business Software$q$, 17, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74e10c7d-96d5-4264-ba96-cb2433fa5fc8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0fa10ed5-4e60-4735-9866-16c7f888de45', $q$Business Software$q$, 18, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0fa10ed5-4e60-4735-9866-16c7f888de45')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '967241ce-ad2e-479e-8559-6bc5c95eaaea', $q$Business Software$q$, 19, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '967241ce-ad2e-479e-8559-6bc5c95eaaea')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f879c9e8-a938-4954-848c-249a83729428', $q$Education Software$q$, 20, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f879c9e8-a938-4954-848c-249a83729428')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c5d7d496-060b-494f-b8f1-4a7cae08eda5', $q$Business Software$q$, 21, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5d7d496-060b-494f-b8f1-4a7cae08eda5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '31db427c-ae17-4868-bb93-d759584d6445', $q$Business Software$q$, 22, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31db427c-ae17-4868-bb93-d759584d6445')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '66ba6370-3244-451b-a008-2d5c51c1fb8e', $q$Business Software$q$, 23, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '66ba6370-3244-451b-a008-2d5c51c1fb8e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '612bcebe-49cc-416a-936e-aee471f9763d', $q$Business Software$q$, 24, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '612bcebe-49cc-416a-936e-aee471f9763d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cb6e4649-6cc1-4673-ab1d-33f9a1308e33', $q$Business Software$q$, 25, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cb6e4649-6cc1-4673-ab1d-33f9a1308e33')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bf96ddc1-32b1-4237-817a-ca717e3008ab', $q$Monitoring & Observability$q$, 26, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bf96ddc1-32b1-4237-817a-ca717e3008ab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8b8db3f8-aabc-46bb-845b-8bd3674c6134', $q$Cloud Infrastructure$q$, 27, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b8db3f8-aabc-46bb-845b-8bd3674c6134')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3b964897-a385-425c-98f2-a58e6a53a9d9', $q$Business Software$q$, 28, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b964897-a385-425c-98f2-a58e6a53a9d9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ac0aa078-cb44-4e12-b0a3-6eb4566c68e0', $q$Business Software$q$, 29, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac0aa078-cb44-4e12-b0a3-6eb4566c68e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9f9e9d60-0697-44c0-88b4-4fa2ce57cd98', $q$Business Software$q$, 30, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9f9e9d60-0697-44c0-88b4-4fa2ce57cd98')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76210422-8c74-4fd4-bc59-22399dd75183', $q$Business Software$q$, 31, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76210422-8c74-4fd4-bc59-22399dd75183')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5acbadd8-c332-4176-81fe-f757b578a77a', $q$Business Software$q$, 32, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5acbadd8-c332-4176-81fe-f757b578a77a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '49f3b309-4a25-4b5f-8510-8a8e1a3e50bb', $q$Cloud Infrastructure$q$, 33, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '49f3b309-4a25-4b5f-8510-8a8e1a3e50bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05511d22-956f-4717-b903-1a7fa4fc130e', $q$Business Software$q$, 34, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05511d22-956f-4717-b903-1a7fa4fc130e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a0e89dfe-75ab-4aea-a6da-0f0334f44020', $q$Design & Media$q$, 35, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0e89dfe-75ab-4aea-a6da-0f0334f44020')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '57a97ac4-376f-4dca-b06f-6fa8252794f0', $q$Business Software$q$, 36, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57a97ac4-376f-4dca-b06f-6fa8252794f0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1a4b2be9-43e2-4d4d-8dc5-0d36c5f7848a', $q$Monitoring & Observability$q$, 37, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a4b2be9-43e2-4d4d-8dc5-0d36c5f7848a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a5b8096a-5ef5-481d-b6e1-09b700f1cd7f', $q$Business Software$q$, 38, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a5b8096a-5ef5-481d-b6e1-09b700f1cd7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '974f7a00-1d67-447e-9058-bf05fe6357ad', $q$Business Software$q$, 39, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '974f7a00-1d67-447e-9058-bf05fe6357ad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ef40340d-975f-4467-ba6c-2e12878f77bb', $q$Design & Media$q$, 40, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ef40340d-975f-4467-ba6c-2e12878f77bb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c2b4d4d3-6914-494c-ab3e-8d02d581f802', $q$Business Software$q$, 41, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2b4d4d3-6914-494c-ab3e-8d02d581f802')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11674814-c70f-44c9-ba68-d6bf1db1e289', $q$Design & Media$q$, 42, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11674814-c70f-44c9-ba68-d6bf1db1e289')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e65336ed-2fb0-413b-92ae-f4002c55115f', $q$Business Software$q$, 43, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e65336ed-2fb0-413b-92ae-f4002c55115f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '08f28219-ca73-42dd-9c5f-17577ab1c841', $q$Design & Media$q$, 44, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '08f28219-ca73-42dd-9c5f-17577ab1c841')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'df246c3f-a420-443c-8aff-f00c444d14d6', $q$Monitoring & Observability$q$, 45, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'df246c3f-a420-443c-8aff-f00c444d14d6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '403ebb64-8b75-4c16-9d1d-26535704f097', $q$Cloud Infrastructure$q$, 46, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '403ebb64-8b75-4c16-9d1d-26535704f097')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dd3835c7-4555-46b1-a75d-55532c70e333', $q$Business Software$q$, 47, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dd3835c7-4555-46b1-a75d-55532c70e333')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5d754571-a7ce-46cf-a42b-c0a05ee72625', $q$Business Software$q$, 48, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d754571-a7ce-46cf-a42b-c0a05ee72625')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '271e90eb-7f4a-4830-83c8-cbe9a8ca5270', $q$Business Software$q$, 49, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '271e90eb-7f4a-4830-83c8-cbe9a8ca5270')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '41edfd95-63c6-404d-94c9-c87a98ef19f2', $q$Databases & Data Infrastructure$q$, 50, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41edfd95-63c6-404d-94c9-c87a98ef19f2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '21dbbf18-b3b0-406f-8a88-055297fc15ab', $q$Business Software$q$, 51, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '21dbbf18-b3b0-406f-8a88-055297fc15ab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2fbffd64-ad25-4d61-8f29-f825da09e9de', $q$Cloud Infrastructure$q$, 52, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2fbffd64-ad25-4d61-8f29-f825da09e9de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1cd3a1d9-5da9-4f4c-825e-94b1d362dd27', $q$Business Software$q$, 53, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1cd3a1d9-5da9-4f4c-825e-94b1d362dd27')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '57e5cd5a-3371-4f98-94e6-bdba29cb1d89', $q$Email & Communication$q$, 54, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '57e5cd5a-3371-4f98-94e6-bdba29cb1d89')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '247d840a-2d7d-4990-8c6a-3e31760daf3d', $q$Business Software$q$, 55, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '247d840a-2d7d-4990-8c6a-3e31760daf3d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd53fd227-dfc9-4433-b23c-eae93cde107f', $q$Business Software$q$, 56, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd53fd227-dfc9-4433-b23c-eae93cde107f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a69f323a-5bac-439b-8d2a-5a1b3804401e', $q$Education Software$q$, 57, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a69f323a-5bac-439b-8d2a-5a1b3804401e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd482f06e-58db-4ac9-abf8-65397ec49f7b', $q$Business Software$q$, 58, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd482f06e-58db-4ac9-abf8-65397ec49f7b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8472f3a3-648f-4ce3-a589-dce2fb48bd28', $q$Business Software$q$, 59, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8472f3a3-648f-4ce3-a589-dce2fb48bd28')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fd499a7e-95e4-4f5b-9e0d-e56389d69a77', $q$Business Software$q$, 60, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fd499a7e-95e4-4f5b-9e0d-e56389d69a77')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bdf4149c-1a2a-4360-bde4-d355b0d33fb6', $q$Business Software$q$, 61, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bdf4149c-1a2a-4360-bde4-d355b0d33fb6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '195e877a-90ba-4659-b84b-ec76222ce094', $q$Business Software$q$, 62, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '195e877a-90ba-4659-b84b-ec76222ce094')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '31c502b7-f2eb-4549-bd9c-e25ef5ac1381', $q$Monitoring & Observability$q$, 63, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31c502b7-f2eb-4549-bd9c-e25ef5ac1381')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd5455709-cf29-432c-94eb-031f95b97e84', $q$Business Software$q$, 64, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd5455709-cf29-432c-94eb-031f95b97e84')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '62e5423f-7b35-4d89-942b-e5a1783055ad', $q$Design & Media$q$, 65, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62e5423f-7b35-4d89-942b-e5a1783055ad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '550831fa-f6ac-49ce-8f68-9bb633fdd5ec', $q$Business Software$q$, 66, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '550831fa-f6ac-49ce-8f68-9bb633fdd5ec')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '40873439-74d5-4c5a-9d8b-5e7348a903a9', $q$Design & Media$q$, 67, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '40873439-74d5-4c5a-9d8b-5e7348a903a9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6a378f3f-8fa1-4cc4-a151-94f0e9c1bddd', $q$Cloud Infrastructure$q$, 68, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6a378f3f-8fa1-4cc4-a151-94f0e9c1bddd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c1619246-54cb-4904-969c-d8ab480b59b5', $q$Business Software$q$, 69, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c1619246-54cb-4904-969c-d8ab480b59b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '43eb1f18-f8c1-4055-9bd9-67c2673345ba', $q$Business Software$q$, 70, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43eb1f18-f8c1-4055-9bd9-67c2673345ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4ecc6a92-bd84-46ac-ae4b-7a99940eda7f', $q$Cloud Infrastructure$q$, 71, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ecc6a92-bd84-46ac-ae4b-7a99940eda7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f6982bed-77ea-4c1c-86ae-f110f934bb26', $q$Business Software$q$, 72, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6982bed-77ea-4c1c-86ae-f110f934bb26')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '73ac7167-1ba7-4e44-bbf8-dbdbcad06d99', $q$Monitoring & Observability$q$, 73, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '73ac7167-1ba7-4e44-bbf8-dbdbcad06d99')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6b78ba61-e23d-473a-8f61-939c1f5fce7b', $q$Business Software$q$, 74, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6b78ba61-e23d-473a-8f61-939c1f5fce7b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'abb96509-e0ba-4927-9110-f72512053172', $q$Business Software$q$, 75, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abb96509-e0ba-4927-9110-f72512053172')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '424eeed7-a359-4785-947f-0867babfff58', $q$Education Software$q$, 76, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '424eeed7-a359-4785-947f-0867babfff58')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '683fdfa0-ec88-4a29-ade2-8bfe6a6b6328', $q$Cloud Infrastructure$q$, 77, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '683fdfa0-ec88-4a29-ade2-8bfe6a6b6328')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f5c3a0e0-ca87-4f5e-89ba-38c7a15c351a', $q$Design & Media$q$, 78, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5c3a0e0-ca87-4f5e-89ba-38c7a15c351a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b7ab00e3-768f-4aff-a73c-f35eeb640abf', $q$Business Software$q$, 79, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b7ab00e3-768f-4aff-a73c-f35eeb640abf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c227968d-30da-4d0b-9a4e-428bc0305d94', $q$Business Software$q$, 80, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c227968d-30da-4d0b-9a4e-428bc0305d94')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'af3b617e-ddb9-4747-8ee6-05fd0b76ab74', $q$Monitoring & Observability$q$, 81, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'af3b617e-ddb9-4747-8ee6-05fd0b76ab74')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '707c21c2-77d0-4aa8-a1f3-817320f58c18', $q$Business Software$q$, 82, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '707c21c2-77d0-4aa8-a1f3-817320f58c18')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '85ea5bd3-d7d0-4431-bd52-9819c2698a09', $q$Design & Media$q$, 83, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '85ea5bd3-d7d0-4431-bd52-9819c2698a09')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a5c2c9f-429f-43f8-aa35-04e216ea807d', $q$Business Software$q$, 84, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a5c2c9f-429f-43f8-aa35-04e216ea807d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eab39cb5-4a40-4290-930a-ce81ba4b90e2', $q$Business Software$q$, 85, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eab39cb5-4a40-4290-930a-ce81ba4b90e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '168f0fc4-11e6-43e9-b43d-4165c98d14f5', $q$Business Software$q$, 86, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '168f0fc4-11e6-43e9-b43d-4165c98d14f5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ca3f9df7-9a06-4cc2-93fc-2fe091154016', $q$Business Software$q$, 87, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ca3f9df7-9a06-4cc2-93fc-2fe091154016')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4bd5937f-e64f-4c25-8c79-12336b88dbbf', $q$Business Software$q$, 88, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bd5937f-e64f-4c25-8c79-12336b88dbbf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a45a42d6-f099-41c6-ae25-4e9fbe792489', $q$Design & Media$q$, 89, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a45a42d6-f099-41c6-ae25-4e9fbe792489')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fc042bad-c86d-4897-bb85-63e8cd464041', $q$Design & Media$q$, 91, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc042bad-c86d-4897-bb85-63e8cd464041')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '05dae713-e7e6-4376-9f1c-10404d9bd72a', $q$Business Software$q$, 92, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '05dae713-e7e6-4376-9f1c-10404d9bd72a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8cd7aefe-b8d8-4c44-99fd-8bd25c94179b', $q$Cloud Infrastructure$q$, 93, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8cd7aefe-b8d8-4c44-99fd-8bd25c94179b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dac93ca8-8c32-4123-94ac-09b9cd060986', $q$Cloud Infrastructure$q$, 94, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dac93ca8-8c32-4123-94ac-09b9cd060986')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ff3f3d7-0f1f-4463-92fc-7af7e8d400ae', $q$Business Software$q$, 95, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ff3f3d7-0f1f-4463-92fc-7af7e8d400ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c5ac4d46-cf75-4332-94c1-b24fe24c15d3', $q$Design & Media$q$, 96, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c5ac4d46-cf75-4332-94c1-b24fe24c15d3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3df60d9d-daa9-46fe-9df1-ce082cf3c163', $q$Cloud Infrastructure$q$, 97, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3df60d9d-daa9-46fe-9df1-ce082cf3c163')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '07f7e3a2-3549-492f-9f44-b804dbf9984a', $q$Email & Communication$q$, 98, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '07f7e3a2-3549-492f-9f44-b804dbf9984a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '81681037-3e0b-4157-82ac-707a4372e951', $q$Business Software$q$, 99, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '81681037-3e0b-4157-82ac-707a4372e951')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '25d9c800-4614-4cac-874b-c91169b5deca', $q$Education Software$q$, 100, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25d9c800-4614-4cac-874b-c91169b5deca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd57763a2-33b1-4688-9b26-dbe5e77635fc', $q$Databases & Data Infrastructure$q$, 101, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd57763a2-33b1-4688-9b26-dbe5e77635fc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b61e50b2-c50d-42ef-95c6-150b39c0cb33', $q$Business Software$q$, 102, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b61e50b2-c50d-42ef-95c6-150b39c0cb33')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7198b10d-6099-4a58-a508-0fbb0e8b0fef', $q$Cloud Infrastructure$q$, 103, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7198b10d-6099-4a58-a508-0fbb0e8b0fef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '41d1b5f6-c8db-4613-a01f-279f3c9c767a', $q$Business Software$q$, 104, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '41d1b5f6-c8db-4613-a01f-279f3c9c767a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a92ed71-a803-41b0-acbd-8930ee381549', $q$Design & Media$q$, 105, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a92ed71-a803-41b0-acbd-8930ee381549')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '791911ae-7f13-4b22-807b-bd998dc0e2de', $q$Business Software$q$, 106, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '791911ae-7f13-4b22-807b-bd998dc0e2de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3bd680fb-ffaf-4404-9c06-bac18a4eedf9', $q$Business Software$q$, 107, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bd680fb-ffaf-4404-9c06-bac18a4eedf9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f1dbcfa2-6b82-4d0b-bc9c-353914d887fa', $q$Cloud Infrastructure$q$, 108, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1dbcfa2-6b82-4d0b-bc9c-353914d887fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'da011c25-1ab6-4391-85b0-7e5c3ab1d6ac', $q$Business Software$q$, 109, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da011c25-1ab6-4391-85b0-7e5c3ab1d6ac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4ce9a315-8686-43e9-92c6-7a9d8afd48f7', $q$Business Software$q$, 110, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ce9a315-8686-43e9-92c6-7a9d8afd48f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c870db71-e7b1-467b-9f40-865796d9d4e9', $q$Cloud Infrastructure$q$, 111, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c870db71-e7b1-467b-9f40-865796d9d4e9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '35fa5c2a-e6b9-42a1-afc9-8109dd8e4b91', $q$Cloud Infrastructure$q$, 112, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '35fa5c2a-e6b9-42a1-afc9-8109dd8e4b91')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '346d7851-ae5a-45e5-8f1c-25b4761b86d4', $q$Business Software$q$, 113, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '346d7851-ae5a-45e5-8f1c-25b4761b86d4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd1601b35-55c8-4070-a942-c125771f0492', $q$Business Software$q$, 114, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd1601b35-55c8-4070-a942-c125771f0492')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de6a5e70-4d70-4559-9d98-560bb0650b87', $q$Education Software$q$, 115, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de6a5e70-4d70-4559-9d98-560bb0650b87')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '25bee257-9102-401a-86db-0cafade6b7fb', $q$Business Software$q$, 116, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25bee257-9102-401a-86db-0cafade6b7fb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'faca7857-2bd8-451d-ac00-7dca0e45b289', $q$Design & Media$q$, 117, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'faca7857-2bd8-451d-ac00-7dca0e45b289')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b77ec0e4-dcb2-4ec6-b1b5-af439818971f', $q$Databases & Data Infrastructure$q$, 118, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b77ec0e4-dcb2-4ec6-b1b5-af439818971f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4ce09b99-f2be-46e5-87e9-b738add6bd0c', $q$Search$q$, 119, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ce09b99-f2be-46e5-87e9-b738add6bd0c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe10ef49-8462-4ceb-b099-a81501193e11', $q$Business Software$q$, 120, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe10ef49-8462-4ceb-b099-a81501193e11')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '77d2c00f-b93d-4ada-a9e5-3d02c9527db3', $q$Search$q$, 121, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '77d2c00f-b93d-4ada-a9e5-3d02c9527db3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7ddd07fe-32b0-4a5b-bf05-2226553c7e22', $q$Business Software$q$, 122, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7ddd07fe-32b0-4a5b-bf05-2226553c7e22')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'be9bb1a6-1bfa-468a-b4ce-ad7f245bb353', $q$Education Software$q$, 123, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'be9bb1a6-1bfa-468a-b4ce-ad7f245bb353')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '779920fd-e21a-4301-86be-66403583d8ad', $q$Business Software$q$, 124, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '779920fd-e21a-4301-86be-66403583d8ad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '224efe76-dd3a-4172-b743-7b0ea83c601a', $q$Monitoring & Observability$q$, 125, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '224efe76-dd3a-4172-b743-7b0ea83c601a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ac6b6746-2fa3-4120-a29b-219a3772b4df', $q$Business Software$q$, 126, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac6b6746-2fa3-4120-a29b-219a3772b4df')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '383f828c-a6f6-416b-a1d7-5263c0b93d24', $q$Monitoring & Observability$q$, 127, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '383f828c-a6f6-416b-a1d7-5263c0b93d24')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4bb7cefd-1923-4415-8bca-87e2a1517d8e', $q$Email & Communication$q$, 128, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bb7cefd-1923-4415-8bca-87e2a1517d8e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '34f0259b-c793-4cb5-a8ec-9f6e4cd5389e', $q$Business Software$q$, 129, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34f0259b-c793-4cb5-a8ec-9f6e4cd5389e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4d396976-cc5c-4bf3-93a7-b18cb22dc1b2', $q$Business Software$q$, 130, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d396976-cc5c-4bf3-93a7-b18cb22dc1b2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'acd57c1b-0ec4-47eb-b5bb-a573a2b42662', $q$Business Software$q$, 131, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'acd57c1b-0ec4-47eb-b5bb-a573a2b42662')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2c6b3848-19a4-4c49-b931-003ba838b9c9', $q$Business Software$q$, 132, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2c6b3848-19a4-4c49-b931-003ba838b9c9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f6cb1438-d516-463e-beaf-3bfbbafea48a', $q$Business Software$q$, 133, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6cb1438-d516-463e-beaf-3bfbbafea48a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b1f42185-14bd-4461-a6a6-45918dcb78bf', $q$Monitoring & Observability$q$, 134, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b1f42185-14bd-4461-a6a6-45918dcb78bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '65691317-5539-43a3-8bb3-c4ad9b27e638', $q$Databases & Data Infrastructure$q$, 135, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65691317-5539-43a3-8bb3-c4ad9b27e638')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '90cb6082-c3da-4d35-ae16-517cb9004d38', $q$Monitoring & Observability$q$, 136, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '90cb6082-c3da-4d35-ae16-517cb9004d38')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ba7da5aa-1683-4bf9-a259-63591d303e29', $q$Monitoring & Observability$q$, 137, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ba7da5aa-1683-4bf9-a259-63591d303e29')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6f5f09e5-d368-4bc6-b9cd-16e74d0398f9', $q$Business Software$q$, 138, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f5f09e5-d368-4bc6-b9cd-16e74d0398f9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '996b4a9f-71f2-4b4d-b8aa-21fea76d6666', $q$Cloud Infrastructure$q$, 139, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '996b4a9f-71f2-4b4d-b8aa-21fea76d6666')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b8174abd-ac27-46c2-9a51-f08d6b87ce7f', $q$Business Software$q$, 140, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b8174abd-ac27-46c2-9a51-f08d6b87ce7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '17a0a618-1801-4386-bec9-758ae128df92', $q$Business Software$q$, 141, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17a0a618-1801-4386-bec9-758ae128df92')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6f2e18b-eae3-454e-9469-bc5dd87574f4', $q$Business Software$q$, 142, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6f2e18b-eae3-454e-9469-bc5dd87574f4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c8e9c26-c142-40c1-852c-62506bc54e8c', $q$Business Software$q$, 143, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c8e9c26-c142-40c1-852c-62506bc54e8c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8b7bbdb7-187c-4a21-ab16-a809bd731985', $q$Business Software$q$, 144, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b7bbdb7-187c-4a21-ab16-a809bd731985')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd45f9431-9e0c-4ef3-bcf4-e8d33c882ffc', $q$Business Software$q$, 145, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd45f9431-9e0c-4ef3-bcf4-e8d33c882ffc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c2bbf3f9-04ed-4d69-b6d3-3d1445d23b0e', $q$Business Software$q$, 146, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c2bbf3f9-04ed-4d69-b6d3-3d1445d23b0e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9a4da127-1e89-46a5-ae31-ebba4008d58f', $q$Design & Media$q$, 147, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9a4da127-1e89-46a5-ae31-ebba4008d58f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b756f9f4-d0fd-4019-94bf-65b792969130', $q$Business Software$q$, 148, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b756f9f4-d0fd-4019-94bf-65b792969130')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fbf78e8a-26c7-4d63-a7b4-b3b2f814c06a', $q$Cloud Infrastructure$q$, 149, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbf78e8a-26c7-4d63-a7b4-b3b2f814c06a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd849eb46-cb77-427d-92b2-77f0e11c7f95', $q$Databases & Data Infrastructure$q$, 150, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd849eb46-cb77-427d-92b2-77f0e11c7f95')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6776ca43-0c85-42d6-ab67-97d33ece86d2', $q$Databases & Data Infrastructure$q$, 151, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6776ca43-0c85-42d6-ab67-97d33ece86d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e41fd154-3522-4aa5-8b80-838519aa792f', $q$Design & Media$q$, 152, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e41fd154-3522-4aa5-8b80-838519aa792f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8f1f6581-f42c-4ff4-a4aa-54f0bd634a79', $q$Monitoring & Observability$q$, 153, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f1f6581-f42c-4ff4-a4aa-54f0bd634a79')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c23b60b-9c3b-4df6-8be5-00cbfd4640ae', $q$Business Software$q$, 154, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c23b60b-9c3b-4df6-8be5-00cbfd4640ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '19c0285e-c51c-4c81-8ee7-bb3f44416a19', $q$Business Software$q$, 155, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19c0285e-c51c-4c81-8ee7-bb3f44416a19')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b4c75243-257c-4c4d-93e3-1519620163e2', $q$Cloud Infrastructure$q$, 156, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4c75243-257c-4c4d-93e3-1519620163e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f45f5100-cd0f-40df-bf87-e9f50305ca3a', $q$Business Software$q$, 157, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f45f5100-cd0f-40df-bf87-e9f50305ca3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '618b0928-1fc1-4ffb-81cd-0264a6700ecf', $q$Business Software$q$, 158, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '618b0928-1fc1-4ffb-81cd-0264a6700ecf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a06f6937-ec5d-4dde-aaaa-bd2c63cbf4c6', $q$Cloud Infrastructure$q$, 159, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a06f6937-ec5d-4dde-aaaa-bd2c63cbf4c6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'eb0232dc-5691-48ff-9ddf-d08361449726', $q$Business Software$q$, 160, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'eb0232dc-5691-48ff-9ddf-d08361449726')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed5ad82f-5490-40b9-9b0f-b5d360bf67a6', $q$Business Software$q$, 161, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed5ad82f-5490-40b9-9b0f-b5d360bf67a6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c935f7b-2238-4175-a21f-59980fc50bd9', $q$Monitoring & Observability$q$, 162, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c935f7b-2238-4175-a21f-59980fc50bd9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fa573bd3-0d65-4d75-8e2b-283a2f8c2ca0', $q$Email & Communication$q$, 163, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa573bd3-0d65-4d75-8e2b-283a2f8c2ca0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5a9d8f69-1922-41da-8c71-ace11d3b04d0', $q$Email & Communication$q$, 164, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5a9d8f69-1922-41da-8c71-ace11d3b04d0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '00fc9a24-2f53-4135-85d0-890fb85f6e29', $q$Business Software$q$, 165, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00fc9a24-2f53-4135-85d0-890fb85f6e29')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7f16724c-cf95-4fa4-8b22-bf014ec23a64', $q$Cloud Infrastructure$q$, 166, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f16724c-cf95-4fa4-8b22-bf014ec23a64')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f01cc239-90d3-4d24-953d-ca65c09ad4ef', $q$Cloud Infrastructure$q$, 167, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f01cc239-90d3-4d24-953d-ca65c09ad4ef')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '68bd3c80-9152-458f-a401-30f2f0a33ab7', $q$Design & Media$q$, 168, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '68bd3c80-9152-458f-a401-30f2f0a33ab7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6983fb32-3dab-49d9-b7f1-769dfda4e53f', $q$Design & Media$q$, 169, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6983fb32-3dab-49d9-b7f1-769dfda4e53f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd6939667-af00-4352-97c1-821741d7fb44', $q$Business Software$q$, 170, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6939667-af00-4352-97c1-821741d7fb44')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd51edc99-d90f-4962-8080-0b1f3641d055', $q$Business Software$q$, 171, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd51edc99-d90f-4962-8080-0b1f3641d055')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b27bfad7-6653-487f-88f3-c21af5e760e5', $q$Business Software$q$, 172, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b27bfad7-6653-487f-88f3-c21af5e760e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '501f1470-d47d-4174-902b-704a2b0c83db', $q$Databases & Data Infrastructure$q$, 173, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '501f1470-d47d-4174-902b-704a2b0c83db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9ad7f473-e6db-4f8c-a293-def363651810', $q$Cloud Infrastructure$q$, 175, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ad7f473-e6db-4f8c-a293-def363651810')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '982b64a8-a629-401d-b51e-1f33ca865cd9', $q$Monitoring & Observability$q$, 176, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '982b64a8-a629-401d-b51e-1f33ca865cd9')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9ace0d1f-f7cd-4734-b86f-bd65a3ef0eb1', $q$Business Software$q$, 177, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9ace0d1f-f7cd-4734-b86f-bd65a3ef0eb1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '06ca1a75-1783-4ad9-afc0-07a8e8681171', $q$Business Software$q$, 178, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '06ca1a75-1783-4ad9-afc0-07a8e8681171')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1149c01b-6a85-4215-b99d-2a8428cd16f7', $q$Business Software$q$, 179, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1149c01b-6a85-4215-b99d-2a8428cd16f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c55332dc-3a18-4da3-a05e-612cd9857b90', $q$Business Software$q$, 180, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c55332dc-3a18-4da3-a05e-612cd9857b90')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '87d9c6b3-d8dd-4e4e-bd1b-9372fc1e78ca', $q$Business Software$q$, 181, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '87d9c6b3-d8dd-4e4e-bd1b-9372fc1e78ca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c39d00f0-8025-44c3-9bf0-5183ad062ee5', $q$Business Software$q$, 182, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c39d00f0-8025-44c3-9bf0-5183ad062ee5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4eb3124b-13d8-4ca6-9474-29d4d982fe06', $q$Business Software$q$, 183, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4eb3124b-13d8-4ca6-9474-29d4d982fe06')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c67ec046-f635-4f97-81eb-88fe628c453f', $q$Business Software$q$, 184, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c67ec046-f635-4f97-81eb-88fe628c453f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fa0e8b2e-ed9f-44e6-b004-931db0666f70', $q$Business Software$q$, 185, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa0e8b2e-ed9f-44e6-b004-931db0666f70')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '03235e53-bf9d-4d4a-884e-ff0627700670', $q$Monitoring & Observability$q$, 186, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '03235e53-bf9d-4d4a-884e-ff0627700670')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '95f3651c-a425-427e-adcc-02eeb635d5b3', $q$Monitoring & Observability$q$, 187, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '95f3651c-a425-427e-adcc-02eeb635d5b3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '61426574-2fcf-460e-9e97-ac60a182bb81', $q$Business Software$q$, 188, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61426574-2fcf-460e-9e97-ac60a182bb81')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b330ace2-1e49-4fea-86e6-08869829ae44', $q$Business Software$q$, 189, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b330ace2-1e49-4fea-86e6-08869829ae44')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5d349153-8e50-4cbb-8fee-feec4618e8e2', $q$Business Software$q$, 190, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5d349153-8e50-4cbb-8fee-feec4618e8e2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fc151623-2597-4f5d-afe0-6cec7896db30', $q$Cloud Infrastructure$q$, 191, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc151623-2597-4f5d-afe0-6cec7896db30')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a0447767-0311-435b-81e2-20841d91ddbb', $q$Cloud Infrastructure$q$, 192, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a0447767-0311-435b-81e2-20841d91ddbb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4fd365b2-b5c2-4925-a7d6-f33c57ab9cd0', $q$Business Software$q$, 193, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4fd365b2-b5c2-4925-a7d6-f33c57ab9cd0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dde02615-5bfb-4ef9-b81a-ae9d291fec00', $q$Business Software$q$, 194, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dde02615-5bfb-4ef9-b81a-ae9d291fec00')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0a8457e3-5983-4dc0-8b49-6b3e6fd57d0e', $q$Business Software$q$, 196, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0a8457e3-5983-4dc0-8b49-6b3e6fd57d0e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c73db290-cb5b-4939-9ea6-5894ea071ff2', $q$Business Software$q$, 197, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c73db290-cb5b-4939-9ea6-5894ea071ff2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7e1958f6-c3cd-401b-b567-de22b54ca1f7', $q$Business Software$q$, 198, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e1958f6-c3cd-401b-b567-de22b54ca1f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '131c242c-255a-4d06-83bf-f7421cb73ba7', $q$Business Software$q$, 199, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '131c242c-255a-4d06-83bf-f7421cb73ba7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3fe59d47-7b27-4e42-a701-6dd41312406f', $q$Business Software$q$, 200, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fe59d47-7b27-4e42-a701-6dd41312406f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e2ea84f6-54bf-46cb-aa55-5efea2486f60', $q$Business Software$q$, 201, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2ea84f6-54bf-46cb-aa55-5efea2486f60')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9c60fd29-9360-4e0b-b425-8821b46fcaaf', $q$Design & Media$q$, 202, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9c60fd29-9360-4e0b-b425-8821b46fcaaf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0606a756-5002-4edd-9943-772a30d40c66', $q$Business Software$q$, 203, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0606a756-5002-4edd-9943-772a30d40c66')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fc6d65ab-04da-4feb-92f9-105c4dcd4bd7', $q$Cloud Infrastructure$q$, 204, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fc6d65ab-04da-4feb-92f9-105c4dcd4bd7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8f4af635-2acf-4254-abda-cfc3ff26c07d', $q$Cloud Infrastructure$q$, 205, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8f4af635-2acf-4254-abda-cfc3ff26c07d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a1e904a6-71b0-4f23-a7cd-88f1f5aa2b30', $q$Business Software$q$, 206, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1e904a6-71b0-4f23-a7cd-88f1f5aa2b30')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '17539e07-2bc1-4999-badc-5ec2ff410426', $q$Cloud Infrastructure$q$, 207, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17539e07-2bc1-4999-badc-5ec2ff410426')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e9067c56-feac-4dd8-9704-37dff5415394', $q$Cloud Infrastructure$q$, 208, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e9067c56-feac-4dd8-9704-37dff5415394')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ab295fca-b53d-43a1-8d07-e20df3134a1b', $q$Cloud Infrastructure$q$, 209, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab295fca-b53d-43a1-8d07-e20df3134a1b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '16e09abd-e9cf-4a80-9594-d0d5267bd1ce', $q$Databases & Data Infrastructure$q$, 210, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '16e09abd-e9cf-4a80-9594-d0d5267bd1ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee0b2e50-33e7-44c9-a816-93566360adf4', $q$Cloud Infrastructure$q$, 211, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee0b2e50-33e7-44c9-a816-93566360adf4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5c35f7c0-ad9a-4109-8253-93a2486655d2', $q$Business Software$q$, 212, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5c35f7c0-ad9a-4109-8253-93a2486655d2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4076d278-fefc-42b9-ade9-8b4f77294f83', $q$Business Software$q$, 213, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4076d278-fefc-42b9-ade9-8b4f77294f83')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e3ed2338-e1c4-461f-b5dc-ea762386a5e0', $q$Monitoring & Observability$q$, 214, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e3ed2338-e1c4-461f-b5dc-ea762386a5e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cba3ee81-5d04-4ae3-918b-132e89328a83', $q$Design & Media$q$, 215, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cba3ee81-5d04-4ae3-918b-132e89328a83')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee0c00fd-b144-433c-9d53-a5c1fbbc1c0f', $q$Monitoring & Observability$q$, 216, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee0c00fd-b144-433c-9d53-a5c1fbbc1c0f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3c4bdd29-01d9-48ba-b8d8-8e45c583a0cc', $q$Business Software$q$, 217, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3c4bdd29-01d9-48ba-b8d8-8e45c583a0cc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '203cd4c9-9c8d-4424-b722-4a2d36374b34', $q$Design & Media$q$, 218, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '203cd4c9-9c8d-4424-b722-4a2d36374b34')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3fb832e5-4f7f-4d80-b77f-9ee328b19588', $q$Business Software$q$, 219, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3fb832e5-4f7f-4d80-b77f-9ee328b19588')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b354e1c1-2aaf-4c90-bfa4-4b8cc24165f8', $q$Business Software$q$, 220, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b354e1c1-2aaf-4c90-bfa4-4b8cc24165f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f13fe577-074c-4bfb-bdfd-391598ff5de8', $q$Search$q$, 221, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f13fe577-074c-4bfb-bdfd-391598ff5de8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '10d53da5-5cc5-4906-87f3-841c86bac076', $q$Design & Media$q$, 222, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10d53da5-5cc5-4906-87f3-841c86bac076')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '74f44d62-3f3b-4fd5-9c70-30609bddda9b', $q$Business Software$q$, 223, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '74f44d62-3f3b-4fd5-9c70-30609bddda9b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2499c402-666f-412c-a889-2acccee0f343', $q$Business Software$q$, 224, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2499c402-666f-412c-a889-2acccee0f343')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48e765bf-1d0f-4728-82ad-1c0c5939a8bf', $q$Business Software$q$, 225, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48e765bf-1d0f-4728-82ad-1c0c5939a8bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7b37029-9001-4b04-af04-6b8a1527ab3a', $q$Business Software$q$, 226, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7b37029-9001-4b04-af04-6b8a1527ab3a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cc31dd4a-ed91-42bd-bf28-f8271b45148f', $q$Business Software$q$, 227, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cc31dd4a-ed91-42bd-bf28-f8271b45148f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c1bbf8b-b7ef-4478-ba4b-9433b2e0b645', $q$Business Software$q$, 228, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c1bbf8b-b7ef-4478-ba4b-9433b2e0b645')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'adb9cff6-86bf-4998-8506-4e88733f35eb', $q$Business Software$q$, 229, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'adb9cff6-86bf-4998-8506-4e88733f35eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a6e152e4-c3af-41f4-8319-d4087c7c7337', $q$Business Software$q$, 230, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a6e152e4-c3af-41f4-8319-d4087c7c7337')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '474a4a6e-c4ff-4295-b4f7-6bb15498551c', $q$Business Software$q$, 231, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '474a4a6e-c4ff-4295-b4f7-6bb15498551c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d34d5ad-0c9d-4016-b95d-1b068b188944', $q$Design & Media$q$, 232, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d34d5ad-0c9d-4016-b95d-1b068b188944')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '52edd952-17dc-4bd6-a726-1cd7105a5189', $q$Cloud Infrastructure$q$, 233, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '52edd952-17dc-4bd6-a726-1cd7105a5189')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f62201af-c64f-4ff3-934f-7160991341de', $q$Business Software$q$, 234, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f62201af-c64f-4ff3-934f-7160991341de')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cf4a5e2b-4fb5-44aa-8a06-8c34eb872e00', $q$Business Software$q$, 235, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf4a5e2b-4fb5-44aa-8a06-8c34eb872e00')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7def4ef7-3522-4409-913a-8059f9a4c57c', $q$Email & Communication$q$, 236, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7def4ef7-3522-4409-913a-8059f9a4c57c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f1704ba2-c3c0-44f0-92c2-63cba83868b8', $q$Design & Media$q$, 237, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1704ba2-c3c0-44f0-92c2-63cba83868b8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '39ec218a-aacf-4f0d-8962-8cfba47f2d9d', $q$Business Software$q$, 238, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39ec218a-aacf-4f0d-8962-8cfba47f2d9d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd15e67ba-6526-47e2-a63c-cb6f09203562', $q$Business Software$q$, 239, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd15e67ba-6526-47e2-a63c-cb6f09203562')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '974e7f41-c43e-4b23-8e33-65427f87f6db', $q$Business Software$q$, 240, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '974e7f41-c43e-4b23-8e33-65427f87f6db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e4f86fc2-89da-40a4-a848-3761aa1479aa', $q$Business Software$q$, 241, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4f86fc2-89da-40a4-a848-3761aa1479aa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f5d67902-822b-4a7a-be0c-1e6a35731441', $q$Business Software$q$, 242, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f5d67902-822b-4a7a-be0c-1e6a35731441')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b2443390-016f-45f0-9875-198f795c1db6', $q$Business Software$q$, 243, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b2443390-016f-45f0-9875-198f795c1db6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0b316c2c-229e-4a90-b380-386ac0bc1ab2', $q$Business Software$q$, 244, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b316c2c-229e-4a90-b380-386ac0bc1ab2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5bfbbe4-a092-491e-92c4-309da2a3da41', $q$Cloud Infrastructure$q$, 245, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5bfbbe4-a092-491e-92c4-309da2a3da41')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a8b8da8-95dc-4398-aa45-d8783e3c6ee5', $q$Business Software$q$, 246, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a8b8da8-95dc-4398-aa45-d8783e3c6ee5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20117f93-b024-4fc4-be56-e37b5eb13cb3', $q$Cloud Infrastructure$q$, 247, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20117f93-b024-4fc4-be56-e37b5eb13cb3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fab40da5-d391-40fe-aff0-a2001bf6db2a', $q$Business Software$q$, 248, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fab40da5-d391-40fe-aff0-a2001bf6db2a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b9ef8465-57d3-43e2-8e9f-10ad6a054ce3', $q$Business Software$q$, 249, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b9ef8465-57d3-43e2-8e9f-10ad6a054ce3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a9655e8b-ccbe-4413-9c28-fd49f95df92f', $q$Business Software$q$, 250, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a9655e8b-ccbe-4413-9c28-fd49f95df92f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c782e64-503f-4c6e-a0b4-773c2bb85393', $q$Business Software$q$, 251, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c782e64-503f-4c6e-a0b4-773c2bb85393')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2f3a1ab9-64bf-4a8a-afb9-5aede25b97b1', $q$Business Software$q$, 252, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2f3a1ab9-64bf-4a8a-afb9-5aede25b97b1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8171bb95-e42e-46ed-9041-79beadb7fcbe', $q$Cloud Infrastructure$q$, 253, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8171bb95-e42e-46ed-9041-79beadb7fcbe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4a44f254-5aad-46b3-a4a5-e72502ff528f', $q$Education Software$q$, 254, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4a44f254-5aad-46b3-a4a5-e72502ff528f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c0b61203-dc40-44c4-a95c-0a228b29e663', $q$Business Software$q$, 255, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0b61203-dc40-44c4-a95c-0a228b29e663')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fef248b9-0a1c-44a8-ad74-efe92c5a5fae', $q$Monitoring & Observability$q$, 256, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fef248b9-0a1c-44a8-ad74-efe92c5a5fae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '24a13e17-0bd4-4ac0-9633-31263f84eb49', $q$Design & Media$q$, 257, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24a13e17-0bd4-4ac0-9633-31263f84eb49')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a14f3f7f-1828-4b1e-8abc-fa892f0731eb', $q$Business Software$q$, 258, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a14f3f7f-1828-4b1e-8abc-fa892f0731eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7d9794dc-9479-45d4-beb8-2712619f1604', $q$Education Software$q$, 259, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d9794dc-9479-45d4-beb8-2712619f1604')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f56fdbb8-9ec0-4a94-95cf-66a760e51101', $q$Business Software$q$, 260, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f56fdbb8-9ec0-4a94-95cf-66a760e51101')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd91ca7ce-e0a1-4e58-9537-860936c84e9d', $q$Email & Communication$q$, 261, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd91ca7ce-e0a1-4e58-9537-860936c84e9d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '617f5deb-40f2-421b-8912-3e424d74595f', $q$Business Software$q$, 262, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '617f5deb-40f2-421b-8912-3e424d74595f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '50cc94c8-e070-45c1-92e6-00e26ad0dc48', $q$Databases & Data Infrastructure$q$, 263, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '50cc94c8-e070-45c1-92e6-00e26ad0dc48')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '313c7874-7e86-4743-93cf-911e1189712e', $q$Business Software$q$, 264, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '313c7874-7e86-4743-93cf-911e1189712e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8bbcb1a6-146c-4988-a987-04db14d713ac', $q$Business Software$q$, 265, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8bbcb1a6-146c-4988-a987-04db14d713ac')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0c59b493-5ae7-4032-9f30-74573eebe525', $q$Business Software$q$, 266, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0c59b493-5ae7-4032-9f30-74573eebe525')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a1d18dea-adab-4864-be43-0317ca8c6d83', $q$Business Software$q$, 267, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a1d18dea-adab-4864-be43-0317ca8c6d83')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bd848d43-abb6-469e-aec6-0b54c99d6de6', $q$Education Software$q$, 268, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bd848d43-abb6-469e-aec6-0b54c99d6de6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '857f5953-4e12-4ff2-a5f0-413165282958', $q$Business Software$q$, 269, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '857f5953-4e12-4ff2-a5f0-413165282958')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '00eeb380-089b-4a60-ac66-c12e1121a869', $q$Monitoring & Observability$q$, 270, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '00eeb380-089b-4a60-ac66-c12e1121a869')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '19222d88-668f-4ede-9a47-5773b0418662', $q$Business Software$q$, 271, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '19222d88-668f-4ede-9a47-5773b0418662')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b6ecec47-9a5c-490d-8098-99a83270a135', $q$Business Software$q$, 272, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6ecec47-9a5c-490d-8098-99a83270a135')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8afe1375-9535-4dd1-8036-9e86271539cd', $q$Design & Media$q$, 273, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8afe1375-9535-4dd1-8036-9e86271539cd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fa574bf7-d995-4bfb-b44e-d53c7d3829bf', $q$Cloud Infrastructure$q$, 274, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa574bf7-d995-4bfb-b44e-d53c7d3829bf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7b80b1eb-308e-47cf-a9c1-5380aa48ca7c', $q$Business Software$q$, 275, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7b80b1eb-308e-47cf-a9c1-5380aa48ca7c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '88814d3d-e18d-4144-8b2a-6c46053ca81c', $q$Business Software$q$, 276, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88814d3d-e18d-4144-8b2a-6c46053ca81c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '36429d28-3fa4-475f-a374-ca7ea3ad722b', $q$Business Software$q$, 277, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '36429d28-3fa4-475f-a374-ca7ea3ad722b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '62ec801b-65ab-49ad-91aa-39b0ade64472', $q$Monitoring & Observability$q$, 278, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '62ec801b-65ab-49ad-91aa-39b0ade64472')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ee421e2c-f1cf-410d-89a2-13cc25b00174', $q$Business Software$q$, 279, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ee421e2c-f1cf-410d-89a2-13cc25b00174')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2540a2d6-58c2-4f94-bba0-36d19a3f19cb', $q$Business Software$q$, 280, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2540a2d6-58c2-4f94-bba0-36d19a3f19cb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd583dbf-10af-4898-86b8-f8fb2937a09d', $q$Business Software$q$, 281, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd583dbf-10af-4898-86b8-f8fb2937a09d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '37c54402-1f2e-43cc-a036-319595252488', $q$Cloud Infrastructure$q$, 283, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37c54402-1f2e-43cc-a036-319595252488')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cf6b8b7f-f3cc-49df-8f8e-28df320abf15', $q$Design & Media$q$, 284, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cf6b8b7f-f3cc-49df-8f8e-28df320abf15')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ab0fc517-fcf4-4b1c-891d-018de3dca6af', $q$Cloud Infrastructure$q$, 285, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab0fc517-fcf4-4b1c-891d-018de3dca6af')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a3501178-44c3-44ef-bc5a-d0980c7fffc6', $q$Business Software$q$, 287, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a3501178-44c3-44ef-bc5a-d0980c7fffc6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b102bf45-3465-4493-9c03-c32d52c10668', $q$Design & Media$q$, 288, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b102bf45-3465-4493-9c03-c32d52c10668')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5b8d917a-75da-40bb-b06b-4cf6b7b3bc56', $q$Business Software$q$, 289, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b8d917a-75da-40bb-b06b-4cf6b7b3bc56')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '204e04ce-67c3-4940-afb1-5cf2fe2b28c4', $q$Business Software$q$, 290, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '204e04ce-67c3-4940-afb1-5cf2fe2b28c4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c9a33a41-18fc-4133-ad15-11e5057ac860', $q$Business Software$q$, 291, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c9a33a41-18fc-4133-ad15-11e5057ac860')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48a6aeeb-62e0-42c2-bb6a-f56d6793e133', $q$Cloud Infrastructure$q$, 292, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48a6aeeb-62e0-42c2-bb6a-f56d6793e133')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ada1724-79ad-4925-b104-09ed89cb3dbe', $q$Cloud Infrastructure$q$, 294, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ada1724-79ad-4925-b104-09ed89cb3dbe')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e66294ea-fcb7-418e-915f-50e1e10aae1b', $q$Cloud Infrastructure$q$, 295, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e66294ea-fcb7-418e-915f-50e1e10aae1b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b18aa15b-a5b5-4f42-8782-b1a4f5e5dd6b', $q$Cloud Infrastructure$q$, 296, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b18aa15b-a5b5-4f42-8782-b1a4f5e5dd6b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '88e62bca-4663-4a52-acc5-e36e25972a08', $q$Monitoring & Observability$q$, 297, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '88e62bca-4663-4a52-acc5-e36e25972a08')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b79c3a9-514e-4324-afbc-837f10877ce3', $q$Search$q$, 298, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b79c3a9-514e-4324-afbc-837f10877ce3')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '31dad8a5-8ad8-481c-af88-a6985cc8dabd', $q$Business Software$q$, 299, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '31dad8a5-8ad8-481c-af88-a6985cc8dabd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '330b47cf-e009-4ced-9c1e-98ede6cd8f51', $q$Business Software$q$, 300, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '330b47cf-e009-4ced-9c1e-98ede6cd8f51')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ab0f5201-0654-4259-a2ec-89a27ee01084', $q$Monitoring & Observability$q$, 301, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ab0f5201-0654-4259-a2ec-89a27ee01084')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de39e4de-2a3a-4179-80a8-5f4d0b965a4b', $q$Cloud Infrastructure$q$, 302, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de39e4de-2a3a-4179-80a8-5f4d0b965a4b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4e1a4fa4-5b7e-411b-9ecb-e05035df46e1', $q$Cloud Infrastructure$q$, 303, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4e1a4fa4-5b7e-411b-9ecb-e05035df46e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '24392f09-a1ea-4fed-862b-0f05b4c1af89', $q$Databases & Data Infrastructure$q$, 304, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '24392f09-a1ea-4fed-862b-0f05b4c1af89')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ac0dfb0e-6545-465b-9399-d4a67daee626', $q$Business Software$q$, 305, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ac0dfb0e-6545-465b-9399-d4a67daee626')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '47643b7d-110f-42fe-becd-99ff81a6790e', $q$Monitoring & Observability$q$, 306, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '47643b7d-110f-42fe-becd-99ff81a6790e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a30ef273-9f6c-4648-83ce-e35770510ce2', $q$Business Software$q$, 307, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a30ef273-9f6c-4648-83ce-e35770510ce2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fb712175-9e28-4116-a938-827f1248d0fa', $q$Search$q$, 308, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fb712175-9e28-4116-a938-827f1248d0fa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4ef39011-da66-4f81-8f96-18114f80a9ad', $q$Cloud Infrastructure$q$, 309, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4ef39011-da66-4f81-8f96-18114f80a9ad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fa22235a-bfe1-49d2-ae3f-ae13f8bf8a97', $q$Business Software$q$, 310, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fa22235a-bfe1-49d2-ae3f-ae13f8bf8a97')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3a0dbd1a-8f71-4f81-82b4-4198ffdd3590', $q$Cloud Infrastructure$q$, 311, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3a0dbd1a-8f71-4f81-82b4-4198ffdd3590')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd727c5ea-6bc6-41f1-9a6f-67cd6ffcc33f', $q$Monitoring & Observability$q$, 312, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd727c5ea-6bc6-41f1-9a6f-67cd6ffcc33f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ec01a00e-7a93-4ab0-a0f0-f666eee90a39', $q$Business Software$q$, 313, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ec01a00e-7a93-4ab0-a0f0-f666eee90a39')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aed11cc9-ad09-4f09-b7e6-3e0ff292dff2', $q$Business Software$q$, 314, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aed11cc9-ad09-4f09-b7e6-3e0ff292dff2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd480e072-3dab-4e4b-8015-b8b353896200', $q$Design & Media$q$, 315, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd480e072-3dab-4e4b-8015-b8b353896200')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8b0f3920-3de2-41f1-9904-f465c7cc9e7f', $q$Business Software$q$, 316, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b0f3920-3de2-41f1-9904-f465c7cc9e7f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '48bf90a4-dd16-4cfa-b0dc-6687b98f76e6', $q$Business Software$q$, 317, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '48bf90a4-dd16-4cfa-b0dc-6687b98f76e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7d0e3372-6acf-4443-9f42-df1f12c70fb8', $q$Business Software$q$, 318, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7d0e3372-6acf-4443-9f42-df1f12c70fb8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1e6e647a-5bb3-4276-beff-fac6ec8016cd', $q$Cloud Infrastructure$q$, 319, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e6e647a-5bb3-4276-beff-fac6ec8016cd')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '39bb6930-79de-4ce6-88f3-9f6113687cca', $q$Education Software$q$, 320, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '39bb6930-79de-4ce6-88f3-9f6113687cca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bbbe5826-3a86-4490-8acd-52bd10c50978', $q$Design & Media$q$, 321, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bbbe5826-3a86-4490-8acd-52bd10c50978')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '782b0516-d982-4777-b008-70bb20dbe6c7', $q$Cloud Infrastructure$q$, 322, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '782b0516-d982-4777-b008-70bb20dbe6c7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7f302dd4-b7ad-40e7-9d7d-75ced6f767f7', $q$Search$q$, 323, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7f302dd4-b7ad-40e7-9d7d-75ced6f767f7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ba5c9a5-eeb2-48b7-8904-0843a9e0c641', $q$Cloud Infrastructure$q$, 324, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ba5c9a5-eeb2-48b7-8904-0843a9e0c641')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1192ad3b-0004-4c8f-9196-b25774e05fdc', $q$Design & Media$q$, 325, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1192ad3b-0004-4c8f-9196-b25774e05fdc')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '400591f7-0d38-4c33-b19e-6fe04e7a51d8', $q$Design & Media$q$, 326, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '400591f7-0d38-4c33-b19e-6fe04e7a51d8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '650afbdf-21cc-46cc-ab97-22be3fa37b38', $q$Business Software$q$, 327, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '650afbdf-21cc-46cc-ab97-22be3fa37b38')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0ab1bf19-9b67-44f6-ba07-9b9f2b18ceb7', $q$Business Software$q$, 328, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0ab1bf19-9b67-44f6-ba07-9b9f2b18ceb7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '045c5d8d-3736-4d95-9744-c56026fa6800', $q$Business Software$q$, 329, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '045c5d8d-3736-4d95-9744-c56026fa6800')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '10f8c1de-1d73-4930-a533-4bcb8cf4d8c2', $q$Search$q$, 330, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '10f8c1de-1d73-4930-a533-4bcb8cf4d8c2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '20e6404e-cbef-4f7f-a733-f27656eca283', $q$Monitoring & Observability$q$, 331, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '20e6404e-cbef-4f7f-a733-f27656eca283')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76f7394b-fb74-41cd-b87b-85f6d2183d40', $q$Business Software$q$, 332, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76f7394b-fb74-41cd-b87b-85f6d2183d40')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4385e79f-0479-4a5a-9241-994c0a55223a', $q$Business Software$q$, 333, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4385e79f-0479-4a5a-9241-994c0a55223a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '49044ad0-3629-4e16-a8fc-1e9aa19739e4', $q$Business Software$q$, 334, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '49044ad0-3629-4e16-a8fc-1e9aa19739e4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '11287e22-d3f8-41b1-9093-07cd67c9a77e', $q$Business Software$q$, 335, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '11287e22-d3f8-41b1-9093-07cd67c9a77e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f6b62219-4aca-4296-ac51-6cc5808f1399', $q$Business Software$q$, 336, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f6b62219-4aca-4296-ac51-6cc5808f1399')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0b2ea677-51ee-45fc-8c2c-bcbfe634fa67', $q$Business Software$q$, 337, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0b2ea677-51ee-45fc-8c2c-bcbfe634fa67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1210f91d-fdf8-4ec2-8944-8e47f873aac2', $q$Business Software$q$, 338, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1210f91d-fdf8-4ec2-8944-8e47f873aac2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8e196347-9f47-4f45-b1b3-fa4d4ce27614', $q$Monitoring & Observability$q$, 339, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8e196347-9f47-4f45-b1b3-fa4d4ce27614')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '177a5ea3-0633-432e-a2d0-f73de15fea26', $q$Business Software$q$, 340, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '177a5ea3-0633-432e-a2d0-f73de15fea26')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d8097ed-353f-42d5-aa67-552a2741f38c', $q$Business Software$q$, 341, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d8097ed-353f-42d5-aa67-552a2741f38c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c90b7c74-3f0b-42ab-9ffb-c06225bb0e64', $q$Business Software$q$, 342, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c90b7c74-3f0b-42ab-9ffb-c06225bb0e64')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7896ee82-1216-417c-b0ae-08feded4e539', $q$Business Software$q$, 343, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7896ee82-1216-417c-b0ae-08feded4e539')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6d6f937b-1204-44f1-b9a2-0c1247081e1b', $q$Business Software$q$, 344, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6d6f937b-1204-44f1-b9a2-0c1247081e1b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '54ea9d0d-996f-471c-8bc7-85fc3fbe16e0', $q$Databases & Data Infrastructure$q$, 345, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '54ea9d0d-996f-471c-8bc7-85fc3fbe16e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '65df064f-c033-48de-963a-975e3a0de2d5', $q$Business Software$q$, 346, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '65df064f-c033-48de-963a-975e3a0de2d5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3391e417-1602-4700-9fb5-25539c0bdc10', $q$Cloud Infrastructure$q$, 347, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3391e417-1602-4700-9fb5-25539c0bdc10')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c529d0a-2b13-466c-9b02-389217e946db', $q$Business Software$q$, 348, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c529d0a-2b13-466c-9b02-389217e946db')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4d8a3758-7694-4248-beb1-71381ebe01eb', $q$Monitoring & Observability$q$, 349, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4d8a3758-7694-4248-beb1-71381ebe01eb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8d44df95-076f-4b04-8588-d09a802ea0ed', $q$Databases & Data Infrastructure$q$, 350, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8d44df95-076f-4b04-8588-d09a802ea0ed')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8a0139ef-143e-477f-9ff7-81df389106ad', $q$Business Software$q$, 351, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8a0139ef-143e-477f-9ff7-81df389106ad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '001d95b5-ec13-44c2-a248-77ee4847b3b5', $q$Business Software$q$, 352, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '001d95b5-ec13-44c2-a248-77ee4847b3b5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed42cf02-1249-4444-ad26-4e2e6d110ede', $q$Business Software$q$, 353, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed42cf02-1249-4444-ad26-4e2e6d110ede')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a11b20bf-4080-4f8f-86bb-35b7ae8f0897', $q$Cloud Infrastructure$q$, 354, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a11b20bf-4080-4f8f-86bb-35b7ae8f0897')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7d5a9c2-8090-4804-9158-6673b15ad608', $q$Monitoring & Observability$q$, 355, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7d5a9c2-8090-4804-9158-6673b15ad608')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6c54c203-c6bd-4a93-b9d7-8c7596d34e37', $q$Cloud Infrastructure$q$, 356, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6c54c203-c6bd-4a93-b9d7-8c7596d34e37')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '34142778-ce27-4fc1-a6f2-f4759311ed30', $q$Cloud Infrastructure$q$, 357, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '34142778-ce27-4fc1-a6f2-f4759311ed30')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c6eeab9c-1912-4c68-baec-92fe8b36128d', $q$Monitoring & Observability$q$, 358, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c6eeab9c-1912-4c68-baec-92fe8b36128d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9b3fae41-1703-49a8-976c-df88b84c194a', $q$Business Software$q$, 359, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9b3fae41-1703-49a8-976c-df88b84c194a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2eefd11f-2786-4279-a1ff-6e6b8a43d86d', $q$Databases & Data Infrastructure$q$, 360, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2eefd11f-2786-4279-a1ff-6e6b8a43d86d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2a03f18b-002e-4912-8543-a5d6d3af4697', $q$Business Software$q$, 361, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2a03f18b-002e-4912-8543-a5d6d3af4697')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d05fa3d-d9db-4318-8c30-1e1ab8659c23', $q$Monitoring & Observability$q$, 363, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d05fa3d-d9db-4318-8c30-1e1ab8659c23')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f444f017-5023-4194-8015-ffa1be730479', $q$Design & Media$q$, 364, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f444f017-5023-4194-8015-ffa1be730479')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5ef88de9-491c-4178-bbfd-2407a8343f21', $q$Business Software$q$, 365, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5ef88de9-491c-4178-bbfd-2407a8343f21')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cae20a8e-278c-4a33-a3b0-225d031962be', $q$Cloud Infrastructure$q$, 366, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cae20a8e-278c-4a33-a3b0-225d031962be')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '82f73737-f24e-4791-ad2a-051f1a2a6581', $q$Cloud Infrastructure$q$, 367, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '82f73737-f24e-4791-ad2a-051f1a2a6581')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'abe93e17-3a77-4279-bbff-bd5943e73402', $q$Business Software$q$, 368, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'abe93e17-3a77-4279-bbff-bd5943e73402')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '22aa6cd1-7c01-43f5-ab30-c82299a787ae', $q$Business Software$q$, 369, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '22aa6cd1-7c01-43f5-ab30-c82299a787ae')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c7f8fb0b-008a-4783-87bf-bc9de7c1769a', $q$Business Software$q$, 370, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c7f8fb0b-008a-4783-87bf-bc9de7c1769a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e5669d78-9447-4a0a-8330-b535d6814691', $q$Business Software$q$, 371, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e5669d78-9447-4a0a-8330-b535d6814691')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe1f7cc5-7acc-4f0d-9fc5-66ae375d1c01', $q$Business Software$q$, 372, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe1f7cc5-7acc-4f0d-9fc5-66ae375d1c01')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3f061782-fdbf-4d73-8e6d-024359acebb2', $q$Business Software$q$, 373, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3f061782-fdbf-4d73-8e6d-024359acebb2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '27d8b818-d6a3-4e88-8e32-8b174e00aff1', $q$Business Software$q$, 374, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '27d8b818-d6a3-4e88-8e32-8b174e00aff1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '29bbfcbe-2a79-463b-b0bf-ffb47cdb8e91', $q$Monitoring & Observability$q$, 375, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '29bbfcbe-2a79-463b-b0bf-ffb47cdb8e91')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd813318a-7c8f-456c-855e-050148e17634', $q$Business Software$q$, 376, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd813318a-7c8f-456c-855e-050148e17634')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd574c3af-ad89-4fc3-a2f9-871c64fe0b5e', $q$Cloud Infrastructure$q$, 377, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd574c3af-ad89-4fc3-a2f9-871c64fe0b5e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'de04bc80-8ff5-41f4-9de1-b1ef2bb4939c', $q$Business Software$q$, 378, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'de04bc80-8ff5-41f4-9de1-b1ef2bb4939c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a04d0876-5dfa-493f-9a71-1fb688f5a8e1', $q$Business Software$q$, 379, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a04d0876-5dfa-493f-9a71-1fb688f5a8e1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1c0a1eeb-af85-47f4-81ad-f2d3722b2adb', $q$Design & Media$q$, 380, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1c0a1eeb-af85-47f4-81ad-f2d3722b2adb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b57e67a2-2d4e-4b8e-a24f-d940ffa320aa', $q$Cloud Infrastructure$q$, 381, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b57e67a2-2d4e-4b8e-a24f-d940ffa320aa')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a61cad7f-b497-4dfe-8ab3-197f60ca3f57', $q$Cloud Infrastructure$q$, 382, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a61cad7f-b497-4dfe-8ab3-197f60ca3f57')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '468ab4ac-c45a-45ff-a112-c0de7cf42397', $q$Design & Media$q$, 383, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '468ab4ac-c45a-45ff-a112-c0de7cf42397')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8b39f588-8dac-4762-bb02-e4fa31089ff5', $q$Business Software$q$, 384, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b39f588-8dac-4762-bb02-e4fa31089ff5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '569f324d-7d35-43ad-9ca0-9c27f833397e', $q$Cloud Infrastructure$q$, 385, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '569f324d-7d35-43ad-9ca0-9c27f833397e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e7431679-4c5c-481c-9d6e-5dc882599125', $q$Business Software$q$, 386, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e7431679-4c5c-481c-9d6e-5dc882599125')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f15523f2-f332-4aee-a29d-022539acd900', $q$Monitoring & Observability$q$, 387, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f15523f2-f332-4aee-a29d-022539acd900')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28db617f-231d-4fab-988e-ab1670524841', $q$Cloud Infrastructure$q$, 388, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28db617f-231d-4fab-988e-ab1670524841')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e0bde2b8-301a-4bcb-83b7-ef051eeb98ba', $q$Search$q$, 389, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e0bde2b8-301a-4bcb-83b7-ef051eeb98ba')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5b27a9ac-e34a-485a-83d5-3ec3655f772a', $q$Cloud Infrastructure$q$, 390, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5b27a9ac-e34a-485a-83d5-3ec3655f772a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '367d93c3-9024-4edc-9f7a-b33694446d51', $q$Design & Media$q$, 391, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '367d93c3-9024-4edc-9f7a-b33694446d51')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '358d246e-8d47-4277-9dd3-07b6ae875996', $q$Business Software$q$, 392, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '358d246e-8d47-4277-9dd3-07b6ae875996')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6f714fa5-136f-483a-a9ae-32c06db775a4', $q$Databases & Data Infrastructure$q$, 393, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f714fa5-136f-483a-a9ae-32c06db775a4')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c0ddf490-b5e9-4cba-9df4-7ddab0740be1', $q$Business Software$q$, 394, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c0ddf490-b5e9-4cba-9df4-7ddab0740be1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f1686afe-048d-4d13-84b3-f7aedc909d5d', $q$Databases & Data Infrastructure$q$, 395, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f1686afe-048d-4d13-84b3-f7aedc909d5d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3bc192c2-8a7c-495d-8d22-bbee8af461a0', $q$Monitoring & Observability$q$, 396, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3bc192c2-8a7c-495d-8d22-bbee8af461a0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3cb9d1ed-58fc-43bb-9c78-eede41255749', $q$Design & Media$q$, 397, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cb9d1ed-58fc-43bb-9c78-eede41255749')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'edc0a915-513f-4ecf-a9a2-f6b72a6318a0', $q$Cloud Infrastructure$q$, 398, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'edc0a915-513f-4ecf-a9a2-f6b72a6318a0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7525fe34-7d1a-4e61-816b-ad21b1b0d74f', $q$Databases & Data Infrastructure$q$, 399, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7525fe34-7d1a-4e61-816b-ad21b1b0d74f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '032f2d56-0dcd-4c46-9791-d3160d13ec72', $q$Business Software$q$, 400, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '032f2d56-0dcd-4c46-9791-d3160d13ec72')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fbcf3698-4281-42dc-847c-418e1115a847', $q$Business Software$q$, 401, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fbcf3698-4281-42dc-847c-418e1115a847')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a789e1e6-db14-4e14-8c28-61dfc090477a', $q$Business Software$q$, 403, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a789e1e6-db14-4e14-8c28-61dfc090477a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '138d0be8-408e-4f39-8921-36e0754ac156', $q$Business Software$q$, 404, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '138d0be8-408e-4f39-8921-36e0754ac156')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '423f7e1e-8c68-4a16-a8ac-318e725a0589', $q$Monitoring & Observability$q$, 405, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '423f7e1e-8c68-4a16-a8ac-318e725a0589')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e74eacf6-db29-4e62-b0bd-49ca33dfc5f8', $q$Monitoring & Observability$q$, 406, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e74eacf6-db29-4e62-b0bd-49ca33dfc5f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0de8b284-1474-480a-bc63-70a10a24e99e', $q$Databases & Data Infrastructure$q$, 407, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0de8b284-1474-480a-bc63-70a10a24e99e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b6378256-073c-41a0-b9ae-7309177ac695', $q$Cloud Infrastructure$q$, 408, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b6378256-073c-41a0-b9ae-7309177ac695')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '765aee9e-524b-4d21-a9f2-f2f1570ed08b', $q$Design & Media$q$, 409, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '765aee9e-524b-4d21-a9f2-f2f1570ed08b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4bcab876-2906-4df5-a9a8-85fb1d89cbb2', $q$Cloud Infrastructure$q$, 410, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4bcab876-2906-4df5-a9a8-85fb1d89cbb2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f69dc960-e2a8-4fb4-8aaa-9ee46234e742', $q$Databases & Data Infrastructure$q$, 411, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f69dc960-e2a8-4fb4-8aaa-9ee46234e742')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '793d2265-e7bd-4b69-97ea-434fa7b1cdea', $q$Databases & Data Infrastructure$q$, 412, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '793d2265-e7bd-4b69-97ea-434fa7b1cdea')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '604c2f5d-82b0-40ac-ab10-198154f9bead', $q$Monitoring & Observability$q$, 413, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '604c2f5d-82b0-40ac-ab10-198154f9bead')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '591a7164-a945-464f-bbd5-877419802e5d', $q$Cloud Infrastructure$q$, 414, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '591a7164-a945-464f-bbd5-877419802e5d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f948abef-a45a-48ea-a8a1-f10e7cf64ed6', $q$Cloud Infrastructure$q$, 415, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f948abef-a45a-48ea-a8a1-f10e7cf64ed6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'f7e870fd-7167-4584-8e3f-86c24ba36ca7', $q$Design & Media$q$, 416, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'f7e870fd-7167-4584-8e3f-86c24ba36ca7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '747c7346-5f11-4502-a6bf-71743d86eb4f', $q$Cloud Infrastructure$q$, 417, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '747c7346-5f11-4502-a6bf-71743d86eb4f')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '561e1312-cd0d-4f47-8230-f28421a2ffd5', $q$Cloud Infrastructure$q$, 418, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '561e1312-cd0d-4f47-8230-f28421a2ffd5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7aa0a594-b907-4664-9413-048ea3745ad8', $q$Cloud Infrastructure$q$, 419, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7aa0a594-b907-4664-9413-048ea3745ad8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'fe89c483-8731-485d-8047-fa4068bc5196', $q$Design & Media$q$, 420, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'fe89c483-8731-485d-8047-fa4068bc5196')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3e2aadb6-d285-4d2a-9116-8e3f49a8fe17', $q$Cloud Infrastructure$q$, 421, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3e2aadb6-d285-4d2a-9116-8e3f49a8fe17')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '01b43452-2b3d-4983-b3ba-2245fe8a857d', $q$Cloud Infrastructure$q$, 422, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '01b43452-2b3d-4983-b3ba-2245fe8a857d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bb5043a1-f2a5-41e6-bfcb-5ac1ad3699e6', $q$Monitoring & Observability$q$, 423, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb5043a1-f2a5-41e6-bfcb-5ac1ad3699e6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1e2fa1b1-9516-49ca-839f-6a11eeafb55d', $q$Testing & QA$q$, 425, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1e2fa1b1-9516-49ca-839f-6a11eeafb55d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1bbd15c1-6ee0-45ba-8a96-24095c4b1449', $q$Cloud Infrastructure$q$, 426, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1bbd15c1-6ee0-45ba-8a96-24095c4b1449')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7c650a9c-79b3-4500-add3-8726bdffa54e', $q$Design & Media$q$, 427, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7c650a9c-79b3-4500-add3-8726bdffa54e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e946ee9b-8b7a-4c15-b099-fb69d747ef70', $q$Cloud Infrastructure$q$, 428, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e946ee9b-8b7a-4c15-b099-fb69d747ef70')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ed9d2ca1-e382-4ca8-a0e1-0e0cfd7cad9e', $q$Monitoring & Observability$q$, 429, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ed9d2ca1-e382-4ca8-a0e1-0e0cfd7cad9e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e44b3145-4fc6-4862-9ce9-82fbc070ef36', $q$Cloud Infrastructure$q$, 430, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e44b3145-4fc6-4862-9ce9-82fbc070ef36')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b4cd7ddc-d7a7-4010-a5b1-76fb0eb1ed79', $q$Databases & Data Infrastructure$q$, 431, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b4cd7ddc-d7a7-4010-a5b1-76fb0eb1ed79')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cfe17654-41ac-4dfa-8b69-eac99681d838', $q$Monitoring & Observability$q$, 432, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cfe17654-41ac-4dfa-8b69-eac99681d838')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1ca54e37-5cb2-40cb-9996-fd8f07e81418', $q$Monitoring & Observability$q$, 433, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1ca54e37-5cb2-40cb-9996-fd8f07e81418')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '04bb646f-e076-4b68-80f1-4b42834cce94', $q$Testing & QA$q$, 434, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '04bb646f-e076-4b68-80f1-4b42834cce94')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd6639407-50ec-4d57-b17d-8fc13401f00e', $q$Cloud Infrastructure$q$, 435, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd6639407-50ec-4d57-b17d-8fc13401f00e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'cd0e3c5a-2288-4c68-ac22-6dffe7e8d568', $q$Testing & QA$q$, 436, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'cd0e3c5a-2288-4c68-ac22-6dffe7e8d568')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'aea05ae7-4100-477e-9674-4882b55a538b', $q$Cloud Infrastructure$q$, 437, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'aea05ae7-4100-477e-9674-4882b55a538b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4dd4ad97-7cd4-4eb0-9c61-428a336d0b2a', $q$Cloud Infrastructure$q$, 438, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4dd4ad97-7cd4-4eb0-9c61-428a336d0b2a')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e966b472-92d2-44be-9553-62a64495d279', $q$Testing & QA$q$, 439, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e966b472-92d2-44be-9553-62a64495d279')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7cdb6e3c-55de-4de1-8fb9-3393b91efc04', $q$Monitoring & Observability$q$, 440, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7cdb6e3c-55de-4de1-8fb9-3393b91efc04')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '25b7f3d8-235b-4964-a32d-bc0e642d8fdb', $q$Design & Media$q$, 441, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '25b7f3d8-235b-4964-a32d-bc0e642d8fdb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e4849843-4cfc-42a9-afcd-588d477dc3da', $q$Design & Media$q$, 442, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e4849843-4cfc-42a9-afcd-588d477dc3da')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b5921690-cda6-473e-8465-b294f87ec3f6', $q$Monitoring & Observability$q$, 443, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b5921690-cda6-473e-8465-b294f87ec3f6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'b22de93c-aecf-4611-98e7-d8985578be42', $q$Cloud Infrastructure$q$, 444, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'b22de93c-aecf-4611-98e7-d8985578be42')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e2bf7b34-b9f4-4323-a520-573c767ca1e5', $q$Design & Media$q$, 445, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e2bf7b34-b9f4-4323-a520-573c767ca1e5')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c8109b06-864f-4152-870a-61fee79cf5da', $q$Monitoring & Observability$q$, 446, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c8109b06-864f-4152-870a-61fee79cf5da')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '17d50aa8-5cc7-49a7-8b6d-968b11c1fb00', $q$Cloud Infrastructure$q$, 447, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '17d50aa8-5cc7-49a7-8b6d-968b11c1fb00')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '312b26ef-c0ab-4dd3-b093-176840c74c52', $q$Cloud Infrastructure$q$, 448, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '312b26ef-c0ab-4dd3-b093-176840c74c52')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c32f3e20-34cf-4218-9ac5-8e56d2856cca', $q$Monitoring & Observability$q$, 449, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c32f3e20-34cf-4218-9ac5-8e56d2856cca')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '12dc5a9e-8824-4869-8f3b-0717550e4b71', $q$Design & Media$q$, 450, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '12dc5a9e-8824-4869-8f3b-0717550e4b71')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9d6d8e24-2d40-450d-8feb-8482a1203a82', $q$Databases & Data Infrastructure$q$, 451, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9d6d8e24-2d40-450d-8feb-8482a1203a82')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6f5099e3-bd9d-4452-88fc-6204e59aeaab', $q$Design & Media$q$, 452, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6f5099e3-bd9d-4452-88fc-6204e59aeaab')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3cbc9317-4d64-4f21-b7cc-760993666870', $q$Monitoring & Observability$q$, 453, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3cbc9317-4d64-4f21-b7cc-760993666870')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '803b4bbe-cab0-4e7d-bd43-91cc737c8535', $q$Design & Media$q$, 454, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '803b4bbe-cab0-4e7d-bd43-91cc737c8535')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '37a5757a-233c-4d44-b107-5ee12a16080c', $q$Monitoring & Observability$q$, 455, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '37a5757a-233c-4d44-b107-5ee12a16080c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '86cc1f26-e0a8-420d-877c-7ed037ff5057', $q$Cloud Infrastructure$q$, 456, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '86cc1f26-e0a8-420d-877c-7ed037ff5057')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6447a010-3f0d-456f-9a01-2818c0885e31', $q$Design & Media$q$, 457, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6447a010-3f0d-456f-9a01-2818c0885e31')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1b6a7e0a-1bde-4c68-97df-61b4197ec9e0', $q$Databases & Data Infrastructure$q$, 458, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1b6a7e0a-1bde-4c68-97df-61b4197ec9e0')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '410d884b-6903-4133-8f37-c6fe6e599e71', $q$Testing & QA$q$, 459, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '410d884b-6903-4133-8f37-c6fe6e599e71')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5e6c8ebb-33aa-4cb9-85ee-8ad06c3526f8', $q$Design & Media$q$, 460, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5e6c8ebb-33aa-4cb9-85ee-8ad06c3526f8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '642ea73c-2c63-4361-ae01-97f65a08d580', $q$Monitoring & Observability$q$, 461, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '642ea73c-2c63-4361-ae01-97f65a08d580')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1d3d3842-0ae9-4daf-a433-4b8f7d9dfe3d', $q$Cloud Infrastructure$q$, 462, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1d3d3842-0ae9-4daf-a433-4b8f7d9dfe3d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7464f45b-a888-4cd0-a0dc-3c46b903b734', $q$Monitoring & Observability$q$, 463, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7464f45b-a888-4cd0-a0dc-3c46b903b734')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '43874be7-a358-4687-a231-64e948e062a1', $q$Cloud Infrastructure$q$, 464, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '43874be7-a358-4687-a231-64e948e062a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'ffce9685-1bc6-4b20-a558-6d7b90d1ea26', $q$Cloud Infrastructure$q$, 465, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'ffce9685-1bc6-4b20-a558-6d7b90d1ea26')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9193d00a-6490-4f31-9c6a-98707d16d3b8', $q$Cloud Infrastructure$q$, 466, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9193d00a-6490-4f31-9c6a-98707d16d3b8')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1a2ebb97-d7f5-4c30-a3ae-852b0123e8cf', $q$Testing & QA$q$, 467, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1a2ebb97-d7f5-4c30-a3ae-852b0123e8cf')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'e71353fc-0f6c-44ed-887a-9c617cf3f6a1', $q$Design & Media$q$, 468, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'e71353fc-0f6c-44ed-887a-9c617cf3f6a1')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '0caedda2-828b-4f3b-b4ae-cd0941d4fe38', $q$Design & Media$q$, 469, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '0caedda2-828b-4f3b-b4ae-cd0941d4fe38')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3b87c272-8dd8-4419-85c0-9175c96f8ef2', $q$Search$q$, 470, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3b87c272-8dd8-4419-85c0-9175c96f8ef2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '13eff50a-75a8-4bfe-ab0b-9be1b06e3345', $q$Databases & Data Infrastructure$q$, 471, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '13eff50a-75a8-4bfe-ab0b-9be1b06e3345')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6fa1c525-8632-40fb-b1e8-e9a481d1f486', $q$Monitoring & Observability$q$, 472, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6fa1c525-8632-40fb-b1e8-e9a481d1f486')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'bb37319d-bb56-4fe3-b692-9ef8e4f68a61', $q$Monitoring & Observability$q$, 473, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'bb37319d-bb56-4fe3-b692-9ef8e4f68a61')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '76af3c0a-f1ba-4f22-8a66-7148625c345b', $q$Design & Media$q$, 474, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '76af3c0a-f1ba-4f22-8a66-7148625c345b')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '3268424d-00e9-4233-b68d-7a421e8b4782', $q$Design & Media$q$, 475, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '3268424d-00e9-4233-b68d-7a421e8b4782')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '28d94363-2f15-468a-a63f-eb487606f861', $q$Design & Media$q$, 476, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '28d94363-2f15-468a-a63f-eb487606f861')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'dfc77588-e534-4acc-a245-ad6c30c1c8b7', $q$Monitoring & Observability$q$, 477, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'dfc77588-e534-4acc-a245-ad6c30c1c8b7')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '1377f1a7-94da-484c-8c0a-e24fecb88745', $q$Testing & QA$q$, 478, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '1377f1a7-94da-484c-8c0a-e24fecb88745')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'a05764ee-6fda-43e1-9c19-e22df70d8bd2', $q$Cloud Infrastructure$q$, 479, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'a05764ee-6fda-43e1-9c19-e22df70d8bd2')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'd171f421-40d4-437a-924c-854351cf99ce', $q$Search$q$, 480, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'd171f421-40d4-437a-924c-854351cf99ce')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '5856d9b7-af12-483f-8b52-c09e74c8275e', $q$Monitoring & Observability$q$, 482, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '5856d9b7-af12-483f-8b52-c09e74c8275e')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '9eb731c4-1797-4851-86e4-4f0d28227e63', $q$Testing & QA$q$, 483, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '9eb731c4-1797-4851-86e4-4f0d28227e63')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '61649c54-e641-400b-9788-527f5e2d1899', $q$Design & Media$q$, 484, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '61649c54-e641-400b-9788-527f5e2d1899')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7e3a72ef-a1d3-4095-8e66-c987efb3a588', $q$Design & Media$q$, 485, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7e3a72ef-a1d3-4095-8e66-c987efb3a588')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '8b40860d-046b-4122-ae90-e09ab1f4aa83', $q$Cloud Infrastructure$q$, 486, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '8b40860d-046b-4122-ae90-e09ab1f4aa83')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '84f319e1-3c4f-4a8d-aee8-b49499eadfad', $q$Design & Media$q$, 487, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '84f319e1-3c4f-4a8d-aee8-b49499eadfad')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7080e9b0-03fb-4a7a-b2fe-90350d84b567', $q$Monitoring & Observability$q$, 488, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7080e9b0-03fb-4a7a-b2fe-90350d84b567')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'da421967-b1e4-4d48-8a90-66fe9381db48', $q$Email & Communication$q$, 489, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'da421967-b1e4-4d48-8a90-66fe9381db48')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '7389f38c-e748-4e49-8bf7-b20dec169901', $q$Design & Media$q$, 490, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '7389f38c-e748-4e49-8bf7-b20dec169901')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2d5f7b7b-a341-4c33-bad4-32961bfb5cdb', $q$Search$q$, 491, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2d5f7b7b-a341-4c33-bad4-32961bfb5cdb')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '45e7fa0b-672f-4380-8758-7af1a167c03d', $q$Business Software$q$, 493, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '45e7fa0b-672f-4380-8758-7af1a167c03d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '77733d0f-adf5-4833-80ef-cc0bcd6a3fc6', $q$Cloud Infrastructure$q$, 494, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '77733d0f-adf5-4833-80ef-cc0bcd6a3fc6')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '761e7f21-1d23-4640-8504-5dbc0bf24928', $q$Business Software$q$, 495, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '761e7f21-1d23-4640-8504-5dbc0bf24928')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '6ec7aaf8-ff07-4d82-96b8-dd8b826a856c', $q$Cloud Infrastructure$q$, 496, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '6ec7aaf8-ff07-4d82-96b8-dd8b826a856c')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '2ac9954b-c313-4db0-a920-6fd720ccad67', $q$Design & Media$q$, 497, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '2ac9954b-c313-4db0-a920-6fd720ccad67')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT 'c15342aa-c5ef-4e11-8054-c7010e732d20', $q$Cloud Infrastructure$q$, 498, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = 'c15342aa-c5ef-4e11-8054-c7010e732d20')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
SELECT '4c18efb7-1701-4fcc-9d73-63de1d05164d', $q$Cloud Infrastructure$q$, 500, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch13$q$ WHERE EXISTS (SELECT 1 FROM tools WHERE id = '4c18efb7-1701-4fcc-9d73-63de1d05164d')
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('7e8227b7-0e90-46d7-92df-86b14a774f8a', $q$Design & Media$q$, 90, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('09bfad13-d346-4bb4-8adf-3ff6863d687e', $q$Cloud Infrastructure$q$, 174, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b040c903-f544-4cf7-9de2-2af9f1ecddaa', $q$Business Software$q$, 195, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('34fac46a-38d6-4512-b24c-19e0f5439125', $q$Cloud Infrastructure$q$, 282, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('46a737e0-4328-492f-9496-68cfcc4a09f1', $q$Business Software$q$, 286, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('b595e89a-3f11-4ebc-af37-5b2c490d5f49', $q$Business Software$q$, 293, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('665123b3-d769-4ea1-851b-2dfd42fa8509', $q$Business Software$q$, 362, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a0b7cc54-ec23-41b8-8746-9590d13dde47', $q$Cloud Infrastructure$q$, 402, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('c628f71b-c0ff-42aa-87ea-a09dfbd28490', $q$Cloud Infrastructure$q$, 424, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Cloud Infrastructure$q$, 481, 8, 8, 8, $q$Tier B — Good commercial prospect$q$, 8, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Cloud Infrastructure$q$, 492, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
INSERT INTO tool_strategic_metadata (tool_id, source_category_label, list_rank, traffic_score, seo_score, paid_listing_score, priority_tier, opportunity_score, import_batch)
VALUES ('f7ec4de0-b2b8-428c-8872-3470c3040b95', $q$Cloud Infrastructure$q$, 499, 8, 8, 6, $q$Tier C — Traffic value, harder sale$q$, 7.4, $q$gappsy-500-2026-07-18-batch13$q$)
ON CONFLICT (tool_id) DO NOTHING;
